import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CollectionCardData {
  final String title;
  final String subtitle;
  final Color cardColor;
  final String imagePath;

  const CollectionCardData({
    required this.title,
    required this.subtitle,
    required this.cardColor,
    required this.imagePath,
  });
}

const List<CollectionCardData> _collectionCards = [
  CollectionCardData(
    title: "New Collections\nAvailable",
    subtitle: "50% Discount for the\nfirst transaction.",
    cardColor: Color(0xFFF34000),
    imagePath: "assets/images/shoe.png",
  ),
  CollectionCardData(
    title: "New Arrivals\nThis Week",
    subtitle: "30% Discount on\nselected jackets.",
    cardColor: Color(0xFF8B7FE8),
    imagePath: "assets/images/sundress2.png",
  ),
  CollectionCardData(
    title: "Limited Edition\nBags",
    subtitle: "Free shipping on\nyour first order.",
    cardColor: Color(0xFF34B653),
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
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: data.cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: 5,
            bottom: -10,
            child: Image.asset(
              data.imagePath,
              height: 130, // was 150 — a bit smaller to match the tighter card
              fit: BoxFit.contain,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // was 0, added some spacing at the top
              Text(
                data.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17, // was 20
                  fontWeight: FontWeight.bold,
                  height: 1.1, // was 1.2
                ),
              ),
              const SizedBox(height: 17), // was 11
              SizedBox(
                width: 160, // was 170
                child: Text(
                  data.subtitle,
                  style: const TextStyle(
                    color: Color(0xFFF5E9E4),
                    fontSize: 11.5, // was 13
                    height: 1.25, // was 1.4
                  ),
                ),
              ),
              const SizedBox(height: 17), // was 20
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: data.cardColor,
                  elevation: 0,
                  minimumSize:
                      Size.zero, // lets the button shrink below default min
                  tapTargetSize: MaterialTapTargetSize
                      .shrinkWrap, // removes extra invisible padding
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 6, // was 10
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                child: const Text(
                  "Shop now",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
