import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoriesProvider = Provider<List<String>>((ref) {
  return ["All", "House", "Villa", "Apartments", "Office"];
});

final selectedCategoryProvider = StateProvider<String>((ref) => "All");

/// All houses
final housesProvider = Provider<List<Map<String, String>>>((ref) {
  return [
    {
      "image":
          "https://media.vrbo.com/lodging/93000000/92750000/92749300/92749255/78a6905c.jpg?impolicy=resizecrop&rw=575&rh=575&ra=fill",
      "title": "La Grand Maison",
      "location": "Tokyo, Japan",
      "price": "\$1224",
      "category": "House",
    },
    {
      "image": "https://images.unsplash.com/photo-1484154218962-a197022b5858",
      "title": "Modern Villa",
      "location": "Tokyo, Japan",
      "price": "\$1424",
      "category": "Villa",
    },
    {
      "image": "https://cdn.furnishedhousing.com/property-images/8242683_R.jpg",
      "title": "Sky Apartments",
      "location": "Tokyo, Japan",
      "price": "\$17821",
      "category": "Apartments",
    },
    {
      "image": "https://images.unsplash.com/photo-1502672260266-1c1ef2d93688",
      "title": "Business Office",
      "location": "Tokyo, Japan",
      "price": "\$21469",
      "category": "Office",
    },
    {
      "image":
          "https://paltonmorgan.com/naresus/2023/02/paramount-4-1280x719.jpg",
      "title": "Luxury House",
      "location": "Osaka, Japan",
      "price": "\$4200",
      "category": "House",
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnc1dXL2P0p4-Th64EBakI4UQc0TWV1TTEpVgawnUBegcb9qeiOKxlIN4&s=10",
      "title": "Green Villa",
      "location": "Kyoto, Japan",
      "price": "\$8500",
      "category": "Villa",
    },
  ];
});

final filteredHousesProvider = Provider<List<Map<String, String>>>((ref) {
  final selectedCategory = ref.watch(selectedCategoryProvider);
  final houses = ref.watch(housesProvider);

  if (selectedCategory == "All") {
    return houses;
  }

  return houses
      .where((house) => house["category"] == selectedCategory)
      .toList();
});
