import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

// ============================================================
// DROP-IN MAIN.DART — Movie Player Screen
// ============================================================
// 1. Add to pubspec.yaml:
//    dependencies:
//      video_player: ^2.9.1
//
// 2. iOS: Add to ios/Runner/Info.plist for HTTP support:
//    <key>NSAppTransportSecurity</key>
//    <dict>
//      <key>NSAllowsArbitraryLoads</key>
//      <true/>
//    </dict>
//
// 3. Android: Ensure this permission in AndroidManifest.xml:
//    <uses-permission android:name="android.permission.INTERNET"/>
// ============================================================

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Player',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.movie_outlined,
              size: 64,
              color: Color(0xFF00D09C),
            ),
            const SizedBox(height: 20),
            const Text(
              'Movie Player Demo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tap below to start watching',
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MoviePlayerScreen(
                    videoUrl:
                        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                    title: 'Avatar: The Way of Water',
                  ),
                ),
              ),
              child: Container(
                width: 220,
                height: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=400&h=600&fit=crop',
                    ),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF00D09C).withOpacity(0.2),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.all(16),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Avatar: The Way of Water',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Sci-Fi · 3h 12m',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Alternative: direct URL input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Or paste a video URL...',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.05),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  suffixIcon: const Icon(
                    Icons.arrow_forward,
                    color: Color(0xFF00D09C),
                  ),
                ),
                onSubmitted: (url) {
                  if (url.trim().isEmpty) return;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MoviePlayerScreen(
                        videoUrl: url.trim(),
                        title: 'Custom Video',
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// MOVIE PLAYER SCREEN
// ============================================================

class MoviePlayerScreen extends StatefulWidget {
  final String videoUrl;
  final String title;
  final String? subtitle;

  const MoviePlayerScreen({
    super.key,
    required this.videoUrl,
    required this.title,
    this.subtitle,
  });

  @override
  State<MoviePlayerScreen> createState() => _MoviePlayerScreenState();
}

class _MoviePlayerScreenState extends State<MoviePlayerScreen>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _controller;
  late AnimationController _fadeController;

  bool _controlsVisible = true;
  bool _isBuffering = false;
  bool _showLanguagePanel = false;
  bool _isFullScreen = false;
  double _volume = 1.0;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;

  String _selectedLanguage = 'English (US)';
  String _selectedSubtitle = 'English (US)';

  final List<Map<String, dynamic>> _languages = [
    {'name': 'Chinese', 'code': 'zh'},
    {'name': 'Español', 'code': 'es'},
    {'name': 'Indonesian', 'code': 'id'},
    {'name': 'English (US)', 'code': 'en-US', 'selected': true},
    {'name': 'Malay', 'code': 'ms'},
    {'name': 'English (UK)', 'code': 'en-GB'},
    {'name': 'Japanese', 'code': 'ja'},
  ];

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _fadeController.value = 1.0;

    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..addListener(_onVideoUpdate)
      ..initialize().then((_) {
        if (mounted) {
          setState(() {
            _duration = _controller.value.duration;
          });
          _controller.play();
          _startControlsTimer();
        }
      });

    _startControlsTimer();
  }

  void _onVideoUpdate() {
    if (!mounted) return;
    setState(() {
      _position = _controller.value.position;
      if (_controller.value.duration > Duration.zero) {
        _duration = _controller.value.duration;
      }
      _isBuffering = _controller.value.isBuffering;
    });
  }

  void _startControlsTimer() {
    if (_controller.value.isPlaying) {
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted &&
            _controller.value.isPlaying &&
            !_showLanguagePanel &&
            _controlsVisible) {
          _hideControls();
        }
      });
    }
  }

  void _showControls() {
    if (!_controlsVisible) {
      setState(() {
        _controlsVisible = true;
      });
      _fadeController.forward();
    }
    _startControlsTimer();
  }

  void _hideControls() {
    if (_showLanguagePanel) return;
    _fadeController.reverse().then((_) {
      if (mounted) {
        setState(() {
          _controlsVisible = false;
        });
      }
    });
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
        _startControlsTimer();
      }
    });
  }

  void _seekForward() {
    final newPos = _position + const Duration(seconds: 10);
    _controller.seekTo(newPos < _duration ? newPos : _duration);
    _showControls();
  }

  void _seekBackward() {
    final newPos = _position - const Duration(seconds: 10);
    _controller.seekTo(newPos > Duration.zero ? newPos : Duration.zero);
    _showControls();
  }

  void _onSliderChanged(double value) {
    final newPos = Duration(milliseconds: value.toInt());
    _controller.seekTo(newPos);
    setState(() {
      _position = newPos;
    });
  }

  void _toggleLanguagePanel() {
    setState(() {
      _showLanguagePanel = !_showLanguagePanel;
    });
    if (_showLanguagePanel) {
      _controller.pause();
    } else {
      _controller.play();
      _startControlsTimer();
    }
  }

  void _selectLanguage(String lang) {
    setState(() {
      _selectedLanguage = lang;
      for (var l in _languages) {
        l['selected'] = l['name'] == lang;
      }
    });
  }

  void _selectSubtitle(String sub) {
    setState(() {
      _selectedSubtitle = sub;
    });
  }

  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });
    if (_isFullScreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
  }

  void _toggleMute() {
    setState(() {
      _volume = _volume == 0.0 ? 1.0 : 0.0;
      _controller.setVolume(_volume);
    });
  }

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = d.inHours;
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final seconds = twoDigits(d.inSeconds.remainder(60));
    if (hours > 0) {
      return '${twoDigits(hours)}:$minutes:$seconds';
    }
    return '$minutes:$seconds';
  }

  double _sliderMax() {
    final ms = _duration.inMilliseconds.toDouble();
    return ms > 0 ? ms : 1.0;
  }

  double _sliderValue() {
    final ms = _position.inMilliseconds.toDouble();
    final max = _sliderMax();
    return ms.clamp(0.0, max);
  }

  @override
  void dispose() {
    _controller.removeListener(_onVideoUpdate);
    _controller.dispose();
    _fadeController.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isInitialized = _controller.value.isInitialized;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Video player — tap anywhere to show controls
          GestureDetector(
            onTap: _showControls,
            child: Center(
              child: isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : const SizedBox.shrink(),
            ),
          ),

          // Loading / buffering indicator
          if (!isInitialized || _isBuffering)
            const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF00D09C),
                strokeWidth: 3,
              ),
            ),

          // Controls overlay
          if (_controlsVisible)
            FadeTransition(
              opacity: _fadeController,
              child: GestureDetector(
                onTap: _hideControls,
                child: Container(
                  color: Colors.black.withOpacity(0.35),
                  child: SafeArea(
                    child: Column(
                      children: [
                        _buildTopBar(),
                        Expanded(child: _buildCenterControls()),
                        _buildBottomControls(),
                      ],
                    ),
                  ),
                ),
              ),
            ),

          // Language / subtitle selection panel
          if (_showLanguagePanel) _buildLanguagePanel(),
        ],
      ),
    );
  }

  // ─── TOP BAR ───────────────────────────────────────────────
  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          // Back
          _iconButton(
            icon: Icons.arrow_back_ios_new_rounded,
            onTap: () => Navigator.pop(context),
          ),
          const SizedBox(width: 14),
          // Title
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (widget.subtitle != null)
                  Text(
                    widget.subtitle!,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 12,
                    ),
                  ),
              ],
            ),
          ),
          // Share
          _iconButton(
            icon: Icons.share_outlined,
            onTap: () {
              // Wire up your share logic here
            },
          ),
          const SizedBox(width: 8),
          // Language toggle
          _iconButton(
            icon: Icons.closed_caption_outlined,
            isActive: _showLanguagePanel,
            onTap: _toggleLanguagePanel,
          ),
        ],
      ),
    );
  }

  Widget _iconButton({
    required IconData icon,
    required VoidCallback onTap,
    bool isActive = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: isActive
              ? const Color(0xFF00D09C).withOpacity(0.25)
              : Colors.white.withOpacity(0.12),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Icon(
          icon,
          color: isActive ? const Color(0xFF00D09C) : Colors.white,
          size: 18,
        ),
      ),
    );
  }

  // ─── CENTER CONTROLS ───────────────────────────────────────
  Widget _buildCenterControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Rewind 10s
        _roundButton(
          icon: Icons.replay_10_rounded,
          size: 44,
          iconSize: 24,
          onTap: _seekBackward,
        ),
        const SizedBox(width: 32),
        // Play / Pause
        GestureDetector(
          onTap: _togglePlayPause,
          child: Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.22),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Icon(
              _controller.value.isPlaying
                  ? Icons.pause_rounded
                  : Icons.play_arrow_rounded,
              color: Colors.white,
              size: 36,
            ),
          ),
        ),
        const SizedBox(width: 32),
        // Forward 10s
        _roundButton(
          icon: Icons.forward_10_rounded,
          size: 44,
          iconSize: 24,
          onTap: _seekForward,
        ),
      ],
    );
  }

  Widget _roundButton({
    required IconData icon,
    required double size,
    required double iconSize,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Icon(icon, color: Colors.white, size: iconSize),
      ),
    );
  }

  // ─── BOTTOM CONTROLS ─────────────────────────────────────
  Widget _buildBottomControls() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Progress slider
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 3,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
              activeTrackColor: const Color(0xFF00D09C),
              inactiveTrackColor: Colors.white.withOpacity(0.25),
              thumbColor: const Color(0xFF00D09C),
              overlayColor: const Color(0xFF00D09C).withOpacity(0.15),
            ),
            child: Slider(
              value: _sliderValue(),
              min: 0,
              max: _sliderMax(),
              onChanged: _onSliderChanged,
            ),
          ),
          // Time + icons row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Text(
                  _formatDuration(_position),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFeatures: [FontFeature.tabularFigures()],
                  ),
                ),
                const Spacer(),
                // Mute
                GestureDetector(
                  onTap: _toggleMute,
                  child: Icon(
                    _volume == 0
                        ? Icons.volume_off_rounded
                        : Icons.volume_up_rounded,
                    color: Colors.white.withOpacity(0.75),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 16),
                // Fullscreen
                GestureDetector(
                  onTap: _toggleFullScreen,
                  child: Icon(
                    _isFullScreen
                        ? Icons.fullscreen_exit_rounded
                        : Icons.fullscreen_rounded,
                    color: Colors.white.withOpacity(0.75),
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─── LANGUAGE PANEL ────────────────────────────────────────
  Widget _buildLanguagePanel() {
    return Positioned(
      right: 0,
      top: 0,
      bottom: 0,
      width: 200,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Colors.black.withOpacity(0.92),
              Colors.black.withOpacity(0.75),
              Colors.transparent,
            ],
            stops: const [0.0, 0.75, 1.0],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 28, top: 80, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _langSectionTitle('Audio'),
                const SizedBox(height: 12),
                ..._languages.map((lang) {
                  final isSel = lang['name'] == _selectedLanguage;
                  return _langItem(
                    label: lang['name'],
                    isSelected: isSel,
                    onTap: () => _selectLanguage(lang['name']),
                  );
                }),
                const SizedBox(height: 20),
                Divider(color: Colors.white.withOpacity(0.12), height: 1),
                const SizedBox(height: 20),
                _langSectionTitle('Subtitles'),
                const SizedBox(height: 12),
                ..._languages.map((lang) {
                  final isSel = lang['name'] == _selectedSubtitle;
                  return _langItem(
                    label: lang['name'],
                    isSelected: isSel,
                    onTap: () => _selectSubtitle(lang['name']),
                  );
                }),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _langSectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 13,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _langItem({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected)
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.check_rounded,
                  color: Color(0xFF00D09C),
                  size: 16,
                ),
              ),
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : Colors.white.withOpacity(0.55),
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
