// import 'package:flutter/material.dart';

// class RealHomeScreen extends StatefulWidget {
//   const RealHomeScreen({super.key});

//   @override
//   State<RealHomeScreen> createState() => _RealHomeScreenState();
// }

// class _RealHomeScreenState extends State<RealHomeScreen> {
//   final CarouselController controller = CarouselController(initialItem: 1);

//   final List<House> houses = [
//     House(
//       title: "Ocean View Villa",
//       location: "Banana Island, Lagos",
//       price: "₦950M",
//       image:
//           "https://images.unsplash.com/photo-1613977257363-707ba9348227?w=1200",
//     ),
//     House(
//       title: "Modern Duplex",
//       location: "Lekki Phase 1",
//       price: "₦480M",
//       image:
//           "https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?w=1200",
//     ),
//     House(
//       title: "Luxury Mansion",
//       location: "Ikoyi, Lagos",
//       price: "₦1.2B",
//       image:
//           "https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=1200",
//     ),
//     House(
//       title: "Palm Residence",
//       location: "Victoria Island",
//       price: "₦650M",
//       image:
//           "https://images.unsplash.com/photo-1600047509807-ba8f99d2cdde?w=1200",
//     ),
//     House(
//       title: "Skyline Penthouse",
//       location: "Eko Atlantic",
//       price: "₦850M",
//       image:
//           "https://images.unsplash.com/photo-1600566752355-35792bedcfea?w=1200",
//     ),
//   ];

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,

//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 12),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /// HEADER
//               Row(
//                 children: [
//                   const Expanded(
//                     child: Text(
//                       "Featured Houses",
//                       style: TextStyle(
//                         fontSize: 28,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ),

//                   Container(
//                     width: 52,
//                     height: 52,
//                     decoration: BoxDecoration(
//                       color: Colors.grey.shade100,
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: const Icon(Icons.search),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 24),

//               SizedBox(
//                 height: 350,
//                 child: CarouselView.weighted(
//                   controller: controller,
//                   itemSnapping: true,
//                   flexWeights: const [1, 7, 1],
//                   children: houses
//                       .map((house) => HouseCard(house: house))
//                       .toList(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class HouseCard extends StatelessWidget {
//   const HouseCard({super.key, required this.house});

//   final House house;

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(28),
//       child: Stack(
//         fit: StackFit.expand,
//         children: [
//           /// IMAGE
//           Image.network(house.image, fit: BoxFit.cover),

//           /// DARK OVERLAY
//           Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.bottomCenter,
//                 end: Alignment.topCenter,
//                 colors: [Colors.black87, Colors.transparent],
//               ),
//             ),
//           ),

//           /// INFO
//           Positioned(
//             left: 18,
//             right: 18,
//             bottom: 18,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   house.title,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 22,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),

//                 const SizedBox(height: 4),

//                 Text(
//                   house.location,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(color: Colors.white70, fontSize: 14),
//                 ),

//                 const SizedBox(height: 12),

//                 Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 14,
//                     vertical: 8,
//                   ),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                   child: Text(
//                     house.price,
//                     style: const TextStyle(fontWeight: FontWeight.w600),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class House {
//   final String title;
//   final String location;
//   final String price;
//   final String image;

//   const House({
//     required this.title,
//     required this.location,
//     required this.price,
//     required this.image,
//   });
// }

import 'package:flutter/material.dart';

class RealHomeScreen extends StatefulWidget {
  const RealHomeScreen({super.key});

  @override
  State<RealHomeScreen> createState() => _RealHomeScreenState();
}

class _RealHomeScreenState extends State<RealHomeScreen> {
  final CarouselController controller = CarouselController(initialItem: 1);

  final List<House> houses = const [
    House(
      title: "Ocean View Villa",
      location: "Banana Island, Lagos",
      image:
          "https://images.unsplash.com/photo-1613977257363-707ba9348227?w=1200",
    ),
    House(
      title: "Modern Duplex",
      location: "Lekki Phase 1",
      image:
          "https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?w=1200",
    ),
    House(
      title: "Luxury Mansion",
      location: "Ikoyi, Lagos",
      image:
          "https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=1200",
    ),
    House(
      title: "Palm Residence",
      location: "Victoria Island",
      image:
          "https://images.unsplash.com/photo-1600047509807-ba8f99d2cdde?w=1200",
    ),
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Featured Houses",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(Icons.search),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// CAROUSEL
              SizedBox(
                height: 360,
                child: CarouselView.weighted(
                  controller: controller,
                  itemSnapping: true,
                  flexWeights: const [1, 7, 1],
                  children: houses.map((h) => HouseCard(house: h)).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HouseCard extends StatelessWidget {
  const HouseCard({super.key, required this.house});

  final House house;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: Stack(
        fit: StackFit.expand,
        children: [
          /// IMAGE
          Image.network(house.image, fit: BoxFit.cover),

          /// VERY SOFT BOTTOM GRADIENT ONLY
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 140,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.65),
                    Colors.black.withValues(alpha: 0.25),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
            ),
          ),

          /// TEXT + BUTTON
          Positioned(
            left: 14,
            right: 14,
            bottom: 14,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  house.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  house.location,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),

                const SizedBox(height: 12),

                /// VIEW BUTTON ONLY (NO ROW → NO OVERFLOW)
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      "View",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class House {
  final String title;
  final String location;
  final String image;

  const House({
    required this.title,
    required this.location,
    required this.image,
  });
}
