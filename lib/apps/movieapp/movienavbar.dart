import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:practice_ui/apps/gadgetapp/pages/gadget_favourite_screen.dart';
import 'package:practice_ui/apps/gadgetapp/pages/gadget_home_screen.dart';
import 'package:practice_ui/apps/gadgetapp/pages/gadget_profile_screen.dart';
import 'package:practice_ui/apps/gadgetapp/pages/gadget_shop_screen.dart';
import 'package:flutter/services.dart';
import 'package:practice_ui/apps/movieapp/pages/movie_bookmarks_screen.dart';
import 'package:practice_ui/apps/movieapp/pages/movie_download_screen.dart';
import 'package:practice_ui/apps/movieapp/pages/movie_home.dart';
import 'package:practice_ui/apps/movieapp/pages/movie_settings_screen.dart';
import 'package:practice_ui/apps/movieapp/pages/movie_search_screen.dart';

class MovieNavbar extends StatefulWidget {
  const MovieNavbar({super.key});

  @override
  State<MovieNavbar> createState() => _MovieNavbarState();
}

class _MovieNavbarState extends State<MovieNavbar> {
  int _currentIndex = 0;

  static const Color _activePurple = Color(0xFF7a65c0);
  static const Color _navBg = Color(0xFF1C1C1E);

  final List<Widget> _pages = [
    const MovieHomeScreen(),
    const MovieSearchScreen(),
    const MovieBookmarksScreen(),
    const MovieDownloadScreen(),
    const MovieSettingsScreen(),
  ];

  final List<_NavItemData> _items = const [
    _NavItemData(label: 'Home', icon: HugeIcons.strokeRoundedHome01),
    _NavItemData(label: 'Search', icon: HugeIcons.strokeRoundedSearch01),
    _NavItemData(label: 'Bookmarks', icon: HugeIcons.strokeRoundedBookmark01),
    _NavItemData(label: 'Downloads', icon: HugeIcons.strokeRoundedDownload01),
    _NavItemData(label: 'Settings', icon: HugeIcons.strokeRoundedSettings01),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      extendBody: true,
      body: _pages[_currentIndex],
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: MediaQuery.of(context).padding.bottom + 16,
          top: 16,
        ),
        child: Container(
          height: 64,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: _navBg,
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment
                .center, // <- keeps all items vertically centered
            children: List.generate(_items.length, (index) {
              final isActive = _currentIndex == index;
              final item = _items[index];

              return GestureDetector(
                onTap: () => setState(() => _currentIndex = index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOutCubic,
                  padding: isActive
                      ? const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12, // <- vertical padding for active item
                        ) // <- vertical matches inactive now
                      : const EdgeInsets.all(12),
                  decoration: isActive
                      ? BoxDecoration(
                          color: _activePurple,
                          borderRadius: BorderRadius.circular(24),
                        )
                      : null,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HugeIcon(
                        icon: item.icon,
                        color: isActive
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                        size: 24,
                      ),
                      if (isActive) ...[
                        const SizedBox(width: 8),
                        Text(
                          item.label,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavItemData {
  final String label;
  final dynamic icon; // <-- changed from IconData to dynamic

  const _NavItemData({required this.label, required this.icon});
}
