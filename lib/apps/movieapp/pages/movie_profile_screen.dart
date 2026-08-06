import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class MovieProfileScreen extends StatefulWidget {
  const MovieProfileScreen({super.key});

  @override
  State<MovieProfileScreen> createState() => _MovieProfileScreenState();
}

class _MovieProfileScreenState extends State<MovieProfileScreen> {
  bool pauseNotifications = true;
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // ── App Bar ──
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.05),
                            shape: BoxShape.circle,
                          ),
                          child: HugeIcon(
                            icon: HugeIcons.strokeRoundedArrowLeft01,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ── User Card ──
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF141414),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        ClipOval(
                          child: Image.network(
                            'https://i.pravatar.cc/300?img=33',
                            width: 48,
                            height: 48,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Your Name',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '@yourname',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ),
                        HugeIcon(
                          icon: HugeIcons.strokeRoundedArrowRight01,
                          color: Colors.grey[600]!,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // ── Group 1: Notifications ──
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF141414),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      _ToggleItem(
                        icon: HugeIcons.strokeRoundedNotification02,
                        label: 'Pause notifications',
                        value: pauseNotifications,
                        activeColor: const Color(0xFFA3E635),
                        onChanged: (v) =>
                            setState(() => pauseNotifications = v),
                      ),
                      Divider(
                        color: Colors.white.withOpacity(0.05),
                        height: 1,
                        indent: 52,
                      ),
                      _ArrowItem(
                        icon: HugeIcons.strokeRoundedSettings01,
                        label: 'General settings',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ── Group 2: Appearance & Contact ──
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF141414),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      _ToggleItem(
                        icon: HugeIcons.strokeRoundedMoon02,
                        label: 'Dark mode',
                        value: darkMode,
                        activeColor: Colors.white,
                        onChanged: (v) => setState(() => darkMode = v),
                      ),
                      Divider(
                        color: Colors.white.withOpacity(0.05),
                        height: 1,
                        indent: 52,
                      ),
                      _ArrowItem(
                        icon: HugeIcons.strokeRoundedLanguageSkill,
                        label: 'Language',
                        onTap: () {},
                      ),
                      Divider(
                        color: Colors.white.withOpacity(0.05),
                        height: 1,
                        indent: 52,
                      ),
                      _ArrowItem(
                        icon: HugeIcons.strokeRoundedDownload01,
                        label: 'My Downloads',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ── Group 3: Legal ──
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF141414),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      _ArrowItem(
                        icon: HugeIcons.strokeRoundedHelpCircle,
                        label: 'FAQ',
                        onTap: () {},
                      ),
                      Divider(
                        color: Colors.white.withOpacity(0.05),
                        height: 1,
                        indent: 52,
                      ),
                      _ArrowItem(
                        icon: HugeIcons.strokeRoundedFile01,
                        label: 'Terms of service',
                        onTap: () {},
                      ),
                      Divider(
                        color: Colors.white.withOpacity(0.05),
                        height: 1,
                        indent: 52,
                      ),
                      _ArrowItem(
                        icon: HugeIcons.strokeRoundedFile02,
                        label: 'User policy',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ── Logout Button ──
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 40),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HugeIcon(
                          icon: HugeIcons.strokeRoundedLogout02,
                          color: Colors.red[400]!,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Log Out',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.red[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Toggle Item ───────────────────────────────────────────────

class _ToggleItem extends StatelessWidget {
  final dynamic icon;
  final String label;
  final bool value;
  final Color activeColor;
  final ValueChanged<bool> onChanged;

  const _ToggleItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.activeColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          HugeIcon(icon: icon, color: Colors.grey[400]!, size: 22),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 28,
            child: FittedBox(
              child: Switch(
                value: value,
                onChanged: onChanged,
                activeColor: activeColor,
                activeTrackColor: activeColor.withOpacity(0.3),
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.white.withOpacity(0.15),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Arrow Item ────────────────────────────────────────────────

class _ArrowItem extends StatelessWidget {
  final dynamic icon;
  final String label;
  final VoidCallback onTap;

  const _ArrowItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            HugeIcon(icon: icon, color: Colors.grey[400]!, size: 22),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            HugeIcon(
              icon: HugeIcons.strokeRoundedArrowRight01,
              color: Colors.grey[600]!,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
