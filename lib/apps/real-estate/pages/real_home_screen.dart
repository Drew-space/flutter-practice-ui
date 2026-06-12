import 'package:flutter/material.dart';
import 'package:practice_ui/apps/real-estate/utils/featured_house_carousel.dart';
import 'package:practice_ui/apps/real-estate/utils/real_searchbar.dart';
import 'package:practice_ui/apps/real-estate/utils/real_userprofile_row.dart';

class RealHomeScreen extends StatelessWidget {
  const RealHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const RealUserprofileRow(),

                    const SizedBox(height: 16),

                    const RealSearchbar(),

                    const SizedBox(height: 30),

                    Row(
                      children: const [
                        Expanded(
                          child: Text(
                            "Featured Houses",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Text("See all", style: TextStyle(color: Colors.blue)),
                      ],
                    ),

                    const SizedBox(height: 20),

                    const FeaturedHouseCarousel(),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
