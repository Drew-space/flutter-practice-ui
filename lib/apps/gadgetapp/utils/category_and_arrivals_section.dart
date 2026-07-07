// import 'package:flutter/material.dart';
// import 'package:practice_ui/apps/furniture/utils/furniture_option.dart';

// class CategoryAndArrivalsSection extends StatelessWidget {
//   CategoryAndArrivalsSection({super.key});

//   final List<String> _options = [
//     "All",
//     "Smartphones",
//     "Laptops",
//     "Tablets",
//     "Accessories",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           SizedBox(height: 20),
//           Row(
//             children: [
//               Text(
//                 "Categories",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
//               ),
//               Spacer(),
//               TextButton(
//                 onPressed: () {},
//                 child: Text(
//                   "View all",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 17,
//                     color: Colors.grey[600],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 40,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               padding: const EdgeInsets.symmetric(horizontal: 16),

//               itemCount: _options.length,
//               itemBuilder: (context, index) {
//                 return FurnitureOption(
//                   title: _options[index],
//                   bgColor: index == 0
//                       ? const Color(0xFF292D32)
//                       : const Color(0xFFF7F7F7),
//                   textColor: index == 0 ? Colors.white : Colors.black87,
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:practice_ui/apps/furniture/utils/furniture_option.dart';

class Product {
  final String name;
  final String price;
  final String imageUrl;
  final double cardHeight;

  const Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.cardHeight,
  });
}

const double _short = 220;
const double _tall = 260;

// Row 0: left short, right tall. Row 1: flips -- left tall, right short.
//
// NOTE: source.unsplash.com (the old "random keyword" redirect service) was
// shut down, which is why images broke. These use fixed, direct photo URLs
// from images.unsplash.com instead -- stable, but tied to a specific photo
// rather than a keyword search. Swap the photo ID in each URL to change one.
const List<Product> _newArrivals = [
  Product(
    name: "Noir Comfort",
    price: "\$410",
    imageUrl:
        "https://images.pexels.com/photos/12269761/pexels-photo-12269761.jpeg?cs=srgb&dl=pexels-esteban-santiago-gonzalez-239179106-12269761.jpg&fm=jpg",
    cardHeight: _short,
  ),
  Product(
    name: "Dome Glow",
    price: "\$180",
    imageUrl:
        "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSUsNuKMQ2dMCe_-PzkDX53Mk7Pa1DjiVzlBht_zoaLfORx6eWN",
    cardHeight: _tall,
  ),
  Product(
    name: "Woven Nest",
    price: "\$260",
    imageUrl:
        "https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400&q=80&auto=format&fit=crop",
    cardHeight: _tall,
  ),
  Product(
    name: "Clay Vase",
    price: "\$95",
    imageUrl:
        "https://images.unsplash.com/photo-1578500494198-246f612d3b3d?w=400&q=80&auto=format&fit=crop",
    cardHeight: _short,
  ),
];

class CategoryAndArrivalsSection extends StatelessWidget {
  CategoryAndArrivalsSection({super.key});

  final List<String> _options = [
    "All",
    "Furniture",
    "Dishes",
    "Lighting",
    "Decor",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                "Categories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  "View all",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),

              itemCount: _options.length,
              itemBuilder: (context, index) {
                return FurnitureOption(
                  title: _options[index],
                  bgColor: index == 0
                      ? const Color(0xFF292D32)
                      : const Color(0xFFF7F7F7),
                  textColor: index == 0 ? Colors.white : Colors.black87,
                );
              },
            ),
          ),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  "New arrival",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "View all",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _StaggeredProductGrid(products: _newArrivals),
          ),
        ],
      ),
    );
  }
}

// Maps over the product list two at a time, building one Row per pair.
// Each card's height comes straight from product.cardHeight, so the
// tall/short pattern is fully data-driven -- edit the list above to restyle.
class _StaggeredProductGrid extends StatelessWidget {
  final List<Product> products;
  const _StaggeredProductGrid({required this.products});

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    for (var i = 0; i < products.length; i += 2) {
      final left = products[i];
      final right = (i + 1 < products.length) ? products[i + 1] : null;
      rows.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: Row(
            // start = both cards begin at the same top level; the taller
            // one just extends further down, which is what the screenshot
            // shows.
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _ProductCard(product: left)),
              if (right != null) ...[
                SizedBox(width: 12),
                Expanded(child: _ProductCard(product: right)),
              ],
            ],
          ),
        ),
      );
    }
    return Column(children: rows);
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;
  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                product.imageUrl,
                height: product.cardHeight,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return Container(
                    height: product.cardHeight,
                    color: const Color(0xFFF7F7F7),
                    child: const Center(child: CircularProgressIndicator()),
                  );
                },
                errorBuilder: (context, error, stack) => Container(
                  height: product.cardHeight,
                  color: const Color(0xFFF7F7F7),
                  child: const Icon(
                    Icons.image_not_supported_rounded,
                    size: 40,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              // Huge icon per the brief.
              child: Icon(Icons.favorite_border, size: 32, color: Colors.white),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Text(
              product.name,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            Spacer(),
            Text(
              product.price,
              style: TextStyle(fontSize: 15, color: Colors.grey[600]),
            ),
          ],
        ),
      ],
    );
  }
}
