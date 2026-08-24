// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:hive_flutter/hive_flutter.dart'; // 👈 new import
// import 'package:practice_ui/apps/cloth_ecom/cloth_ecom_navbar.dart';
// import 'package:practice_ui/apps/counter.dart';
// import 'package:practice_ui/apps/furniture/pages/furniture_home_screen.dart';
// import 'package:practice_ui/apps/furniture/pages/furniture_navbar.dart';
// import 'package:practice_ui/apps/gadgetapp/gadget_navbar.dart';
// import 'package:practice_ui/apps/gadgetapp/pages/gadget_home_screen.dart';
// import 'package:practice_ui/apps/movieapp/movienavbar.dart';
// import 'package:practice_ui/apps/movieapp/pages/movie_onboarding.dart';

// import 'package:practice_ui/apps/naija.dart';
// import 'package:practice_ui/apps/real-estate/auth/auth_screen.dart';
// import 'package:practice_ui/apps/real-estate/utils/real_navbar.dart';
// import 'package:practice_ui/apps/whatsapp/home_screen.dart';
// import 'package:practice_ui/apps/whatsapp/nav_control.dart';

// void main() async {
//   // 👇 Required because we're doing async work (Hive setup)
//   //    BEFORE runApp(). Without this line, Flutter hasn't
//   //    "woken up" yet and Hive calls can crash or misbehave.
//   WidgetsFlutterBinding.ensureInitialized();

//   // 👇 Sets up Hive's storage location on the device automatically
//   //    (handles Android/iOS/web path differences for you).
//   await Hive.initFlutter();

//   // 👇 Open the box ONCE, here, at app startup.
//   //    Think of "favoritesBox" like a named table/collection.
//   //    Every screen that needs it just calls Hive.box('favoritesBox')
//   //    afterwards — no need to "open" it again.
//   await Hive.openBox('favoritesBox');
//   await Hive.openBox<String>('movieBookmarks'); // JSON strings

//   runApp(const ProviderScope(child: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         scaffoldBackgroundColor: Colors.white,
//         //
//       ),
//       // the routes
//       // GadgetNavbar
//       // AuthScreen
//       // ClotheEcomNavbar
//       // FurnitureNavbar
//       // MovieDetailPage
//       // MovieOnboarding
//       // MovieNavbar
//       home: MovieOnboarding(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:practice_ui/firebase_options.dart';
import 'package:practice_ui/apps/movieapp/movienavbar.dart';
import 'package:practice_ui/apps/movieapp/pages/movie_onboarding.dart';
import 'package:practice_ui/apps/movieapp/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase init
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await AuthService.initialize();

  // Hive init
  await Hive.initFlutter();
  await Hive.openBox('favoritesBox');
  await Hive.openBox<String>('movieBookmarks');

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: const AuthGate(),
    );
  }
}

/// Handles auth state: shows MovieNavbar if signed in, MovieOnboarding if not
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().authStateChanges,
      builder: (context, snapshot) {
        // Loading state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // Signed in → show app
        if (snapshot.hasData) {
          return const MovieNavbar();
        }

        // Not signed in → show onboarding
        return const MovieOnboarding();
      },
    );
  }
}
