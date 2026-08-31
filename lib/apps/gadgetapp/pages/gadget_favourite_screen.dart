import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_ui/apps/gadgetapp/provider/favourite_provider.dart';
import 'package:practice_ui/apps/gadgetapp/utils/product_card.dart';

/// Shows every gadget the user has favourited, in a 2-column grid —
/// same card style used on the Home screen (ProductCard), so the
/// look stays consistent across the app.
class GadgetFavouriteScreen extends ConsumerWidget {
  const GadgetFavouriteScreen({super.key});

  @override
  // ConsumerWidget gives us "ref" so we can read favouriteNotifierProvider.
  // We don't need setState here since there's no local UI state —
  // Riverpod handles all the state (the Set of favourited gadgets).
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch() = read the current favourites, and rebuild this
    // screen automatically whenever the Set changes (add/remove).
    final favourites = ref.watch(favouriteNotifierProvider);

    // Convert the Set to a List so GridView.builder can use an index
    // to pick items one by one (Sets don't support indexing directly).
    final favouritesList = favourites.toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Favourites',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),

      // If there are no favourites yet, show a friendly empty state
      // instead of a blank grid.
      body: favouritesList.isEmpty
          ? const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.favorite_border, size: 48, color: Colors.grey),
                  SizedBox(height: 12),
                  Text(
                    'No favourites yet',
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Tap the heart on any product to save it here',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: favouritesList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.68,
              ),
              itemBuilder: (context, index) {
                // Pick ONE gadget using the index, same pattern as
                // every other GridView we've built in this app.
                final gadget = favouritesList[index];

                // Reuse the SAME ProductCard widget used on Home —
                // this is exactly why we made it accept a "product"
                // parameter instead of hardcoding data inside it.
                return ProductCard(product: gadget);
              },
            ),
    );
  }
}
