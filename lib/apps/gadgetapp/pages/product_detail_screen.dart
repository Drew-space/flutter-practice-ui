// import 'package:flutter/material.dart';
// import 'package:hugeicons/hugeicons.dart';
// import 'package:practice_ui/apps/gadgetapp/utils/product.dart';
// import 'package:practice_ui/apps/whatsapp/pages/hello.dart';

// /// Product Detail Screen
// ///
// /// Layout merges two references:
// /// - Top: full-width swipeable image carousel with dot indicator,
// ///   back button (top-left), share + favourite buttons (top-right).
// ///   [matches reference image 1]
// /// - Detail card: name + price side-by-side, star rating with review
// ///   count, plain description paragraph below.
// ///   [name/price layout from image 1, rating + description style from image 2]
// /// - Bottom bar: "Add to cart" (outlined) + "Buy Now" (filled black).
// ///   [matches reference image 2/3]
// ///
// /// Color selectors, size selectors, and the "Details" expandable
// /// section were intentionally omitted per request. Accent color is
// /// neutral black, not the orange shown in the reference.
// class ProductDetailScreen extends StatefulWidget {
//   final Product product;

//   const ProductDetailScreen({super.key, required this.product});

//   @override
//   State<ProductDetailScreen> createState() => _ProductDetailScreenState();
// }

// class _ProductDetailScreenState extends State<ProductDetailScreen> {
//   final PageController _pageController = PageController();
//   int _currentImageIndex = 0;
//   late bool isFavourite;

//   @override
//   void initState() {
//     super.initState();
//     isFavourite = widget.product.isFavourite;
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   List<String> get _images {
//     // Your Product model only has a single imageUrl, so the carousel
//     // shows that one image. The dot indicator will just render a
//     // single dot. If you later add multiple images to your model,
//     // swap this to return that list instead.
//     return [widget.product.imageUrl];
//   }

//   @override
//   Widget build(BuildContext context) {
//     final p = widget.product;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           // ── IMAGE CAROUSEL ─────────────────────────────────
//           Expanded(
//             flex: 5,
//             child: Stack(
//               children: [
//                 PageView.builder(
//                   controller: _pageController,
//                   itemCount: _images.length,
//                   onPageChanged: (index) {
//                     setState(() => _currentImageIndex = index);
//                   },
//                   itemBuilder: (context, index) {
//                     return Image.network(
//                       _images[index],
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                       loadingBuilder: (context, child, progress) {
//                         if (progress == null) return child;
//                         return Container(
//                           color: const Color(0xFFF5F5F5),
//                           child: const Center(
//                             child: CircularProgressIndicator(strokeWidth: 2),
//                           ),
//                         );
//                       },
//                       errorBuilder: (context, error, stackTrace) => Container(
//                         color: const Color(0xFFF5F5F5),
//                         child: const Center(
//                           child: Icon(
//                             Icons.broken_image_outlined,
//                             color: Colors.grey,
//                             size: 40,
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),

//                 // Back button
//                 SafeArea(
//                   child: Padding(
//                     padding: const EdgeInsets.all(16),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         _CircleIconButton(
//                           icon: HugeIcons.strokeRoundedArrowLeft01,
//                           onTap: () => Navigator.of(context).maybePop(),
//                         ),
//                         Row(
//                           children: [
//                             _CircleIconButton(
//                               icon: HugeIcons.strokeRoundedShare08,
//                               onTap: () {},
//                             ),
//                             const SizedBox(width: 10),
//                             _CircleIconButton(
//                               icon: isFavourite
//                                   ? HugeIcons.strokeRoundedFavourite
//                                   : HugeIcons.strokeRoundedHeartAdd,
//                               iconColor: isFavourite
//                                   ? const Color(0xFFFF5A5F)
//                                   : Colors.black,
//                               onTap: () =>
//                                   setState(() => isFavourite = !isFavourite),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//                 // Dot indicator
//                 Positioned(
//                   bottom: 16,
//                   left: 0,
//                   right: 0,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: List.generate(_images.length, (index) {
//                       final isActive = index == _currentImageIndex;
//                       return AnimatedContainer(
//                         duration: const Duration(milliseconds: 200),
//                         margin: const EdgeInsets.symmetric(horizontal: 3),
//                         width: isActive ? 8 : 6,
//                         height: isActive ? 8 : 6,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: isActive
//                               ? Colors.black
//                               : Colors.black.withOpacity(0.25),
//                         ),
//                       );
//                     }),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // ── DETAIL CARD ─────────────────────────────────────
//           Expanded(
//             flex: 4,
//             child: Container(
//               width: double.infinity,
//               padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(24),
//                   topRight: Radius.circular(24),
//                 ),
//               ),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Name + price row
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: Text(
//                             p.name,
//                             style: const TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 12),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Text(
//                               '\$${p.price.toStringAsFixed(2)}',
//                               style: const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w700,
//                                 color: Colors.black,
//                               ),
//                             ),
//                             if (p.originalPrice != null)
//                               Text(
//                                 '\$${p.originalPrice!.toStringAsFixed(2)}',
//                                 style: TextStyle(
//                                   fontSize: 13,
//                                   color: Colors.grey[400],
//                                   decoration: TextDecoration.lineThrough,
//                                 ),
//                               ),
//                           ],
//                         ),
//                       ],
//                     ),

//                     const SizedBox(height: 8),

//                     // Rating row
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.star_rounded,
//                           size: 18,
//                           color: Colors.amber,
//                         ),
//                         const SizedBox(width: 4),
//                         Text(
//                           p.rating.toStringAsFixed(1),
//                           style: const TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black,
//                           ),
//                         ),
//                         const SizedBox(width: 4),
//                         Text(
//                           '(${p.reviewCount} reviews)',
//                           style: TextStyle(
//                             fontSize: 13,
//                             color: Colors.grey[500],
//                           ),
//                         ),
//                       ],
//                     ),

//                     const SizedBox(height: 14),

//                     // Description (your model doesn't have a separate
//                     // description field, so subtitle is reused here)
//                     Text(
//                       p.subtitle,
//                       style: TextStyle(
//                         fontSize: 14,
//                         height: 1.5,
//                         color: Colors.grey[600],
//                       ),
//                     ),

//                     const SizedBox(height: 90), // space for bottom bar
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: _BottomActionBar(
//         onAddToCart: () {},
//         onBuyNow: () {},
//       ),
//     );
//   }
// }

// // ============================================================
// // CIRCLE ICON BUTTON (back / share / favourite)
// // ============================================================

// class _CircleIconButton extends StatelessWidget {
//   final dynamic icon;
//   final Color iconColor;
//   final VoidCallback onTap;

//   const _CircleIconButton({
//     required this.icon,
//     required this.onTap,
//     this.iconColor = Colors.black,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(20),
//       child: Container(
//         width: 38,
//         height: 38,
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           shape: BoxShape.circle,
//         ),
//         child: Center(
//           child: HugeIcon(icon: icon, color: iconColor, size: 18),
//         ),
//       ),
//     );
//   }
// }

// // ============================================================
// // BOTTOM ACTION BAR ("Add to cart" + "Buy Now")
// // ============================================================

// class _BottomActionBar extends StatelessWidget {
//   final VoidCallback onAddToCart;
//   final VoidCallback onBuyNow;

//   const _BottomActionBar({required this.onAddToCart, required this.onBuyNow});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       top: false,
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
//         child: Row(
//           children: [
//             // Add to cart (outlined)
//             Expanded(
//               child: OutlinedButton(
//                 onPressed: onAddToCart,
//                 style: OutlinedButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   side: const BorderSide(color: Color(0xFFE0E0E0)),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     HugeIcon(
//                       icon: HugeIcons.strokeRoundedShoppingBag02,
//                       color: Colors.black,
//                       size: 18,
//                     ),
//                     const SizedBox(width: 8),
//                     const Text(
//                       'Add to cart',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),

//             // Buy Now (filled)
//             Expanded(
//               child: ElevatedButton(
//                 onPressed: onBuyNow,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.black,
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   elevation: 0,
//                 ),
//                 child: const Text(
//                   'Buy Now',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w600,
//                     fontSize: 14,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:hugeicons/hugeicons.dart';
// import 'package:practice_ui/apps/gadgetapp/utils/product.dart';
// import 'package:practice_ui/apps/gadgetapp/utils/cart_manager.dart';

// /// Product Detail Screen
// ///
// /// Layout merges two references:
// /// - Top: full-width swipeable image carousel with dot indicator,
// ///   back button (top-left), share + favourite buttons (top-right).
// /// - Detail card: name + price side-by-side, star rating with review
// ///   count, plain description paragraph below.
// /// - Bottom bar: "Add to cart" (outlined) + "Buy Now" (filled black).
// ///
// /// Color selectors, size selectors, and the "Details" expandable
// /// section were intentionally omitted per request. Accent color is
// /// neutral black.
// ///
// /// "Add to cart" now actually adds the product to the global
// /// CartManager and shows a confirmation snackbar.
// class ProductDetailScreen extends StatefulWidget {
//   final Product product;

//   const ProductDetailScreen({super.key, required this.product});

//   @override
//   State<ProductDetailScreen> createState() => _ProductDetailScreenState();
// }

// class _ProductDetailScreenState extends State<ProductDetailScreen> {
//   final PageController _pageController = PageController();
//   int _currentImageIndex = 0;
//   late bool isFavourite;

//   @override
//   void initState() {
//     super.initState();
//     isFavourite = widget.product.isFavourite;
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   List<String> get _images {
//     return [widget.product.imageUrl];
//   }

//   void _addToCart() {
//     CartManager.add(widget.product);
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('${widget.product.name} added to cart'),
//         duration: const Duration(seconds: 2),
//         behavior: SnackBarBehavior.floating,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final p = widget.product;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           Expanded(
//             flex: 5,
//             child: Stack(
//               children: [
//                 PageView.builder(
//                   controller: _pageController,
//                   itemCount: _images.length,
//                   onPageChanged: (index) {
//                     setState(() => _currentImageIndex = index);
//                   },
//                   itemBuilder: (context, index) {
//                     return Image.network(
//                       _images[index],
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                       loadingBuilder: (context, child, progress) {
//                         if (progress == null) return child;
//                         return Container(
//                           color: const Color(0xFFF5F5F5),
//                           child: const Center(
//                             child: CircularProgressIndicator(strokeWidth: 2),
//                           ),
//                         );
//                       },
//                       errorBuilder: (context, error, stackTrace) => Container(
//                         color: const Color(0xFFF5F5F5),
//                         child: const Center(
//                           child: Icon(
//                             Icons.broken_image_outlined,
//                             color: Colors.grey,
//                             size: 40,
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//                 SafeArea(
//                   child: Padding(
//                     padding: const EdgeInsets.all(16),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         _CircleIconButton(
//                           icon: HugeIcons.strokeRoundedArrowLeft01,
//                           onTap: () => Navigator.of(context).maybePop(),
//                         ),
//                         Row(
//                           children: [
//                             _CircleIconButton(
//                               icon: HugeIcons.strokeRoundedShare08,
//                               onTap: () {},
//                             ),
//                             const SizedBox(width: 10),
//                             _CircleIconButton(
//                               icon: isFavourite
//                                   ? HugeIcons.strokeRoundedFavourite
//                                   : HugeIcons.strokeRoundedHeartAdd,
//                               iconColor: isFavourite
//                                   ? const Color(0xFFFF5A5F)
//                                   : Colors.black,
//                               onTap: () =>
//                                   setState(() => isFavourite = !isFavourite),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 16,
//                   left: 0,
//                   right: 0,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: List.generate(_images.length, (index) {
//                       final isActive = index == _currentImageIndex;
//                       return AnimatedContainer(
//                         duration: const Duration(milliseconds: 200),
//                         margin: const EdgeInsets.symmetric(horizontal: 3),
//                         width: isActive ? 8 : 6,
//                         height: isActive ? 8 : 6,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: isActive
//                               ? Colors.black
//                               : Colors.black.withOpacity(0.25),
//                         ),
//                       );
//                     }),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             flex: 4,
//             child: Container(
//               width: double.infinity,
//               padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(24),
//                   topRight: Radius.circular(24),
//                 ),
//               ),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: Text(
//                             p.name,
//                             style: const TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 12),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Text(
//                               '\$${p.price.toStringAsFixed(2)}',
//                               style: const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w700,
//                                 color: Colors.black,
//                               ),
//                             ),
//                             if (p.originalPrice != null)
//                               Text(
//                                 '\$${p.originalPrice!.toStringAsFixed(2)}',
//                                 style: TextStyle(
//                                   fontSize: 13,
//                                   color: Colors.grey[400],
//                                   decoration: TextDecoration.lineThrough,
//                                 ),
//                               ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 8),
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.star_rounded,
//                           size: 18,
//                           color: Colors.amber,
//                         ),
//                         const SizedBox(width: 4),
//                         Text(
//                           p.rating.toStringAsFixed(1),
//                           style: const TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black,
//                           ),
//                         ),
//                         const SizedBox(width: 4),
//                         Text(
//                           '(${p.reviewCount} reviews)',
//                           style: TextStyle(
//                             fontSize: 13,
//                             color: Colors.grey[500],
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 14),
//                     Text(
//                       p.subtitle,
//                       style: TextStyle(
//                         fontSize: 14,
//                         height: 1.5,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                     const SizedBox(height: 90),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: _BottomActionBar(
//         onAddToCart: _addToCart,
//         onBuyNow: () {},
//       ),
//     );
//   }
// }

// class _CircleIconButton extends StatelessWidget {
//   final dynamic icon;
//   final Color iconColor;
//   final VoidCallback onTap;

//   const _CircleIconButton({
//     required this.icon,
//     required this.onTap,
//     this.iconColor = Colors.black,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(20),
//       child: Container(
//         width: 38,
//         height: 38,
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           shape: BoxShape.circle,
//         ),
//         child: Center(
//           child: HugeIcon(icon: icon, color: iconColor, size: 18),
//         ),
//       ),
//     );
//   }
// }

// class _BottomActionBar extends StatelessWidget {
//   final VoidCallback onAddToCart;
//   final VoidCallback onBuyNow;

//   const _BottomActionBar({required this.onAddToCart, required this.onBuyNow});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       top: false,
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
//         child: Row(
//           children: [
//             Expanded(
//               child: OutlinedButton(
//                 onPressed: onAddToCart,
//                 style: OutlinedButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   side: const BorderSide(color: Color(0xFFE0E0E0)),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     HugeIcon(
//                       icon: HugeIcons.strokeRoundedShoppingBag02,
//                       color: Colors.black,
//                       size: 18,
//                     ),
//                     const SizedBox(width: 8),
//                     const Text(
//                       'Add to cart',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//             Expanded(
//               child: ElevatedButton(
//                 onPressed: onBuyNow,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.black,
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   elevation: 0,
//                 ),
//                 child: const Text(
//                   'Buy Now',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w600,
//                     fontSize: 14,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:practice_ui/apps/gadgetapp/utils/product.dart';

/// Product Detail Screen
///
/// Layout per latest spec (voice notes, 2026-06-23):
/// - No top app bar, no floating price pill, no floating heart icon.
///   Just a back arrow (top-left) and a share button (top-right),
///   floating directly over the page.
/// - The hero image is the dominant element on the screen: big,
///   sitting a little lower than the very top (not flush against
///   the status bar), taking up most of the visible height.
/// - If the product has more than one image, small thumbnails are
///   shown in a row directly below the hero image to let the user
///   switch between them. If there's only one image, no thumbnail
///   row is shown at all.
/// - Below that: star rating + review count, product name, price
///   (with strikethrough original price if discounted), then a
///   plain description paragraph.
/// - No color selector, no size selector.
/// - Bottom bar: "Add to cart" (outlined) + "Buy Now" (filled black).
class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late List<String> _images;
  late String _selectedImage;

  @override
  void initState() {
    super.initState();
    // imageUrl is always the cover/first image; anything in
    // product.images is shown alongside it as extra thumbnails.
    _images = [
      widget.product.imageUrl,
      ...widget.product.images.where((img) => img != widget.product.imageUrl),
    ];
    _selectedImage = _images.first;
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.product;
    final hasMultipleImages = _images.length > 1;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ── TOP ROW: back arrow + share ───────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _CircleIconButton(
                    icon: HugeIcons.strokeRoundedArrowLeft01,
                    onTap: () => Navigator.of(context).maybePop(),
                  ),
                  _CircleIconButton(
                    icon: HugeIcons.strokeRoundedShare08,
                    onTap: () {},
                  ),
                ],
              ),
            ),

            // ── SCROLLABLE BODY ────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Pushes the hero image down a bit so it doesn't
                    // sit flush under the top row — sits a little
                    // below center-top rather than right at the top.
                    const SizedBox(height: 24),

                    // ── HERO IMAGE ───────────────────────────────
                    Center(
                      child: Container(
                        height: 360,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(
                          _selectedImage,
                          fit: BoxFit.contain,
                          loadingBuilder: (context, child, progress) {
                            if (progress == null) return child;
                            return const Center(
                              child: CircularProgressIndicator(strokeWidth: 2),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) =>
                              const Center(
                                child: Icon(
                                  Icons.broken_image_outlined,
                                  color: Colors.grey,
                                  size: 40,
                                ),
                              ),
                        ),
                      ),
                    ),

                    // ── THUMBNAIL ROW (only if multiple images) ──
                    if (hasMultipleImages) ...[
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 64,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          itemCount: _images.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 10),
                          itemBuilder: (context, index) {
                            final img = _images[index];
                            final isSelected = img == _selectedImage;
                            return GestureDetector(
                              onTap: () => setState(() => _selectedImage = img),
                              child: Container(
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  // border: Border.all(
                                  //   color: isSelected
                                  //       ? Colors.black
                                  //       : const Color(0xFFE0E0E0),
                                  //   width: isSelected ? 2 : 1,
                                  // ),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Image.network(
                                  img,
                                  fit: BoxFit.scaleDown,
                                  errorBuilder: (_, __, ___) => const Icon(
                                    Icons.broken_image_outlined,
                                    color: Colors.grey,
                                    size: 18,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],

                    const SizedBox(height: 24),

                    // ── DETAIL SECTION ────────────────────────────
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Rating row
                          Row(
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                size: 18,
                                color: Colors.amber,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                p.rating.toStringAsFixed(1),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '(${p.reviewCount} reviews)',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          // Name
                          Text(
                            p.name,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),

                          const SizedBox(height: 8),

                          // Price row
                          Row(
                            children: [
                              Text(
                                '\$${p.price.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: p.originalPrice != null
                                      ? const Color(0xFFE0473E)
                                      : Colors.black,
                                ),
                              ),
                              if (p.originalPrice != null) ...[
                                const SizedBox(width: 8),
                                Text(
                                  '\$${p.originalPrice!.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[400],
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ],
                          ),

                          const SizedBox(height: 14),

                          // Description (falls back to subtitle if a
                          // product hasn't got a description set yet)
                          Text(
                            p.description ?? p.subtitle,
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.5,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _BottomActionBar(
        onAddToCart: () {},
        onBuyNow: () {},
      ),
    );
  }
}

// ============================================================
// CIRCLE ICON BUTTON (back / share)
// ============================================================

class _CircleIconButton extends StatelessWidget {
  final dynamic icon;
  final Color iconColor;
  final VoidCallback onTap;

  const _CircleIconButton({
    required this.icon,
    required this.onTap,
    this.iconColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: HugeIcon(icon: icon, color: iconColor, size: 18),
        ),
      ),
    );
  }
}

// ============================================================
// BOTTOM ACTION BAR ("Add to cart" + "Buy Now")
// ============================================================

class _BottomActionBar extends StatelessWidget {
  final VoidCallback onAddToCart;
  final VoidCallback onBuyNow;

  const _BottomActionBar({required this.onAddToCart, required this.onBuyNow});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
        child: Row(
          children: [
            // Add to cart (outlined)
            Expanded(
              child: OutlinedButton(
                onPressed: onAddToCart,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(color: Color(0xFFFF8A00)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedShoppingBag02,
                      color: Color(0xFFFF8A00),
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Add to cart',
                      style: TextStyle(
                        color: Color(0xFFFF8A00),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Buy Now (filled)
            Expanded(
              child: ElevatedButton(
                onPressed: onBuyNow,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF8A00),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Buy Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
