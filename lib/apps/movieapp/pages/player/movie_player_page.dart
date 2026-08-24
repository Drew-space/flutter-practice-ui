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
