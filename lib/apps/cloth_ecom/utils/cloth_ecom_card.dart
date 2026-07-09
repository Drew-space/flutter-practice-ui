import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CollectionCardData {
  final String title;
  final String subtitle;
  final Color cardColor;
  final Color ringColor; // Optional ring color for the first card
  final String imagePath;

  const CollectionCardData({
    required this.title,
    required this.subtitle,
    required this.cardColor,
    required this.ringColor,
    required this.imagePath,
  });
}

const List<CollectionCardData> _collectionCards = [
  CollectionCardData(
    title: "New Collections\nAvailable",
    subtitle: "50% Discount for the\nfirst transaction.",
    cardColor: Color(0xFFF34000),
    ringColor: Color(0xFFF76733),
    imagePath: "assets/images/shoe.png",
  ),
  CollectionCardData(
    title: "New Arrivals\nThis Week",
    subtitle: "30% Discount on\nselected jackets.",
    cardColor: Color(0xFF8B7FE8),
    ringColor: Color(0xFFBC95FF),
    imagePath: "assets/images/sundress2.png",
  ),
  CollectionCardData(
    title: "Limited Edition\nBags",
    subtitle: "Free shipping on\nyour first order.",
    cardColor: Color(0xFF34B653),
    ringColor: Color(0xFF6FCF97),
    imagePath: "assets/images/hoodie.png",
  ),
];

class ClothEcomCard extends StatefulWidget {
  const ClothEcomCard({super.key});

  @override
  State<ClothEcomCard> createState() => _ClothEcomCardState();
}

class _ClothEcomCardState extends State<ClothEcomCard> {
  final PageController _pageController = PageController(viewportFraction: 0.84);
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 170,
          child: PageView.builder(
            padEnds: false,
            controller: _pageController,
            itemCount: _collectionCards.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final data = _collectionCards[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                ), // was 6, tighter gap
                child: _CollectionCard(data: data),
              );
            },
          ),
        ),
        const SizedBox(height: 14),
        SmoothPageIndicator(
          controller: _pageController,
          count: _collectionCards.length,
          onDotClicked: (index) {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeInOut,
            );
          },
          effect: ExpandingDotsEffect(
            activeDotColor: const Color(0xFFF34000),
            dotColor: const Color(0xFFD9D9D9),
            dotHeight: 8,
            dotWidth: 8,
            expansionFactor: 3,
            spacing: 6,
          ),
        ),
      ],
    );
  }
}

class _CollectionCard extends StatelessWidget {
  final CollectionCardData data;

  const _CollectionCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: data.cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      // No padding here anymore — this is what was clipping the rings.
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            Positioned(
              left: -30,
              top: -30,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: data.ringColor, width: 15),
                ),
              ),
            ),
            Positioned(
              right: -30,
              bottom: -30,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: data.ringColor, width: 15),
                ),
              ),
            ),
            Positioned(
              right: 5,
              bottom: -10,
              child: Image.asset(
                data.imagePath,
                height: 130,
                fit: BoxFit.contain,
              ),
            ),
            // Only the text/button content gets the inner padding now.
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 17),
                  SizedBox(
                    width: 160,
                    child: Text(
                      data.subtitle,
                      style: const TextStyle(
                        color: Color(0xFFF5E9E4),
                        fontSize: 11.5,
                        height: 1.25,
                      ),
                    ),
                  ),
                  const SizedBox(height: 17),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: data.cardColor,
                      elevation: 0,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 6,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: const Text(
                      "Shop now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
