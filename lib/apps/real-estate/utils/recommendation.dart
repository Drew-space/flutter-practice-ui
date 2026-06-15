import 'package:flutter/material.dart';

class Recommendation extends StatelessWidget {
  const Recommendation({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ["All", "House", "Villa", "Apartments", "Office"];

    final houses = [
      {
        "image": "https://images.unsplash.com/photo-1505693416388-ac5ce068fe85",
        "title": "La Grand Maison",
        "location": "Tokyo, Japan",
        "price": "\$1224",
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Our Recommendation",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "See All",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        /// Categories
        SizedBox(
          height: 42,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final isSelected = index == 0;

              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : const Color(0xffEEF2F6),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  categories[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 20),

        /// Grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: houses.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 0.68,
          ),
          itemBuilder: (context, index) {
            final house = houses[index];

            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.05),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Image
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          house["image"]!,
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.star, color: Colors.orange, size: 14),
                              SizedBox(width: 4),
                              Text(
                                "4.8",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
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
                    house["title"]!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    house["location"]!,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        house["price"]!,
                        style: const TextStyle(
                          color: Colors.blue,
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
          },
        ),
      ],
    );
  }
}
