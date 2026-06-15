import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class RealExplore extends StatelessWidget {
  const RealExplore({super.key});

  @override
  Widget build(BuildContext context) {
    return const PropertySearchScreen();
  }
}

/// MAIN SCREEN
class PropertySearchScreen extends StatelessWidget {
  const PropertySearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              /// HEADER
              Row(
                children: [
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: const Color(0xffEEF2F6),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(Icons.arrow_back),
                  ),

                  const Expanded(
                    child: Center(
                      child: Text(
                        "Search for Your Ideal Home",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),

                  const NotificationIcon(),
                ],
              ),

              const SizedBox(height: 20),

              /// SEARCH
              Row(children: [const Expanded(child: SearchBarWidget())]),

              const SizedBox(height: 20),

              /// FILTERS
              SizedBox(
                height: 42,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    FilterChipWidget(title: "All", selected: true),
                    FilterChipWidget(title: "House"),
                    FilterChipWidget(title: "Villa"),
                    FilterChipWidget(title: "Apartments"),
                    FilterChipWidget(title: "Office"),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              /// TITLE
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Found 182 Apartments",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ),

              const SizedBox(height: 20),

              /// GRID
              const Expanded(child: RecommendationGrid()),
            ],
          ),
        ),
      ),
    );
  }
}

/// SEARCH BAR (moved from file)
class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Row(
        children: [
          HugeIcon(icon: HugeIcons.strokeRoundedSearch01),
          SizedBox(width: 10),

          Expanded(
            child: Text(
              "Search houses, villas...",
              style: TextStyle(color: Colors.grey),
            ),
          ),

          HugeIcon(icon: HugeIcons.strokeRoundedFilterHorizontal),
        ],
      ),
    );
  }
}

/// NOTIFICATION ICON (moved from file)
class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        color: const Color(0xffEEF2F6),
        borderRadius: BorderRadius.circular(50),
      ),
      child: HugeIcon(icon: HugeIcons.strokeRoundedNotification01),
    );
  }
}

/// GRID
class RecommendationGrid extends StatelessWidget {
  const RecommendationGrid({super.key});

  final List<Map<String, String>> houses = const [
    {
      "image": "https://images.unsplash.com/photo-1505693416388-ac5ce068fe85",
      "title": "La Grand Maison",
      "location": "Tokyo, Japan",
      "price": "\$12219",
    },
    {
      "image": "https://images.unsplash.com/photo-1484154218962-a197022b5858",
      "title": "La Grand Maison",
      "location": "Tokyo, Japan",
      "price": "\$1424",
    },
    {
      "image": "https://images.unsplash.com/photo-1513694203232-719a280e022f",
      "title": "La Grand Maison",
      "location": "Tokyo, Japan",
      "price": "\$17821",
    },
    {
      "image": "https://images.unsplash.com/photo-1502672260266-1c1ef2d93688",
      "title": "La Grand Maison",
      "location": "Tokyo, Japan",
      "price": "\$21469",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: houses.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 18,
        childAspectRatio: .68,
      ),
      itemBuilder: (context, index) {
        final house = houses[index];

        return HouseCard(
          image: house["image"]!,
          title: house["title"]!,
          location: house["location"]!,
          price: house["price"]!,
        );
      },
    );
  }
}

/// HOUSE CARD
class HouseCard extends StatelessWidget {
  final String image;
  final String title;
  final String location;
  final String price;

  const HouseCard({
    super.key,
    required this.image,
    required this.title,
    required this.location,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  image,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 14),
                      SizedBox(width: 4),
                      Text(
                        "4.8",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),

          const SizedBox(height: 4),

          Text(
            location,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
          ),

          const Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: const TextStyle(
                  color: Color(0xff246BFD),
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              Icon(Icons.favorite_border, color: Colors.grey.shade500),
            ],
          ),
        ],
      ),
    );
  }
}

/// FILTER CHIP
class FilterChipWidget extends StatelessWidget {
  final String title;
  final bool selected;

  const FilterChipWidget({
    super.key,
    required this.title,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: selected ? const Color(0xff246BFD) : const Color(0xffEEF2F6),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
