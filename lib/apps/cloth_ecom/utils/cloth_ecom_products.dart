// import 'package:flutter/material.dart';

// const List<Map<String, dynamic>> _products = [
//   {
//     "name": "Abracadabra Shirt",
//     "category": "Unisex Wear",
//     "price": 4000.00,
//     "rating": 4.5,
//     "image":
//         "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400",
//   },
//   {
//     "name": "Panther Jacket",
//     "category": "Female Wear",
//     "price": 2500.89,
//     "rating": 3.9,
//     "image": "https://images.unsplash.com/photo-1551028719-00167b16eac5?w=400",
//   },
//   {
//     "name": "Coboko Reworm",
//     "category": "Unisex Wear",
//     "price": 8500.16,
//     "rating": 4.3,
//     "image": "https://images.unsplash.com/photo-1548126032-079a0fb0099d?w=400",
//   },
//   {
//     "name": "Queenie Gown",
//     "category": "Female Wear",
//     "price": 3100.24,
//     "rating": 4.0,
//     "image":
//         "https://images.unsplash.com/photo-1595777457583-95e059d581b8?w=400",
//   },
//   {
//     "name": "Sambissa Fitz",
//     "category": "Male Wear",
//     "price": 6340.00,
//     "rating": 3.5,
//     "image":
//         "https://images.unsplash.com/photo-1578932750294-f5075e85f44a?w=400",
//   },
//   {
//     "name": "Mancity Levi Gown",
//     "category": "Female Wear",
//     "price": 2786.00,
//     "rating": 4.8,
//     "image":
//         "https://images.unsplash.com/photo-1539109136881-3be0616acf4b?w=400",
//   },
//   {
//     "name": "Urban Hoodie",
//     "category": "Unisex Wear",
//     "price": 5200.00,
//     "rating": 4.2,
//     "image": "https://images.unsplash.com/photo-1556821840-3a63f15732ce?w=400",
//   },
//   {
//     "name": "Classic Chinos",
//     "category": "Male Wear",
//     "price": 3800.50,
//     "rating": 4.1,
//     "image":
//         "https://images.unsplash.com/photo-1624378439575-d8705ad7ae80?w=400",
//   },
//   {
//     "name": "Summer Sundress",
//     "category": "Female Wear",
//     "price": 4500.00,
//     "rating": 4.6,
//     "image":
//         "https://images.unsplash.com/photo-1572804013309-59a88b7e92f1?w=400",
//   },
//   {
//     "name": "Leather Bomber",
//     "category": "Unisex Wear",
//     "price": 12000.00,
//     "rating": 4.9,
//     "image":
//         "https://images.unsplash.com/photo-1520975954732-35dd22299614?w=400",
//   },
//   {
//     "name": "Vintage Tee",
//     "category": "Unisex Wear",
//     "price": 1800.00,
//     "rating": 3.8,
//     "image":
//         "https://images.unsplash.com/photo-1503341504253-dff4815485f1?w=400",
//   },
//   {
//     "name": "Floral Blouse",
//     "category": "Female Wear",
//     "price": 2200.00,
//     "rating": 4.4,
//     "image":
//         "https://images.unsplash.com/photo-1485230895905-ec40ba36b9bc?w=400",
//   },
//   {
//     "name": "Cargo Pants",
//     "category": "Male Wear",
//     "price": 5500.00,
//     "rating": 4.0,
//     "image":
//         "https://images.unsplash.com/photo-1473966968600-fa801b869a1a?w=400",
//   },
//   {
//     "name": "Knit Sweater",
//     "category": "Unisex Wear",
//     "price": 4100.00,
//     "rating": 4.3,
//     "image":
//         "https://images.unsplash.com/photo-1576566588028-4147f3842f27?w=400",
//   },
//   {
//     "name": "Trench Coat",
//     "category": "Female Wear",
//     "price": 9800.00,
//     "rating": 4.7,
//     "image": "https://images.unsplash.com/photo-1548624313-0396c75e4b1a?w=400",
//   },
// ];

// class ClothEcomProducts extends StatelessWidget {
//   const ClothEcomProducts({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             const Text(
//               "Recommended for you",
//               style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
//             ),
//             const Spacer(),
//             TextButton(
//               onPressed: () {},
//               child: Text(
//                 "See all",
//                 style: TextStyle(
//                   fontWeight: FontWeight.w500,
//                   fontSize: 13,
//                   color: Colors.grey[500],
//                 ),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 8),
//         GridView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: _products.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 12,
//             mainAxisSpacing: 12,
//             childAspectRatio: 0.68,
//           ),
//           itemBuilder: (context, index) {
//             return _ProductCard(product: _products[index]);
//           },
//         ),
//       ],
//     );
//   }
// }

// class _ProductCard extends StatefulWidget {
//   final Map<String, dynamic> product;
//   const _ProductCard({required this.product});

//   @override
//   State<_ProductCard> createState() => _ProductCardState();
// }

// class _ProductCardState extends State<_ProductCard> {
//   bool _liked = false;

//   @override
//   Widget build(BuildContext context) {
//     final price = widget.product["price"] as double;
//     final rating = widget.product["rating"] as double;
//     final whole = "\$${price.toStringAsFixed(0)}";
//     final decimal = price.toStringAsFixed(2).split(".")[1];

//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.04),
//             blurRadius: 6,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // ── Image with padding + heart ──
//           Padding(
//             padding: const EdgeInsets.all(8),
//             child: Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: AspectRatio(
//                     aspectRatio: 1.1,
//                     child: Image.network(
//                       widget.product["image"]!,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                       loadingBuilder: (context, child, progress) {
//                         if (progress == null) return child;
//                         return Container(
//                           color: Colors.grey[100],
//                           child: const Center(
//                             child: CircularProgressIndicator(
//                               strokeWidth: 2,
//                               color: Color(0xFFF34000),
//                             ),
//                           ),
//                         );
//                       },
//                       errorBuilder: (_, __, ___) => Container(
//                         color: Colors.grey[100],
//                         child: Icon(
//                           Icons.image_not_supported,
//                           color: Colors.grey[300],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),

//                 // Heart
//                 Positioned(
//                   top: 6,
//                   right: 6,
//                   child: GestureDetector(
//                     onTap: () => setState(() => _liked = !_liked),
//                     child: Container(
//                       padding: const EdgeInsets.all(5),
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(
//                         _liked ? Icons.favorite : Icons.favorite_border,
//                         color: const Color(0xFFF34000),
//                         size: 14,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // ── Name ──
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Text(
//               widget.product["name"]!,
//               style: const TextStyle(
//                 fontSize: 13,
//                 fontWeight: FontWeight.w700,
//                 color: Colors.black,
//               ),
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),

//           const SizedBox(height: 3),

//           // ── Category + rating ──
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Row(
//               children: [
//                 Text(
//                   widget.product["category"]!,
//                   style: TextStyle(fontSize: 10, color: Colors.grey[500]),
//                 ),
//                 const SizedBox(width: 5),
//                 Container(width: 1, height: 10, color: Colors.grey[300]),
//                 const SizedBox(width: 5),
//                 const Icon(
//                   Icons.star_rounded,
//                   color: Color(0xFFF34000),
//                   size: 12,
//                 ),
//                 const SizedBox(width: 2),
//                 Text(
//                   rating.toStringAsFixed(1),
//                   style: TextStyle(fontSize: 10, color: Colors.grey[500]),
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(height: 8),

//           // ── Price — full width bottom ──
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//             decoration: BoxDecoration(
//               color: Colors.grey[50],
//               borderRadius: const BorderRadius.vertical(
//                 bottom: Radius.circular(16),
//               ),
//             ),
//             child: RichText(
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: whole,
//                     style: const TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.black,
//                     ),
//                   ),
//                   TextSpan(
//                     text: ".$decimal",
//                     style: TextStyle(
//                       fontSize: 10,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.grey[500],
//                     ),
//                   ),
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

const List<Map<String, dynamic>> _products = [
  {
    "name": "Abracadabra Shirt",
    "category": "Unisex Wear",
    "price": 4000.00,
    "rating": 4.5,
    "image":
        "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400",
  },
  {
    "name": "Paul Elite Shoe",
    "category": "Male Wear",
    "price": 2500.89,
    "rating": 3.9,
    "image": "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400",
  },
  {
    "name": "Genies Wristwatch",
    "category": "Unisex Wear",
    "price": 3100.24,
    "rating": 4.0,
    "image":
        "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400",
  },
  {
    "name": "Coboko Reworm",
    "category": "Unisex Wear",
    "price": 8500.16,
    "rating": 4.2,
    "image": "https://images.unsplash.com/photo-1548126032-079a0fb0099d?w=400",
  },
  {
    "name": "Sambissa Trouser",
    "category": "Male Wear",
    "price": 6340.00,
    "rating": 3.5,
    "image":
        "https://images.unsplash.com/photo-1624378439575-d8705ad7ae80?w=400",
  },
  {
    "name": "Mancity Levi Gown",
    "category": "Female Wear",
    "price": 2786.34,
    "rating": 4.0,
    "image":
        "https://images.unsplash.com/photo-1539109136881-3be0616acf4b?w=400",
  },
  {
    "name": "Urban Hoodie",
    "category": "Unisex Wear",
    "price": 5200.00,
    "rating": 4.2,
    "image": "https://images.unsplash.com/photo-1556821840-3a63f15732ce?w=400",
  },
  {
    "name": "Summer Sundress",
    "category": "Female Wear",
    "price": 4500.00,
    "rating": 4.6,
    "image":
        "https://images.unsplash.com/photo-1572804013309-59a88b7e92f1?w=400",
  },
  {
    "name": "Leather Bomber",
    "category": "Unisex Wear",
    "price": 12000.00,
    "rating": 4.9,
    "image":
        "https://images.unsplash.com/photo-1520975954732-35dd22299614?w=400",
  },
  {
    "name": "Vintage Tee",
    "category": "Unisex Wear",
    "price": 1800.00,
    "rating": 3.8,
    "image":
        "https://images.unsplash.com/photo-1503341504253-dff4815485f1?w=400",
  },
  {
    "name": "Floral Blouse",
    "category": "Female Wear",
    "price": 2200.00,
    "rating": 4.4,
    "image":
        "https://images.unsplash.com/photo-1485230895905-ec40ba36b9bc?w=400",
  },
  {
    "name": "Cargo Pants",
    "category": "Male Wear",
    "price": 5500.00,
    "rating": 4.0,
    "image":
        "https://images.unsplash.com/photo-1473966968600-fa801b869a1a?w=400",
  },
  {
    "name": "Knit Sweater",
    "category": "Unisex Wear",
    "price": 4100.00,
    "rating": 4.3,
    "image":
        "https://images.unsplash.com/photo-1576566588028-4147f3842f27?w=400",
  },
  {
    "name": "Trench Coat",
    "category": "Female Wear",
    "price": 9800.00,
    "rating": 4.7,
    "image": "https://images.unsplash.com/photo-1548624313-0396c75e4b1a?w=400",
  },
  {
    "name": "Queenie Gown",
    "category": "Female Wear",
    "price": 3100.24,
    "rating": 4.0,
    "image":
        "https://images.unsplash.com/photo-1595777457583-95e059d581b8?w=400",
  },
];

class ClothEcomProducts extends StatelessWidget {
  const ClothEcomProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── Header ──
        Row(
          children: [
            const Text(
              "Recommended for you",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: Text(
                "See all",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: Colors.grey[500],
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        // ── Grid ──
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.68,
          ),
          itemBuilder: (context, index) {
            return _ProductCard(product: _products[index]);
          },
        ),
      ],
    );
  }
}

class _ProductCard extends StatefulWidget {
  final Map<String, dynamic> product;
  const _ProductCard({required this.product});

  @override
  State<_ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<_ProductCard> {
  bool _liked = false;

  @override
  Widget build(BuildContext context) {
    final price = widget.product["price"] as double;
    final rating = widget.product["rating"] as double;
    final whole = "\$${price.toStringAsFixed(0)}";
    final decimal = price.toStringAsFixed(2).split(".")[1];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Image with space around + heart ──
          Padding(
            padding: const EdgeInsets.all(8),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: AspectRatio(
                    aspectRatio: 1.05,
                    child: Image.network(
                      widget.product["image"]!,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return Container(
                          color: Colors.grey[100],
                          child: const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Color(0xFFF34000),
                            ),
                          ),
                        );
                      },
                      errorBuilder: (_, __, ___) => Container(
                        color: Colors.grey[100],
                        child: Icon(
                          Icons.image_not_supported,
                          color: Colors.grey[300],
                        ),
                      ),
                    ),
                  ),
                ),

                // Heart button
                Positioned(
                  top: 7,
                  right: 7,
                  child: GestureDetector(
                    onTap: () => setState(() => _liked = !_liked),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _liked ? Icons.favorite : Icons.favorite_border,
                        color: const Color(0xFFF34000),
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── Name ──
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.product["name"]!,
              style: const TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          const SizedBox(height: 4),

          // ── Category + rating ──
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  widget.product["category"]!,
                  style: TextStyle(
                    fontSize: 10.5,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 5),
                Container(width: 1, height: 10, color: Colors.grey[300]),
                const SizedBox(width: 5),
                const Icon(Icons.star, color: Color(0xFFF34000), size: 12),
                const SizedBox(width: 3),
                Text(
                  rating.toStringAsFixed(1),
                  style: TextStyle(
                    fontSize: 10.5,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // ── Price — centered grey pill ──
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 9),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: whole,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: ".$decimal",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
