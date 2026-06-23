import 'dart:async';
import 'package:flutter/material.dart';
import 'package:practice_ui/apps/gadgetapp/pages/product_detail_screen.dart';
import 'package:practice_ui/apps/gadgetapp/utils/category_model.dart';
import 'package:practice_ui/apps/gadgetapp/utils/gadget_options.dart';
import 'package:practice_ui/apps/gadgetapp/utils/product.dart';

class GadgetProducts extends StatelessWidget {
  final List<CategoryModel> options = [
    CategoryModel(
      name: "iPhone",
      imageUrl: "https://i.ebayimg.com/images/g/668AAeSwTzto6q1i/s-l1600.webp",
    ),
    CategoryModel(
      name: "Laptop",
      imageUrl: "https://i.ebayimg.com/images/g/5VUAAeSwc-tppi6V/s-l1600.webp",
    ),
    CategoryModel(
      name: "Watch",
      imageUrl:
          "https://www.apple.com/v/apple-watch-series-11/c/images/overview/contrast/contrast_s11__dkui1dgfuwcy_large_2x.png",
    ),
    CategoryModel(
      name: "Airpod",
      imageUrl:
          "https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/airpods-4-select-202409_FV1?wid=976&hei=916&fmt=jpeg&qlt=90&.v=WnVKRVRUTFVsYThXaWkydWViL1Q3ZDZGTE9TV3RDcGJJclBqdUtzdTJYYjNHc3NlSmU2dzJyR1kxZEwyTE1neUJkRlpCNVhYU3AwTldRQldlSnpRa0NZZXAxWFNjRXhITDI1RVE5YVpyU0E",
    ),
    CategoryModel(
      name: "Headset",
      imageUrl:
          "https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/airpods-max-hero-select-202409?wid=976&hei=916&fmt=jpeg&qlt=90&.v=WXBZVEZCOUNiUWlBYUtjZmtBc0J2N1V1ZldxRmdZVjlvL2IxaEY3dzY3SG0ybW5TK3prTnlNTURRc1V2clYydHZvdUZlR0V0VUdJSjBWaDVNVG95YkJTUUExTVpiaXRIUnFOM1YxY0hPWFU",
    ),
  ];

  final List<Product> flashSaleProducts = [
    Product(
      name: 'iPhone 16 Pro',
      subtitle: '128GB Natural Titanium',
      rating: 4.6,
      reviewCount: 78,
      price: 899.00,
      originalPrice: 950.00,
      imageUrl:
          'https://canoonstore.com/wp-content/uploads/2024/11/Iphone-16-pro-NT.webp',
      isFavourite: true,
    ),

    Product(
      name: 'MacBook Pro M1',
      subtitle: '256GB Natural Silver',
      rating: 4.6,
      reviewCount: 78,
      price: 1119.00,
      originalPrice: 1250.00,
      imageUrl:
          'https://www.amaget.com/wp-content/uploads/2022/07/macbook.webp',
    ),
    Product(
      name: 'AirPods Pro 3',
      subtitle: 'Active Noise Cancellation',
      rating: 4.6,
      reviewCount: 78,
      price: 249.00,
      originalPrice: 460.00,
      imageUrl:
          'https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/airpods-pro-3-hero-select-202509?wid=976&hei=916&fmt=jpeg&qlt=90&.v=cmp4MmZ6OWxOeHNNTXh4SzlBNUpEb1RucE9zZTI5eEREaWZpY29lSld3eWVDYXovZDMyN1dXU211bjZoVlVUcWJGcXNRQnFCV0w3WVRjTExvdm1ic1YxRUxFRmRlWDBITzhnRmZ5OTRmaVdKTExiOEFsRmxtQ2Nua0tRSC83MkI',
    ),
  ];

  /// Popular / best-selling products.
  final List<Product> popularProducts = [
    Product(
      name: 'iPhone 17 Pro Max',
      subtitle: '6.9-inch display',
      rating: 4.6,
      reviewCount: 78,
      price: 1199.00,
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSTOzCcoUr7gHnEITFDMdRDKKYVveu02dFPiv4nTdd9952JGdtPKoZF0I&s=10",
    ),

    Product(
      name: 'Sony WH-1000MP3',
      subtitle: 'Gaming Headset Pro',
      rating: 4.6,
      reviewCount: 78,
      price: 249.00,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQULwLHBRQic4DOGN_xqqzI3l1AjQilI92WcS9FhZB2OA&s=10',
    ),
    Product(
      name: 'Apple Watch',
      subtitle: 'Water resistance 45mm',
      rating: 4.6,
      reviewCount: 78,
      price: 399.00,
      imageUrl:
          'https://images.unsplash.com/photo-1551816230-ef5deaed4a26?w=600&auto=format&fit=crop&q=80',
      isFavourite: true,
    ),
    Product(
      name: 'AirPods Pro 3',
      subtitle: 'Active Noise Cancellation',
      rating: 4.6,
      reviewCount: 78,
      price: 249.00,

      imageUrl:
          'https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/airpods-pro-3-hero-select-202509?wid=976&hei=916&fmt=jpeg&qlt=90&.v=cmp4MmZ6OWxOeHNNTXh4SzlBNUpEb1RucE9zZTI5eEREaWZpY29lSld3eWVDYXovZDMyN1dXU211bjZoVlVUcWJGcXNRQnFCV0w3WVRjTExvdm1ic1YxRUxFRmRlWDBITzhnRmZ5OTRmaVdKTExiOEFsRmxtQ2Nua0tRSC83MkI',
      isFavourite: true,
    ),
    Product(
      name: 'AirPods Max 2',
      subtitle: 'Active Noise Cancellation',
      rating: 4.6,
      reviewCount: 78,
      price: 549.00,

      imageUrl:
          "https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/airpods-max-compare-202409?wid=420&hei=500&fmt=jpeg&qlt=90&.v=MGJ3WGNoS1hJZng5ZTNiUkNNckE1WUNLYUZJYzNlb2M5YWlUSmxDUFM0VU1zMnAyYWJvaWNXR0hyZHB2dmJDMmdsbGZlRHV0Q3JlbHJxWXRlWjZpMnFLMWZobVVoS25GeGxET3FhTGFDUFE",
      isFavourite: true,
    ),
    Product(
      name: 'Apple Watch Ultra 3',
      subtitle: '40hrs Battery life',
      rating: 4.6,
      reviewCount: 78,
      price: 549.00,

      imageUrl:
          "https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/watch-card-40-hermes-ultra-202603?wid=680&hei=528&fmt=p-jpg&qlt=95&.v=Ly93VWF6a1dGOWJLL3RMM0s0eGZ6dkxrL1JtTWVkTlZHZC94N3hJUktvSGZPOGdzbXFQKzNyOVN3L2NRSHJCNStFVlF6ZkRtZVJkbnBuR0wwNDgvSm1sYzVYYlU2dmpTclpCc0EvbDhhcVJKWTVCVjAxTmRTUFh4NVVLRDdSSEc",
      isFavourite: true,
    ),
  ];

  GadgetProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── CATEGORY ROW ──────────────────────────────────────
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: options.length,
            itemBuilder: (context, index) {
              final option = options[index];
              return GadgetOptions(
                title: option.name,
                imageUrl: option.imageUrl,
              );
            },
          ),
        ),

        const SizedBox(height: 20),

        // ── FLASH SALES (HORIZONTAL SCROLL) ───────────────────
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Text(
                    "Flash Sales",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8),
                  _CountdownBadge(),
                ],
              ),
              const _ViewAllButton(),
            ],
          ),
        ),

        const SizedBox(height: 12),

        SizedBox(
          height: 260,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: flashSaleProducts.length,
            itemBuilder: (context, index) {
              final product = flashSaleProducts[index];
              return Container(
                width: 180,
                margin: const EdgeInsets.only(left: 16),
                child: _ProductCard(product: product),
              );
            },
          ),
        ),

        const SizedBox(height: 24),

        // ── POPULAR PRODUCTS (VERTICAL GRID, 2 COLUMNS) ───────
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Popular Products",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              _ViewAllButton(),
            ],
          ),
        ),

        const SizedBox(height: 12),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: popularProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.68,
          ),
          itemBuilder: (context, index) {
            final product = popularProducts[index];
            return _ProductCard(product: product);
          },
        ),

        const SizedBox(height: 24),
      ],
    );
  }
}

// ============================================================
// REUSABLE PRODUCT CARD (used by both flash sale + popular grid)
// ============================================================

class _ProductCard extends StatefulWidget {
  final Product product;

  const _ProductCard({required this.product});

  @override
  State<_ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<_ProductCard> {
  late bool isFavourite;

  @override
  void initState() {
    super.initState();
    isFavourite = widget.product.isFavourite;
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.product;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ProductDetailScreen(product: p)),
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
                        p.imageUrl,
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
                      onTap: () => setState(() => isFavourite = !isFavourite),
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Icon(
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
              p.name,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),

            // Subtitle
            Text(
              p.subtitle,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),

            // Rating
            Row(
              children: [
                Text(
                  p.rating.toStringAsFixed(1),
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.star_rounded, size: 14, color: Colors.amber),
                const SizedBox(width: 4),
                Text(
                  '(${p.reviewCount})',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
            const SizedBox(height: 4),

            // Price row
            Row(
              children: [
                Text(
                  '\$${p.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (p.originalPrice != null) ...[
                  const SizedBox(width: 6),
                  Text(
                    '\$${p.originalPrice!.toStringAsFixed(2)}',
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

// ============================================================
// COUNTDOWN BADGE (next to "Flash Sales")
// ============================================================

class _CountdownBadge extends StatefulWidget {
  const _CountdownBadge();

  @override
  State<_CountdownBadge> createState() => _CountdownBadgeState();
}

class _CountdownBadgeState extends State<_CountdownBadge> {
  Duration _remaining = const Duration(hours: 2, minutes: 46, seconds: 23);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_remaining.inSeconds <= 0) {
        _timer?.cancel();
        return;
      }
      setState(() => _remaining -= const Duration(seconds: 1));
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _two(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    final h = _two(_remaining.inHours);
    final m = _two(_remaining.inMinutes.remainder(60));
    final s = _two(_remaining.inSeconds.remainder(60));

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFFFF3B30),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        '$h:$m:$s',
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}

// ============================================================
// "VIEW ALL >" LINK
// ============================================================

class _ViewAllButton extends StatelessWidget {
  const _ViewAllButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const Row(
        children: [
          Text(
            'View All',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFFFF8A00),
            ),
          ),
          SizedBox(width: 2),
          Icon(Icons.chevron_right, size: 16, color: Color(0xFFFF8A00)),
        ],
      ),
    );
  }
}
