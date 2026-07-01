import 'package:flutter/material.dart';
import 'package:practice_ui/apps/furniture/utils/furniture_header.dart';
import 'package:practice_ui/apps/furniture/utils/new_collection_card.dart';
import 'package:practice_ui/apps/gadgetapp/utils/category_and_arrivals_section.dart';

class FurnitureHomeScreen extends StatelessWidget {
  const FurnitureHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 17),
          child: Column(
            children: [
              FurnitureHeader(),
              SizedBox(height: 20),
              NewCollectionCard(),
              CategoryAndArrivalsSection(),
              // Add your furniture home page content here
            ],
          ),
        ),
      ),
    );
  }
}
