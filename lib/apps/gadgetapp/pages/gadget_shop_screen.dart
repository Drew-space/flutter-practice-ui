import 'package:flutter/material.dart';
import 'package:practice_ui/apps/gadgetapp/utils/product.dart';

/// Pairs a Product with a quantity for the cart, without modifying
/// your existing Product model.
class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});

  double get lineTotal => product.price * quantity;
}

/// Cart screen BODY only — no AppBar (use your existing one).
/// Coupon code section intentionally excluded per request.
class GadgetShopScreen extends StatefulWidget {
  final List<CartItem> cartItems;
  final double shipping;

  const GadgetShopScreen({
    super.key,
    required this.cartItems,
    this.shipping = 75.0,
  });

  @override
  State<GadgetShopScreen> createState() => _GadgetShopScreenState();
}

class _GadgetShopScreenState extends State<GadgetShopScreen> {
  double get _subTotal =>
      widget.cartItems.fold(0.0, (sum, item) => sum + item.lineTotal);

  double get _total => _subTotal + widget.shipping;

  void _increment(CartItem item) {
    setState(() => item.quantity++);
  }

  void _decrement(CartItem item) {
    if (item.quantity <= 1) return;
    setState(() => item.quantity--);
  }

  void _remove(CartItem item) {
    setState(() => widget.cartItems.remove(item));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),

          // ── CART ITEMS LIST ─────────────────────────────────
          Expanded(
            child: widget.cartItems.isEmpty
                ? const Center(
                    child: Text(
                      'Your cart is empty',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : ListView.separated(
                    itemCount: widget.cartItems.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final item = widget.cartItems[index];
                      return _CartItemTile(
                        item: item,
                        onIncrement: () => _increment(item),
                        onDecrement: () => _decrement(item),
                        onRemove: () => _remove(item),
                      );
                    },
                  ),
          ),

          const SizedBox(height: 12),

          // ── SUMMARY ─────────────────────────────────────────
          _SummaryRow(label: 'Sub Total', value: _subTotal),
          const SizedBox(height: 8),
          _SummaryRow(label: 'Shipping', value: widget.shipping),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(height: 1, color: Color(0xFFEDEDED)),
          ),
          _SummaryRow(label: 'Total', value: _total, isTotal: true),

          const SizedBox(height: 16),

          // ── CHECKOUT BUTTON ─────────────────────────────────
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: widget.cartItems.isEmpty ? null : () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5B5FE9),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Proceed to Checkout',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

// ============================================================
// CART ITEM TILE
// ============================================================

class _CartItemTile extends StatelessWidget {
  final CartItem item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;

  const _CartItemTile({
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final p = item.product;

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
          // Thumbnail
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: 56,
              height: 56,
              child: Image.network(
                p.imageUrl,
                fit: BoxFit.cover,
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

          // Name, price, stepper
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        p.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    InkWell(
                      onTap: onRemove,
                      borderRadius: BorderRadius.circular(20),
                      child: const Padding(
                        padding: EdgeInsets.all(4),
                        child: Icon(
                          Icons.delete_outline_rounded,
                          size: 20,
                          color: Color(0xFFFF5A5F),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  '\$${p.price.toStringAsFixed(0)}',
                  style: TextStyle(fontSize: 13, color: Colors.grey[500]),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _StepperButton(icon: Icons.remove, onTap: onDecrement),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        '${item.quantity}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    _StepperButton(icon: Icons.add, onTap: onIncrement),
                    const Spacer(),
                    Text(
                      '\$${item.lineTotal.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF5B5FE9),
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

class _StepperButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _StepperButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          color: const Color(0xFF5B5FE9),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(icon, size: 14, color: Colors.white),
      ),
    );
  }
}

// ============================================================
// SUMMARY ROW (Sub Total / Shipping / Total)
// ============================================================

class _SummaryRow extends StatelessWidget {
  final String label;
  final double value;
  final bool isTotal;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(
      fontSize: isTotal ? 15 : 14,
      fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
      color: isTotal ? Colors.black : Colors.grey[600],
    );
    final valueStyle = TextStyle(
      fontSize: isTotal ? 16 : 14,
      fontWeight: isTotal ? FontWeight.w700 : FontWeight.w600,
      color: Colors.black,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: labelStyle),
        Text('\$${value.toStringAsFixed(0)}', style: valueStyle),
      ],
    );
  }
}
