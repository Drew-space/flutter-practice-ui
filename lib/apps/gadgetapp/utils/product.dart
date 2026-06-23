// class Product {
//   final String name;
//   final String subtitle;
//   final double rating;
//   final int reviewCount;
//   final double price;
//   final double? originalPrice;
//   final String imageUrl;
//   final bool isFavourite;

//   const Product({
//     required this.name,
//     required this.subtitle,
//     required this.rating,
//     required this.reviewCount,
//     required this.price,
//     required this.imageUrl,
//     this.originalPrice,
//     this.isFavourite = false,
//   });
// }

class Product {
  final String name;
  final String subtitle;
  final double rating;
  final int reviewCount;
  final double price;
  final double? originalPrice;
  final String imageUrl;
  final bool isFavourite;

  /// Optional extra images for the product detail carousel.
  /// [imageUrl] is always shown first; anything in here is shown
  /// after it. Leave empty/omit for single-image products — the
  /// detail screen will just show the one image with no thumbnail
  /// row.
  final List<String> images;

  /// Longer-form description shown on the product detail screen.
  /// [subtitle] stays as the short tagline used on listing cards
  /// (e.g. "6.9-inch display"). If a product hasn't got a
  /// [description] set, the detail screen falls back to [subtitle]
  /// so nothing breaks.
  final String? description;

  const Product({
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
