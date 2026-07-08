import 'package:flutter/material.dart';
import 'package:practice_ui/apps/cloth_ecom/utils/cloth_ecom_card.dart';
import 'package:practice_ui/apps/cloth_ecom/utils/cloth_ecom_header.dart';
import 'package:practice_ui/apps/cloth_ecom/utils/cloth_ecom_products.dart';
import 'package:practice_ui/apps/cloth_ecom/utils/cloth_ecom_search.dart';

class ClotheEcomHomeScreen extends StatelessWidget {
  const ClotheEcomHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClothEcomHeader(),
              SizedBox(height: 20),
              Text.rich(
                TextSpan(
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    const TextSpan(text: "Shop "),
                    const TextSpan(
                      text: "Fashion",
                      style: TextStyle(color: Color(0xFFF34000)),
                    ),
                    const TextSpan(text: " in the easiest way\nall the time"),
                  ],
                ),
              ),
              SizedBox(height: 20),
              const ClothEcomSearch(),
              SizedBox(height: 20),
              const ClothEcomCard(),
              const ClothEcomProducts(),

              // Add your cloth e-commerce home page content here
              //FurnitureHeader Add your cloth e-commerce home page content here
            ],
          ),
        ),
      ),
    );
  }
}
