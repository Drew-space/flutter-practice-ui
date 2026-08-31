class Gadget {
  final String name;
  final String subtitle;
  final double rating;
  final int reviewCount;
  final double price;
  final double? originalPrice;
  final String imageUrl;
  final bool isFavourite;
  final List<String> images;
  final String? description;

  const Gadget({
    required this.name,
    required this.subtitle,
    required this.rating,
    required this.reviewCount,
    required this.price,
    required this.imageUrl,
    this.originalPrice,
    this.isFavourite = false,
    this.images = const [],
    this.description,
  });
}
