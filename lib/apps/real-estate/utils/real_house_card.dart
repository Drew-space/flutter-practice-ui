// import 'package:flutter/material.dart';
// import 'real_house.dart';

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
//           Image.network(house.image, fit: BoxFit.cover),

//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               height: 140,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.bottomCenter,
//                   end: Alignment.topCenter,
//                   colors: [
//                     Colors.black.withValues(alpha: 0.65),
//                     Colors.black.withValues(alpha: 0.25),
//                     Colors.transparent,
//                   ],
//                   stops: const [0.0, 0.5, 1.0],
//                 ),
//               ),
//             ),
//           ),

//           Positioned(
//             left: 14,
//             right: 14,
//             bottom: 14,
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
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),

//                 const SizedBox(height: 4),

//                 Text(
//                   house.location,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(color: Colors.white70, fontSize: 13),
//                 ),

//                 const SizedBox(height: 12),

//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 18,
//                       vertical: 10,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.blue,
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: const Text(
//                       "view",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
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

import 'package:flutter/material.dart';
import 'real_house.dart';

class HouseCard extends StatelessWidget {
  const HouseCard({super.key, required this.house});

  final House house;

  // Below this width, the card is considered "collapsed" (a side card in
  // the carousel) — only the bare image shows, no text/badges/buttons,
  // since there's no realistic way to fit them without overflowing.
  static const double _collapsedThreshold = 130;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool isExpanded = constraints.maxWidth >= _collapsedThreshold;

          return Stack(
            fit: StackFit.expand,
            children: [
              Image.network(house.image, fit: BoxFit.cover),

              if (isExpanded) ...[
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

                /// RATING BADGE — top right
                Positioned(
                  top: 14,
                  right: 14,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 15),
                        const SizedBox(width: 4),
                        Text(
                          house.rating.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

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
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),

                      const SizedBox(height: 12),

                      /// PRICE + FAVORITE — replaces the old "view" button
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                house.price,
                                maxLines: 1,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            height: 34,
                            width: 34,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              house.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: house.isFavorite
                                  ? Colors.red
                                  : Colors.black87,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
