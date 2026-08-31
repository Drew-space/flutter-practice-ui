import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_ui/apps/gadgetapp/models/gadget_models.dart';

class CartNotifier extends Notifier<Map<Gadget, int>> {
  @override
  Map<Gadget, int> build() {
    // Cart starts empty
    return {};
  }

  void addProduct(Gadget product) {
    final currentQty = state[product] ?? 0;
    // Copy the map, bump this product's count by 1
    state = {...state, product: currentQty + 1};
  }

  void removeProduct(Gadget product) {
    final currentQty = state[product] ?? 0;
    if (currentQty <= 1) {
      // Last one — remove the entry entirely
      final newState = {...state};
      newState.remove(product);
      state = newState;
    } else {
      state = {...state, product: currentQty - 1};
    }
  }

  void deleteProduct(Gadget product) {
    // Remove regardless of quantity
    final newState = {...state};
    newState.remove(product);
    state = newState;
  }
}

final CartNotifierProvider = NotifierProvider<CartNotifier, Map<Gadget, int>>(
  () {
    return CartNotifier();
  },
);
