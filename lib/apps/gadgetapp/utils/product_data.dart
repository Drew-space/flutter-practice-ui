import 'package:practice_ui/apps/gadgetapp/utils/product.dart';

/// Flash sale products shown in the horizontal-scroll row.
final List<Product> flashSaleProducts = [
  Product(
    name: 'iPhone 16 Pro',
    subtitle: '128GB Natural Titanium',
    rating: 4.6,
    reviewCount: 78,
    price: 899.00,
    originalPrice: 950.00,
    imageUrl:
        'https://canoonstore.com/wp-content/uploads/2024/11/Iphone-16-pro-NT.webp',
    isFavourite: true,
  ),

  Product(
    name: 'MacBook Pro M1',
    subtitle: '256GB Natural Silver',
    rating: 4.6,
    reviewCount: 78,
    price: 1119.00,
    originalPrice: 1250.00,
    imageUrl: 'https://www.amaget.com/wp-content/uploads/2022/07/macbook.webp',
  ),
  Product(
    name: 'AirPods Pro 3',
    subtitle: 'Active Noise Cancellation',
    rating: 4.6,
    reviewCount: 78,
    price: 249.00,
    originalPrice: 460.00,
    imageUrl:
        'https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/airpods-pro-3-hero-select-202509?wid=976&hei=916&fmt=jpeg&qlt=90&.v=cmp4MmZ6OWxOeHNNTXh4SzlBNUpEb1RucE9zZTI5eEREaWZpY29lSld3eWVDYXovZDMyN1dXU211bjZoVlVUcWJGcXNRQnFCV0w3WVRjTExvdm1ic1YxRUxFRmRlWDBITzhnRmZ5OTRmaVdKTExiOEFsRmxtQ2Nua0tRSC83MkI',
  ),
];

/// Popular / best-selling products shown in the 2-column grid.
final List<Product> popularProducts = [
  Product(
    name: 'iPhone 17 Pro Max',
    subtitle: '6.9-inch display',
    rating: 4.6,
    reviewCount: 78,
    price: 1199.00,
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSTOzCcoUr7gHnEITFDMdRDKKYVveu02dFPiv4nTdd9952JGdtPKoZF0I&s=10",
    description:
        'The biggest, brightest iPhone display yet, paired with the new '
        'A-series chip for all-day performance. Built with a titanium '
        'frame and a pro camera system that shoots stunning photos and '
        'video in any light.',
    images: [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXl_1fOHpAuk2IGpWvYydFeTdtaWpG6es7TMrAOeiy2CDzxYDyJ9201WTK&s=10",
      "https://cdsassets.apple.com/live/7WUAS350/images/tech-specs/iphone-17-pro-17-pro-max-hero.png",
    ],
  ),

  Product(
    name: 'MacBook Pro M1',
    subtitle: '256GB Natural Silver',
    rating: 4.6,
    reviewCount: 78,
    price: 1119.00,
    description:
        'The Apple M1 MacBook Pro delivers exceptional performance with '
        'Apple’s powerful M1 chip, offering blazing-fast speed, incredible '
        'battery life, and smooth multitasking. Featuring a stunning Retina '
        'display, premium aluminum design, and advanced thermal efficiency, '
        'it is built for developers, creators, and professionals who need '
        'reliable performance for demanding workloads every day.',
    originalPrice: 1250.00,
    images: [
      "https://www.amaget.com/wp-content/uploads/2022/07/macbook.webp",
      "https://static.wixstatic.com/media/c719ab_db1162f965d34776857f20f1b64c9439~mv2.jpg/v1/fill/w_542,h_504,al_c,lg_1,q_80,enc_avif,quality_auto/c719ab_db1162f965d34776857f20f1b64c9439~mv2.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScQTsOzh-YOGQHt0_ASs0INUlIJUv5Ev7XrAb8HMYIqw&s=10",
      "https://cdn.shopify.com/s/files/1/0306/8677/files/apple-macbook-pro-16-inch-macbook-pro-16-inch-m2-pro-12-core-space-grey-2023-good-44234563551548.jpg",
    ],
    imageUrl:
        'https://orangedeals.ng/wp-content/uploads/2025/04/Macbookpro.webp',
  ),

  Product(
    name: 'Sony WH-1000MP3',
    subtitle: 'Gaming Headset Pro',
    rating: 4.6,
    reviewCount: 78,
    price: 249.00,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQULwLHBRQic4DOGN_xqqzI3l1AjQilI92WcS9FhZB2OA&s=10',
    description:
        'Industry-leading noise cancellation meets a gaming-tuned sound '
        'profile, so every footstep and explosion lands exactly where '
        'it should. Plush ear cushions keep you comfortable through '
        'marathon sessions.',
  ),
  Product(
    name: 'Apple Watch',
    subtitle: 'Water resistance 45mm',
    rating: 4.6,
    reviewCount: 78,
    price: 399.00,
    imageUrl:
        'https://images.unsplash.com/photo-1551816230-ef5deaed4a26?w=600&auto=format&fit=crop&q=80',
    isFavourite: true,
    description:
        'Track every workout, swim, and step with a watch that\'s '
        'tough enough to keep up. Water resistant up to 50 metres, '
        'with a brighter always-on display you can read at a glance.',
  ),
  Product(
    name: 'AirPods Pro 3',
    subtitle: 'Active Noise Cancellation',
    rating: 4.6,
    reviewCount: 78,
    price: 249.00,
    imageUrl:
        'https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/airpods-pro-3-hero-select-202509?wid=976&hei=916&fmt=jpeg&qlt=90&.v=cmp4MmZ6OWxOeHNNTXh4SzlBNUpEb1RucE9zZTI5eEREaWZpY29lSld3eWVDYXovZDMyN1dXU211bjZoVlVUcWJGcXNRQnFCV0w3WVRjTExvdm1ic1YxRUxFRmRlWDBITzhnRmZ5OTRmaVdKTExiOEFsRmxtQ2Nua0tRSC83MkI',
    isFavourite: true,
    description:
        'Richer active noise cancellation blocks out the world, while '
        'Adaptive Transparency lets it back in when you need it. A '
        'snugger fit and longer battery life make these the most '
        'comfortable AirPods Pro yet.',
  ),
  Product(
    name: 'AirPods Max 2',
    subtitle: 'Active Noise Cancellation',
    rating: 4.6,
    reviewCount: 78,
    price: 549.00,
    imageUrl:
        "https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/airpods-max-compare-202409?wid=420&hei=500&fmt=jpeg&qlt=90&.v=MGJ3WGNoS1hJZng5ZTNiUkNNckE1WUNLYUZJYzNlb2M5YWlUSmxDUFM0VU1zMnAyYWJvaWNXR0hyZHB2dmJDMmdsbGZlRHV0Q3JlbHJxWXRlWjZpMnFLMWZobVVoS25GeGxET3FhTGFDUFE",
    isFavourite: true,
    description:
        'Over-ear comfort with studio-grade sound. A breathable knit '
        'mesh canopy distributes weight evenly, while high-fidelity '
        'audio and adaptive EQ tune the sound to your ears in '
        'real time.',
  ),
  Product(
    name: 'Apple Watch Ultra 3',
    subtitle: '40hrs Battery life',
    rating: 4.6,
    reviewCount: 78,
    price: 549.00,
    imageUrl:
        "https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/watch-card-40-hermes-ultra-202603?wid=680&hei=528&fmt=p-jpg&qlt=95&.v=Ly93VWF6a1dGOWJLL3RMM0s0eGZ6dkxrL1JtTWVkTlZHZC94N3hJUktvSGZPOGdzbXFQKzNyOVN3L2NRSHJCNStFVlF6ZkRtZVJkbnBuR0wwNDgvSm1sYzVYYlU2dmpTclpCc0EvbDhhcVJKWTVCVjAxTmRTUFh4NVVLRDdSSEc",
    isFavourite: true,
    description:
        'Built for the extremes. A rugged titanium case, the brightest '
        'Apple Watch display ever, and up to 40 hours of battery life '
        'so it keeps going long after you\'ve clocked out.',
  ),
];
