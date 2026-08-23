// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:video_player/video_player.dart';

// // // ============================================================
// // // DROP-IN MAIN.DART — Movie Player Screen
// // // ============================================================
// // // 1. Add to pubspec.yaml:
// // //    dependencies:
// // //      video_player: ^2.9.1
// // //
// // // 2. iOS: Add to ios/Runner/Info.plist for HTTP support:
// // //    <key>NSAppTransportSecurity</key>
// // //    <dict>
// // //      <key>NSAllowsArbitraryLoads</key>
// // //      <true/>
// // //    </dict>
// // //
// // // 3. Android: Ensure this permission in AndroidManifest.xml:
// // //    <uses-permission android:name="android.permission.INTERNET"/>
// // // ============================================================

// // void main() {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   SystemChrome.setPreferredOrientations([
// //     DeviceOrientation.portraitUp,
// //     DeviceOrientation.portraitDown,
// //   ]);
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Movie Player',
// //       debugShowCheckedModeBanner: false,
// //       theme: ThemeData(
// //         brightness: Brightness.dark,
// //         scaffoldBackgroundColor: Colors.black,
// //         useMaterial3: true,
// //       ),
// //       home: const HomePage(),
// //     );
// //   }
// // }

// // class HomePage extends StatelessWidget {
// //   const HomePage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xFF0F0F0F),
// //       body: Center(
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             const Icon(
// //               Icons.movie_outlined,
// //               size: 64,
// //               color: Color(0xFF00D09C),
// //             ),
// //             const SizedBox(height: 20),
// //             const Text(
// //               'Movie Player Demo',
// //               style: TextStyle(
// //                 color: Colors.white,
// //                 fontSize: 24,
// //                 fontWeight: FontWeight.w600,
// //               ),
// //             ),
// //             const SizedBox(height: 8),
// //             Text(
// //               'Tap below to start watching',
// //               style: TextStyle(
// //                 color: Colors.white.withOpacity(0.5),
// //                 fontSize: 14,
// //               ),
// //             ),
// //             const SizedBox(height: 40),
// //             GestureDetector(
// //               onTap: () => Navigator.push(
// //                 context,
// //                 MaterialPageRoute(
// //                   builder: (_) => const MoviePlayerScreen(
// //                     videoUrl:
// //                         'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
// //                     title: 'Avatar: The Way of Water',
// //                   ),
// //                 ),
// //               ),
// //               child: Container(
// //                 width: 220,
// //                 height: 320,
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(16),
// //                   image: const DecorationImage(
// //                     image: NetworkImage(
// //                       'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=400&h=600&fit=crop',
// //                     ),
// //                     fit: BoxFit.cover,
// //                   ),
// //                   boxShadow: [
// //                     BoxShadow(
// //                       color: const Color(0xFF00D09C).withOpacity(0.2),
// //                       blurRadius: 20,
// //                       spreadRadius: 2,
// //                     ),
// //                   ],
// //                 ),
// //                 child: Container(
// //                   decoration: BoxDecoration(
// //                     borderRadius: BorderRadius.circular(16),
// //                     gradient: LinearGradient(
// //                       begin: Alignment.topCenter,
// //                       end: Alignment.bottomCenter,
// //                       colors: [
// //                         Colors.transparent,
// //                         Colors.black.withOpacity(0.8),
// //                       ],
// //                     ),
// //                   ),
// //                   alignment: Alignment.bottomLeft,
// //                   padding: const EdgeInsets.all(16),
// //                   child: const Column(
// //                     mainAxisSize: MainAxisSize.min,
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(
// //                         'Avatar: The Way of Water',
// //                         style: TextStyle(
// //                           color: Colors.white,
// //                           fontSize: 16,
// //                           fontWeight: FontWeight.w600,
// //                         ),
// //                       ),
// //                       SizedBox(height: 4),
// //                       Text(
// //                         'Sci-Fi · 3h 12m',
// //                         style: TextStyle(color: Colors.white70, fontSize: 12),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(height: 32),
// //             // Alternative: direct URL input
// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 40),
// //               child: TextField(
// //                 style: const TextStyle(color: Colors.white),
// //                 decoration: InputDecoration(
// //                   hintText: 'Or paste a video URL...',
// //                   hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
// //                   filled: true,
// //                   fillColor: Colors.white.withOpacity(0.05),
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(12),
// //                     borderSide: BorderSide.none,
// //                   ),
// //                   contentPadding: const EdgeInsets.symmetric(
// //                     horizontal: 16,
// //                     vertical: 14,
// //                   ),
// //                   suffixIcon: const Icon(
// //                     Icons.arrow_forward,
// //                     color: Color(0xFF00D09C),
// //                   ),
// //                 ),
// //                 onSubmitted: (url) {
// //                   if (url.trim().isEmpty) return;
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (_) => MoviePlayerScreen(
// //                         videoUrl: url.trim(),
// //                         title: 'Custom Video',
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // ============================================================
// // // MOVIE PLAYER SCREEN
// // // ============================================================

// // class MoviePlayerScreen extends StatefulWidget {
// //   final String videoUrl;
// //   final String title;
// //   final String? subtitle;

// //   const MoviePlayerScreen({
// //     super.key,
// //     required this.videoUrl,
// //     required this.title,
// //     this.subtitle,
// //   });

// //   @override
// //   State<MoviePlayerScreen> createState() => _MoviePlayerScreenState();
// // }

// // class _MoviePlayerScreenState extends State<MoviePlayerScreen>
// //     with SingleTickerProviderStateMixin {
// //   late VideoPlayerController _controller;
// //   late AnimationController _fadeController;

// //   bool _controlsVisible = true;
// //   bool _isBuffering = false;
// //   bool _showLanguagePanel = false;
// //   bool _isFullScreen = false;
// //   double _volume = 1.0;
// //   Duration _position = Duration.zero;
// //   Duration _duration = Duration.zero;

// //   String _selectedLanguage = 'English (US)';
// //   String _selectedSubtitle = 'English (US)';

// //   final List<Map<String, dynamic>> _languages = [
// //     {'name': 'Chinese', 'code': 'zh'},
// //     {'name': 'Español', 'code': 'es'},
// //     {'name': 'Indonesian', 'code': 'id'},
// //     {'name': 'English (US)', 'code': 'en-US', 'selected': true},
// //     {'name': 'Malay', 'code': 'ms'},
// //     {'name': 'English (UK)', 'code': 'en-GB'},
// //     {'name': 'Japanese', 'code': 'ja'},
// //   ];

// //   @override
// //   void initState() {
// //     super.initState();
// //     _fadeController = AnimationController(
// //       vsync: this,
// //       duration: const Duration(milliseconds: 300),
// //     );
// //     _fadeController.value = 1.0;

// //     _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
// //       ..addListener(_onVideoUpdate)
// //       ..initialize().then((_) {
// //         if (mounted) {
// //           setState(() {
// //             _duration = _controller.value.duration;
// //           });
// //           _controller.play();
// //           _startControlsTimer();
// //         }
// //       });

// //     _startControlsTimer();
// //   }

// //   void _onVideoUpdate() {
// //     if (!mounted) return;
// //     setState(() {
// //       _position = _controller.value.position;
// //       if (_controller.value.duration > Duration.zero) {
// //         _duration = _controller.value.duration;
// //       }
// //       _isBuffering = _controller.value.isBuffering;
// //     });
// //   }

// //   void _startControlsTimer() {
// //     if (_controller.value.isPlaying) {
// //       Future.delayed(const Duration(seconds: 3), () {
// //         if (mounted &&
// //             _controller.value.isPlaying &&
// //             !_showLanguagePanel &&
// //             _controlsVisible) {
// //           _hideControls();
// //         }
// //       });
// //     }
// //   }

// //   void _showControls() {
// //     if (!_controlsVisible) {
// //       setState(() {
// //         _controlsVisible = true;
// //       });
// //       _fadeController.forward();
// //     }
// //     _startControlsTimer();
// //   }

// //   void _hideControls() {
// //     if (_showLanguagePanel) return;
// //     _fadeController.reverse().then((_) {
// //       if (mounted) {
// //         setState(() {
// //           _controlsVisible = false;
// //         });
// //       }
// //     });
// //   }

// //   void _togglePlayPause() {
// //     setState(() {
// //       if (_controller.value.isPlaying) {
// //         _controller.pause();
// //       } else {
// //         _controller.play();
// //         _startControlsTimer();
// //       }
// //     });
// //   }

// //   void _seekForward() {
// //     final newPos = _position + const Duration(seconds: 10);
// //     _controller.seekTo(newPos < _duration ? newPos : _duration);
// //     _showControls();
// //   }

// //   void _seekBackward() {
// //     final newPos = _position - const Duration(seconds: 10);
// //     _controller.seekTo(newPos > Duration.zero ? newPos : Duration.zero);
// //     _showControls();
// //   }

// //   void _onSliderChanged(double value) {
// //     final newPos = Duration(milliseconds: value.toInt());
// //     _controller.seekTo(newPos);
// //     setState(() {
// //       _position = newPos;
// //     });
// //   }

// //   void _toggleLanguagePanel() {
// //     setState(() {
// //       _showLanguagePanel = !_showLanguagePanel;
// //     });
// //     if (_showLanguagePanel) {
// //       _controller.pause();
// //     } else {
// //       _controller.play();
// //       _startControlsTimer();
// //     }
// //   }

// //   void _selectLanguage(String lang) {
// //     setState(() {
// //       _selectedLanguage = lang;
// //       for (var l in _languages) {
// //         l['selected'] = l['name'] == lang;
// //       }
// //     });
// //   }

// //   void _selectSubtitle(String sub) {
// //     setState(() {
// //       _selectedSubtitle = sub;
// //     });
// //   }

// //   void _toggleFullScreen() {
// //     setState(() {
// //       _isFullScreen = !_isFullScreen;
// //     });
// //     if (_isFullScreen) {
// //       SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
// //       SystemChrome.setPreferredOrientations([
// //         DeviceOrientation.landscapeLeft,
// //         DeviceOrientation.landscapeRight,
// //       ]);
// //     } else {
// //       SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
// //       SystemChrome.setPreferredOrientations([
// //         DeviceOrientation.portraitUp,
// //         DeviceOrientation.portraitDown,
// //       ]);
// //     }
// //   }

// //   void _toggleMute() {
// //     setState(() {
// //       _volume = _volume == 0.0 ? 1.0 : 0.0;
// //       _controller.setVolume(_volume);
// //     });
// //   }

// //   String _formatDuration(Duration d) {
// //     String twoDigits(int n) => n.toString().padLeft(2, '0');
// //     final hours = d.inHours;
// //     final minutes = twoDigits(d.inMinutes.remainder(60));
// //     final seconds = twoDigits(d.inSeconds.remainder(60));
// //     if (hours > 0) {
// //       return '${twoDigits(hours)}:$minutes:$seconds';
// //     }
// //     return '$minutes:$seconds';
// //   }

// //   double _sliderMax() {
// //     final ms = _duration.inMilliseconds.toDouble();
// //     return ms > 0 ? ms : 1.0;
// //   }

// //   double _sliderValue() {
// //     final ms = _position.inMilliseconds.toDouble();
// //     final max = _sliderMax();
// //     return ms.clamp(0.0, max);
// //   }

// //   @override
// //   void dispose() {
// //     _controller.removeListener(_onVideoUpdate);
// //     _controller.dispose();
// //     _fadeController.dispose();
// //     SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
// //     SystemChrome.setPreferredOrientations([
// //       DeviceOrientation.portraitUp,
// //       DeviceOrientation.portraitDown,
// //     ]);
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final isInitialized = _controller.value.isInitialized;

// //     return Scaffold(
// //       backgroundColor: Colors.black,
// //       body: Stack(
// //         children: [
// //           // Video player — tap anywhere to show controls
// //           GestureDetector(
// //             onTap: _showControls,
// //             child: Center(
// //               child: isInitialized
// //                   ? AspectRatio(
// //                       aspectRatio: _controller.value.aspectRatio,
// //                       child: VideoPlayer(_controller),
// //                     )
// //                   : const SizedBox.shrink(),
// //             ),
// //           ),

// //           // Loading / buffering indicator
// //           if (!isInitialized || _isBuffering)
// //             const Center(
// //               child: CircularProgressIndicator(
// //                 color: Color(0xFF00D09C),
// //                 strokeWidth: 3,
// //               ),
// //             ),

// //           // Controls overlay
// //           if (_controlsVisible)
// //             FadeTransition(
// //               opacity: _fadeController,
// //               child: GestureDetector(
// //                 onTap: _hideControls,
// //                 child: Container(
// //                   color: Colors.black.withOpacity(0.35),
// //                   child: SafeArea(
// //                     child: Column(
// //                       children: [
// //                         _buildTopBar(),
// //                         Expanded(child: _buildCenterControls()),
// //                         _buildBottomControls(),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),

// //           // Language / subtitle selection panel
// //           if (_showLanguagePanel) _buildLanguagePanel(),
// //         ],
// //       ),
// //     );
// //   }

// //   // ─── TOP BAR ───────────────────────────────────────────────
// //   Widget _buildTopBar() {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// //       child: Row(
// //         children: [
// //           // Back
// //           _iconButton(
// //             icon: Icons.arrow_back_ios_new_rounded,
// //             onTap: () => Navigator.pop(context),
// //           ),
// //           const SizedBox(width: 14),
// //           // Title
// //           Expanded(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(
// //                   widget.title,
// //                   style: const TextStyle(
// //                     color: Colors.white,
// //                     fontSize: 15,
// //                     fontWeight: FontWeight.w600,
// //                   ),
// //                   maxLines: 1,
// //                   overflow: TextOverflow.ellipsis,
// //                 ),
// //                 if (widget.subtitle != null)
// //                   Text(
// //                     widget.subtitle!,
// //                     style: TextStyle(
// //                       color: Colors.white.withOpacity(0.6),
// //                       fontSize: 12,
// //                     ),
// //                   ),
// //               ],
// //             ),
// //           ),
// //           // Share
// //           _iconButton(
// //             icon: Icons.share_outlined,
// //             onTap: () {
// //               // Wire up your share logic here
// //             },
// //           ),
// //           const SizedBox(width: 8),
// //           // Language toggle
// //           _iconButton(
// //             icon: Icons.closed_caption_outlined,
// //             isActive: _showLanguagePanel,
// //             onTap: _toggleLanguagePanel,
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _iconButton({
// //     required IconData icon,
// //     required VoidCallback onTap,
// //     bool isActive = false,
// //   }) {
// //     return GestureDetector(
// //       onTap: onTap,
// //       child: Container(
// //         width: 38,
// //         height: 38,
// //         decoration: BoxDecoration(
// //           color: isActive
// //               ? const Color(0xFF00D09C).withOpacity(0.25)
// //               : Colors.white.withOpacity(0.12),
// //           borderRadius: BorderRadius.circular(10),
// //         ),
// //         alignment: Alignment.center,
// //         child: Icon(
// //           icon,
// //           color: isActive ? const Color(0xFF00D09C) : Colors.white,
// //           size: 18,
// //         ),
// //       ),
// //     );
// //   }

// //   // ─── CENTER CONTROLS ───────────────────────────────────────
// //   Widget _buildCenterControls() {
// //     return Row(
// //       mainAxisAlignment: MainAxisAlignment.center,
// //       children: [
// //         // Rewind 10s
// //         _roundButton(
// //           icon: Icons.replay_10_rounded,
// //           size: 44,
// //           iconSize: 24,
// //           onTap: _seekBackward,
// //         ),
// //         const SizedBox(width: 32),
// //         // Play / Pause
// //         GestureDetector(
// //           onTap: _togglePlayPause,
// //           child: Container(
// //             width: 68,
// //             height: 68,
// //             decoration: BoxDecoration(
// //               color: Colors.white.withOpacity(0.22),
// //               shape: BoxShape.circle,
// //             ),
// //             alignment: Alignment.center,
// //             child: Icon(
// //               _controller.value.isPlaying
// //                   ? Icons.pause_rounded
// //                   : Icons.play_arrow_rounded,
// //               color: Colors.white,
// //               size: 36,
// //             ),
// //           ),
// //         ),
// //         const SizedBox(width: 32),
// //         // Forward 10s
// //         _roundButton(
// //           icon: Icons.forward_10_rounded,
// //           size: 44,
// //           iconSize: 24,
// //           onTap: _seekForward,
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _roundButton({
// //     required IconData icon,
// //     required double size,
// //     required double iconSize,
// //     required VoidCallback onTap,
// //   }) {
// //     return GestureDetector(
// //       onTap: onTap,
// //       child: Container(
// //         width: size,
// //         height: size,
// //         decoration: BoxDecoration(
// //           color: Colors.white.withOpacity(0.15),
// //           shape: BoxShape.circle,
// //         ),
// //         alignment: Alignment.center,
// //         child: Icon(icon, color: Colors.white, size: iconSize),
// //       ),
// //     );
// //   }

// //   // ─── BOTTOM CONTROLS ─────────────────────────────────────
// //   Widget _buildBottomControls() {
// //     return Padding(
// //       padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
// //       child: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         children: [
// //           // Progress slider
// //           SliderTheme(
// //             data: SliderTheme.of(context).copyWith(
// //               trackHeight: 3,
// //               thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
// //               overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
// //               activeTrackColor: const Color(0xFF00D09C),
// //               inactiveTrackColor: Colors.white.withOpacity(0.25),
// //               thumbColor: const Color(0xFF00D09C),
// //               overlayColor: const Color(0xFF00D09C).withOpacity(0.15),
// //             ),
// //             child: Slider(
// //               value: _sliderValue(),
// //               min: 0,
// //               max: _sliderMax(),
// //               onChanged: _onSliderChanged,
// //             ),
// //           ),
// //           // Time + icons row
// //           Padding(
// //             padding: const EdgeInsets.symmetric(horizontal: 8),
// //             child: Row(
// //               children: [
// //                 Text(
// //                   _formatDuration(_position),
// //                   style: const TextStyle(
// //                     color: Colors.white,
// //                     fontSize: 12,
// //                     fontWeight: FontWeight.w500,
// //                     fontFeatures: [FontFeature.tabularFigures()],
// //                   ),
// //                 ),
// //                 const Spacer(),
// //                 // Mute
// //                 GestureDetector(
// //                   onTap: _toggleMute,
// //                   child: Icon(
// //                     _volume == 0
// //                         ? Icons.volume_off_rounded
// //                         : Icons.volume_up_rounded,
// //                     color: Colors.white.withOpacity(0.75),
// //                     size: 20,
// //                   ),
// //                 ),
// //                 const SizedBox(width: 16),
// //                 // Fullscreen
// //                 GestureDetector(
// //                   onTap: _toggleFullScreen,
// //                   child: Icon(
// //                     _isFullScreen
// //                         ? Icons.fullscreen_exit_rounded
// //                         : Icons.fullscreen_rounded,
// //                     color: Colors.white.withOpacity(0.75),
// //                     size: 20,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   // ─── LANGUAGE PANEL ────────────────────────────────────────
// //   Widget _buildLanguagePanel() {
// //     return Positioned(
// //       right: 0,
// //       top: 0,
// //       bottom: 0,
// //       width: 200,
// //       child: Container(
// //         decoration: BoxDecoration(
// //           gradient: LinearGradient(
// //             begin: Alignment.centerRight,
// //             end: Alignment.centerLeft,
// //             colors: [
// //               Colors.black.withOpacity(0.92),
// //               Colors.black.withOpacity(0.75),
// //               Colors.transparent,
// //             ],
// //             stops: const [0.0, 0.75, 1.0],
// //           ),
// //         ),
// //         child: SafeArea(
// //           child: SingleChildScrollView(
// //             padding: const EdgeInsets.only(left: 28, top: 80, right: 20),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.end,
// //               children: [
// //                 _langSectionTitle('Audio'),
// //                 const SizedBox(height: 12),
// //                 ..._languages.map((lang) {
// //                   final isSel = lang['name'] == _selectedLanguage;
// //                   return _langItem(
// //                     label: lang['name'],
// //                     isSelected: isSel,
// //                     onTap: () => _selectLanguage(lang['name']),
// //                   );
// //                 }),
// //                 const SizedBox(height: 20),
// //                 Divider(color: Colors.white.withOpacity(0.12), height: 1),
// //                 const SizedBox(height: 20),
// //                 _langSectionTitle('Subtitles'),
// //                 const SizedBox(height: 12),
// //                 ..._languages.map((lang) {
// //                   final isSel = lang['name'] == _selectedSubtitle;
// //                   return _langItem(
// //                     label: lang['name'],
// //                     isSelected: isSel,
// //                     onTap: () => _selectSubtitle(lang['name']),
// //                   );
// //                 }),
// //                 const SizedBox(height: 40),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _langSectionTitle(String text) {
// //     return Text(
// //       text,
// //       style: const TextStyle(
// //         color: Colors.white,
// //         fontSize: 13,
// //         fontWeight: FontWeight.w600,
// //       ),
// //     );
// //   }

// //   Widget _langItem({
// //     required String label,
// //     required bool isSelected,
// //     required VoidCallback onTap,
// //   }) {
// //     return GestureDetector(
// //       onTap: onTap,
// //       child: Padding(
// //         padding: const EdgeInsets.symmetric(vertical: 9),
// //         child: Row(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             if (isSelected)
// //               const Padding(
// //                 padding: EdgeInsets.only(right: 8),
// //                 child: Icon(
// //                   Icons.check_rounded,
// //                   color: Color(0xFF00D09C),
// //                   size: 16,
// //                 ),
// //               ),
// //             Text(
// //               label,
// //               style: TextStyle(
// //                 color: isSelected
// //                     ? Colors.white
// //                     : Colors.white.withOpacity(0.55),
// //                 fontSize: 13,
// //                 fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:practice_ui/apps/movieapp/movielib/movie_api/apikey.dart';
// import 'package:practice_ui/apps/movieapp/widgets/movie_trend.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// /// ── MOVIE-ONLY PLAYER ──
// /// No seasons, no episodes. Just video + movie info + cast + related.
// class MoviePlayerPage extends StatefulWidget {
//   final Map<String, dynamic> movie;

//   const MoviePlayerPage({super.key, required this.movie});

//   @override
//   State<MoviePlayerPage> createState() => _MoviePlayerPageState();
// }

// class _MoviePlayerPageState extends State<MoviePlayerPage>
//     with WidgetsBindingObserver {
//   late final WebViewController _controller;
//   bool _isLoading = true;
//   bool _isFullscreen = false;

//   // Cast data
//   List<Map<String, dynamic>> _cast = [];
//   bool _castLoading = false;

//   // Synopsis expansion
//   bool _isSynopsisExpanded = false;
//   static const int _synopsisMaxLines = 3;

//   // Allowed domains
//   static const List<String> _allowedHosts = [
//     'vidsrcme.ru',
//     'cloudorchestranova.com',
//     'cdn.vidsrc.me',
//     'vidsrc.me',
//     'vidsrc.dev',
//     'vidsrc.to',
//     'vidsrc.in',
//     'vidsrc.net',
//     'vidsrc.xyz',
//     'vidsrc.cc',
//     'vidsrc.io',
//     'vidsrc.pm',
//     'vidsrc.vc',
//     'vidsrc.su',
//     'vidsrc.pro',
//     'vidsrc.tv',
//     'vidsrc.stream',
//     'vidsrc.click',
//     'vidsrc.icu',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//     _initWebView();
//     _fetchCast();
//   }

//   String get _title =>
//       widget.movie['title'] ?? widget.movie['name'] ?? 'Unknown';

//   String get _id {
//     final imdb = widget.movie['imdb_id'];
//     if (imdb != null && imdb.toString().isNotEmpty) {
//       return imdb.toString();
//     }
//     return widget.movie['id']?.toString() ?? '';
//   }

//   String get _vidsrcUrl {
//     if (_id.isEmpty) {
//       debugPrint('ERROR: No ID available for VidSrc');
//       return '';
//     }
//     return 'https://vidsrcme.ru/embed/movie/$_id?autoplay=1';
//   }

//   String get _vidsrcUrlWithResume {
//     String url = _vidsrcUrl;
//     if (url.isEmpty) return url;
//     final savedProgress = _getSavedProgress();
//     if (savedProgress > 30) {
//       final separator = url.contains('?') ? '&' : '?';
//       url = '$url${separator}startAt=${savedProgress.toInt()}';
//     }
//     return url;
//   }

//   double _getSavedProgress() {
//     final saved = widget.movie['_savedProgress'];
//     if (saved != null) return (saved as num).toDouble();
//     return 0.0;
//   }

//   void _saveProgress(double progress) {
//     widget.movie['_savedProgress'] = progress;
//   }

//   // ── Fetch Cast from TMDB ──
//   Future<void> _fetchCast() async {
//     final movieId = widget.movie['id'];
//     if (movieId == null) return;

//     final url =
//         'https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$apikey';

//     setState(() => _castLoading = true);
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         final castList = data['cast'] as List<dynamic>? ?? [];
//         setState(() {
//           _cast = castList
//               .take(10)
//               .map(
//                 (c) => {
//                   'name': c['name']?.toString() ?? 'Unknown',
//                   'character': c['character']?.toString() ?? '',
//                   'profile_path': c['profile_path']?.toString(),
//                   'profileUrl': c['profile_path'] != null
//                       ? 'https://image.tmdb.org/t/p/w185${c['profile_path']}'
//                       : '',
//                 },
//               )
//               .toList();
//           _castLoading = false;
//         });
//       }
//     } catch (e) {
//       debugPrint('Failed to fetch cast: $e');
//       setState(() => _castLoading = false);
//     }
//   }

//   void _initWebView() {
//     final url = _vidsrcUrlWithResume;
//     if (url.isEmpty) {
//       setState(() => _isLoading = false);
//       return;
//     }

//     _controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(Colors.black)
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onPageFinished: (_) {
//             setState(() => _isLoading = false);
//             _injectPostMessageListener();
//             _blockAdsAndPopups();
//             _autoClickPlayButton();
//           },
//           onWebResourceError: (error) {
//             debugPrint('WebView error: ${error.description}');
//           },
//           onNavigationRequest: (request) {
//             final uri = Uri.parse(request.url);
//             final host = uri.host.toLowerCase();
//             final isAllowed = _allowedHosts.any((h) => host.contains(h));
//             if (!isAllowed) {
//               debugPrint('BLOCKED redirect to: ${request.url}');
//               return NavigationDecision.prevent;
//             }
//             return NavigationDecision.navigate;
//           },
//         ),
//       )
//       ..loadRequest(Uri.parse(url));
//   }

//   void _autoClickPlayButton() {
//     const js = """
//       (function() {
//         function clickPlay() {
//           const playBtn = document.querySelector('.play-button, .vjs-big-play-button, [class*=\"play\"], button[title*=\"Play\"]');
//           if (playBtn) { playBtn.click(); return true; }
//           const video = document.querySelector('video');
//           if (video && video.paused) { video.play(); return true; }
//           return false;
//         }
//         clickPlay();
//         setTimeout(clickPlay, 500);
//         setTimeout(clickPlay, 1500);
//         setTimeout(clickPlay, 3000);
//       })();
//     """;
//     _controller.runJavaScript(js);
//   }

//   void _blockAdsAndPopups() {
//     const js = """
//       (function() {
//         'use strict';
//         window.open = function() { return null; };
//         document.addEventListener('click', function(e) {
//           const target = e.target.closest('a');
//           if (target) {
//             const href = target.href || '';
//             const allowed = ['vidsrc', 'cloudorchestranova', 'javascript:', '#'];
//             const isAllowed = allowed.some(function(a) { return href.includes(a); });
//             if (!isAllowed) { e.preventDefault(); e.stopPropagation(); return false; }
//           }
//         }, true);
//         function removeAds() {
//           const selectors = [
//             'iframe[src*=\"aliexpress\"]', 'iframe[src*=\"advertising\"]',
//             'iframe[src*=\"ads\"]', 'iframe[src*=\"popup\"]',
//             'iframe[src*=\"click\"]', 'iframe[src*=\"banner\"]',
//             'div[class*=\"ad\"]', 'div[id*=\"ad\"]',
//             'div[class*=\"popup\"]', 'div[id*=\"popup\"]',
//             'div[class*=\"banner\"]', 'div[id*=\"banner\"]',
//             'a[target=\"_blank\"]', '[onclick*=\"window.open\"]',
//           ];
//           selectors.forEach(function(selector) {
//             document.querySelectorAll(selector).forEach(function(el) { el.remove(); });
//           });
//         }
//         removeAds();
//         const observer = new MutationObserver(removeAds);
//         observer.observe(document.body, { childList: true, subtree: true });
//         const originalReplace = window.location.replace;
//         window.location.replace = function(url) {
//           const allowed = ['vidsrc', 'cloudorchestranova'];
//           if (allowed.some(function(a) { return url.includes(a); })) {
//             return originalReplace.call(window.location, url);
//           }
//         };
//         window.onbeforeunload = null;
//       })();
//     """;
//     _controller.runJavaScript(js);
//   }

//   void _injectPostMessageListener() {
//     const jsCode = """
//       (function() {
//         window.addEventListener('message', function(event) {
//           if (event.data && event.data.type === 'PLAYER_EVENT') {
//             const data = event.data.data;
//             console.log('VIDSRC_EVENT:' + JSON.stringify(data));
//           }
//         });
//       })();
//     """;
//     _controller.runJavaScript(jsCode);
//   }

//   void _enterFullscreen() {
//     setState(() => _isFullscreen = true);
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeLeft,
//       DeviceOrientation.landscapeRight,
//     ]);
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
//   }

//   void _exitFullscreen() {
//     setState(() => _isFullscreen = false);
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//     _controller.clearCache();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: _isFullscreen ? _buildFullscreenView() : _buildPortraitView(),
//     );
//   }

//   Widget _buildPortraitView() {
//     return SafeArea(
//       child: Column(
//         children: [
//           _buildAppBar(),
//           AspectRatio(
//             aspectRatio: 16 / 9,
//             child: Container(
//               color: Colors.black,
//               child: Stack(
//                 fit: StackFit.expand,
//                 children: [
//                   WebViewWidget(controller: _controller),
//                   if (_isLoading)
//                     Container(
//                       color: Colors.black,
//                       child: const Center(
//                         child: CircularProgressIndicator(
//                           color: Color(0xFF7C3AED),
//                         ),
//                       ),
//                     ),
//                   Positioned(
//                     bottom: 12,
//                     right: 12,
//                     child: GestureDetector(
//                       onTap: _enterFullscreen,
//                       child: Container(
//                         padding: const EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                           color: Colors.black.withOpacity(0.6),
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: const Icon(
//                           Icons.fullscreen_rounded,
//                           color: Colors.white,
//                           size: 22,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     _title,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: [
//                       _MetaBadge(
//                         icon: Icons.star_rounded,
//                         label: _getRating(),
//                         color: Colors.amber,
//                       ),
//                       const SizedBox(width: 12),
//                       _MetaBadge(
//                         icon: Icons.calendar_today_rounded,
//                         label: _getYear(),
//                       ),
//                       const SizedBox(width: 12),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 8,
//                           vertical: 3,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.white.withOpacity(0.1),
//                           borderRadius: BorderRadius.circular(6),
//                         ),
//                         child: const Text(
//                           'HD',
//                           style: TextStyle(
//                             fontSize: 11,
//                             fontWeight: FontWeight.w700,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   _buildSynopsis(),
//                   const SizedBox(height: 24),
//                   _buildCastSection(),
//                   const SizedBox(height: 24),
//                   // Related movies section
//                   MovieTrend(),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSynopsis() {
//     final synopsis = _getSynopsis();
//     final bool isLong = synopsis.length > 120;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Synopsis',
//           style: TextStyle(
//             color: Colors.grey[400],
//             fontSize: 14,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         const SizedBox(height: 8),
//         AnimatedCrossFade(
//           firstChild: Text(
//             synopsis,
//             style: TextStyle(
//               color: Colors.grey[500],
//               fontSize: 14,
//               height: 1.6,
//             ),
//             maxLines: _synopsisMaxLines,
//             overflow: TextOverflow.ellipsis,
//           ),
//           secondChild: Text(
//             synopsis,
//             style: TextStyle(
//               color: Colors.grey[500],
//               fontSize: 14,
//               height: 1.6,
//             ),
//           ),
//           crossFadeState: _isSynopsisExpanded || !isLong
//               ? CrossFadeState.showSecond
//               : CrossFadeState.showFirst,
//           duration: const Duration(milliseconds: 200),
//         ),
//         if (isLong)
//           GestureDetector(
//             onTap: () {
//               setState(() => _isSynopsisExpanded = !_isSynopsisExpanded);
//             },
//             child: Padding(
//               padding: const EdgeInsets.only(top: 8),
//               child: Text(
//                 _isSynopsisExpanded ? 'Show Less' : 'Show More',
//                 style: const TextStyle(
//                   color: Color(0xFF7C3AED),
//                   fontSize: 13,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ),
//       ],
//     );
//   }

//   Widget _buildCastSection() {
//     if (_castLoading) {
//       return const SizedBox(
//         height: 50,
//         child: Center(
//           child: CircularProgressIndicator(
//             color: Color(0xFF7C3AED),
//             strokeWidth: 2,
//           ),
//         ),
//       );
//     }
//     if (_cast.isEmpty) return const SizedBox.shrink();

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Cast',
//           style: TextStyle(
//             color: Colors.grey[400],
//             fontSize: 14,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         const SizedBox(height: 12),
//         SizedBox(
//           height: 100,
//           child: ListView.separated(
//             scrollDirection: Axis.horizontal,
//             itemCount: _cast.length,
//             separatorBuilder: (_, __) => const SizedBox(width: 16),
//             itemBuilder: (context, index) {
//               final actor = _cast[index];
//               return _CastAvatar(
//                 name: actor['name'] ?? 'Unknown',
//                 character: actor['character'] ?? '',
//                 imageUrl: actor['profileUrl']?.toString() ?? '',
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildFullscreenView() {
//     return Stack(
//       fit: StackFit.expand,
//       children: [
//         WebViewWidget(controller: _controller),
//         if (_isLoading)
//           Container(
//             color: Colors.black,
//             child: const Center(
//               child: CircularProgressIndicator(color: Color(0xFF7C3AED)),
//             ),
//           ),
//         Positioned(
//           top: 16,
//           left: 16,
//           child: SafeArea(
//             child: GestureDetector(
//               onTap: _exitFullscreen,
//               child: Container(
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.5),
//                   shape: BoxShape.circle,
//                 ),
//                 child: const Icon(
//                   Icons.fullscreen_exit_rounded,
//                   color: Colors.white,
//                   size: 24,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildAppBar() {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       child: Row(
//         children: [
//           GestureDetector(
//             onTap: () => Navigator.pop(context),
//             child: Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.1),
//                 shape: BoxShape.circle,
//               ),
//               child: const Icon(
//                 Icons.arrow_back_ios_new_rounded,
//                 color: Colors.white,
//                 size: 18,
//               ),
//             ),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Text(
//               'Now Playing',
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//           GestureDetector(
//             onTap: () {},
//             child: Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.1),
//                 shape: BoxShape.circle,
//               ),
//               child: const Icon(Icons.cast, color: Colors.white, size: 18),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   String _getRating() {
//     final rating =
//         (widget.movie['vote_average'] as num?)?.toDouble() ??
//         (widget.movie['rating'] as num?)?.toDouble() ??
//         0.0;
//     return rating.toStringAsFixed(1);
//   }

//   String _getYear() {
//     final date = widget.movie['release_date'] ?? '';
//     if (date.toString().isNotEmpty) {
//       final parsed = DateTime.tryParse(date.toString());
//       return parsed?.year.toString() ?? 'TBD';
//     }
//     return widget.movie['year']?.toString() ?? 'TBD';
//   }

//   String _getSynopsis() {
//     final overview = widget.movie['overview']?.toString();
//     if (overview != null && overview.isNotEmpty) {
//       return overview;
//     }
//     return "No synopsis available.";
//   }
// }

// class _CastAvatar extends StatelessWidget {
//   final String name;
//   final String character;
//   final String imageUrl;

//   const _CastAvatar({
//     required this.name,
//     required this.character,
//     required this.imageUrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 70,
//       child: Column(
//         children: [
//           Container(
//             width: 60,
//             height: 60,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.grey[800],
//               border: Border.all(
//                 color: Colors.white.withOpacity(0.1),
//                 width: 1.5,
//               ),
//             ),
//             child: ClipOval(
//               child: imageUrl.isNotEmpty
//                   ? Image.network(
//                       imageUrl,
//                       fit: BoxFit.cover,
//                       errorBuilder: (_, __, ___) => Center(
//                         child: Icon(
//                           Icons.person,
//                           color: Colors.grey[600],
//                           size: 28,
//                         ),
//                       ),
//                     )
//                   : Center(
//                       child: Icon(
//                         Icons.person,
//                         color: Colors.grey[600],
//                         size: 28,
//                       ),
//                     ),
//             ),
//           ),
//           const SizedBox(height: 6),
//           Text(
//             name,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 11,
//               fontWeight: FontWeight.w600,
//             ),
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 2),
//           Text(
//             character.isNotEmpty ? character : 'Unknown',
//             style: TextStyle(color: Colors.grey[500], fontSize: 10),
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _MetaBadge extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final Color? color;

//   const _MetaBadge({required this.icon, required this.label, this.color});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Icon(icon, color: color ?? Colors.grey[400], size: 14),
//         const SizedBox(width: 4),
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 13,
//             color: color ?? Colors.grey[300],
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:practice_ui/apps/movieapp/models/bookmarks_services.dart';
import 'dart:convert';
import 'package:practice_ui/apps/movieapp/movielib/movie_api/apikey.dart';

import 'package:practice_ui/apps/movieapp/widgets/movie_trend.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// ── MOVIE-ONLY PLAYER ──
class MoviePlayerPage extends StatefulWidget {
  final Map<String, dynamic> movie;

  const MoviePlayerPage({super.key, required this.movie});

  @override
  State<MoviePlayerPage> createState() => _MoviePlayerPageState();
}

class _MoviePlayerPageState extends State<MoviePlayerPage>
    with WidgetsBindingObserver {
  late final WebViewController _controller;
  bool _isLoading = true;
  bool _isFullscreen = false;
  bool _isBookmarked = false;

  List<Map<String, dynamic>> _cast = [];
  bool _castLoading = false;
  bool _isSynopsisExpanded = false;
  static const int _synopsisMaxLines = 3;

  final BookmarksService _bookmarksService = BookmarksService();

  static const List<String> _allowedHosts = [
    'vidsrcme.ru',
    'cloudorchestranova.com',
    'cdn.vidsrc.me',
    'vidsrc.me',
    'vidsrc.dev',
    'vidsrc.to',
    'vidsrc.in',
    'vidsrc.net',
    'vidsrc.xyz',
    'vidsrc.cc',
    'vidsrc.io',
    'vidsrc.pm',
    'vidsrc.vc',
    'vidsrc.su',
    'vidsrc.pro',
    'vidsrc.tv',
    'vidsrc.stream',
    'vidsrc.click',
    'vidsrc.icu',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkBookmarkStatus();
    _initWebView();
    _fetchCast();
  }

  void _checkBookmarkStatus() {
    final id = widget.movie['id']?.toString();
    if (id != null) {
      setState(() {
        _isBookmarked = _bookmarksService.isBookmarked(id);
      });
    }
  }

  Future<void> _toggleBookmark() async {
    final isNowBookmarked = await _bookmarksService.toggleBookmark(
      widget.movie,
    );
    setState(() {
      _isBookmarked = isNowBookmarked;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isNowBookmarked ? 'Added to Wishlist' : 'Removed from Wishlist',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: isNowBookmarked
            ? const Color(0xFF7C3AED)
            : Colors.grey[800],
        duration: const Duration(seconds: 1),
      ),
    );
  }

  String get _title =>
      widget.movie['title'] ?? widget.movie['name'] ?? 'Unknown';

  String get _id {
    final imdb = widget.movie['imdb_id'];
    if (imdb != null && imdb.toString().isNotEmpty) return imdb.toString();
    return widget.movie['id']?.toString() ?? '';
  }

  String get _vidsrcUrl {
    if (_id.isEmpty) {
      debugPrint('ERROR: No ID available for VidSrc');
      return '';
    }
    return 'https://vidsrcme.ru/embed/movie/$_id?autoplay=1';
  }

  String get _vidsrcUrlWithResume {
    String url = _vidsrcUrl;
    if (url.isEmpty) return url;
    final savedProgress = _getSavedProgress();
    if (savedProgress > 30) {
      final separator = url.contains('?') ? '&' : '?';
      url = '$url${separator}startAt=${savedProgress.toInt()}';
    }
    return url;
  }

  double _getSavedProgress() {
    final saved = widget.movie['_savedProgress'];
    if (saved != null) return (saved as num).toDouble();
    return 0.0;
  }

  void _saveProgress(double progress) {
    widget.movie['_savedProgress'] = progress;
  }

  Future<void> _fetchCast() async {
    final movieId = widget.movie['id'];
    if (movieId == null) return;

    final url =
        'https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$apikey';
    setState(() => _castLoading = true);
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final castList = data['cast'] as List<dynamic>? ?? [];
        setState(() {
          _cast = castList
              .take(10)
              .map(
                (c) => {
                  'name': c['name']?.toString() ?? 'Unknown',
                  'character': c['character']?.toString() ?? '',
                  'profile_path': c['profile_path']?.toString(),
                  'profileUrl': c['profile_path'] != null
                      ? 'https://image.tmdb.org/t/p/w185${c['profile_path']}'
                      : '',
                },
              )
              .toList();
          _castLoading = false;
        });
      }
    } catch (e) {
      debugPrint('Failed to fetch cast: $e');
      setState(() => _castLoading = false);
    }
  }

  void _initWebView() {
    final url = _vidsrcUrlWithResume;
    if (url.isEmpty) {
      setState(() => _isLoading = false);
      return;
    }

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.black)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (_) {
            setState(() => _isLoading = false);
            _injectPostMessageListener();
            _blockAdsAndPopups();
            _autoClickPlayButton();
          },
          onWebResourceError: (error) =>
              debugPrint('WebView error: ${error.description}'),
          onNavigationRequest: (request) {
            final uri = Uri.parse(request.url);
            final host = uri.host.toLowerCase();
            final isAllowed = _allowedHosts.any((h) => host.contains(h));
            if (!isAllowed) {
              debugPrint('BLOCKED redirect to: ${request.url}');
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
  }

  void _autoClickPlayButton() {
    const js = """
      (function() {
        function clickPlay() {
          const playBtn = document.querySelector('.play-button, .vjs-big-play-button, [class*=\"play\"], button[title*=\"Play\"]');
          if (playBtn) { playBtn.click(); return true; }
          const video = document.querySelector('video');
          if (video && video.paused) { video.play(); return true; }
          return false;
        }
        clickPlay();
        setTimeout(clickPlay, 500);
        setTimeout(clickPlay, 1500);
        setTimeout(clickPlay, 3000);
      })();
    """;
    _controller.runJavaScript(js);
  }

  void _blockAdsAndPopups() {
    const js = """
      (function() {
        'use strict';
        window.open = function() { return null; };
        document.addEventListener('click', function(e) {
          const target = e.target.closest('a');
          if (target) {
            const href = target.href || '';
            const allowed = ['vidsrc', 'cloudorchestranova', 'javascript:', '#'];
            const isAllowed = allowed.some(function(a) { return href.includes(a); });
            if (!isAllowed) { e.preventDefault(); e.stopPropagation(); return false; }
          }
        }, true);
        function removeAds() {
          const selectors = [
            'iframe[src*=\"aliexpress\"]', 'iframe[src*=\"advertising\"]',
            'iframe[src*=\"ads\"]', 'iframe[src*=\"popup\"]',
            'iframe[src*=\"click\"]', 'iframe[src*=\"banner\"]',
            'div[class*=\"ad\"]', 'div[id*=\"ad\"]',
            'div[class*=\"popup\"]', 'div[id*=\"popup\"]',
            'div[class*=\"banner\"]', 'div[id*=\"banner\"]',
            'a[target=\"_blank\"]', '[onclick*=\"window.open\"]',
          ];
          selectors.forEach(function(selector) {
            document.querySelectorAll(selector).forEach(function(el) { el.remove(); });
          });
        }
        removeAds();
        const observer = new MutationObserver(removeAds);
        observer.observe(document.body, { childList: true, subtree: true });
        const originalReplace = window.location.replace;
        window.location.replace = function(url) {
          const allowed = ['vidsrc', 'cloudorchestranova'];
          if (allowed.some(function(a) { return url.includes(a); })) {
            return originalReplace.call(window.location, url);
          }
        };
        window.onbeforeunload = null;
      })();
    """;
    _controller.runJavaScript(js);
  }

  void _injectPostMessageListener() {
    const jsCode = """
      (function() {
        window.addEventListener('message', function(event) {
          if (event.data && event.data.type === 'PLAYER_EVENT') {
            const data = event.data.data;
            console.log('VIDSRC_EVENT:' + JSON.stringify(data));
          }
        });
      })();
    """;
    _controller.runJavaScript(jsCode);
  }

  void _enterFullscreen() {
    setState(() => _isFullscreen = true);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  void _exitFullscreen() {
    setState(() => _isFullscreen = false);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    _controller.clearCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _isFullscreen ? _buildFullscreenView() : _buildPortraitView(),
    );
  }

  Widget _buildPortraitView() {
    return SafeArea(
      child: Column(
        children: [
          _buildAppBar(),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: Colors.black,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  WebViewWidget(controller: _controller),
                  if (_isLoading)
                    Container(
                      color: Colors.black,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFF7C3AED),
                        ),
                      ),
                    ),
                  Positioned(
                    bottom: 12,
                    right: 12,
                    child: GestureDetector(
                      onTap: _enterFullscreen,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.fullscreen_rounded,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _MetaBadge(
                        icon: Icons.star_rounded,
                        label: _getRating(),
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 12),
                      _MetaBadge(
                        icon: Icons.calendar_today_rounded,
                        label: _getYear(),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'HD',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildSynopsis(),
                  const SizedBox(height: 24),
                  _buildCastSection(),
                  const SizedBox(height: 24),
                  MovieTrend(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── APP BAR WITH HEART ICON ──
  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          // Back button
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Title
          Expanded(
            child: Text(
              'Now Playing',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // ── HEART / BOOKMARK ICON ──
          GestureDetector(
            onTap: _toggleBookmark,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: _isBookmarked
                    ? const Color(0xFF7C3AED).withOpacity(0.2)
                    : Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                _isBookmarked ? Icons.favorite : Icons.favorite_border,
                color: _isBookmarked ? const Color(0xFF7C3AED) : Colors.white,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Cast icon
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.cast, color: Colors.white, size: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSynopsis() {
    final synopsis = _getSynopsis();
    final bool isLong = synopsis.length > 120;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Synopsis',
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        AnimatedCrossFade(
          firstChild: Text(
            synopsis,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 14,
              height: 1.6,
            ),
            maxLines: _synopsisMaxLines,
            overflow: TextOverflow.ellipsis,
          ),
          secondChild: Text(
            synopsis,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 14,
              height: 1.6,
            ),
          ),
          crossFadeState: _isSynopsisExpanded || !isLong
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
        ),
        if (isLong)
          GestureDetector(
            onTap: () =>
                setState(() => _isSynopsisExpanded = !_isSynopsisExpanded),
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                _isSynopsisExpanded ? 'Show Less' : 'Show More',
                style: const TextStyle(
                  color: Color(0xFF7C3AED),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildCastSection() {
    if (_castLoading) {
      return const SizedBox(
        height: 50,
        child: Center(
          child: CircularProgressIndicator(
            color: Color(0xFF7C3AED),
            strokeWidth: 2,
          ),
        ),
      );
    }
    if (_cast.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cast',
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _cast.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final actor = _cast[index];
              return _CastAvatar(
                name: actor['name'] ?? 'Unknown',
                character: actor['character'] ?? '',
                imageUrl: actor['profileUrl']?.toString() ?? '',
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFullscreenView() {
    return Stack(
      fit: StackFit.expand,
      children: [
        WebViewWidget(controller: _controller),
        if (_isLoading)
          Container(
            color: Colors.black,
            child: const Center(
              child: CircularProgressIndicator(color: Color(0xFF7C3AED)),
            ),
          ),
        Positioned(
          top: 16,
          left: 16,
          child: SafeArea(
            child: GestureDetector(
              onTap: _exitFullscreen,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.fullscreen_exit_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _getRating() {
    final rating =
        (widget.movie['vote_average'] as num?)?.toDouble() ??
        (widget.movie['rating'] as num?)?.toDouble() ??
        0.0;
    return rating.toStringAsFixed(1);
  }

  String _getYear() {
    final date = widget.movie['release_date'] ?? '';
    if (date.toString().isNotEmpty) {
      final parsed = DateTime.tryParse(date.toString());
      return parsed?.year.toString() ?? 'TBD';
    }
    return widget.movie['year']?.toString() ?? 'TBD';
  }

  String _getSynopsis() {
    final overview = widget.movie['overview']?.toString();
    if (overview != null && overview.isNotEmpty) return overview;
    return "No synopsis available.";
  }
}

class _CastAvatar extends StatelessWidget {
  final String name;
  final String character;
  final String imageUrl;

  const _CastAvatar({
    required this.name,
    required this.character,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[800],
              border: Border.all(
                color: Colors.white.withOpacity(0.1),
                width: 1.5,
              ),
            ),
            child: ClipOval(
              child: imageUrl.isNotEmpty
                  ? Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Center(
                        child: Icon(
                          Icons.person,
                          color: Colors.grey[600],
                          size: 28,
                        ),
                      ),
                    )
                  : Center(
                      child: Icon(
                        Icons.person,
                        color: Colors.grey[600],
                        size: 28,
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 2),
          Text(
            character.isNotEmpty ? character : 'Unknown',
            style: TextStyle(color: Colors.grey[500], fontSize: 10),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _MetaBadge extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;

  const _MetaBadge({required this.icon, required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color ?? Colors.grey[400], size: 14),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: color ?? Colors.grey[300],
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
