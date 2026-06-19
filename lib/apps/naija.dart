// naija_chow_screen.dart
//
// Drop this file into your `lib/` folder and import it from main.dart.
// Needs: cupertino_icons (already default), and hugeicons:
//   flutter pub add hugeicons
//
// Usage from main.dart:
//   import 'naija_chow_screen.dart';
//   ...
//   home: const HomeFeedScreen(),

import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

// ---------------------------------------------------------------------------
// THEME — warm, food-forward palette. Not the default purple/teal Flutter
// look — leaning into a spiced, earthy palette that reads "Nigerian kitchen"
// rather than generic food-app green.
// ---------------------------------------------------------------------------
class AppColors {
  static const bg = Color(0xFFFFFBF6);
  static const card = Color(0xFFFFFFFF);
  static const ink = Color(0xFF231711);
  static const inkSoft = Color(0xFF8B7A70);
  static const paprika = Color(0xFFD0492A);
  static const paprikaDeep = Color(0xFFA8371E);
  static const palmGold = Color(0xFFE8A33D);
  static const leaf = Color(0xFF4C7A55);
  static const line = Color(0xFFF0E4D8);
  static const chipBg = Color(0xFFF6EEE3);
}

// ---------------------------------------------------------------------------
// MOCK DATA
// ---------------------------------------------------------------------------
class Dish {
  final String id;
  final String name;
  final String cookName;
  final String cookHandle;
  final String cookAvatarUrl;
  final String thumbUrl;
  final String videoThumbUrl;
  final String calories;
  final String minutes;
  final double rating;
  final int reviews;
  final int likes;
  final int comments;
  final String category;
  final String description;
  final List<Ingredient> ingredients;

  const Dish({
    required this.id,
    required this.name,
    required this.cookName,
    required this.cookHandle,
    required this.cookAvatarUrl,
    required this.thumbUrl,
    required this.videoThumbUrl,
    required this.calories,
    required this.minutes,
    required this.rating,
    required this.reviews,
    required this.likes,
    required this.comments,
    required this.category,
    required this.description,
    required this.ingredients,
  });
}

class Ingredient {
  final String name;
  final String amount;
  final String imageUrl;
  const Ingredient(this.name, this.amount, this.imageUrl);
}

final List<Dish> mockDishes = [
  Dish(
    id: 'jollof-1',
    name: 'Party Jollof Rice',
    cookName: 'Adaeze Okafor',
    cookHandle: '@adaezecooks',
    // https://www.preciouscore.com/wp-content/uploads/2021/12/Jollof-Rice-With-Chicken.jpg
    cookAvatarUrl:
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=200&q=80&auto=format&fit=crop',
    thumbUrl:
        'https://www.preciouscore.com/wp-content/uploads/2021/12/Jollof-Rice-With-Chicken.jpg',
    videoThumbUrl:
        'https://www.preciouscore.com/wp-content/uploads/2021/12/Jollof-Rice-With-Chicken.jpg',
    calories: '420 Cal',
    minutes: '55 Min',
    rating: 4.8,
    reviews: 132,
    likes: 2300,
    comments: 84,
    category: 'Lunch',
    description:
        'Smoky party-style jollof, the kind cooked over firewood at every '
        'owambe. Long-grain rice simmered in a deep tomato-pepper base '
        'until every grain is red and dry-fried at the edges.',
    ingredients: const [
      Ingredient(
        'Long grain rice',
        '4.0 cups',
        'https://images.unsplash.com/photo-1586201375761-83865001e31c?w=200&q=80&auto=format&fit=crop',
      ),
      Ingredient(
        'Fresh tomatoes',
        '6.0 pcs',
        'https://images.unsplash.com/photo-1546470427-e26264be0b0d?w=200&q=80&auto=format&fit=crop',
      ),
      Ingredient(
        'Red bell pepper',
        '3.0 pcs',
        'https://images.unsplash.com/photo-1525607551316-4a8e16d1f9ba?w=200&q=80&auto=format&fit=crop',
      ),
      Ingredient(
        'Chicken stock',
        '500.0 ml',
        'https://images.unsplash.com/photo-1604503468506-a8da13d82791?w=200&q=80&auto=format&fit=crop',
      ),
    ],
  ),
  Dish(
    id: 'egusi-1',
    name: 'Egusi Soup',
    cookName: 'Tunde Bakare',
    cookHandle: '@tundeskitchen',
    cookAvatarUrl:
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200&q=80&auto=format&fit=crop',
    thumbUrl:
        'https://images.unsplash.com/photo-1644387884030-e743ce2d4dab?w=600&q=80&auto=format&fit=crop',
    videoThumbUrl:
        'https://images.unsplash.com/photo-1644387884030-e743ce2d4dab?w=1000&q=80&auto=format&fit=crop',
    calories: '380 Cal',
    minutes: '70 Min',
    rating: 4.6,
    reviews: 98,
    likes: 1800,
    comments: 51,
    category: 'Dinner',
    description:
        'Ground melon seeds thickened into a rich, nutty soup loaded with '
        'assorted meat, stockfish and a generous handful of ugu leaves. '
        'Best eaten with pounded yam, no shaking.',
    ingredients: const [
      Ingredient(
        'Ground egusi',
        '2.0 cups',
        'https://images.unsplash.com/photo-1623428187969-1cf0908b22c5?w=200&q=80&auto=format&fit=crop',
      ),
      Ingredient(
        'Ugu leaves',
        '1.0 bunch',
        'https://images.unsplash.com/photo-1576045057995-568f588f82fb?w=200&q=80&auto=format&fit=crop',
      ),
      Ingredient(
        'Palm oil',
        '0.5 cup',
        'https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?w=200&q=80&auto=format&fit=crop',
      ),
      Ingredient(
        'Assorted meat',
        '600.0 g',
        'https://images.unsplash.com/photo-1607623814075-e51df1bdc82f?w=200&q=80&auto=format&fit=crop',
      ),
    ],
  ),
  Dish(
    id: 'suya-1',
    name: 'Beef Suya Skewers',
    cookName: 'Aisha Mohammed',
    cookHandle: '@aishagrills',
    cookAvatarUrl:
        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=200&q=80&auto=format&fit=crop',
    thumbUrl:
        'https://images.unsplash.com/photo-1529193591184-b1d58069ecdd?w=600&q=80&auto=format&fit=crop',
    videoThumbUrl:
        'https://images.unsplash.com/photo-1529193591184-b1d58069ecdd?w=1000&q=80&auto=format&fit=crop',
    calories: '310 Cal',
    minutes: '35 Min',
    rating: 4.9,
    reviews: 210,
    likes: 4100,
    comments: 162,
    category: 'Dinner',
    description:
        'Thin-sliced beef rubbed in a fiery groundnut-and-spice yaji blend, '
        'grilled over open flame until smoky at the edges. Street food '
        'royalty, made at home.',
    ingredients: const [
      Ingredient(
        'Beef sirloin',
        '500.0 g',
        'https://images.unsplash.com/photo-1551028150-64b9f398f678?w=200&q=80&auto=format&fit=crop',
      ),
      Ingredient(
        'Suya spice (yaji)',
        '4.0 tbsp',
        'https://images.unsplash.com/photo-1596040033229-a9821ebd058d?w=200&q=80&auto=format&fit=crop',
      ),
      Ingredient(
        'Groundnut oil',
        '2.0 tbsp',
        'https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?w=200&q=80&auto=format&fit=crop',
      ),
      Ingredient(
        'Onions',
        '2.0 pcs',
        'https://images.unsplash.com/photo-1518977676601-b53f82aba655?w=200&q=80&auto=format&fit=crop',
      ),
    ],
  ),
  Dish(
    id: 'akara-1',
    name: 'Akara & Pap',
    cookName: 'Funke Adeyemi',
    cookHandle: '@funkesplate',
    cookAvatarUrl:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200&q=80&auto=format&fit=crop',
    thumbUrl:
        'https://images.unsplash.com/photo-1639024471283-03518883512d?w=600&q=80&auto=format&fit=crop',
    videoThumbUrl:
        'https://images.unsplash.com/photo-1639024471283-03518883512d?w=1000&q=80&auto=format&fit=crop',
    calories: '260 Cal',
    minutes: '25 Min',
    rating: 4.5,
    reviews: 76,
    likes: 1200,
    comments: 33,
    category: 'Breakfast',
    description:
        'Crispy bean cake fritters, blended fresh and fried golden, paired '
        'with warm pap. A Saturday morning staple that needs nothing but '
        'pepper and patience.',
    ingredients: const [
      Ingredient(
        'Peeled beans',
        '2.0 cups',
        'https://images.unsplash.com/photo-1515543904379-3d757afe72e4?w=200&q=80&auto=format&fit=crop',
      ),
      Ingredient(
        'Scotch bonnet pepper',
        '2.0 pcs',
        'https://images.unsplash.com/photo-1599819811279-d5ad9cccf838?w=200&q=80&auto=format&fit=crop',
      ),
      Ingredient(
        'Onions',
        '1.0 pcs',
        'https://images.unsplash.com/photo-1518977676601-b53f82aba655?w=200&q=80&auto=format&fit=crop',
      ),
      Ingredient(
        'Vegetable oil',
        '500.0 ml',
        'https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?w=200&q=80&auto=format&fit=crop',
      ),
    ],
  ),
];

// ---------------------------------------------------------------------------
// HOME FEED SCREEN
// ---------------------------------------------------------------------------
class HomeFeedScreen extends StatefulWidget {
  const HomeFeedScreen({super.key});

  @override
  State<HomeFeedScreen> createState() => _HomeFeedScreenState();
}

class _HomeFeedScreenState extends State<HomeFeedScreen> {
  String _selectedCategory = 'All';
  int _navIndex = 0;

  static const _categories = ['All', 'Dinner', 'Lunch', 'Breakfast'];

  List<Dish> get _filteredDishes {
    if (_selectedCategory == 'All') return mockDishes;
    return mockDishes.where((d) => d.category == _selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _buildHeader(context)),
            SliverToBoxAdapter(child: _buildSearchBar()),
            SliverToBoxAdapter(child: _buildBanner()),
            SliverToBoxAdapter(child: _buildCategoriesLabel()),
            SliverToBoxAdapter(child: _buildCategoryPills()),
            SliverToBoxAdapter(child: _buildSectionLabel('Trending Naija')),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.78,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => _DishCard(dish: _filteredDishes[index]),
                  childCount: _filteredDishes.length,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: Text(
              'Wetin we dey cook today?',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: AppColors.ink,
                height: 1.15,
              ),
            ),
          ),
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.line),
            ),
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedNotification01,
              size: 22,
              color: AppColors.ink,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.line),
        ),
        child: Row(
          children: [
            const HugeIcon(
              icon: HugeIcons.strokeRoundedSearch01,
              size: 20,
              color: AppColors.inkSoft,
            ),
            const SizedBox(width: 10),
            Text(
              'Search jollof, egusi, suya...',
              style: TextStyle(
                color: AppColors.inkSoft.withOpacity(0.9),
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [AppColors.paprika, AppColors.paprikaDeep],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: -10,
              bottom: -10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "https://images.unsplash.com/photo-1665332195309-9d75071138f0?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                  opacity: const AlwaysStoppedAnimation(0.35),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 130, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Watch how your\nfavourite chops dey made',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      height: 1.25,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      'Explore',
                      style: TextStyle(
                        color: AppColors.paprikaDeep,
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
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

  Widget _buildCategoriesLabel() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(20, 22, 20, 0),
      child: Text(
        'Categories',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: AppColors.ink,
        ),
      ),
    );
  }

  Widget _buildCategoryPills() {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final cat = _categories[index];
          final selected = cat == _selectedCategory;
          return GestureDetector(
            onTap: () => setState(() => _selectedCategory = cat),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected ? AppColors.ink : AppColors.chipBg,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                cat,
                style: TextStyle(
                  color: selected ? Colors.white : AppColors.inkSoft,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionLabel(String label) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: AppColors.ink,
            ),
          ),
          const Text(
            'View all',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.paprika,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    final items = [
      (HugeIcons.strokeRoundedHome01, 'Home'),
      (HugeIcons.strokeRoundedFavourite, 'Favorites'),
      (HugeIcons.strokeRoundedCalendar03, 'Meal Plan'),
      (HugeIcons.strokeRoundedSettings01, 'Settings'),
    ];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        border: Border(top: BorderSide(color: AppColors.line)),
      ),
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (i) {
            final selected = i == _navIndex;
            final (icon, label) = items[i];
            return GestureDetector(
              onTap: () => setState(() => _navIndex = i),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HugeIcon(
                    icon: icon,
                    size: 22,
                    color: selected ? AppColors.paprika : AppColors.inkSoft,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: selected ? AppColors.paprika : AppColors.inkSoft,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// DISH CARD (grid item on the feed)
// ---------------------------------------------------------------------------
class _DishCard extends StatefulWidget {
  final Dish dish;
  const _DishCard({required this.dish});

  @override
  State<_DishCard> createState() => _DishCardState();
}

class _DishCardState extends State<_DishCard> {
  bool _favorited = false;

  @override
  Widget build(BuildContext context) {
    final dish = widget.dish;
    return GestureDetector(
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => DishDetailScreen(dish: dish)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.line),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: Image.network(
                      dish.thumbUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: AppColors.chipBg,
                        child: const Icon(
                          Icons.image_not_supported_outlined,
                          color: AppColors.inkSoft,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: () => setState(() => _favorited = !_favorited),
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: HugeIcon(
                          icon: _favorited
                              ? HugeIcons.strokeRoundedFavourite
                              : HugeIcons.strokeRoundedFavourite,
                          size: 16,
                          color: _favorited
                              ? AppColors.paprika
                              : AppColors.inkSoft,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dish.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14.5,
                      fontWeight: FontWeight.w700,
                      color: AppColors.ink,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const HugeIcon(
                        icon: HugeIcons.strokeRoundedFire,
                        size: 13,
                        color: AppColors.palmGold,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        dish.calories,
                        style: const TextStyle(
                          fontSize: 11.5,
                          color: AppColors.inkSoft,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const HugeIcon(
                        icon: HugeIcons.strokeRoundedClock01,
                        size: 13,
                        color: AppColors.inkSoft,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        dish.minutes,
                        style: const TextStyle(
                          fontSize: 11.5,
                          color: AppColors.inkSoft,
                        ),
                      ),
                    ],
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

// ---------------------------------------------------------------------------
// DISH DETAIL SCREEN
// Header = "video" (thumbnail + play button), then cook profile row,
// then description, then like/comment row, then ingredients.
// ---------------------------------------------------------------------------
class DishDetailScreen extends StatefulWidget {
  final Dish dish;
  const DishDetailScreen({super.key, required this.dish});

  @override
  State<DishDetailScreen> createState() => _DishDetailScreenState();
}

class _DishDetailScreenState extends State<DishDetailScreen> {
  bool _liked = false;
  bool _following = false;
  int _servings = 1;

  @override
  Widget build(BuildContext context) {
    final dish = widget.dish;
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _buildVideoHeader(context, dish)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCookRow(dish),
                  const SizedBox(height: 18),
                  _buildTitleAndMeta(dish),
                  const SizedBox(height: 14),
                  _buildDescription(dish),
                  const SizedBox(height: 16),
                  _buildEngagementRow(dish),
                  const SizedBox(height: 22),
                  _buildIngredientsHeader(),
                  const SizedBox(height: 14),
                  ...dish.ingredients.map(
                    (ing) => _IngredientRow(ingredient: ing),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildVideoHeader(BuildContext context, Dish dish) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Image.network(
            dish.videoThumbUrl,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              color: AppColors.chipBg,
              child: const Icon(
                Icons.image_not_supported_outlined,
                color: AppColors.inkSoft,
                size: 40,
              ),
            ),
          ),
        ),
        // Darken slightly so the play button + top icons stay legible
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.25),
                  Colors.transparent,
                  Colors.black.withOpacity(0.15),
                ],
                stops: const [0.0, 0.4, 1.0],
              ),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _circleButton(
                  icon: HugeIcons.strokeRoundedArrowLeft01,
                  onTap: () => Navigator.of(context).pop(),
                ),
                _circleButton(
                  icon: HugeIcons.strokeRoundedNotification01,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        // Play button — looks like a video, doesn't actually play one
        Positioned.fill(
          child: Center(
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.92),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: const HugeIcon(
                icon: HugeIcons.strokeRoundedPlay,
                color: AppColors.paprikaDeep,
                size: 28,
              ),
            ),
          ),
        ),
        Positioned(
          left: 16,
          bottom: 14,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.55),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                HugeIcon(
                  icon: HugeIcons.strokeRoundedVideo01,
                  size: 13,
                  color: Colors.white,
                ),
                SizedBox(width: 5),
                Text(
                  '3:42',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _circleButton({required dynamic icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          shape: BoxShape.circle,
        ),
        child: HugeIcon(icon: icon, size: 19, color: AppColors.ink),
      ),
    );
  }

  Widget _buildCookRow(Dish dish) {
    return Row(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: AppColors.chipBg,
          backgroundImage: NetworkImage(dish.cookAvatarUrl),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dish.cookName,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.5,
                  color: AppColors.ink,
                ),
              ),
              Text(
                dish.cookHandle,
                style: const TextStyle(
                  fontSize: 12.5,
                  color: AppColors.inkSoft,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => setState(() => _following = !_following),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
            decoration: BoxDecoration(
              color: _following ? AppColors.chipBg : AppColors.ink,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              _following ? 'Following' : 'Follow',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: _following ? AppColors.ink : Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitleAndMeta(Dish dish) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dish.name,
          style: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w800,
            color: AppColors.ink,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const HugeIcon(
              icon: HugeIcons.strokeRoundedFire,
              size: 15,
              color: AppColors.palmGold,
            ),
            const SizedBox(width: 4),
            Text(
              dish.calories,
              style: const TextStyle(color: AppColors.inkSoft, fontSize: 13),
            ),
            const SizedBox(width: 10),
            const HugeIcon(
              icon: HugeIcons.strokeRoundedClock01,
              size: 15,
              color: AppColors.inkSoft,
            ),
            const SizedBox(width: 4),
            Text(
              dish.minutes,
              style: const TextStyle(color: AppColors.inkSoft, fontSize: 13),
            ),
            const SizedBox(width: 10),
            const HugeIcon(
              icon: HugeIcons.strokeRoundedStar, // filled look via color
              size: 15,
              color: AppColors.palmGold,
            ),
            const SizedBox(width: 4),
            Text(
              '${dish.rating}/5 (${dish.reviews} Reviews)',
              style: const TextStyle(color: AppColors.inkSoft, fontSize: 13),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDescription(Dish dish) {
    return Text(
      dish.description,
      style: const TextStyle(
        fontSize: 14,
        color: AppColors.inkSoft,
        height: 1.5,
      ),
    );
  }

  Widget _buildEngagementRow(Dish dish) {
    final likeCount = dish.likes + (_liked ? 1 : 0);
    return Row(
      children: [
        GestureDetector(
          onTap: () => setState(() => _liked = !_liked),
          child: Row(
            children: [
              HugeIcon(
                icon: HugeIcons.strokeRoundedFavourite,
                size: 20,
                color: _liked ? AppColors.paprika : AppColors.inkSoft,
              ),
              const SizedBox(width: 6),
              Text(
                _formatCount(likeCount),
                style: const TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w600,
                  color: AppColors.ink,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 22),
        Row(
          children: [
            const HugeIcon(
              icon: HugeIcons.strokeRoundedMessage01,
              size: 20,
              color: AppColors.inkSoft,
            ),
            const SizedBox(width: 6),
            Text(
              '${dish.comments} comments',
              style: const TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.w600,
                color: AppColors.ink,
              ),
            ),
          ],
        ),
        const Spacer(),
        const HugeIcon(
          icon: HugeIcons.strokeRoundedShare08,
          size: 20,
          color: AppColors.inkSoft,
        ),
      ],
    );
  }

  String _formatCount(int n) {
    if (n >= 1000) {
      return '${(n / 1000).toStringAsFixed(1)}k';
    }
    return '$n';
  }

  Widget _buildIngredientsHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Ingredients',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w800,
            color: AppColors.ink,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.line),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              _stepperButton(
                icon: HugeIcons.strokeRoundedMinusSign,
                onTap: () {
                  if (_servings > 1) setState(() => _servings--);
                },
              ),
              SizedBox(
                width: 28,
                child: Text(
                  '$_servings',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.ink,
                  ),
                ),
              ),
              _stepperButton(
                icon: HugeIcons.strokeRoundedPlusSign,
                onTap: () => setState(() => _servings++),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _stepperButton({required dynamic icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 26,
        height: 26,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: AppColors.chipBg,
          shape: BoxShape.circle,
        ),
        child: HugeIcon(icon: icon, size: 14, color: AppColors.ink),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      decoration: BoxDecoration(
        color: AppColors.bg,
        border: Border(top: BorderSide(color: AppColors.line)),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.paprika,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Watch Full Video',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
              ),
            ),
            const SizedBox(width: 12),
            GestureDetector(
              onTap: () => setState(() => _liked = !_liked),
              child: Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.line),
                ),
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedFavourite,
                  color: _liked ? AppColors.paprika : AppColors.inkSoft,
                  size: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// INGREDIENT ROW
// ---------------------------------------------------------------------------
class _IngredientRow extends StatelessWidget {
  final Ingredient ingredient;
  const _IngredientRow({required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              ingredient.imageUrl,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 48,
                height: 48,
                color: AppColors.chipBg,
                child: const Icon(
                  Icons.image_not_supported_outlined,
                  size: 18,
                  color: AppColors.inkSoft,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              ingredient.name,
              style: const TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.w600,
                color: AppColors.ink,
              ),
            ),
          ),
          Text(
            ingredient.amount,
            style: const TextStyle(fontSize: 13.5, color: AppColors.inkSoft),
          ),
        ],
      ),
    );
  }
}
