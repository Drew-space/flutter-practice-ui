import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_ui/apps/gadgetapp/models/gadget_models.dart';
import 'package:practice_ui/apps/gadgetapp/pages/product_detail_screen.dart';
import 'package:practice_ui/apps/gadgetapp/provider/favourite_provider.dart';
import 'package:intl/intl.dart';

/// Reusable product card — used in the Flash Sales horizontal row,
/// the Popular Products 2-column grid, and the Favourites screen.
///
/// This is now a ConsumerWidget because the heart icon needs to
/// read AND update favouriteNotifierProvider directly.
class ProductCard extends ConsumerWidget {
  const ProductCard({super.key, required this.product});

  final Gadget product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the favourites Set so this card rebuilds (heart icon
    // flips) whenever this product is added/removed from favourites.
    final favourites = ref.watch(favouriteNotifierProvider);

    // Instead of the old fixed "product.isFavourite" field, we check
    // the LIVE state — is this product currently inside the Set?
    final isFavourite = favourites.contains(product);
    final formatter = NumberFormat('#,##0.00');
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image + favourite heart
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox(
                      width: double.infinity,
                      child: Image.network(
                        product.imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;
                          return Container(
                            color: const Color(0xFFF7F7F7),
                            child: const Center(
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: const Color(0xFFF7F7F7),
                          child: const Icon(
                            Icons.broken_image_outlined,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: InkWell(
                      // Tapping the heart now actually DOES something:
                      // it calls toggleFavourite, which adds this
                      // product to favourites if it's not there, or
                      // removes it if it already is.
                      onTap: () {
                        ref
                            .read(favouriteNotifierProvider.notifier)
                            .toggleFavourite(product);
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Icon(
                          // Now driven by the LIVE isFavourite value,
                          // not the old static product.isFavourite field.
                          isFavourite ? Icons.favorite : Icons.favorite_border,
                          size: 20,
                          color: isFavourite
                              ? const Color(0xFFFF5A5F)
                              : const Color(0xFF8A8A8A),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // Name
            Text(
              product.name,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),

            // Subtitle
            Text(
              product.subtitle,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),

            // Rating
            Row(
              children: [
                Text(
                  product.rating.toStringAsFixed(1),
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.star_rounded, size: 14, color: Colors.amber),
                const SizedBox(width: 4),
                Text(
                  '(${product.reviewCount})',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
            const SizedBox(height: 4),

            // Price row
            Row(
              children: [
                Text(
                  '\$${formatter.format(product.price)}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (product.originalPrice != null) ...[
                  const SizedBox(width: 6),
                  Text(
                    '\$${formatter.format(product.originalPrice!)}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[400],
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
