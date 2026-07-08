import 'package:flutter/material.dart';
import 'package:practice_ui/apps/cloth_ecom/pages/cloth_ecom_home_screen.dart';
import 'package:practice_ui/apps/cloth_ecom/pages/cloth_ecom_cart_screen.dart';
import 'package:practice_ui/apps/cloth_ecom/pages/cloth_ecom_favourite_screen.dart';
import 'package:practice_ui/apps/cloth_ecom/pages/cloth_ecom_profile_screen.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:flutter/services.dart';

class ClotheEcomNavbar extends StatefulWidget {
  const ClotheEcomNavbar({super.key});

  @override
  State<ClotheEcomNavbar> createState() => _ClotheEcomNavbarState();
}

class _ClotheEcomNavbarState extends State<ClotheEcomNavbar> {
  int _currentIndex = 0;
  static const Color _active = Color(0xFFF34000);
  static const Color _inactive = Color(0xFF9A9A9A);
  static const double _iconSize = 28;

  void _changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = [
    ClotheEcomHomeScreen(),
    ClothEcomCartScreen(),
    ClothEcomFavouriteScreen(),
    ClothEcomProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      body: _pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: _changeIndex,

        type: BottomNavigationBarType.fixed,
        selectedItemColor: _active,
        unselectedItemColor: _inactive,

        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedHome01,
              color: _inactive,
              size: _iconSize,
            ),
            activeIcon: HugeIcon(
              icon: HugeIcons.strokeRoundedHome01,
              color: _active,
              size: _iconSize,
            ),
          ),
          BottomNavigationBarItem(
            label: "Cart",
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedShoppingCart02,
              color: _inactive,
              size: _iconSize,
            ),
            activeIcon: HugeIcon(
              icon: HugeIcons.strokeRoundedShoppingCart02,
              color: _active,
              size: _iconSize,
            ),
          ),
          BottomNavigationBarItem(
            label: "Favourites",
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedFavourite,
              color: _inactive,
              size: _iconSize,
            ),
            activeIcon: HugeIcon(
              icon: HugeIcons.strokeRoundedFavourite,
              color: _active,
              size: _iconSize,
            ),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedUserCircle,
              color: _inactive,
              size: _iconSize,
            ),
            activeIcon: HugeIcon(
              icon: HugeIcons.strokeRoundedUserCircle,
              color: _active,
              size: _iconSize,
            ),
          ),
        ],
      ),
    );
  }
}
