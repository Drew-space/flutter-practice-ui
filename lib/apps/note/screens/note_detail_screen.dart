import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:intl/intl.dart';
import '../models/note.dart';

class NoteDetailScreen extends StatefulWidget {
  final Note? note;

  const NoteDetailScreen({super.key, this.note});

  @override
  State<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  late quill.QuillController _controller;
  late TextEditingController _titleController;
  bool _isToolbarExpanded = false;
  bool _isEdited = false;
  final FocusNode _editorFocusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note?.title ?? '');

    if (widget.note != null) {
      _controller = quill.QuillController(
        document: quill.Document()..insert(0, widget.note!.content),
        selection: const TextSelection.collapsed(offset: 0),
      );
    } else {
      _controller = quill.QuillController.basic();
    }

    _controller.addListener(() {
      setState(() => _isEdited = true);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _titleController.dispose();
    _editorFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar — Back + Save only
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFF1A1A1A),
                      size: 22,
                    ),
                  ),
                  IconButton(
                    onPressed: _saveNote,
                    icon: Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        color: Color(0xFF1A1A1A),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title input
                    TextField(
                      controller: _titleController,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A1A),
                        height: 1.3,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Note Title',
                        hintStyle: TextStyle(color: Color(0xFFCCCCCC)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                      maxLines: null,
                    ),

                    const SizedBox(height: 8),

                    // Date + Edited badge
                    Row(
                      children: [
                        Text(
                          DateFormat(
                            'EEE, MMMM d, yyyy HH:mm',
                          ).format(widget.note?.date ?? DateTime.now()),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF888888),
                          ),
                        ),
                        if (_isEdited) ...[
                          const SizedBox(width: 12),
                          Row(
                            children: [
                              const Icon(
                                Icons.edit,
                                size: 12,
                                color: Color(0xFF888888),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Edited',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Rich Text Editor — direct parameters (v8/v9 API)
                    quill.QuillEditor(
                      controller: _controller,
                      scrollController: _scrollController,
                      focusNode: _editorFocusNode,
                      scrollable: true,
                      padding: EdgeInsets.zero,
                      autoFocus: false,
                      readOnly: false,
                      expands: false,
                      placeholder: 'Start typing...',
                    ),

                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Custom Rich Text Toolbar
      bottomNavigationBar: _buildToolbar(),
    );
  }

  Widget _buildToolbar() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Collapsed row
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    _toolbarButton(
                      icon: Icons.format_bold,
                      isActive: _isFormatActive(quill.Attribute.bold),
                      onTap: () => _toggleFormat(quill.Attribute.bold),
                    ),
                    _toolbarButton(
                      icon: Icons.format_italic,
                      isActive: _isFormatActive(quill.Attribute.italic),
                      onTap: () => _toggleFormat(quill.Attribute.italic),
                    ),
                    _toolbarButton(
                      icon: Icons.format_underline,
                      isActive: _isFormatActive(quill.Attribute.underline),
                      onTap: () => _toggleFormat(quill.Attribute.underline),
                    ),
                    _toolbarButton(icon: Icons.link, onTap: _showLinkDialog),
                    _toolbarButton(
                      icon: Icons.format_color_text,
                      onTap: _showColorPicker,
                    ),
                    _toolbarButton(
                      icon: Icons.brush,
                      onTap: () => _applyHighlight('#FFE4B5'),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => setState(
                        () => _isToolbarExpanded = !_isToolbarExpanded,
                      ),
                      child: AnimatedRotation(
                        turns: _isToolbarExpanded ? 0.5 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: const Icon(
                          Icons.keyboard_arrow_up,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Expanded grid
              AnimatedCrossFade(
                firstChild: const SizedBox.shrink(),
                secondChild: _buildExpandedToolbar(),
                crossFadeState: _isToolbarExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandedToolbar() {
    final toolbarItems = [
      _ToolbarItem(
        icon: Icons.format_bold,
        label: 'Bold',
        attribute: quill.Attribute.bold,
      ),
      _ToolbarItem(
        icon: Icons.format_italic,
        label: 'Italic',
        attribute: quill.Attribute.italic,
      ),
      _ToolbarItem(
        icon: Icons.format_underline,
        label: 'Underline',
        attribute: quill.Attribute.underline,
      ),
      _ToolbarItem(
        icon: Icons.format_strikethrough,
        label: 'Strike',
        attribute: quill.Attribute.strikeThrough,
      ),
      _ToolbarItem(
        icon: Icons.title,
        label: 'H1',
        attribute: quill.Attribute.h1,
      ),
      _ToolbarItem(
        icon: Icons.title,
        label: 'H2',
        attribute: quill.Attribute.h2,
        iconSize: 18,
      ),
      _ToolbarItem(
        icon: Icons.title,
        label: 'H3',
        attribute: quill.Attribute.h3,
        iconSize: 14,
      ),
      _ToolbarItem(
        icon: Icons.format_list_bulleted,
        label: 'Bullet',
        attribute: quill.Attribute.ul,
      ),
      _ToolbarItem(
        icon: Icons.format_list_numbered,
        label: 'Number',
        attribute: quill.Attribute.ol,
      ),
      _ToolbarItem(
        icon: Icons.format_align_left,
        label: 'Align',
        attribute: quill.Attribute.align,
      ),
      _ToolbarItem(
        icon: Icons.format_quote,
        label: 'Quote',
        attribute: quill.Attribute.blockQuote,
      ),
      _ToolbarItem(
        icon: Icons.code,
        label: 'Code',
        attribute: quill.Attribute.codeBlock,
      ),
      _ToolbarItem(
        icon: Icons.check_box,
        label: 'Check',
        attribute: quill.Attribute.checked,
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xFF252525),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                'Formatting',
                style: TextStyle(
                  color: Color(0xFF888888),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: toolbarItems.map((item) {
              final isActive = _isFormatActive(item.attribute);

              return GestureDetector(
                onTap: () => _toggleFormat(item.attribute),
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: isActive
                        ? const Color(0xFF444444)
                        : const Color(0xFF333333),
                    borderRadius: BorderRadius.circular(12),
                    border: isActive
                        ? Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 1,
                          )
                        : null,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        item.icon,
                        color: isActive
                            ? Colors.white
                            : const Color(0xFFAAAAAA),
                        size: item.iconSize ?? 20,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item.label,
                        style: TextStyle(
                          color: isActive
                              ? Colors.white
                              : const Color(0xFF888888),
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              Text(
                'Highlights',
                style: TextStyle(
                  color: Color(0xFF888888),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _highlightColorButton('#FFE4B5', 'Yellow'),
              _highlightColorButton('#FFB5B5', 'Red'),
              _highlightColorButton('#B5D8FF', 'Blue'),
              _highlightColorButton('#B5FFB5', 'Green'),
              _highlightColorButton('#E5B5FF', 'Purple'),
              _highlightColorButton('#FFFFFF', 'White'),
            ],
          ),
        ],
      ),
    );
  }

  // ─── Helpers ───

  bool _isFormatActive(quill.Attribute attribute) {
    return _controller.getSelectionStyle().attributes[attribute.key] ==
        attribute;
  }

  void _toggleFormat(quill.Attribute attribute) {
    _controller.formatSelection(attribute);
    setState(() {});
  }

  void _applyHighlight(String colorHex) {
    final style = _controller.getSelectionStyle();
    final currentBg = style.attributes['background'];
    if (currentBg != null && currentBg.value == colorHex) {
      _controller.formatSelection(
        quill.Attribute.clone(quill.Attribute.background, null),
      );
    } else {
      _controller.formatSelection(quill.Attribute.background);
      _controller.formatSelection(
        quill.Attribute.clone(quill.Attribute.background, colorHex),
      );
    }
    setState(() {});
  }

  Widget _toolbarButton({
    required IconData icon,
    required VoidCallback onTap,
    bool isActive = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Icon(
          icon,
          color: isActive ? Colors.white : const Color(0xFF888888),
          size: 22,
        ),
      ),
    );
  }

  Widget _highlightColorButton(String colorHex, String label) {
    final color = Color(int.parse(colorHex.replaceFirst('#', '0xFF')));

    return GestureDetector(
      onTap: () => _applyHighlight(colorHex),
      child: Column(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 1,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: Color(0xFF888888), fontSize: 9),
          ),
        ],
      ),
    );
  }

  void _showLinkDialog() {
    final textController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A1A),
        title: const Text('Insert Link', style: TextStyle(color: Colors.white)),
        content: TextField(
          controller: textController,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: 'https://...',
            hintStyle: TextStyle(color: Color(0xFF666666)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF444444)),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              _controller.formatSelection(
                quill.LinkAttribute(textController.text),
              );
              Navigator.pop(context);
              setState(() {});
            },
            child: const Text('Insert'),
          ),
        ],
      ),
    );
  }

  void _showColorPicker() {
    final colors = [
      '#000000',
      '#FF0000',
      '#00FF00',
      '#0000FF',
      '#FFFF00',
      '#FF00FF',
      '#00FFFF',
      '#FFFFFF',
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A1A1A),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Text Color',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: colors.map((colorHex) {
                return GestureDetector(
                  onTap: () {
                    _controller.formatSelection(quill.ColorAttribute(colorHex));
                    Navigator.pop(context);
                    setState(() {});
                  },
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Color(
                        int.parse(colorHex.replaceFirst('#', '0xFF')),
                      ),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white.withOpacity(0.2)),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void _saveNote() {
    final title = _titleController.text;
    final content = _controller.document.toPlainText();

    debugPrint('Saving note: $title');
    debugPrint('Content: $content');

    Navigator.pop(context);
  }
}

class _ToolbarItem {
  final IconData icon;
  final String label;
  final quill.Attribute attribute;
  final double? iconSize;

  _ToolbarItem({
    required this.icon,
    required this.label,
    required this.attribute,
    this.iconSize,
  });
}
