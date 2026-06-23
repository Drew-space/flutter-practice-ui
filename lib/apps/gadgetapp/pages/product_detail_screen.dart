import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:practice_ui/apps/gadgetapp/utils/product.dart';
import 'package:practice_ui/apps/whatsapp/pages/hello.dart';

/// Product Detail Screen
///
/// Layout merges two references:
/// - Top: full-width swipeable image carousel with dot indicator,
///   back button (top-left), share + favourite buttons (top-right).
///   [matches reference image 1]
/// - Detail card: name + price side-by-side, star rating with review
///   count, plain description paragraph below.
///   [name/price layout from image 1, rating + description style from image 2]
/// - Bottom bar: "Add to cart" (outlined) + "Buy Now" (filled black).
///   [matches reference image 2/3]
///
/// Color selectors, size selectors, and the "Details" expandable
/// section were intentionally omitted per request. Accent color is
/// neutral black, not the orange shown in the reference.
class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final PageController _pageController = PageController();
  int _currentImageIndex = 0;
  late bool isFavourite;

  @override
  void initState() {
    super.initState();
    isFavourite = widget.product.isFavourite;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<String> get _images {
    // Your Product model only has a single imageUrl, so the carousel
    // shows that one image. The dot indicator will just render a
    // single dot. If you later add multiple images to your model,
    // swap this to return that list instead.
    return [widget.product.imageUrl];
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.product;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ── IMAGE CAROUSEL ─────────────────────────────────
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: _images.length,
                  onPageChanged: (index) {
                    setState(() => _currentImageIndex = index);
                  },
                  itemBuilder: (context, index) {
                    return Image.network(
                      _images[index],
                      width: double.infinity,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return Container(
                          color: const Color(0xFFF5F5F5),
                          child: const Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: const Color(0xFFF5F5F5),
                        child: const Center(
                          child: Icon(
                            Icons.broken_image_outlined,
                            color: Colors.grey,
                            size: 40,
                          ),
                        ),
                      ),
                    );
                  },
                ),

                // Back button
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _CircleIconButton(
                          icon: HugeIcons.strokeRoundedArrowLeft01,
                          onTap: () => Navigator.of(context).maybePop(),
                        ),
                        Row(
                          children: [
                            _CircleIconButton(
                              icon: HugeIcons.strokeRoundedShare08,
                              onTap: () {},
                            ),
                            const SizedBox(width: 10),
                            _CircleIconButton(
                              icon: isFavourite
                                  ? HugeIcons.strokeRoundedFavourite
                                  : HugeIcons.strokeRoundedHeartAdd,
                              iconColor: isFavourite
                                  ? const Color(0xFFFF5A5F)
                                  : Colors.black,
                              onTap: () =>
                                  setState(() => isFavourite = !isFavourite),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Dot indicator
                Positioned(
                  bottom: 16,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_images.length, (index) {
                      final isActive = index == _currentImageIndex;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: isActive ? 8 : 6,
                        height: isActive ? 8 : 6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isActive
                              ? Colors.black
                              : Colors.black.withOpacity(0.25),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),

          // ── DETAIL CARD ─────────────────────────────────────
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name + price row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            p.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '\$${p.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            if (p.originalPrice != null)
                              Text(
                                '\$${p.originalPrice!.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey[400],
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

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

                    const SizedBox(height: 14),

                    // Description (your model doesn't have a separate
                    // description field, so subtitle is reused here)
                    Text(
                      p.subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.5,
                        color: Colors.grey[600],
                      ),
                    ),

                    const SizedBox(height: 90), // space for bottom bar
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _BottomActionBar(
        onAddToCart: () {},
        onBuyNow: () {},
      ),
    );
  }
}

// ============================================================
// CIRCLE ICON BUTTON (back / share / favourite)
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
        decoration: const BoxDecoration(
          color: Colors.white,
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
                  side: const BorderSide(color: Color(0xFFE0E0E0)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedShoppingBag02,
                      color: Colors.black,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Add to cart',
                      style: TextStyle(
                        color: Colors.black,
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
                  backgroundColor: Colors.black,
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
