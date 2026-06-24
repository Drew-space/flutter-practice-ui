import 'package:flutter/material.dart';
import 'package:practice_ui/apps/gadgetapp/utils/category_model.dart';
import 'package:practice_ui/apps/gadgetapp/utils/countdown_badge.dart';
import 'package:practice_ui/apps/gadgetapp/utils/gadget_options.dart';
import 'package:practice_ui/apps/gadgetapp/utils/product_card.dart';
import 'package:practice_ui/apps/gadgetapp/utils/product_data.dart';
import 'package:practice_ui/apps/gadgetapp/utils/view_all_button.dart';

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
                  CountdownBadge(),
                ],
              ),
              const ViewAllButton(),
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
                child: ProductCard(product: product),
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
              ViewAllButton(),
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
            return ProductCard(product: product);
          },
        ),

        const SizedBox(height: 24),
      ],
    );
  }
}
