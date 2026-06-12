import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:practice_ui/apps/whatsapp/home_screen.dart';
import 'package:practice_ui/apps/whatsapp/pages/calls_screen.dart';
import 'package:practice_ui/apps/whatsapp/pages/communities_screen.dart';
import 'package:practice_ui/apps/whatsapp/pages/updates_screen.dart';

class NavControll extends StatefulWidget {
  const NavControll({super.key});

  @override
  State<NavControll> createState() => _NavControllState();
}

class _NavControllState extends State<NavControll> {
  int _currentIndex = 0;

  void _changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomeScreen(),
    UpdatesScreen(),
    CommunitiesScreen(),
    CallsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: _changeIndex,
        selectedItemColor: const Color(0xff25D366),
        unselectedItemColor: Colors.black87,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            label: "Chats",
            icon: HugeIcon(icon: HugeIcons.strokeRoundedMessage01),
          ),
          BottomNavigationBarItem(
            label: "Updates",
            icon: HugeIcon(icon: HugeIcons.strokeRoundedSolarSystem01),
          ),
          BottomNavigationBarItem(
            label: "Communities",
            icon: HugeIcon(icon: HugeIcons.strokeRoundedUserGroup),
          ),
          BottomNavigationBarItem(
            label: "Calls",
            icon: HugeIcon(icon: HugeIcons.strokeRoundedCall),
          ),
        ],
      ),
    );
  }
}
