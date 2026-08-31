import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:practice_ui/apps/gadgetapp/models/gadget_models.dart';
import 'package:practice_ui/apps/gadgetapp/utils/stepper_button.dart';

/// Represents ONE product row inside the cart list.
/// Shows: thumbnail image, product name, delete icon, price,
/// quantity stepper (-  2  +), and the line total (price × quantity).
///
/// This widget does NOT talk to Riverpod or the cart provider directly.
/// It just DISPLAYS data it's given, and reports taps back up
/// through the onIncrement/onDecrement/onRemove callbacks.
/// This makes it reusable and easy to test on its own.
class CartItemTile extends StatelessWidget {
  final Gadget product; // the product being shown
  final int quantity; // how many of this product are in the cart

  // These three are "callback functions" — meaning THIS widget doesn't
  // decide what happens when you tap +, -, or delete. It just calls
  // whatever function the PARENT widget gave it. This keeps this
  // widget "dumb" (display-only) and lets the parent screen handle
  // the actual cart logic.
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;

  const CartItemTile({
    super.key,
    required this.product,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate this item's line total: e.g. $50 × 3 = $150
    final lineTotal = product.price * quantity;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFEDEDED)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── PRODUCT THUMBNAIL IMAGE ─────────────────────
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: 56,
              height: 56,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
                // If the image fails to load, show a broken-image icon
                // instead of crashing or showing a blank box.
                errorBuilder: (_, __, ___) => Container(
                  color: const Color(0xFFF7F7F7),
                  child: const Icon(
                    Icons.broken_image_outlined,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // ── NAME, PRICE, STEPPER (everything to the right of image) ──
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top row: product name (left) + delete icon (right)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis, // "..." if too long
                      ),
                    ),
                    // Delete/trash icon — tapping it calls onRemove()
                    InkWell(
                      onTap: onRemove,
                      borderRadius: BorderRadius.circular(20),
                      child: const Padding(
                        padding: EdgeInsets.all(4),
                        child: HugeIcon(
                          icon: HugeIcons.strokeRoundedDelete02,
                          size: 20,
                          color: Color(0xFFFF5A5F), // red
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),

                // Single unit price, e.g. "$50"
                Text(
                  '\$${product.price.toStringAsFixed(0)}',
                  style: TextStyle(fontSize: 13, color: Colors.grey[500]),
                ),
                const SizedBox(height: 8),

                // Bottom row: - button, quantity number, + button,
                // then the line total pushed all the way right
                Row(
                  children: [
                    // "-" button — tapping it calls onDecrement()
                    StepperButton(icon: Icons.remove, onTap: onDecrement),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        '$quantity', // shows the current quantity number
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    // "+" button — tapping it calls onIncrement()
                    StepperButton(icon: Icons.add, onTap: onIncrement),

                    // Spacer pushes everything after it to the far right
                    const Spacer(),

                    // Line total, e.g. "$150" (price × quantity)
                    Text(
                      '\$${lineTotal.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFEC7018),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
