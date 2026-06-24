import 'package:flutter/material.dart';

/// Bottom sheet shown after a successful "Add to cart" tap.
///
/// Slides up from the bottom (handled by [showModalBottomSheet]'s own
/// transition) and the green checkmark badge bounces in on top of that
/// using a spring-like overshoot curve, matching the reference clip.
///
/// Usage:
/// ```dart
/// CartSuccessSheet.show(
///   context,
///   onViewCart: () {
///     Navigator.push(context, MaterialPageRoute(builder: (_) => const GadgetShopScreen()));
///   },
/// );
/// ```
class CartSuccessSheet extends StatefulWidget {
  final VoidCallback? onContinueShopping;
  final VoidCallback? onViewCart;

  const CartSuccessSheet({super.key, this.onContinueShopping, this.onViewCart});

  /// Convenience helper — shows this sheet as a modal bottom sheet.
  static Future<void> show(
    BuildContext context, {
    VoidCallback? onContinueShopping,
    VoidCallback? onViewCart,
  }) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => CartSuccessSheet(
        onContinueShopping: onContinueShopping,
        onViewCart: onViewCart,
      ),
    );
  }

  @override
  State<CartSuccessSheet> createState() => _CartSuccessSheetState();
}

class _CartSuccessSheetState extends State<CartSuccessSheet> {
  static const _orange = Color(0xFFFF8A00);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ── BOUNCING CHECK BADGE ──────────────────────────
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 600),
              curve: Curves.elasticOut,
              builder: (context, value, child) {
                return Transform.scale(scale: value, child: child);
              },
              child: Container(
                width: 72,
                height: 72,
                decoration: const BoxDecoration(
                  color: Color(0xFF34C759),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Successfully Added to Cart',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'The item has been successfully added to your cart',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: Colors.grey[500]),
            ),

            const SizedBox(height: 28),

            // ── CONTINUE SHOPPING (filled orange) ─────────────
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  widget.onContinueShopping?.call();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _orange,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Continue Shopping',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // ── VIEW CART (outlined orange) ────────────────────
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  widget.onViewCart?.call();
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(color: _orange),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'View Cart',
                  style: TextStyle(
                    color: _orange,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
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
