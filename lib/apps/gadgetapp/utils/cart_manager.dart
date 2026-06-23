import 'package:flutter/foundation.dart';
import 'package:practice_ui/apps/gadgetapp/utils/product.dart';

/// Pairs a Product with a quantity for the cart, without modifying
/// your existing Product model.
class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});

  double get lineTotal => product.price * quantity;
}

/// Simple static/global cart store — no external package needed.
///
/// `items` is wrapped in a ValueNotifier so any widget can listen
/// for changes (add/remove/quantity update) and rebuild automatically
/// via ValueListenableBuilder, without manual setState plumbing
/// across different screens/files.
class CartManager {
  CartManager._(); // not meant to be instantiated

  static final ValueNotifier<List<CartItem>> items =
      ValueNotifier<List<CartItem>>([]);

  /// Adds a product to the cart. If it's already in the cart,
  /// increments its quantity instead of adding a duplicate row.
  static void add(Product product) {
    final list = items.value;
    final existingIndex = list.indexWhere((item) => item.product == product);

    if (existingIndex != -1) {
      list[existingIndex].quantity++;
    } else {
      list.add(CartItem(product: product));
    }

    // Reassigning triggers the ValueNotifier's listeners.
    items.value = List.of(list);
  }

  static void increment(CartItem item) {
    item.quantity++;
    items.value = List.of(items.value);
  }

  static void decrement(CartItem item) {
    if (item.quantity <= 1) return;
    item.quantity--;
    items.value = List.of(items.value);
  }

  static void remove(CartItem item) {
    final list = List.of(items.value)..remove(item);
    items.value = list;
  }

  static void clear() {
    items.value = [];
  }

  static double get subTotal =>
      items.value.fold(0.0, (sum, item) => sum + item.lineTotal);
}
