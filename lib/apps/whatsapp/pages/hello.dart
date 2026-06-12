// import 'package:flutter/material.dart';
// import 'package:hugeicons/hugeicons.dart';

// void main() {
//   runApp(const MyApp());
// }

// class StatusModel {
//   final String name;
//   final String time;
//   final String image;

//   const StatusModel({
//     required this.name,
//     required this.time,
//     required this.image,
//   });
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: UpdatesScreen(),
//     );
//   }
// }

// class UpdatesScreen extends StatelessWidget {
//   const UpdatesScreen({super.key});

//   static const List<StatusModel> updates = [
//     StatusModel(
//       name: "T-jay ❤️",
//       time: "Yesterday",
//       image:
//           "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=200",
//     ),
//     StatusModel(
//       name: "jennifer",
//       time: "2:58 AM",
//       image:
//           "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200",
//     ),
//     StatusModel(
//       name: "judith",
//       time: "56 minutes ago",
//       image:
//           "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=200",
//     ),
//     StatusModel(
//       name: "Oghale",
//       time: "Yesterday",
//       image: "https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=200",
//     ),
//     StatusModel(
//       name: "Boy Alone💚",
//       time: "Yesterday",
//       image:
//           "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=200",
//     ),
//     StatusModel(
//       name: "Wisdompaul🚀",
//       time: "2:32 AM",
//       image:
//           "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=200",
//     ),
//     StatusModel(
//       name: "Wisdom",
//       time: "Yesterday",
//       image:
//           "https://images.unsplash.com/photo-1517841905240-472988babdf9?w=200",
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,

//       body: SafeArea(
//         child: ListView(
//           children: [
//             const SizedBox(height: 12),

//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Updates",
//                     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                   ),
//                   Row(
//                     children: [
//                       HugeIcon(icon: HugeIcons.strokeRoundedSearch01),
//                       SizedBox(width: 10),
//                       HugeIcon(icon: HugeIcons.strokeRoundedMoreVertical),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 10),

//             // My Status
//             ListTile(
//               contentPadding: const EdgeInsets.symmetric(horizontal: 16),
//               leading: Stack(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(3),
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(color: Colors.grey.shade400, width: 3),
//                     ),
//                     child: const CircleAvatar(
//                       radius: 28,
//                       backgroundImage: NetworkImage(
//                         "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=200",
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     right: 0,
//                     child: Container(
//                       width: 20,
//                       height: 20,
//                       decoration: const BoxDecoration(
//                         color: Color(0xff25D366),
//                         shape: BoxShape.circle,
//                       ),
//                       child: const Icon(
//                         Icons.add,
//                         color: Colors.white,
//                         size: 14,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               title: const Text(
//                 "My status",
//                 style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
//               ),
//               subtitle: const Text("Tap to add status update"),
//             ),

//             const SizedBox(height: 20),

//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Text(
//                 "Recent updates",
//                 style: TextStyle(
//                   color: Colors.grey.shade700,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 15,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 8),

//             ...updates.map(
//               (user) => ListTile(
//                 contentPadding: const EdgeInsets.symmetric(
//                   horizontal: 7,
//                   vertical: 2,
//                 ),
//                 leading: Container(
//                   padding: const EdgeInsets.all(4),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(
//                       color: const Color(0xff25D366),
//                       width: 2.5,
//                     ),
//                   ),
//                   child: CircleAvatar(
//                     radius: 28,
//                     backgroundImage: NetworkImage(user.image),
//                   ),
//                 ),
//                 title: Text(
//                   user.name,
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 subtitle: Text(user.time),
//               ),
//             ),
//           ],
//         ),
//       ),

//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton.small(
//             heroTag: "edit",
//             backgroundColor: Colors.grey.shade200,
//             elevation: 1,
//             onPressed: () {},
//             child: const Icon(Icons.edit, color: Colors.black54),
//           ),
//           const SizedBox(height: 16),
//           FloatingActionButton(
//             heroTag: "camera",
//             backgroundColor: const Color(0xff25D366),
//             onPressed: () {},
//             child: const Icon(Icons.camera_alt, color: Colors.white),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

void main() {
  runApp(const MyApp());
}

class StatusModel {
  final String name;
  final String time;
  final String image;

  const StatusModel({
    required this.name,
    required this.time,
    required this.image,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UpdatesScreen(),
    );
  }
}

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({super.key});

  static const List<StatusModel> updates = [
    StatusModel(
      name: "T-jay ❤️",
      time: "Yesterday",
      image:
          "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=200",
    ),
    StatusModel(
      name: "jennifer",
      time: "2:58 AM",
      image:
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200",
    ),
    StatusModel(
      name: "judith",
      time: "56 minutes ago",
      image:
          "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=200",
    ),
    StatusModel(
      name: "Oghale",
      time: "Yesterday",
      image: "https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=200",
    ),
    StatusModel(
      name: "Boy Alone💚",
      time: "Yesterday",
      image:
          "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=200",
    ),
    StatusModel(
      name: "Wisdompaul🚀",
      time: "2:32 AM",
      image:
          "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=200",
    ),
    StatusModel(
      name: "Wisdom",
      time: "Yesterday",
      image:
          "https://images.unsplash.com/photo-1517841905240-472988babdf9?w=200",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 12),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Updates",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      HugeIcon(icon: HugeIcons.strokeRoundedSearch01),
                      SizedBox(width: 10),
                      HugeIcon(icon: HugeIcons.strokeRoundedMoreVertical),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // My Status
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: Stack(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=200",
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: Color(0xff25D366),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ),
                ],
              ),
              title: const Text(
                "My status",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              subtitle: const Text("Tap to add status update"),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Recent updates",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),

            const SizedBox(height: 8),

            ...updates.map(
              (user) => ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 7,
                  vertical: 2,
                ),
                leading: Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xff25D366),
                      width: 2.5,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(user.image),
                  ),
                ),
                title: Text(
                  user.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(user.time),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.small(
            heroTag: "edit",
            backgroundColor: Colors.grey.shade200,
            elevation: 1,
            onPressed: () {},
            child: const Icon(Icons.edit, color: Colors.black54),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            heroTag: "camera",
            backgroundColor: const Color(0xff25D366),
            onPressed: () {},
            child: const Icon(Icons.camera_alt, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
