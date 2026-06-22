import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:practice_ui/apps/gadgetapp/pages/gadget_favourite_screen.dart';
import 'package:practice_ui/apps/gadgetapp/pages/gadget_home_screen.dart';
import 'package:practice_ui/apps/gadgetapp/pages/gadget_profile_screen.dart';
import 'package:practice_ui/apps/gadgetapp/pages/gadget_shop_screen.dart';

class GadgetNavbar extends StatefulWidget {
  const GadgetNavbar({super.key});

  @override
  State<GadgetNavbar> createState() => _GadgetNavbarState();
}

class _GadgetNavbarState extends State<GadgetNavbar> {
  int _currentIndex = 0;
  static const Color _active = Color(0xFFFF8A00);
  static const Color _inactive = Color(0xFF9A9A9A);

  void _changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = [
    GadgetHomeScreen(),
    GadgetShopScreen(),
    GadgetFavouriteScreen(),
    GadgetProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: _changeIndex,

        type: BottomNavigationBarType.fixed,
        selectedItemColor: _active,
        unselectedItemColor: _inactive,

        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: HugeIcon(icon: HugeIcons.strokeRoundedHome01),
          ),
          BottomNavigationBarItem(
            label: "Cart",
            icon: HugeIcon(icon: HugeIcons.strokeRoundedShoppingCart02),
          ),
          BottomNavigationBarItem(
            label: "Favourites",
            icon: HugeIcon(icon: HugeIcons.strokeRoundedFavourite),
          ),
          BottomNavigationBarItem(
            label: "Account",
            icon: HugeIcon(icon: HugeIcons.strokeRoundedUser),
          ),
        ],
      ),
    );
  }
}
