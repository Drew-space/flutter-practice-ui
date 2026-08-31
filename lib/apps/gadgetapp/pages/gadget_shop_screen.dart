import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_ui/apps/gadgetapp/provider/cart_provider.dart';
import 'package:practice_ui/apps/gadgetapp/utils/cart_item_tile.dart';

import 'package:practice_ui/apps/gadgetapp/utils/summary_row.dart';

/// The main Cart screen. Shows AppBar ("Your Cart"), the list of
/// items in the cart, a Total row, and a checkout button.
///
/// This widget itself doesn't know HOW to build a single cart row
/// (that's CartItemTile's job) — it just loops through the cart
/// data and creates one CartItemTile per product.
class GadgetShopScreen extends ConsumerWidget {
  const GadgetShopScreen({super.key});

  @override
  // ConsumerWidget gives us "ref" — the tool we use to read/talk to
  // our Riverpod providers (like CartNotifierProvider).
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch() = "give me the cart data NOW, and rebuild this
    // whole screen automatically whenever the cart changes."
    // cart is a Map<Gadget, int> — Gadget = product, int = quantity.
    final cart = ref.watch(CartNotifierProvider);

    // A Map isn't directly loop-able with ListView, so we convert it
    // to a List of "entries" — each entry.key = the Gadget,
    // each entry.value = the quantity for that Gadget.
    final cartEntries = cart.entries.toList();

    // Add up (price × quantity) for every item to get the grand total.
    final total = cartEntries.fold<double>(
      0.0,
      (sum, entry) => sum + (entry.key.price * entry.value),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Cart',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            // ── CART ITEMS LIST ─────────────────────────────
            Expanded(
              // If the cart has nothing in it, show "Your cart is empty"
              // instead of an empty list.
              child: cartEntries.isEmpty
                  ? const Center(
                      child: Text(
                        'Your cart is empty',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.separated(
                      itemCount: cartEntries.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        // Pick ONE (product, quantity) pair using index
                        final entry = cartEntries[index];
                        final product = entry.key;
                        final quantity = entry.value;

                        // Build ONE row using our separate CartItemTile
                        // widget, passing it the product + quantity +
                        // what should happen on each button tap.
                        return CartItemTile(
                          product: product,
                          quantity: quantity,

                          // ref.read (not watch!) because we only want
                          // to CALL a method here, not rebuild this
                          // whole screen just from writing this line.
                          onIncrement: () => ref
                              .read(CartNotifierProvider.notifier)
                              .addProduct(product),
                          onDecrement: () => ref
                              .read(CartNotifierProvider.notifier)
                              .removeProduct(product),
                          onRemove: () => ref
                              .read(CartNotifierProvider.notifier)
                              .deleteProduct(product),
                        );
                      },
                    ),
            ),

            const SizedBox(height: 12),

            // ── TOTAL ──────────────────────────────────────
            SummaryRow(label: 'Total', value: total, isTotal: true),

            const SizedBox(height: 16),

            // ── CHECKOUT BUTTON ──────────────────────────────
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                // Disabled (greyed out, does nothing) if cart is empty
                onPressed: cartEntries.isEmpty ? null : () {},
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
      ),
    );
  }
}
