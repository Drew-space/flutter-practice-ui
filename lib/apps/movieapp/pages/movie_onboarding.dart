// import 'package:flutter/material.dart';

// class MovieOnboarding extends StatelessWidget {
//   const MovieOnboarding({super.key});

//   static const Color kPurple = Color(0xFF7A65C0);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           // Background image
//           Image.asset(
//             'assets/images/fluttermovie_app.jpg', // adjust extension as needed
//             fit: BoxFit.cover,
//           ),

//           // Dark gradient overlay for text readability
//           Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Colors.transparent,
//                   Colors.transparent,
//                   Colors.black87,
//                   Colors.black,
//                 ],
//                 stops: [0.0, 0.5, 0.85, 1.0],
//               ),
//             ),
//           ),

//           // Content
//           SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Discover cinema from a\ndifferent perspective.',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 26,
//                       fontWeight: FontWeight.bold,
//                       height: 1.3,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   Text(
//                     'Stories unfold beyond the screen, movies into an\nimmersive experience.',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.white.withOpacity(0.7),
//                       fontSize: 13,
//                       height: 1.4,
//                     ),
//                   ),
//                   const SizedBox(height: 28),

//                   // Get Started button
//                   SizedBox(
//                     width: double.infinity,
//                     height: 56,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // navigate to next screen / home
//                         // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: kPurple,
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         elevation: 0,
//                       ),
//                       child: const Text(
//                         'Get Started',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),

//                   // Home indicator bar (optional, iOS style)
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:practice_ui/apps/movieapp/movienavbar.dart';
import 'package:practice_ui/apps/movieapp/pages/movie_home.dart';

class MovieOnboarding extends StatelessWidget {
  const MovieOnboarding({super.key});

  static const Color primaryPurple = Color(0xFF7a65c0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/images/fluttermovie_app.jpg', // change to your actual image filename
            fit: BoxFit.cover,
          ),

          // Bottom gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.4),
                  Colors.black.withOpacity(0.85),
                  Colors.black.withOpacity(0.95),
                ],
                stops: const [0.45, 0.6, 0.75, 1.0],
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const Spacer(),

                  // Title
                  Text(
                    'Discover cinema from a different perspective.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.95),
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      height: 1.25,
                      letterSpacing: -0.5,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Subtitle
                  Text(
                    'stories unfold beyond the screen, movies into an immersive experience.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Get Started Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MovieNavbar(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryPurple,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
