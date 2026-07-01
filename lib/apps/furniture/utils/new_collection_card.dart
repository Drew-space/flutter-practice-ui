import 'package:flutter/material.dart';

const kWhite = Color(0xFFFFFFFF);
const kMaroon = Color(0xFF3D2B27);
const kFontFamily = 'HelveticaNeue';

class NewCollectionCard extends StatelessWidget {
  const NewCollectionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kMaroon,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          // Image sits behind the text, pinned to the right side of the card.
          Positioned(
            right: -10,
            top: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/chair.png',
              height: 160,
              fit: BoxFit.contain,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'New Collection',
                style: TextStyle(
                  fontFamily: kFontFamily,
                  color: kWhite,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(
                width: 190,
                child: Text(
                  'Discover the new collection for minimalist and pure interiors',
                  style: TextStyle(
                    fontFamily: kFontFamily,
                    color: Color(0xFFD9CFCB),
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kWhite,
                  foregroundColor: kMaroon,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 26,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                child: const Text(
                  'Explore',
                  style: TextStyle(
                    fontFamily: kFontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
