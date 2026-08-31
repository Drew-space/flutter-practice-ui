import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_ui/apps/gadgetapp/models/gadget_models.dart';

class FavouriteNotifier extends Notifier<Set<Gadget>> {
  @override
  Set<Gadget> build() {
    return {};
  }

  void toggleFavourite(Gadget gadget) {
    if (state.contains(gadget)) {
      // already favourited — remove it
      final newState = {...state};
      newState.remove(gadget);
      state = newState;
    } else {
      // not favourited yet — add it
      state = {...state, gadget};
    }
  }
}

final favouriteNotifierProvider =
    NotifierProvider<FavouriteNotifier, Set<Gadget>>(() {
      return FavouriteNotifier();
    });
