// import 'package:flutter/material.dart';
// import 'package:hugeicons/hugeicons.dart';
// import 'package:practice_ui/apps/furniture/pages/furniture_catalog_screen.dart';
// import 'package:practice_ui/apps/furniture/pages/furniture_home_screen.dart';
// import 'package:practice_ui/apps/furniture/pages/furniture_favourite_screen.dart';
// import 'package:practice_ui/apps/furniture/pages/furniture_profile_screen.dart';
// import 'package:practice_ui/apps/gadgetapp/pages/gadget_shop_screen.dart';
// import 'package:flutter/services.dart';

// class FurnitureNavbar extends StatefulWidget {
//   const FurnitureNavbar({super.key});

//   @override
//   State<FurnitureNavbar> createState() => _FurnitureNavbarState();
// }

// class _FurnitureNavbarState extends State<FurnitureNavbar> {
//   int _currentIndex = 0;
//   static const Color _active = Color(0xFF292D32);
//   static const Color _inactive = Color(0xFF9A9A9A);

//   void _changeIndex(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   final List<Widget> _pages = [
//     FurnitureHomeScreen(),
//     FurnitureCatalogScreen(),
//     FurnitureFavouriteScreen(),
//     FurnitureProfileScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(
//       const SystemUiOverlayStyle(
//         statusBarColor: Colors.transparent,
//         statusBarIconBrightness: Brightness.dark,
//         systemNavigationBarColor: Colors.transparent,
//         systemNavigationBarIconBrightness: Brightness.dark,
//       ),
//     );
//     return Scaffold(
//       body: _pages[_currentIndex],

//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.white,
//         currentIndex: _currentIndex,
//         onTap: _changeIndex,

//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: _active,
//         unselectedItemColor: _inactive,

//         items: const [
//           BottomNavigationBarItem(
//             label: "Home",
//             icon: HugeIcon(icon: HugeIcons.strokeRoundedHome01),
//           ),
//           BottomNavigationBarItem(
//             label: "Catalog",
//             icon: HugeIcon(icon: HugeIcons.strokeRoundedShoppingCart02),
//           ),
//           BottomNavigationBarItem(
//             label: "Favourites",
//             icon: HugeIcon(icon: HugeIcons.strokeRoundedFavourite),
//           ),
//           BottomNavigationBarItem(
//             label: "Profile",
//             icon: HugeIcon(icon: HugeIcons.strokeRoundedUser),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:practice_ui/apps/furniture/pages/furniture_catalog_screen.dart';
import 'package:practice_ui/apps/furniture/pages/furniture_home_screen.dart';
import 'package:practice_ui/apps/furniture/pages/furniture_favourite_screen.dart';
import 'package:practice_ui/apps/furniture/pages/furniture_profile_screen.dart';
import 'package:practice_ui/apps/gadgetapp/pages/gadget_shop_screen.dart';
import 'package:flutter/services.dart';

class FurnitureNavbar extends StatefulWidget {
  const FurnitureNavbar({super.key});

  @override
  State<FurnitureNavbar> createState() => _FurnitureNavbarState();
}

class _FurnitureNavbarState extends State<FurnitureNavbar> {
  int _currentIndex = 0;
  static const Color _active = Color(0xFF292D32);
  static const Color _inactive = Color(0xFF9A9A9A);

  void _changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = [
    FurnitureHomeScreen(),
    FurnitureCatalogScreen(),
    FurnitureFavouriteScreen(),
    FurnitureProfileScreen(),
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

        // Not const -- every icon now swaps image assets based on
        // _currentIndex, which needs to be built at runtime.
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Image.asset(
              'assets/images/homeoutline.png',
              width: 24,
              height: 24,
              color: _active,
            ),
            activeIcon: Image.asset(
              'assets/images/homefill.png',
              width: 24,
              height: 24,
              color: _active,
            ),
          ),
          BottomNavigationBarItem(
            label: "Catalog",
            icon: Image.asset(
              'assets/images/cartoutline.png',
              width: 24,
              height: 24,
              color: _active,
            ),
            activeIcon: Image.asset(
              'assets/images/cartfill.png',
              width: 24,
              height: 24,
              color: _active,
            ),
          ),
          BottomNavigationBarItem(
            label: "Favourites",
            icon: Image.asset(
              'assets/images/favouriteoutline.png',
              width: 24,
              height: 24,
              color: _active,
            ),
            activeIcon: Image.asset(
              'assets/images/favouritefill.png',
              width: 24,
              height: 24,
              color: _active,
            ),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Image.asset(
              'assets/images/profileoutline.png',
              width: 24,
              height: 24,
              color: _active,
            ),
            activeIcon: Image.asset(
              'assets/images/profilefill.png',
              width: 24,
              height: 24,
              color: _active,
            ),
          ),
        ],
      ),
    );
  }
}
