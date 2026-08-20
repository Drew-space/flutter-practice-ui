import 'package:flutter/material.dart';
import 'package:practice_ui/apps/movieapp/URLs/models/movie_models.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../models/movie_model.dart';

class VidkingPlayerPage extends StatefulWidget {
  final Map<String, dynamic> movie; // <-- Change from MovieModel to Map
  final int season;
  final int episode;

  const VidkingPlayerPage({
    super.key,
    required this.movie,
    this.season = 1,
    this.episode = 1,
  });

  @override
  State<VidkingPlayerPage> createState() => _VidkingPlayerPageState();
}

class _VidkingPlayerPageState extends State<VidkingPlayerPage> {
  late final WebViewController _controller;
  bool _showControls = true;
  bool _isLoading = true;
  int _currentSeason;
  int _currentEpisode;
  double _volume = 1.0;

  _VidkingPlayerPageState() : _currentSeason = 1, _currentEpisode = 1;

  @override
  void initState() {
    super.initState();
    _currentSeason = widget.season;
    _currentEpisode = widget.episode;
    _initWebView();
  }

  // String get _vidkingUrl {
  //   if (widget.movie.isMovie) {
  //     return 'https://www.vidking.net/embed/movie/${widget.movie.id}?color=7C3AED&autoPlay=true';
  //   }
  //   return 'https://www.vidking.net/embed/tv/${widget.movie.id}/$_currentSeason/$_currentEpisode?color=7C3AED&autoPlay=true&nextEpisode=true&episodeSelector=true';
  // }

  // Replace MovieModel getters with map lookups:
  String get _title =>
      widget.movie['title'] ?? widget.movie['name'] ?? 'Unknown';
  int get _id => widget.movie['id'] ?? 0;
  bool get _isMovie => widget.movie['title'] != null;

  String get _vidkingUrl {
    if (_isMovie) {
      return 'https://www.vidking.net/embed/movie/$_id?color=7C3AED&autoPlay=true';
    }
    return 'https://www.vidking.net/embed/tv/$_id/$currentSeason/$currentEpisode?color=7C3AED&autoPlay=true&nextEpisode=true&episodeSelector=true';
  }

  void _initWebView() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.black)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (_) => setState(() => _isLoading = false),
          onWebResourceError: (_) => setState(() => _isLoading = false),
        ),
      )
      ..loadRequest(Uri.parse(_vidkingUrl));
  }

  void _reloadWithEpisode(int season, int episode) {
    setState(() {
      _currentSeason = season;
      _currentEpisode = episode;
      _isLoading = true;
    });
    _controller.loadRequest(Uri.parse(_vidkingUrl));
  }

  void _toggleControls() {
    setState(() => _showControls = !_showControls);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: _toggleControls,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // WebView Player
            WebViewWidget(controller: _controller),

            // Loading Indicator
            if (_isLoading)
              Container(
                color: Colors.black,
                child: const Center(
                  child: CircularProgressIndicator(color: Color(0xFF7C3AED)),
                ),
              ),

            // Controls Overlay
            if (_showControls) ...[
              // Top Bar
              _buildTopBar(),

              // Center Play/Pause (Vidking handles this, but we show a hint)
              if (!_isLoading)
                Center(
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white.withOpacity(0.3)),
                    ),
                    child: const Icon(
                      Icons.touch_app,
                      color: Colors.white54,
                      size: 32,
                    ),
                  ),
                ),

              // Bottom Controls
              _buildBottomControls(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black.withOpacity(0.8), Colors.transparent],
          ),
        ),
        child: Row(
          children: [
            _ControlButton(
              icon: Icons.arrow_back_ios_new_rounded,
              onTap: () => Navigator.pop(context),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                widget.movie.displayTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            _ControlButton(
              icon: Icons.cast,
              onTap: () {}, // Chromecast/AirPlay
            ),
            const SizedBox(width: 8),
            _ControlButton(
              icon: Icons.settings_outlined,
              onTap: _showSettingsMenu,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomControls() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.black.withOpacity(0.9), Colors.transparent],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Progress bar (decorative - Vidking handles actual seeking)
              Container(
                height: 3,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor:
                      0.3, // Placeholder - would need JS bridge for real progress
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF7C3AED),
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Control Buttons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Subtitles
                  _ControlButton(
                    icon: Icons.subtitles_outlined,
                    label: 'CC',
                    onTap: _showSubtitleOptions,
                  ),

                  // Skip Backward 10s
                  _ControlButton(
                    icon: Icons.replay_10_rounded,
                    size: 32,
                    onTap: () => _seek(-10),
                  ),

                  // Play/Pause (handled by Vidking, this is visual)
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: const Color(0xFF7C3AED),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF7C3AED).withOpacity(0.4),
                          blurRadius: 20,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),

                  // Skip Forward 10s
                  _ControlButton(
                    icon: Icons.forward_10_rounded,
                    size: 32,
                    onTap: () => _seek(10),
                  ),

                  // Episodes (TV only)
                  if (!widget.movie.isMovie)
                    _ControlButton(
                      icon: Icons.list_rounded,
                      label: 'Eps',
                      onTap: _showEpisodeSelector,
                    )
                  else
                    _ControlButton(
                      icon: Icons.fullscreen_rounded,
                      onTap: _toggleFullscreen,
                    ),
                ],
              ),
              const SizedBox(height: 12),

              // Secondary Row: Volume, Quality, Server
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _ControlButton(
                    icon: _volume > 0 ? Icons.volume_up : Icons.volume_off,
                    onTap: _toggleMute,
                  ),
                  _ControlButton(
                    icon: Icons.hd_outlined,
                    label: 'Auto',
                    onTap: _showQualitySelector,
                  ),
                  _ControlButton(
                    icon: Icons.dns_rounded,
                    label: 'Server',
                    onTap: _showServerSelector,
                  ),
                  if (!widget.movie.isMovie)
                    _ControlButton(
                      icon: Icons.fullscreen_rounded,
                      onTap: _toggleFullscreen,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Control Actions ──
  void _seek(int seconds) {
    // Vidking doesn't expose JS API for seeking directly
    // You'd need to inject JavaScript or use postMessage
    _controller.runJavaScript('''
      try {
        const video = document.querySelector('video');
        if (video) video.currentTime += $seconds;
      } catch(e) {}
    ''');
  }

  void _toggleMute() {
    setState(() => _volume = _volume > 0 ? 0 : 1);
    _controller.runJavaScript('''
      try {
        const video = document.querySelector('video');
        if (video) video.muted = ${_volume == 0};
      } catch(e) {}
    ''');
  }

  void _toggleFullscreen() {
    _controller.runJavaScript('''
      try {
        const video = document.querySelector('video');
        if (video) {
          if (document.fullscreenElement) {
            document.exitFullscreen();
          } else {
            video.requestFullscreen();
          }
        }
      } catch(e) {}
    ''');
  }

  // ── Bottom Sheets ──
  void _showEpisodeSelector() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1C1C1C),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => _EpisodeSelector(
        movie: widget.movie,
        currentSeason: _currentSeason,
        currentEpisode: _currentEpisode,
        onSelect: (s, e) {
          Navigator.pop(context);
          _reloadWithEpisode(s, e);
        },
      ),
    );
  }

  void _showQualitySelector() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1C1C1C),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => _QualitySelector(
        qualities: const ['Auto', '4K', '1080p', '720p', '480p', '360p'],
        onSelect: (q) => Navigator.pop(context),
      ),
    );
  }

  void _showServerSelector() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1C1C1C),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => _ServerSelector(
        servers: const ['Vidking', 'Server 2', 'Server 3'],
        onSelect: (s) => Navigator.pop(context),
      ),
    );
  }

  void _showSubtitleOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1C1C1C),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => _SubtitleSelector(
        subtitles: const ['Off', 'English', 'Spanish', 'French', 'German'],
        onSelect: (s) => Navigator.pop(context),
      ),
    );
  }

  void _showSettingsMenu() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1C1C1C),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.speed, color: Colors.white),
              title: const Text(
                'Playback Speed',
                style: TextStyle(color: Colors.white),
              ),
              trailing: const Text(
                '1.0x',
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.subtitles, color: Colors.white),
              title: const Text(
                'Subtitles',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                _showSubtitleOptions();
              },
            ),
            ListTile(
              leading: const Icon(Icons.hd, color: Colors.white),
              title: const Text(
                'Quality',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                _showQualitySelector();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.clearCache();
    super.dispose();
  }
}

// ─── Helper Widgets ─────────────────────────────────────────────

class _ControlButton extends StatelessWidget {
  final IconData icon;
  final String? label;
  final double size;
  final VoidCallback onTap;

  const _ControlButton({
    required this.icon,
    this.label,
    this.size = 24,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: size),
          if (label != null) ...[
            const SizedBox(height: 2),
            Text(
              label!,
              style: const TextStyle(color: Colors.white70, fontSize: 10),
            ),
          ],
        ],
      ),
    );
  }
}

// ─── Bottom Sheet Widgets ─────────────────────────────────────

class _EpisodeSelector extends StatelessWidget {
  final MovieModel movie;
  final int currentSeason;
  final int currentEpisode;
  final Function(int season, int episode) onSelect;

  const _EpisodeSelector({
    required this.movie,
    required this.currentSeason,
    required this.currentEpisode,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: movie.seasons.length,
      initialIndex: movie.seasons
          .indexWhere((s) => s.seasonNumber == currentSeason)
          .clamp(0, movie.seasons.length - 1),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: const Text(
              'Episodes',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TabBar(
            isScrollable: true,
            labelColor: const Color(0xFF7C3AED),
            unselectedLabelColor: Colors.grey,
            indicatorColor: const Color(0xFF7C3AED),
            tabs: movie.seasons.map((s) => Tab(text: s.name)).toList(),
          ),
          Expanded(
            child: TabBarView(
              children: movie.seasons.map((season) {
                return ListView.builder(
                  itemCount: season.episodeCount,
                  itemBuilder: (context, index) {
                    final ep = index + 1;
                    final isCurrent =
                        season.seasonNumber == currentSeason &&
                        ep == currentEpisode;
                    return ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: isCurrent
                              ? const Color(0xFF7C3AED)
                              : Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            '$ep',
                            style: TextStyle(
                              color: isCurrent ? Colors.white : Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        'Episode $ep',
                        style: TextStyle(
                          color: isCurrent
                              ? const Color(0xFF7C3AED)
                              : Colors.white,
                          fontWeight: isCurrent
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      trailing: isCurrent
                          ? const Icon(
                              Icons.play_arrow,
                              color: Color(0xFF7C3AED),
                            )
                          : null,
                      onTap: () => onSelect(season.seasonNumber, ep),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _QualitySelector extends StatelessWidget {
  final List<String> qualities;
  final Function(String) onSelect;

  const _QualitySelector({required this.qualities, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Quality',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...qualities.map(
          (q) => ListTile(
            title: Text(q, style: const TextStyle(color: Colors.white)),
            trailing: q == 'Auto'
                ? const Icon(Icons.check, color: Color(0xFF7C3AED))
                : null,
            onTap: () => onSelect(q),
          ),
        ),
      ],
    );
  }
}

class _ServerSelector extends StatelessWidget {
  final List<String> servers;
  final Function(String) onSelect;

  const _ServerSelector({required this.servers, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Select Server',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...servers.map(
          (s) => ListTile(
            leading: const Icon(Icons.dns, color: Colors.white70),
            title: Text(s, style: const TextStyle(color: Colors.white)),
            trailing: s == 'Vidking'
                ? const Icon(Icons.check, color: Color(0xFF7C3AED))
                : null,
            onTap: () => onSelect(s),
          ),
        ),
      ],
    );
  }
}

class _SubtitleSelector extends StatelessWidget {
  final List<String> subtitles;
  final Function(String) onSelect;

  const _SubtitleSelector({required this.subtitles, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Subtitles',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...subtitles.map(
          (s) => ListTile(
            title: Text(s, style: const TextStyle(color: Colors.white)),
            trailing: s == 'Off'
                ? const Icon(Icons.check, color: Color(0xFF7C3AED))
                : null,
            onTap: () => onSelect(s),
          ),
        ),
      ],
    );
  }
}
