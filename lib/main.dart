import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_ui/apps/gadgetapp/gadget_navbar.dart';
import 'package:practice_ui/apps/gadgetapp/pages/gadget_home_screen.dart';
import 'package:practice_ui/apps/naija.dart';
import 'package:practice_ui/apps/real-estate/utils/real_navbar.dart';
import 'package:practice_ui/apps/whatsapp/home_screen.dart';
import 'package:practice_ui/apps/whatsapp/nav_control.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        // ...rest of your theme
      ),
      home: RealNavbar(),
    );
  }
}
