// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:practice_ui/apps/gadgetapp/gadget_navbar.dart';
// import 'package:practice_ui/apps/gadgetapp/pages/gadget_home_screen.dart';
// import 'package:practice_ui/apps/naija.dart';
// import 'package:practice_ui/apps/real-estate/utils/real_navbar.dart';
// import 'package:practice_ui/apps/whatsapp/home_screen.dart';
// import 'package:practice_ui/apps/whatsapp/nav_control.dart';

// void main() {
//   runApp(const ProviderScope(child: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: true,
//       theme: ThemeData(
//         scaffoldBackgroundColor: Colors.white,
//         // ...rest of your theme
//       ),
//       home: RealNavbar(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart'; // 👈 new import
import 'package:practice_ui/apps/cloth_ecom/cloth_ecom_navbar.dart';
import 'package:practice_ui/apps/furniture/pages/furniture_home_screen.dart';
import 'package:practice_ui/apps/furniture/pages/furniture_navbar.dart';
import 'package:practice_ui/apps/gadgetapp/gadget_navbar.dart';
import 'package:practice_ui/apps/gadgetapp/pages/gadget_home_screen.dart';
import 'package:practice_ui/apps/naija.dart';
import 'package:practice_ui/apps/real-estate/auth/auth_screen.dart';
import 'package:practice_ui/apps/real-estate/utils/real_navbar.dart';
import 'package:practice_ui/apps/whatsapp/home_screen.dart';
import 'package:practice_ui/apps/whatsapp/nav_control.dart';

void main() async {
  // 👇 Required because we're doing async work (Hive setup)
  //    BEFORE runApp(). Without this line, Flutter hasn't
  //    "woken up" yet and Hive calls can crash or misbehave.
  WidgetsFlutterBinding.ensureInitialized();

  // 👇 Sets up Hive's storage location on the device automatically
  //    (handles Android/iOS/web path differences for you).
  await Hive.initFlutter();

  // 👇 Open the box ONCE, here, at app startup.
  //    Think of "favoritesBox" like a named table/collection.
  //    Every screen that needs it just calls Hive.box('favoritesBox')
  //    afterwards — no need to "open" it again.
  await Hive.openBox('favoritesBox');

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
      home: ClotheEcomNavbar(),
    );
  }
}
