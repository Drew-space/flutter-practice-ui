import 'package:flutter_riverpod/flutter_riverpod.dart';

final furnitureCategoriesProvider = StateProvider<List<String>>(
  (ref) => ["All", "Furniture", "Dishes", "Lighting", "Decor"],
);

final furnitureSelectedCategoryProvider = StateProvider<String>((ref) => "All");
