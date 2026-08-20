// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:webview_flutter/webview_flutter.dart';

// // class VidsrcPlayerPage extends StatefulWidget {
// //   final Map<String, dynamic> movie;
// //   final int season;
// //   final int episode;

// //   const VidsrcPlayerPage({
// //     super.key,
// //     required this.movie,
// //     this.season = 1,
// //     this.episode = 1,
// //   });

// //   @override
// //   State<VidsrcPlayerPage> createState() => _VidsrcPlayerPageState();
// // }

// // class _VidsrcPlayerPageState extends State<VidsrcPlayerPage>
// //     with WidgetsBindingObserver {
// //   late final WebViewController _controller;
// //   bool _isLoading = true;
// //   bool _isFullscreen = false;

// //   // Allowed domains
// //   static const List<String> _allowedHosts = [
// //     'vidsrcme.ru',
// //     'cloudorchestranova.com',
// //     'cdn.vidsrc.me',
// //     'vidsrc.me',
// //     'vidsrc.dev',
// //     'vidsrc.to',
// //     'vidsrc.in',
// //     'vidsrc.net',
// //     'vidsrc.xyz',
// //     'vidsrc.cc',
// //     'vidsrc.io',
// //     'vidsrc.pm',
// //     'vidsrc.vc',
// //     'vidsrc.su',
// //     'vidsrc.pro',
// //     'vidsrc.tv',
// //     'vidsrc.stream',
// //     'vidsrc.click',
// //     'vidsrc.icu',
// //   ];

// //   @override
// //   void initState() {
// //     super.initState();
// //     WidgetsBinding.instance.addObserver(this);
// //     _initWebView();
// //   }

// //   String get _title =>
// //       widget.movie['title'] ?? widget.movie['name'] ?? 'Unknown';

// //   String get _id {
// //     final imdb = widget.movie['imdb_id'];
// //     if (imdb != null && imdb.toString().isNotEmpty) {
// //       return imdb.toString();
// //     }
// //     return widget.movie['id']?.toString() ?? '';
// //   }

// //   bool get _isMovie => widget.movie['title'] != null;

// //   int get _currentSeason => widget.season;
// //   int get _currentEpisode => widget.episode;

// //   String get _vidsrcUrl {
// //     if (_id.isEmpty) {
// //       debugPrint('ERROR: No ID available for VidSrc');
// //       return '';
// //     }
// //     if (_isMovie) {
// //       return 'https://vidsrcme.ru/embed/movie/$_id?autoplay=1';
// //     }
// //     if (_currentSeason > 0 && _currentEpisode > 0) {
// //       return 'https://vidsrcme.ru/embed/tv/$_id/$_currentSeason/$_currentEpisode?autoplay=1&autonext=1';
// //     }
// //     return 'https://vidsrcme.ru/embed/tv/$_id?autoplay=1&autonext=1';
// //   }

// //   String get _vidsrcUrlWithResume {
// //     String url = _vidsrcUrl;
// //     if (url.isEmpty) return url;
// //     final savedProgress = _getSavedProgress();
// //     if (savedProgress > 30) {
// //       final separator = url.contains('?') ? '&' : '?';
// //       url = '$url${separator}startAt=${savedProgress.toInt()}';
// //     }
// //     return url;
// //   }

// //   double _getSavedProgress() {
// //     final saved = widget.movie['_savedProgress'];
// //     if (saved != null) return (saved as num).toDouble();
// //     return 0.0;
// //   }

// //   void _saveProgress(double progress) {
// //     widget.movie['_savedProgress'] = progress;
// //   }

// //   void _initWebView() {
// //     final url = _vidsrcUrlWithResume;
// //     if (url.isEmpty) {
// //       setState(() => _isLoading = false);
// //       return;
// //     }

// //     _controller = WebViewController()
// //       ..setJavaScriptMode(JavaScriptMode.unrestricted)
// //       ..setBackgroundColor(Colors.black)
// //       ..setNavigationDelegate(
// //         NavigationDelegate(
// //           onPageFinished: (_) {
// //             setState(() => _isLoading = false);
// //             _injectPostMessageListener();
// //             _blockAdsAndPopups();
// //             _autoClickPlayButton();
// //           },
// //           onWebResourceError: (error) {
// //             debugPrint('WebView error: ${error.description}');
// //           },
// //           onNavigationRequest: (request) {
// //             final uri = Uri.parse(request.url);
// //             final host = uri.host.toLowerCase();
// //             final isAllowed = _allowedHosts.any((h) => host.contains(h));
// //             if (!isAllowed) {
// //               debugPrint('BLOCKED redirect to: ${request.url}');
// //               return NavigationDecision.prevent;
// //             }
// //             return NavigationDecision.navigate;
// //           },
// //         ),
// //       )
// //       ..loadRequest(Uri.parse(url));
// //   }

// //   // Auto-click VidSrc's play button since autoplay=1 still shows a button on free domains
// //   void _autoClickPlayButton() {
// //     const js = """
// //       (function() {
// //         // Try to find and click the play button
// //         function clickPlay() {
// //           // VidSrc usually has a play button overlay
// //           const playBtn = document.querySelector('.play-button, .vjs-big-play-button, [class*="play"], button[title*="Play"]');
// //           if (playBtn) {
// //             playBtn.click();
// //             console.log('Auto-clicked play button');
// //             return true;
// //           }
// //           // Try clicking the video element itself
// //           const video = document.querySelector('video');
// //           if (video && video.paused) {
// //             video.play();
// //             console.log('Auto-played video element');
// //             return true;
// //           }
// //           return false;
// //         }

// //         // Try immediately and after a short delay
// //         clickPlay();
// //         setTimeout(clickPlay, 500);
// //         setTimeout(clickPlay, 1500);
// //         setTimeout(clickPlay, 3000);
// //       })();
// //     """;
// //     _controller.runJavaScript(js);
// //   }

// //   void _blockAdsAndPopups() {
// //     const js = """
// //       (function() {
// //         'use strict';
// //         window.open = function() {
// //           console.log('BLOCKED: window.open popup');
// //           return null;
// //         };
// //         document.addEventListener('click', function(e) {
// //           const target = e.target.closest('a');
// //           if (target) {
// //             const href = target.href || '';
// //             const allowed = ['vidsrc', 'cloudorchestranova', 'javascript:', '#'];
// //             const isAllowed = allowed.some(function(a) { return href.includes(a); });
// //             if (!isAllowed) {
// //               console.log('BLOCKED click to:', href);
// //               e.preventDefault();
// //               e.stopPropagation();
// //               return false;
// //             }
// //           }
// //         }, true);
// //         function removeAds() {
// //           const selectors = [
// //             'iframe[src*=\"aliexpress\"]',
// //             'iframe[src*=\"advertising\"]',
// //             'iframe[src*=\"ads\"]',
// //             'iframe[src*=\"popup\"]',
// //             'iframe[src*=\"click\"]',
// //             'iframe[src*=\"banner\"]',
// //             'div[class*=\"ad\"]',
// //             'div[id*=\"ad\"]',
// //             'div[class*=\"popup\"]',
// //             'div[id*=\"popup\"]',
// //             'div[class*=\"banner\"]',
// //             'div[id*=\"banner\"]',
// //             'a[target=\"_blank\"]',
// //             '[onclick*=\"window.open\"]',
// //           ];
// //           selectors.forEach(function(selector) {
// //             document.querySelectorAll(selector).forEach(function(el) {
// //               console.log('REMOVED ad element:', selector);
// //               el.remove();
// //             });
// //           });
// //         }
// //         removeAds();
// //         const observer = new MutationObserver(removeAds);
// //         observer.observe(document.body, { childList: true, subtree: true });
// //         const originalReplace = window.location.replace;
// //         window.location.replace = function(url) {
// //           const allowed = ['vidsrc', 'cloudorchestranova'];
// //           if (allowed.some(function(a) { return url.includes(a); })) {
// //             return originalReplace.call(window.location, url);
// //           }
// //           console.log('BLOCKED location.replace to:', url);
// //         };
// //         window.onbeforeunload = null;
// //         console.log('Ad blocker injected successfully');
// //       })();
// //     """;
// //     _controller.runJavaScript(js);
// //   }

// //   void _injectPostMessageListener() {
// //     const jsCode = """
// //       (function() {
// //         window.addEventListener('message', function(event) {
// //           if (event.data && event.data.type === 'PLAYER_EVENT') {
// //             const data = event.data.data;
// //             console.log('VIDSRC_EVENT:' + JSON.stringify(data));
// //           }
// //         });
// //       })();
// //     """;
// //     _controller.runJavaScript(jsCode);
// //   }

// //   void _handlePlayerEvent(Map<String, dynamic> data) {
// //     final status = data['player_status']?.toString();
// //     final progress = (data['player_progress'] as num?)?.toDouble() ?? 0.0;
// //     if (status == 'playing' && progress > 0) {
// //       _saveProgress(progress);
// //     }
// //   }

// //   // Listen for fullscreen changes from VidSrc's native fullscreen button
// //   void _listenForFullscreenChanges() {
// //     const js = """
// //       (function() {
// //         document.addEventListener('fullscreenchange', function() {
// //           const isFullscreen = !!document.fullscreenElement;
// //           console.log('FULLSCREEN_CHANGE:' + isFullscreen);
// //         });
// //       })();
// //     """;
// //     _controller.runJavaScript(js);
// //   }

// //   @override
// //   void didChangeAppLifecycleState(AppLifecycleState state) {}

// //   @override
// //   void dispose() {
// //     WidgetsBinding.instance.removeObserver(this);
// //     SystemChrome.setPreferredOrientations([
// //       DeviceOrientation.portraitUp,
// //       DeviceOrientation.portraitDown,
// //     ]);
// //     SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
// //     _controller.clearCache();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.black,
// //       body: _isFullscreen ? _buildFullscreenView() : _buildPortraitView(),
// //     );
// //   }

// //   // PORTRAIT: Video centered at top, movie info below, VidSrc native controls visible
// //   Widget _buildPortraitView() {
// //     return SafeArea(
// //       child: Column(
// //         children: [
// //           // Top App Bar
// //           _buildAppBar(),

// //           // Video Player - centered 16:9 with VidSrc native controls
// //           AspectRatio(
// //             aspectRatio: 16 / 9,
// //             child: Container(
// //               color: Colors.black,
// //               child: Stack(
// //                 fit: StackFit.expand,
// //                 children: [
// //                   WebViewWidget(controller: _controller),
// //                   if (_isLoading)
// //                     Container(
// //                       color: Colors.black,
// //                       child: const Center(
// //                         child: CircularProgressIndicator(
// //                           color: Color(0xFF7C3AED),
// //                         ),
// //                       ),
// //                     ),
// //                 ],
// //               ),
// //             ),
// //           ),

// //           // Movie info below video (scrollable)
// //           Expanded(
// //             child: SingleChildScrollView(
// //               padding: const EdgeInsets.all(16),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Text(
// //                     _title,
// //                     style: const TextStyle(
// //                       color: Colors.white,
// //                       fontSize: 22,
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   ),
// //                   const SizedBox(height: 8),
// //                   Row(
// //                     children: [
// //                       _MetaBadge(
// //                         icon: Icons.star_rounded,
// //                         label: _getRating(),
// //                         color: Colors.amber,
// //                       ),
// //                       const SizedBox(width: 12),
// //                       _MetaBadge(
// //                         icon: Icons.calendar_today_rounded,
// //                         label: _getYear(),
// //                       ),
// //                       const SizedBox(width: 12),
// //                       Container(
// //                         padding: const EdgeInsets.symmetric(
// //                           horizontal: 8,
// //                           vertical: 3,
// //                         ),
// //                         decoration: BoxDecoration(
// //                           color: Colors.white.withOpacity(0.1),
// //                           borderRadius: BorderRadius.circular(6),
// //                         ),
// //                         child: const Text(
// //                           'HD',
// //                           style: TextStyle(
// //                             fontSize: 11,
// //                             fontWeight: FontWeight.w700,
// //                             color: Colors.white,
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                   const SizedBox(height: 16),

// //                   // Episode info (TV only)
// //                   if (!_isMovie)
// //                     Container(
// //                       padding: const EdgeInsets.symmetric(
// //                         horizontal: 14,
// //                         vertical: 8,
// //                       ),
// //                       decoration: BoxDecoration(
// //                         color: Colors.white.withOpacity(0.08),
// //                         borderRadius: BorderRadius.circular(10),
// //                       ),
// //                       child: Text(
// //                         'Season $_currentSeason  Episode $_currentEpisode',
// //                         style: const TextStyle(
// //                           color: Colors.white,
// //                           fontSize: 13,
// //                           fontWeight: FontWeight.w600,
// //                         ),
// //                       ),
// //                     ),
// //                   if (!_isMovie) const SizedBox(height: 16),

// //                   // Synopsis
// //                   Text(
// //                     'Synopsis',
// //                     style: TextStyle(
// //                       color: Colors.grey[400],
// //                       fontSize: 14,
// //                       fontWeight: FontWeight.w600,
// //                     ),
// //                   ),
// //                   const SizedBox(height: 8),
// //                   Text(
// //                     _getSynopsis(),
// //                     style: TextStyle(
// //                       color: Colors.grey[500],
// //                       fontSize: 14,
// //                       height: 1.6,
// //                     ),
// //                   ),

// //                   const SizedBox(height: 20),

// //                   // Episode navigation (TV only)
// //                   if (!_isMovie) _buildEpisodeNav(),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildEpisodeNav() {
// //     return Row(
// //       children: [
// //         if (_currentEpisode > 1)
// //           Expanded(
// //             child: _NavButton(
// //               icon: Icons.skip_previous_rounded,
// //               label: 'Previous Episode',
// //               onTap: () {
// //                 final newUrl = _vidsrcUrl.replaceAll(
// //                   '/$_currentSeason/$_currentEpisode',
// //                   '/$_currentSeason/${_currentEpisode - 1}',
// //                 );
// //                 _controller.loadRequest(Uri.parse(newUrl));
// //               },
// //             ),
// //           ),
// //         if (_currentEpisode > 1) const SizedBox(width: 12),
// //         Expanded(
// //           child: _NavButton(
// //             icon: Icons.skip_next_rounded,
// //             label: 'Next Episode',
// //             onTap: () {
// //               final newUrl = _vidsrcUrl.replaceAll(
// //                 '/$_currentSeason/$_currentEpisode',
// //                 '/$_currentSeason/${_currentEpisode + 1}',
// //               );
// //               _controller.loadRequest(Uri.parse(newUrl));
// //             },
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// //   // FULLSCREEN: Video fills entire screen in landscape
// //   Widget _buildFullscreenView() {
// //     return Stack(
// //       fit: StackFit.expand,
// //       children: [
// //         WebViewWidget(controller: _controller),
// //         if (_isLoading)
// //           Container(
// //             color: Colors.black,
// //             child: const Center(
// //               child: CircularProgressIndicator(color: Color(0xFF7C3AED)),
// //             ),
// //           ),
// //         // Exit fullscreen button
// //         Positioned(
// //           top: 16,
// //           left: 16,
// //           child: SafeArea(
// //             child: GestureDetector(
// //               onTap: () {
// //                 setState(() => _isFullscreen = false);
// //                 SystemChrome.setPreferredOrientations([
// //                   DeviceOrientation.portraitUp,
// //                   DeviceOrientation.portraitDown,
// //                 ]);
// //                 SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
// //               },
// //               child: Container(
// //                 padding: const EdgeInsets.all(10),
// //                 decoration: BoxDecoration(
// //                   color: Colors.black.withOpacity(0.5),
// //                   shape: BoxShape.circle,
// //                 ),
// //                 child: const Icon(
// //                   Icons.fullscreen_exit_rounded,
// //                   color: Colors.white,
// //                   size: 24,
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buildAppBar() {
// //     return Container(
// //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// //       child: Row(
// //         children: [
// //           GestureDetector(
// //             onTap: () => Navigator.pop(context),
// //             child: Container(
// //               padding: const EdgeInsets.all(8),
// //               decoration: BoxDecoration(
// //                 color: Colors.white.withOpacity(0.1),
// //                 shape: BoxShape.circle,
// //               ),
// //               child: const Icon(
// //                 Icons.arrow_back_ios_new_rounded,
// //                 color: Colors.white,
// //                 size: 18,
// //               ),
// //             ),
// //           ),
// //           const SizedBox(width: 12),
// //           Expanded(
// //             child: Text(
// //               _isMovie ? 'Now Playing' : 'S$_currentSeason E$_currentEpisode',
// //               style: const TextStyle(
// //                 color: Colors.white,
// //                 fontSize: 16,
// //                 fontWeight: FontWeight.w600,
// //               ),
// //             ),
// //           ),
// //           GestureDetector(
// //             onTap: () {},
// //             child: Container(
// //               padding: const EdgeInsets.all(8),
// //               decoration: BoxDecoration(
// //                 color: Colors.white.withOpacity(0.1),
// //                 shape: BoxShape.circle,
// //               ),
// //               child: const Icon(Icons.cast, color: Colors.white, size: 18),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   String _getRating() {
// //     final rating =
// //         (widget.movie['vote_average'] as num?)?.toDouble() ??
// //         (widget.movie['rating'] as num?)?.toDouble() ??
// //         0.0;
// //     return rating.toStringAsFixed(1);
// //   }

// //   String _getYear() {
// //     final date =
// //         widget.movie['release_date'] ?? widget.movie['first_air_date'] ?? '';
// //     if (date.toString().isNotEmpty) {
// //       final parsed = DateTime.tryParse(date.toString());
// //       return parsed?.year.toString() ?? 'TBD';
// //     }
// //     return widget.movie['year']?.toString() ?? 'TBD';
// //   }

// //   String _getSynopsis() {
// //     final overview = widget.movie['overview']?.toString();
// //     if (overview != null && overview.isNotEmpty) {
// //       return overview;
// //     }
// //     return "No synopsis available.";
// //   }
// // }

// // class _MetaBadge extends StatelessWidget {
// //   final IconData icon;
// //   final String label;
// //   final Color? color;

// //   const _MetaBadge({required this.icon, required this.label, this.color});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Row(
// //       mainAxisSize: MainAxisSize.min,
// //       children: [
// //         Icon(icon, color: color ?? Colors.grey[400], size: 14),
// //         const SizedBox(width: 4),
// //         Text(
// //           label,
// //           style: TextStyle(
// //             fontSize: 13,
// //             color: color ?? Colors.grey[300],
// //             fontWeight: FontWeight.w600,
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// // class _NavButton extends StatelessWidget {
// //   final IconData icon;
// //   final String label;
// //   final VoidCallback onTap;

// //   const _NavButton({
// //     required this.icon,
// //     required this.label,
// //     required this.onTap,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: onTap,
// //       child: Container(
// //         padding: const EdgeInsets.symmetric(vertical: 12),
// //         decoration: BoxDecoration(
// //           color: Colors.white.withOpacity(0.08),
// //           borderRadius: BorderRadius.circular(12),
// //         ),
// //         child: Row(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Icon(icon, color: Colors.white, size: 20),
// //             const SizedBox(width: 8),
// //             Text(
// //               label,
// //               style: const TextStyle(
// //                 color: Colors.white,
// //                 fontSize: 13,
// //                 fontWeight: FontWeight.w600,
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
// import 'package:practice_ui/apps/movieapp/widgets/movie_trend.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class VidsrcPlayerPage extends StatefulWidget {
//   final Map<String, dynamic> movie;
//   final int season;
//   final int episode;

//   const VidsrcPlayerPage({
//     super.key,
//     required this.movie,
//     this.season = 1,
//     this.episode = 1,
//   });

//   @override
//   State<VidsrcPlayerPage> createState() => _VidsrcPlayerPageState();
// }

// class _VidsrcPlayerPageState extends State<VidsrcPlayerPage>
//     with WidgetsBindingObserver {
//   late final WebViewController _controller;
//   bool _isLoading = true;
//   bool _isFullscreen = false;
//   int _activeSeason = 1;
//   int _activeEpisode = 1;

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
//     _activeSeason = widget.season;
//     _activeEpisode = widget.episode;
//     _initWebView();
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

//   bool get _isMovie => widget.movie['title'] != null;

//   int get _currentSeason => _activeSeason;
//   int get _currentEpisode => _activeEpisode;

//   String get _vidsrcUrl {
//     if (_id.isEmpty) {
//       debugPrint('ERROR: No ID available for VidSrc');
//       return '';
//     }
//     if (_isMovie) {
//       return 'https://vidsrcme.ru/embed/movie/$_id?autoplay=1';
//     }
//     if (_currentSeason > 0 && _currentEpisode > 0) {
//       return 'https://vidsrcme.ru/embed/tv/$_id/$_currentSeason/$_currentEpisode?autoplay=1&autonext=1';
//     }
//     return 'https://vidsrcme.ru/embed/tv/$_id?autoplay=1&autonext=1';
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

//   // Auto-click VidSrc's play button since autoplay=1 still shows a button on free domains
//   void _autoClickPlayButton() {
//     const js = """
//       (function() {
//         function clickPlay() {
//           const playBtn = document.querySelector('.play-button, .vjs-big-play-button, [class*=\"play\"], button[title*=\"Play\"]');
//           if (playBtn) {
//             playBtn.click();
//             console.log('Auto-clicked play button');
//             return true;
//           }
//           const video = document.querySelector('video');
//           if (video && video.paused) {
//             video.play();
//             console.log('Auto-played video element');
//             return true;
//           }
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
//         window.open = function() {
//           console.log('BLOCKED: window.open popup');
//           return null;
//         };
//         document.addEventListener('click', function(e) {
//           const target = e.target.closest('a');
//           if (target) {
//             const href = target.href || '';
//             const allowed = ['vidsrc', 'cloudorchestranova', 'javascript:', '#'];
//             const isAllowed = allowed.some(function(a) { return href.includes(a); });
//             if (!isAllowed) {
//               console.log('BLOCKED click to:', href);
//               e.preventDefault();
//               e.stopPropagation();
//               return false;
//             }
//           }
//         }, true);
//         function removeAds() {
//           const selectors = [
//             'iframe[src*=\"aliexpress\"]',
//             'iframe[src*=\"advertising\"]',
//             'iframe[src*=\"ads\"]',
//             'iframe[src*=\"popup\"]',
//             'iframe[src*=\"click\"]',
//             'iframe[src*=\"banner\"]',
//             'div[class*=\"ad\"]',
//             'div[id*=\"ad\"]',
//             'div[class*=\"popup\"]',
//             'div[id*=\"popup\"]',
//             'div[class*=\"banner\"]',
//             'div[id*=\"banner\"]',
//             'a[target=\"_blank\"]',
//             '[onclick*=\"window.open\"]',
//           ];
//           selectors.forEach(function(selector) {
//             document.querySelectorAll(selector).forEach(function(el) {
//               console.log('REMOVED ad element:', selector);
//               el.remove();
//             });
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
//           console.log('BLOCKED location.replace to:', url);
//         };
//         window.onbeforeunload = null;
//         console.log('Ad blocker injected successfully');
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

//   void _handlePlayerEvent(Map<String, dynamic> data) {
//     final status = data['player_status']?.toString();
//     final progress = (data['player_progress'] as num?)?.toDouble() ?? 0.0;
//     if (status == 'playing' && progress > 0) {
//       _saveProgress(progress);
//     }
//   }

//   void _listenForFullscreenChanges() {
//     const js = """
//       (function() {
//         document.addEventListener('fullscreenchange', function() {
//           const isFullscreen = !!document.fullscreenElement;
//           console.log('FULLSCREEN_CHANGE:' + isFullscreen);
//         });
//       })();
//     """;
//     _controller.runJavaScript(js);
//   }

//   void _loadEpisode(int season, int episode) {
//     setState(() {
//       _activeSeason = season;
//       _activeEpisode = episode;
//       _isLoading = true;
//     });
//     final newUrl = _vidsrcUrl;
//     _controller.loadRequest(Uri.parse(newUrl));
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {}

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

//   // PORTRAIT: Video centered at top, movie info below
//   Widget _buildPortraitView() {
//     return SafeArea(
//       child: Column(
//         children: [
//           // Top App Bar
//           _buildAppBar(),

//           // Video Player
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
//                 ],
//               ),
//             ),
//           ),

//           // Movie info below video (scrollable)
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

//                   // Synopsis
//                   Text(
//                     'Synopsis',
//                     style: TextStyle(
//                       color: Colors.grey[400],
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     _getSynopsis(),
//                     style: TextStyle(
//                       color: Colors.grey[500],
//                       fontSize: 14,
//                       height: 1.6,
//                     ),
//                   ),

//                   const SizedBox(height: 24),

//                   // Episodes section (TV only) OR MovieTrend() for movies
//                   if (!_isMovie) ...[
//                     _buildSeasonSelector(),
//                     const SizedBox(height: 16),
//                     _buildEpisodesList(),
//                   ] else ...[
//                     // For movies, use the imported MovieTrend widget
//                     MovieTrend(),
//                   ],
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Season selector tabs (S1, S2, S3...)
//   Widget _buildSeasonSelector() {
//     // Get number of seasons from movie data, default to 3
//     final seasonCount = (widget.movie['number_of_seasons'] as int?) ?? 3;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Seasons',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 12),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: List.generate(seasonCount, (index) {
//               final seasonNum = index + 1;
//               final isActive = seasonNum == _activeSeason;
//               return Padding(
//                 padding: const EdgeInsets.only(right: 10),
//                 child: GestureDetector(
//                   onTap: () {
//                     setState(() => _activeSeason = seasonNum);
//                     _loadEpisode(seasonNum, 1);
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 10,
//                     ),
//                     decoration: BoxDecoration(
//                       color: isActive
//                           ? const Color(0xFF7C3AED)
//                           : Colors.white.withOpacity(0.08),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Text(
//                       'S$seasonNum',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 14,
//                         fontWeight: isActive
//                             ? FontWeight.w700
//                             : FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             }),
//           ),
//         ),
//       ],
//     );
//   }

//   // Episode list matching the image design
//   Widget _buildEpisodesList() {
//     // Get episodes from movie data, or generate placeholders
//     final episodes = _getEpisodesForSeason(_activeSeason);

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Episodes',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 12),
//         ...episodes.map((ep) => _buildEpisodeItem(ep)),
//       ],
//     );
//   }

//   List<Map<String, dynamic>> _getEpisodesForSeason(int season) {
//     // Try to get episodes from movie data
//     final seasons = widget.movie['seasons'] as List<dynamic>?;
//     if (seasons != null) {
//       final seasonData = seasons.firstWhere(
//         (s) => (s['season_number'] ?? s['number']) == season,
//         orElse: () => null,
//       );
//       if (seasonData != null && seasonData['episodes'] != null) {
//         return (seasonData['episodes'] as List).cast<Map<String, dynamic>>();
//       }
//     }

//     // Fallback: generate placeholder episodes
//     final episodeCount = widget.movie['number_of_episodes'] ?? 6;
//     return List.generate(
//       episodeCount,
//       (index) => {
//         'episode_number': index + 1,
//         'name': 'Episode ${index + 1}',
//         'overview': 'Episode ${index + 1} of Season $season',
//         'runtime': 45,
//         'still_path': null,
//       },
//     );
//   }

//   Widget _buildEpisodeItem(Map<String, dynamic> episode) {
//     final epNum = episode['episode_number'] ?? episode['number'] ?? 1;
//     final title = episode['name'] ?? episode['title'] ?? 'Episode $epNum';
//     final subtitle = episode['overview']?.toString().isNotEmpty == true
//         ? episode['overview'].toString()
//         : 'Episode $epNum';
//     final runtime = episode['runtime'] ?? episode['duration'] ?? 45;
//     final stillPath = episode['still_path'];
//     final isActive = epNum == _activeEpisode;

//     // Purple-ish background for active playing episode
//     final activeBgColor = const Color(0xFF7C3AED).withOpacity(0.15);
//     final activeBorderColor = const Color(0xFF7C3AED).withOpacity(0.4);

//     return GestureDetector(
//       onTap: () => _loadEpisode(_activeSeason, epNum as int),
//       child: Container(
//         margin: const EdgeInsets.only(bottom: 12),
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: isActive ? activeBgColor : Colors.transparent,
//           borderRadius: BorderRadius.circular(12),
//           border: isActive
//               ? Border.all(color: activeBorderColor, width: 1)
//               : null,
//         ),
//         child: Row(
//           children: [
//             // Thumbnail
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: Container(
//                 width: 100,
//                 height: 60,
//                 color: Colors.grey[900],
//                 child: stillPath != null
//                     ? Image.network(
//                         'https://image.tmdb.org/t/p/w300$stillPath',
//                         fit: BoxFit.cover,
//                         errorBuilder: (_, __, ___) =>
//                             _buildThumbnailFallback(epNum as int),
//                       )
//                     : _buildThumbnailFallback(epNum as int),
//               ),
//             ),
//             const SizedBox(width: 12),
//             // Episode info
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 14,
//                       fontWeight: isActive ? FontWeight.w700 : FontWeight.w600,
//                     ),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     subtitle,
//                     style: TextStyle(color: Colors.grey[500], fontSize: 12),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     '$runtime min',
//                     style: TextStyle(color: Colors.grey[600], fontSize: 11),
//                   ),
//                 ],
//               ),
//             ),
//             // Download icon
//             GestureDetector(
//               onTap: () {
//                 // Handle download
//               },
//               child: Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.06),
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(
//                   Icons.download_rounded,
//                   color: isActive ? const Color(0xFF7C3AED) : Colors.grey[400],
//                   size: 18,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildThumbnailFallback(int epNum) {
//     return Stack(
//       fit: StackFit.expand,
//       children: [
//         Container(
//           color: Colors.grey[850],
//           child: Center(
//             child: Icon(
//               Icons.play_circle_outline,
//               color: Colors.grey[600],
//               size: 24,
//             ),
//           ),
//         ),
//         // Episode number badge
//         Positioned(
//           bottom: 4,
//           left: 4,
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//             decoration: BoxDecoration(
//               color: Colors.black.withOpacity(0.7),
//               borderRadius: BorderRadius.circular(4),
//             ),
//             child: Text(
//               'E$epNum',
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 10,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   // FULLSCREEN: Video fills entire screen in landscape
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
//         // Exit fullscreen button
//         Positioned(
//           top: 16,
//           left: 16,
//           child: SafeArea(
//             child: GestureDetector(
//               onTap: () {
//                 setState(() => _isFullscreen = false);
//                 SystemChrome.setPreferredOrientations([
//                   DeviceOrientation.portraitUp,
//                   DeviceOrientation.portraitDown,
//                 ]);
//                 SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//               },
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
//               _isMovie ? 'Now Playing' : 'S$_currentSeason E$_currentEpisode',
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
//     final date =
//         widget.movie['release_date'] ?? widget.movie['first_air_date'] ?? '';
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
import 'package:practice_ui/apps/movieapp/services/tmdb_service.dart';
import 'package:practice_ui/apps/movieapp/widgets/movie_trend.dart';

import 'package:webview_flutter/webview_flutter.dart';

class VidsrcPlayerPage extends StatefulWidget {
  final Map<String, dynamic> movie;
  final int season;
  final int episode;

  const VidsrcPlayerPage({
    super.key,
    required this.movie,
    this.season = 1,
    this.episode = 1,
  });

  @override
  State<VidsrcPlayerPage> createState() => _VidsrcPlayerPageState();
}

class _VidsrcPlayerPageState extends State<VidsrcPlayerPage>
    with WidgetsBindingObserver {
  late final WebViewController _controller;
  bool _isLoading = true;
  bool _isFullscreen = false;
  int _activeSeason = 1;
  int _activeEpisode = 1;

  // Episode cache: seasonNumber -> List<episode data>
  final Map<int, List<Map<String, dynamic>>> _episodeCache = {};
  bool _episodesLoading = false;

  // Allowed domains
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
    _activeSeason = widget.season;
    _activeEpisode = widget.episode;
    _initWebView();
    _fetchEpisodesForSeason(_activeSeason);
  }

  String get _title =>
      widget.movie['title'] ?? widget.movie['name'] ?? 'Unknown';

  String get _id {
    final imdb = widget.movie['imdb_id'];
    if (imdb != null && imdb.toString().isNotEmpty) {
      return imdb.toString();
    }
    return widget.movie['id']?.toString() ?? '';
  }

  bool get _isMovie => widget.movie['title'] != null;

  int get _currentSeason => _activeSeason;
  int get _currentEpisode => _activeEpisode;

  /// Main movie poster/backdrop to use as episode thumbnail fallback
  String? get _fallbackImagePath {
    final poster = widget.movie['poster_path']?.toString();
    if (poster != null && poster.isNotEmpty) return poster;
    final backdrop = widget.movie['backdrop_path']?.toString();
    if (backdrop != null && backdrop.isNotEmpty) return backdrop;
    return null;
  }

  String get _vidsrcUrl {
    if (_id.isEmpty) {
      debugPrint('ERROR: No ID available for VidSrc');
      return '';
    }
    if (_isMovie) {
      return 'https://vidsrcme.ru/embed/movie/$_id?autoplay=1';
    }
    if (_currentSeason > 0 && _currentEpisode > 0) {
      return 'https://vidsrcme.ru/embed/tv/$_id/$_currentSeason/$_currentEpisode?autoplay=1&autonext=1';
    }
    return 'https://vidsrcme.ru/embed/tv/$_id?autoplay=1&autonext=1';
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

  // ── Fetch real episode data with still_path from TMDB ──
  Future<void> _fetchEpisodesForSeason(int season) async {
    if (_episodeCache.containsKey(season)) return;
    if (_isMovie) return;

    final seriesId = widget.movie['id'];
    if (seriesId == null) return;

    setState(() => _episodesLoading = true);
    try {
      final episodes = await TMDBService().fetchSeasonEpisodes(
        seriesId,
        season,
      );
      setState(() {
        _episodeCache[season] = episodes;
        _episodesLoading = false;
      });
    } catch (e) {
      debugPrint('Failed to fetch episodes: $e');
      setState(() => _episodesLoading = false);
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
          onWebResourceError: (error) {
            debugPrint('WebView error: ${error.description}');
          },
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

  // Auto-click VidSrc's play button since autoplay=1 still shows a button on free domains
  void _autoClickPlayButton() {
    const js = """
      (function() {
        function clickPlay() {
          const playBtn = document.querySelector('.play-button, .vjs-big-play-button, [class*=\"play\"], button[title*=\"Play\"]');
          if (playBtn) {
            playBtn.click();
            console.log('Auto-clicked play button');
            return true;
          }
          const video = document.querySelector('video');
          if (video && video.paused) {
            video.play();
            console.log('Auto-played video element');
            return true;
          }
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
        window.open = function() { 
          console.log('BLOCKED: window.open popup');
          return null; 
        };
        document.addEventListener('click', function(e) {
          const target = e.target.closest('a');
          if (target) {
            const href = target.href || '';
            const allowed = ['vidsrc', 'cloudorchestranova', 'javascript:', '#'];
            const isAllowed = allowed.some(function(a) { return href.includes(a); });
            if (!isAllowed) {
              console.log('BLOCKED click to:', href);
              e.preventDefault();
              e.stopPropagation();
              return false;
            }
          }
        }, true);
        function removeAds() {
          const selectors = [
            'iframe[src*=\"aliexpress\"]',
            'iframe[src*=\"advertising\"]',
            'iframe[src*=\"ads\"]',
            'iframe[src*=\"popup\"]',
            'iframe[src*=\"click\"]',
            'iframe[src*=\"banner\"]',
            'div[class*=\"ad\"]',
            'div[id*=\"ad\"]',
            'div[class*=\"popup\"]',
            'div[id*=\"popup\"]',
            'div[class*=\"banner\"]',
            'div[id*=\"banner\"]',
            'a[target=\"_blank\"]',
            '[onclick*=\"window.open\"]',
          ];
          selectors.forEach(function(selector) {
            document.querySelectorAll(selector).forEach(function(el) {
              console.log('REMOVED ad element:', selector);
              el.remove();
            });
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
          console.log('BLOCKED location.replace to:', url);
        };
        window.onbeforeunload = null;
        console.log('Ad blocker injected successfully');
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

  void _handlePlayerEvent(Map<String, dynamic> data) {
    final status = data['player_status']?.toString();
    final progress = (data['player_progress'] as num?)?.toDouble() ?? 0.0;
    if (status == 'playing' && progress > 0) {
      _saveProgress(progress);
    }
  }

  void _listenForFullscreenChanges() {
    const js = """
      (function() {
        document.addEventListener('fullscreenchange', function() {
          const isFullscreen = !!document.fullscreenElement;
          console.log('FULLSCREEN_CHANGE:' + isFullscreen);
        });
      })();
    """;
    _controller.runJavaScript(js);
  }

  void _loadEpisode(int season, int episode) {
    setState(() {
      _activeSeason = season;
      _activeEpisode = episode;
      _isLoading = true;
    });
    final newUrl = _vidsrcUrl;
    _controller.loadRequest(Uri.parse(newUrl));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {}

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

  // PORTRAIT: Video centered at top, movie info below
  Widget _buildPortraitView() {
    return SafeArea(
      child: Column(
        children: [
          // Top App Bar
          _buildAppBar(),

          // Video Player
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
                ],
              ),
            ),
          ),

          // Movie info below video (scrollable)
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

                  // Synopsis
                  Text(
                    'Synopsis',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _getSynopsis(),
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Episodes section (TV only) OR MovieTrend() for movies
                  if (!_isMovie) ...[
                    _buildSeasonSelector(),
                    const SizedBox(height: 16),
                    _buildEpisodesList(),
                  ] else ...[
                    // For movies, use the imported MovieTrend widget
                    MovieTrend(),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Season selector tabs (S1, S2, S3...)
  Widget _buildSeasonSelector() {
    // Get number of seasons from movie data, default to 3
    final seasonCount = (widget.movie['number_of_seasons'] as int?) ?? 3;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Seasons',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(seasonCount, (index) {
              final seasonNum = index + 1;
              final isActive = seasonNum == _activeSeason;
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() => _activeSeason = seasonNum);
                    _fetchEpisodesForSeason(seasonNum);
                    _loadEpisode(seasonNum, 1);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: isActive
                          ? const Color(0xFF7C3AED)
                          : Colors.white.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'S$seasonNum',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: isActive
                            ? FontWeight.w700
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  // Episode list with image fallback logic
  Widget _buildEpisodesList() {
    final episodes = _getEpisodesForSeason(_activeSeason);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Episodes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        if (_episodesLoading)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: CircularProgressIndicator(color: Color(0xFF7C3AED)),
            ),
          )
        else
          ...episodes.map((ep) => _buildEpisodeItem(ep)),
      ],
    );
  }

  List<Map<String, dynamic>> _getEpisodesForSeason(int season) {
    // 1. Use cached TMDB episode data (has real still_path)
    if (_episodeCache.containsKey(season)) {
      return _episodeCache[season]!;
    }

    // 2. Try to get episodes from movie data (from details API)
    final seasons = widget.movie['seasons'] as List<dynamic>?;
    if (seasons != null) {
      final seasonData = seasons.firstWhere(
        (s) => (s['season_number'] ?? s['number']) == season,
        orElse: () => null,
      );
      if (seasonData != null && seasonData['episodes'] != null) {
        return (seasonData['episodes'] as List).cast<Map<String, dynamic>>();
      }
    }

    // 3. Fallback: generate placeholder episodes with fallback image
    final episodeCount = widget.movie['number_of_episodes'] ?? 6;
    return List.generate(
      episodeCount,
      (index) => {
        'episode_number': index + 1,
        'name': 'Episode ${index + 1}',
        'overview': 'Episode ${index + 1} of Season $season',
        'runtime': 45,
        'still_path': null,
        // Pass fallback image so _buildEpisodeItem can use it
        '_fallback_image': _fallbackImagePath,
      },
    );
  }

  Widget _buildEpisodeItem(Map<String, dynamic> episode) {
    final epNum = episode['episode_number'] ?? episode['number'] ?? 1;
    final title = episode['name'] ?? episode['title'] ?? 'Episode $epNum';
    final subtitle = episode['overview']?.toString().isNotEmpty == true
        ? episode['overview'].toString()
        : 'Episode $epNum';
    final runtime = episode['runtime'] ?? episode['duration'] ?? 45;
    final isActive = epNum == _activeEpisode;

    // ── IMAGE RESOLUTION: episode still -> movie poster -> movie backdrop -> fallback widget ──
    String? imagePath = episode['still_path']?.toString();
    if (imagePath == null || imagePath.isEmpty || imagePath == 'null') {
      imagePath = episode['_fallback_image']?.toString();
    }
    if (imagePath == null || imagePath.isEmpty || imagePath == 'null') {
      imagePath = _fallbackImagePath;
    }
    final bool hasImage =
        imagePath != null && imagePath.isNotEmpty && imagePath != 'null';

    // Purple-ish background for active playing episode
    final activeBgColor = const Color(0xFF7C3AED).withOpacity(0.15);
    final activeBorderColor = const Color(0xFF7C3AED).withOpacity(0.4);

    return GestureDetector(
      onTap: () => _loadEpisode(_activeSeason, epNum as int),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isActive ? activeBgColor : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: isActive
              ? Border.all(color: activeBorderColor, width: 1)
              : null,
        ),
        child: Row(
          children: [
            // Thumbnail with fallback chain
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 100,
                height: 60,
                color: Colors.grey[900],
                child: hasImage
                    ? Image.network(
                        'https://image.tmdb.org/t/p/w300$imagePath',
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            _buildThumbnailFallback(epNum as int),
                      )
                    : _buildThumbnailFallback(epNum as int),
              ),
            ),
            const SizedBox(width: 12),
            // Episode info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: isActive ? FontWeight.w700 : FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey[500], fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$runtime min',
                    style: TextStyle(color: Colors.grey[600], fontSize: 11),
                  ),
                ],
              ),
            ),
            // Download icon
            GestureDetector(
              onTap: () {
                // Handle download
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.06),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.download_rounded,
                  color: isActive ? const Color(0xFF7C3AED) : Colors.grey[400],
                  size: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnailFallback(int epNum) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          color: Colors.grey[850],
          child: Center(
            child: Icon(
              Icons.play_circle_outline,
              color: Colors.grey[600],
              size: 24,
            ),
          ),
        ),
        // Episode number badge
        Positioned(
          bottom: 4,
          left: 4,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              'E$epNum',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // FULLSCREEN: Video fills entire screen in landscape
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
        // Exit fullscreen button
        Positioned(
          top: 16,
          left: 16,
          child: SafeArea(
            child: GestureDetector(
              onTap: () {
                setState(() => _isFullscreen = false);
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.portraitUp,
                  DeviceOrientation.portraitDown,
                ]);
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
              },
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

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
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
          Expanded(
            child: Text(
              _isMovie ? 'Now Playing' : 'S$_currentSeason E$_currentEpisode',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
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

  String _getRating() {
    final rating =
        (widget.movie['vote_average'] as num?)?.toDouble() ??
        (widget.movie['rating'] as num?)?.toDouble() ??
        0.0;
    return rating.toStringAsFixed(1);
  }

  String _getYear() {
    final date =
        widget.movie['release_date'] ?? widget.movie['first_air_date'] ?? '';
    if (date.toString().isNotEmpty) {
      final parsed = DateTime.tryParse(date.toString());
      return parsed?.year.toString() ?? 'TBD';
    }
    return widget.movie['year']?.toString() ?? 'TBD';
  }

  String _getSynopsis() {
    final overview = widget.movie['overview']?.toString();
    if (overview != null && overview.isNotEmpty) {
      return overview;
    }
    return "No synopsis available.";
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
