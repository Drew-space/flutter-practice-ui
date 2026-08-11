// // import 'package:flutter/material.dart';
// // import 'package:practice_ui/apps/movieapp/utils/movie_trend.dart';

// // class MovieDetailPage extends StatelessWidget {
// //   const MovieDetailPage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     final size = MediaQuery.of(context).size;

// //     return Scaffold(
// //       backgroundColor: const Color(0xFF0A0A0A),
// //       body: CustomScrollView(
// //         physics: const BouncingScrollPhysics(),
// //         slivers: [
// //           // ── Hero ──
// //           SliverToBoxAdapter(
// //             child: Stack(
// //               clipBehavior: Clip.none,
// //               children: [
// //                 _HeroPoster(size: size),
// //                 Positioned.fill(
// //                   child: DecoratedBox(
// //                     decoration: BoxDecoration(
// //                       gradient: LinearGradient(
// //                         begin: Alignment.topCenter,
// //                         end: Alignment.bottomCenter,
// //                         colors: [
// //                           Colors.black.withOpacity(0.2),
// //                           Colors.transparent,
// //                           const Color(0xFF0A0A0A).withOpacity(0.4),
// //                           const Color(0xFF0A0A0A),
// //                         ],
// //                         stops: const [0.0, 0.25, 0.6, 1.0],
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //                 SafeArea(
// //                   bottom: false,
// //                   child: Padding(
// //                     padding: const EdgeInsets.symmetric(horizontal: 16),
// //                     child: Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       children: [
// //                         _GlassIconButton(
// //                           icon: Icons.arrow_back_ios_new_rounded,
// //                           onTap: () {},
// //                         ),
// //                         Row(
// //                           children: [
// //                             _GlassIconButton(
// //                               icon: Icons.bookmark_border_rounded,
// //                               onTap: () {},
// //                             ),
// //                             const SizedBox(width: 10),
// //                             _GlassIconButton(
// //                               icon: Icons.share_outlined,
// //                               onTap: () {},
// //                             ),
// //                           ],
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 Positioned(
// //                   top: size.height * 0.18,
// //                   left: 0,
// //                   right: 0,
// //                   child: Center(child: _PlayButton()),
// //                 ),
// //                 Positioned(
// //                   bottom: -40,
// //                   left: 0,
// //                   right: 0,
// //                   child: Container(
// //                     padding: const EdgeInsets.symmetric(horizontal: 24),
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         const Text(
// //                           'Spider-Man: Brand New Day',
// //                           style: TextStyle(
// //                             fontSize: 32,
// //                             fontWeight: FontWeight.w800,
// //                             color: Colors.white,
// //                             letterSpacing: -0.5,
// //                             height: 1.1,
// //                           ),
// //                         ),
// //                         const SizedBox(height: 12),
// //                         Row(
// //                           children: [
// //                             _MetaBadge(
// //                               icon: Icons.star_rounded,
// //                               label: '8.9',
// //                               color: Colors.amber,
// //                             ),
// //                             const SizedBox(width: 12),
// //                             _MetaBadge(
// //                               icon: Icons.schedule_rounded,
// //                               label: '2h 15m',
// //                             ),
// //                             const SizedBox(width: 12),
// //                             _MetaBadge(
// //                               icon: Icons.calendar_today_rounded,
// //                               label: '2026',
// //                             ),
// //                             const SizedBox(width: 12),
// //                             Container(
// //                               padding: const EdgeInsets.symmetric(
// //                                 horizontal: 8,
// //                                 vertical: 3,
// //                               ),
// //                               decoration: BoxDecoration(
// //                                 color: Colors.white.withOpacity(0.1),
// //                                 borderRadius: BorderRadius.circular(6),
// //                               ),
// //                               child: const Text(
// //                                 'HD',
// //                                 style: TextStyle(
// //                                   fontSize: 11,
// //                                   fontWeight: FontWeight.w700,
// //                                   color: Colors.white,
// //                                 ),
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                         const SizedBox(height: 16),
// //                         Wrap(
// //                           spacing: 8,
// //                           runSpacing: 8,
// //                           children: [
// //                             _FilledTag(label: 'Action'),
// //                             _FilledTag(label: 'Fantasy'),
// //                             _FilledTag(label: 'Adventure'),
// //                           ],
// //                         ),
// //                         const SizedBox(height: 20),
// //                         Row(
// //                           children: [
// //                             Expanded(
// //                               flex: 3,
// //                               child: _MainActionButton(
// //                                 label: 'Watch Now',
// //                                 icon: Icons.play_arrow_rounded,
// //                                 onTap: () {},
// //                               ),
// //                             ),
// //                             const SizedBox(width: 12),
// //                             Expanded(
// //                               flex: 2,
// //                               child: _SecondaryActionButton(
// //                                 label: 'Download',
// //                                 icon: Icons.download_rounded,
// //                                 onTap: () {},
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),

// //           const SliverToBoxAdapter(child: SizedBox(height: 60)),

// //           // ── Synopsis ──
// //           SliverToBoxAdapter(
// //             child: Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 24),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   _SectionTitle(title: 'Synopsis'),
// //                   const SizedBox(height: 12),
// //                   Text(
// //                     "A forgotten Peter Parker lives alone as a full-time Spider-Man until mounting pressure triggers a dangerous change and a powerful new enemy emerges.",
// //                     style: TextStyle(
// //                       fontSize: 15,
// //                       color: Colors.grey[400],
// //                       height: 1.7,
// //                       letterSpacing: 0.1,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),

// //           // ── Cast ──
// //           SliverToBoxAdapter(
// //             child: Padding(
// //               padding: const EdgeInsets.only(top: 32),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Padding(
// //                     padding: const EdgeInsets.symmetric(horizontal: 24),
// //                     child: Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       children: [
// //                         _SectionTitle(title: 'Top Cast'),
// //                         TextButton(
// //                           onPressed: () {},
// //                           style: TextButton.styleFrom(
// //                             padding: EdgeInsets.zero,
// //                             minimumSize: Size.zero,
// //                             tapTargetSize: MaterialTapTargetSize.shrinkWrap,
// //                           ),
// //                           child: const Text(
// //                             'See all',
// //                             style: TextStyle(
// //                               fontSize: 14,
// //                               color: Color(0xFF8B5CF6),
// //                               fontWeight: FontWeight.w600,
// //                             ),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                   const SizedBox(height: 16),
// //                   SizedBox(
// //                     height: 160,
// //                     child: ListView(
// //                       scrollDirection: Axis.horizontal,
// //                       padding: const EdgeInsets.symmetric(horizontal: 24),
// //                       physics: const BouncingScrollPhysics(),
// //                       children: const [
// //                         _CastCard(
// //                           name: 'Tom Holland',
// //                           role: 'Peter Parker / Spider-Man',
// //                           imageUrl:
// //                               'https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcS9r-FRHaSWFNAVrvW9jNfHEHZFo8NpQL6NHpcK7ksyJ0QO_4B8ufcooMAHc5oVknua0-mV52GjSPfQxKKusSYKhRaU06qeE9P6CoFdlftuOnPcrFs7cu_J6-pA-Y380U_RTMoXW2w6rdc&s=19',
// //                         ),
// //                         _CastCard(
// //                           name: 'Zendaya',
// //                           role: 'MJ',
// //                           imageUrl:
// //                               'https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcTH0uF_IqMPEg4u68CA131G6W52sUHO8kEKpx0vO7JVCfP-cYJao0dN0W5YiW7NxC5awhu-wMW8XSfQBKc',
// //                         ),
// //                         _CastCard(
// //                           name: 'Jacob Batalon',
// //                           role: 'Ned Leeds',
// //                           imageUrl:
// //                               'https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcQnB_jGazdgPTcfw3ePKKo17jZzbPjs02UBWf5xIOR1RBPQXG6Qw_jdqlPFNhVMmKjNmgk_uNG4GKk1yQGOJCgRjBvFIBaa2Wn0RfBnZtRk2esMCsyCyIAxW6EMFCo5fFPJjyR8jKC_Iw&s=19',
// //                         ),
// //                         _CastCard(
// //                           name: 'Jon Bernthal',
// //                           role: 'Frank Castle / Punisher',
// //                           imageUrl:
// //                               'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSW9jvpT1H4p4KsiDut5tCHeqCq7yb1PpRVqm5vm9vjHJy24xzaGyt2Uqv3ba-_mK1gnUggcIr2jFGP5BcQm42fv6sXi0beqjtikxNxtA&s=10',
// //                         ),
// //                         _CastCard(
// //                           name: 'Mark Ruffalo',
// //                           role: 'Bruce Banner / Hulk',
// //                           imageUrl:
// //                               'https://m.media-amazon.com/images/M/MV5BM2JiYzA0ZGItNmFhYy00MjIyLWEwN2QtMzRmNDUyNjNiZjBiXkEyXkFqcGc@._V1_.jpg',
// //                         ),
// //                         _CastCard(
// //                           name: 'Sadie Sink',
// //                           role: 'TBA',
// //                           imageUrl:
// //                               "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLnUQM5V6Oq7BnAGiLmZF-peHnu6Tw_rBKEurw9kVEtZVM-rjYEV7TkV7onLPH7E6Y_VGmee3D6y1UpkrVsaoqJGKOiZlx3Ub_7-FWAg&s=10",
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),

// //           // ── Details ──
// //           SliverToBoxAdapter(
// //             child: Padding(
// //               padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   _SectionTitle(title: 'Details'),
// //                   const SizedBox(height: 16),
// //                   _InfoRow(label: 'Director', value: 'Cedric Nicolas-Troyan'),
// //                   const SizedBox(height: 10),
// //                   _InfoRow(
// //                     label: 'Writers',
// //                     value: 'Evan Spiliotopoulos, Craig Mazin',
// //                   ),
// //                   const SizedBox(height: 10),
// //                   _InfoRow(label: 'Studio', value: 'Universal Pictures'),
// //                   const SizedBox(height: 10),
// //                   _InfoRow(label: 'Language', value: 'English, French'),
// //                 ],
// //               ),
// //             ),
// //           ),

// //           // ── YOUR MovieTrend() WIDGET ──
// //           const SliverToBoxAdapter(
// //             child: Padding(
// //               padding: EdgeInsets.only(top: 32),
// //               child: MovieTrend(),
// //             ),
// //           ),

// //           const SliverToBoxAdapter(child: SizedBox(height: 40)),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // ─── Widgets ───────────────────────────────────────────────────

// // class _HeroPoster extends StatelessWidget {
// //   final Size size;
// //   const _HeroPoster({required this.size});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       height: size.height * 0.58,
// //       width: double.infinity,
// //       foregroundDecoration: BoxDecoration(
// //         gradient: LinearGradient(
// //           begin: Alignment.topCenter,
// //           end: Alignment.bottomCenter,
// //           colors: [
// //             Colors.black.withOpacity(0.3),
// //             Colors.transparent,
// //             const Color(0xFF0A0A0A).withOpacity(0.8),
// //             const Color(0xFF0A0A0A),
// //           ],
// //           stops: const [0.0, 0.2, 0.7, 1.0],
// //         ),
// //       ),
// //       child: Image.network(
// //         "https://m.media-amazon.com/images/M/MV5BOWNjYWM3NWItOGE0ZS00MWRjLThiZWEtYjc4ZmNmMmU5ZTVmXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg",
// //         fit: BoxFit.cover,
// //         alignment: Alignment.topCenter,
// //       ),
// //     );
// //   }
// // }

// // class _GlassIconButton extends StatelessWidget {
// //   final IconData icon;
// //   final VoidCallback onTap;
// //   const _GlassIconButton({required this.icon, required this.onTap});

// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: onTap,
// //       child: Container(
// //         width: 40,
// //         height: 40,
// //         decoration: BoxDecoration(
// //           color: Colors.black.withOpacity(0.3),
// //           shape: BoxShape.circle,
// //           border: Border.all(color: Colors.white.withOpacity(0.1), width: 0.5),
// //           boxShadow: [
// //             BoxShadow(
// //               color: Colors.black.withOpacity(0.2),
// //               blurRadius: 10,
// //               offset: const Offset(0, 4),
// //             ),
// //           ],
// //         ),
// //         child: Icon(icon, color: Colors.white, size: 18),
// //       ),
// //     );
// //   }
// // }

// // class _PlayButton extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: () {},
// //       child: Container(
// //         width: 72,
// //         height: 72,
// //         decoration: BoxDecoration(
// //           color: Colors.white.withOpacity(0.15),
// //           shape: BoxShape.circle,
// //           border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
// //           boxShadow: [
// //             BoxShadow(
// //               color: Colors.black.withOpacity(0.4),
// //               blurRadius: 20,
// //               spreadRadius: 2,
// //             ),
// //           ],
// //         ),
// //         child: const Icon(
// //           Icons.play_arrow_rounded,
// //           color: Colors.white,
// //           size: 36,
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class _MetaBadge extends StatelessWidget {
// //   final IconData icon;
// //   final String label;
// //   final Color? color;
// //   const _MetaBadge({required this.icon, required this.label, this.color});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Row(
// //       mainAxisSize: MainAxisSize.min,
// //       children: [
// //         Icon(icon, color: color ?? Colors.grey[400], size: 14),
// //         const SizedBox(width: 4),
// //         Text(
// //           label,
// //           style: TextStyle(
// //             fontSize: 13,
// //             color: color ?? Colors.grey[300],
// //             fontWeight: FontWeight.w600,
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// // class _FilledTag extends StatelessWidget {
// //   final String label;
// //   const _FilledTag({required this.label});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
// //       decoration: BoxDecoration(
// //         color: Colors.white.withOpacity(0.08),
// //         borderRadius: BorderRadius.circular(8),
// //         border: Border.all(color: Colors.white.withOpacity(0.08), width: 1),
// //       ),
// //       child: Text(
// //         label,
// //         style: const TextStyle(
// //           fontSize: 12,
// //           color: Colors.white,
// //           fontWeight: FontWeight.w500,
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class _MainActionButton extends StatelessWidget {
// //   final String label;
// //   final IconData icon;
// //   final VoidCallback onTap;
// //   const _MainActionButton({
// //     required this.label,
// //     required this.icon,
// //     required this.onTap,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: onTap,
// //       child: Container(
// //         height: 52,
// //         decoration: BoxDecoration(
// //           color: const Color(0xFF7C3AED),
// //           borderRadius: BorderRadius.circular(35),
// //           // boxShadow: [
// //           //   BoxShadow(
// //           //     color: const Color(0xFF7C3AED).withOpacity(0.4),
// //           //     blurRadius: 20,
// //           //     offset: const Offset(0, 2),
// //           //   ),
// //           // ],
// //         ),
// //         child: Row(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Icon(icon, color: Colors.white, size: 22),
// //             const SizedBox(width: 8),
// //             Text(
// //               label,
// //               style: const TextStyle(
// //                 color: Colors.white,
// //                 fontSize: 16,
// //                 fontWeight: FontWeight.w700,
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class _SecondaryActionButton extends StatelessWidget {
// //   final String label;
// //   final IconData icon;
// //   final VoidCallback onTap;
// //   const _SecondaryActionButton({
// //     required this.label,
// //     required this.icon,
// //     required this.onTap,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: onTap,
// //       child: Container(
// //         height: 52,
// //         decoration: BoxDecoration(
// //           color: Colors.white.withOpacity(0.08),
// //           borderRadius: BorderRadius.circular(35),
// //           border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
// //         ),
// //         child: Row(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Icon(icon, color: Colors.white, size: 20),
// //             const SizedBox(width: 8),
// //             Text(
// //               label,
// //               style: const TextStyle(
// //                 color: Colors.white,
// //                 fontSize: 15,
// //                 fontWeight: FontWeight.w600,
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class _SectionTitle extends StatelessWidget {
// //   final String title;
// //   const _SectionTitle({required this.title});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Text(
// //       title,
// //       style: const TextStyle(
// //         fontSize: 20,
// //         fontWeight: FontWeight.w800,
// //         color: Colors.white,
// //         letterSpacing: -0.3,
// //       ),
// //     );
// //   }
// // }

// // class _CastCard extends StatelessWidget {
// //   final String name;
// //   final String role;
// //   final String imageUrl;
// //   const _CastCard({
// //     required this.name,
// //     required this.role,
// //     required this.imageUrl,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       width: 100,
// //       margin: const EdgeInsets.only(right: 16),
// //       child: Column(
// //         children: [
// //           ClipRRect(
// //             borderRadius: BorderRadius.circular(14),
// //             child: Image.network(
// //               imageUrl,
// //               width: 100,
// //               height: 100,
// //               fit: BoxFit.cover,
// //             ),
// //           ),
// //           const SizedBox(height: 10),
// //           Text(
// //             name,
// //             style: const TextStyle(
// //               fontSize: 13,
// //               color: Colors.white,
// //               fontWeight: FontWeight.w600,
// //             ),
// //             maxLines: 1,
// //             overflow: TextOverflow.ellipsis,
// //             textAlign: TextAlign.center,
// //           ),
// //           const SizedBox(height: 2),
// //           Text(
// //             role,
// //             style: TextStyle(fontSize: 12, color: Colors.grey[500]),
// //             maxLines: 1,
// //             overflow: TextOverflow.ellipsis,
// //             textAlign: TextAlign.center,
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class _InfoRow extends StatelessWidget {
// //   final String label;
// //   final String value;
// //   const _InfoRow({required this.label, required this.value});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Row(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         SizedBox(
// //           width: 80,
// //           child: Text(
// //             label,
// //             style: TextStyle(
// //               fontSize: 14,
// //               color: Colors.grey[500],
// //               fontWeight: FontWeight.w500,
// //             ),
// //           ),
// //         ),
// //         Expanded(
// //           child: Text(
// //             value,
// //             style: const TextStyle(
// //               fontSize: 14,
// //               color: Colors.white,
// //               fontWeight: FontWeight.w500,
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:hugeicons/hugeicons.dart';
// import 'package:practice_ui/apps/movieapp/utils/movie_trend.dart';

// class MovieDetailPage extends StatelessWidget {
//   final Map<String, dynamic> movie;
//   const MovieDetailPage({super.key, required this.movie});

//   String get _title => movie['title'] ?? movie['name'] ?? 'Unknown';
//   String get _imageUrl {
//     final path = movie['backdrop_path'] ?? movie['poster_path'];
//     if (path != null && path.toString().isNotEmpty) {
//       return 'https://image.tmdb.org/t/p/w500$path';
//     }
//     return movie['imageUrl'] ?? '';
//   }

//   String get _posterUrl {
//     final path = movie['poster_path'];
//     if (path != null && path.toString().isNotEmpty) {
//       return 'https://image.tmdb.org/t/p/w500$path';
//     }
//     return movie['imageUrl'] ?? '';
//   }

//   double get _rating =>
//       (movie['vote_average'] as num?)?.toDouble() ??
//       (movie['rating'] as num?)?.toDouble() ??
//       0.0;
//   String get _year {
//     final date = movie['release_date'] ?? movie['first_air_date'] ?? '';
//     if (date.toString().isNotEmpty) {
//       final parsed = DateTime.tryParse(date.toString());
//       return parsed?.year.toString() ?? 'TBD';
//     }
//     return movie['year']?.toString() ?? 'TBD';
//   }

//   String get _synopsis => (movie['overview']?.toString().isNotEmpty == true)
//       ? movie['overview']
//       : "A forgotten hero faces mounting pressure and a powerful new enemy emerges in this thrilling adventure.";

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       backgroundColor: const Color(0xFF0A0A0A),
//       body: CustomScrollView(
//         physics: const BouncingScrollPhysics(),
//         slivers: [
//           // ── Hero ──
//           SliverToBoxAdapter(
//             child: Stack(
//               clipBehavior: Clip.none,
//               children: [
//                 _HeroPoster(size: size, imageUrl: _posterUrl),
//                 Positioned.fill(
//                   child: DecoratedBox(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                         colors: [
//                           Colors.black.withOpacity(0.2),
//                           Colors.transparent,
//                           const Color(0xFF0A0A0A).withOpacity(0.4),
//                           const Color(0xFF0A0A0A),
//                         ],
//                         stops: const [0.0, 0.25, 0.6, 1.0],
//                       ),
//                     ),
//                   ),
//                 ),
//                 SafeArea(
//                   bottom: false,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         _GlassIconButton(
//                           icon: Icons.arrow_back_ios_new_rounded,
//                           onTap: () => Navigator.pop(context),
//                         ),
//                         Row(
//                           children: [
//                             _GlassIconButton(
//                               icon: Icons.bookmark_border_rounded,
//                               onTap: () {},
//                             ),
//                             const SizedBox(width: 10),
//                             _GlassIconButton(
//                               icon: Icons.share_outlined,
//                               onTap: () {},
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: size.height * 0.18,
//                   left: 0,
//                   right: 0,
//                   child: Center(child: _PlayButton()),
//                 ),
//                 Positioned(
//                   bottom: -40,
//                   left: 0,
//                   right: 0,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 24),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           _title,
//                           style: const TextStyle(
//                             fontSize: 32,
//                             fontWeight: FontWeight.w800,
//                             color: Colors.white,
//                             letterSpacing: -0.5,
//                             height: 1.1,
//                           ),
//                         ),
//                         const SizedBox(height: 12),
//                         Row(
//                           children: [
//                             _MetaBadge(
//                               icon: Icons.star_rounded,
//                               label: _rating.toStringAsFixed(1),
//                               color: Colors.amber,
//                             ),
//                             const SizedBox(width: 12),
//                             _MetaBadge(
//                               icon: Icons.schedule_rounded,
//                               label: '2h 15m',
//                             ),
//                             const SizedBox(width: 12),
//                             _MetaBadge(
//                               icon: Icons.calendar_today_rounded,
//                               label: _year,
//                             ),
//                             const SizedBox(width: 12),
//                             Container(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 8,
//                                 vertical: 3,
//                               ),
//                               decoration: BoxDecoration(
//                                 color: Colors.white.withOpacity(0.1),
//                                 borderRadius: BorderRadius.circular(6),
//                               ),
//                               child: const Text(
//                                 'HD',
//                                 style: TextStyle(
//                                   fontSize: 11,
//                                   fontWeight: FontWeight.w700,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 16),
//                         Wrap(
//                           spacing: 8,
//                           runSpacing: 8,
//                           children: [
//                             _FilledTag(label: 'Action'),
//                             _FilledTag(label: 'Fantasy'),
//                             _FilledTag(label: 'Adventure'),
//                           ],
//                         ),
//                         const SizedBox(height: 20),
//                         Row(
//                           children: [
//                             Expanded(
//                               flex: 3,
//                               child: _MainActionButton(
//                                 label: 'Watch Now',
//                                 icon: Icons.play_arrow_rounded,
//                                 onTap: () {},
//                               ),
//                             ),
//                             const SizedBox(width: 12),
//                             Expanded(
//                               flex: 2,
//                               child: _SecondaryActionButton(
//                                 label: 'Download',
//                                 icon: Icons.download_rounded,
//                                 onTap: () {},
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           const SliverToBoxAdapter(child: SizedBox(height: 60)),

//           // ── Synopsis ──
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _SectionTitle(title: 'Synopsis'),
//                   const SizedBox(height: 12),
//                   Text(
//                     _synopsis,
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: Colors.grey[400],
//                       height: 1.7,
//                       letterSpacing: 0.1,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           // ── Cast ──
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.only(top: 32),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 24),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         _SectionTitle(title: 'Top Cast'),
//                         TextButton(
//                           onPressed: () {},
//                           style: TextButton.styleFrom(
//                             padding: EdgeInsets.zero,
//                             minimumSize: Size.zero,
//                             tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                           ),
//                           child: const Text(
//                             'See all',
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Color(0xFF8B5CF6),
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   SizedBox(
//                     height: 160,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       padding: const EdgeInsets.symmetric(horizontal: 24),
//                       physics: const BouncingScrollPhysics(),
//                       children: const [
//                         _CastCard(
//                           name: 'Tom Holland',
//                           role: 'Peter Parker',
//                           imageUrl: 'https://i.pravatar.cc/300?img=11',
//                         ),
//                         _CastCard(
//                           name: 'Zendaya',
//                           role: 'MJ',
//                           imageUrl: 'https://i.pravatar.cc/300?img=5',
//                         ),
//                         _CastCard(
//                           name: 'Jacob Batalon',
//                           role: 'Ned Leeds',
//                           imageUrl: 'https://i.pravatar.cc/300?img=9',
//                         ),
//                         _CastCard(
//                           name: 'Jon Bernthal',
//                           role: 'Punisher',
//                           imageUrl: 'https://i.pravatar.cc/300?img=13',
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           // ── Details ──
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _SectionTitle(title: 'Details'),
//                   const SizedBox(height: 16),
//                   _InfoRow(label: 'Director', value: 'TBA'),
//                   const SizedBox(height: 10),
//                   _InfoRow(label: 'Studio', value: 'Marvel Studios'),
//                   const SizedBox(height: 10),
//                   _InfoRow(label: 'Language', value: 'English'),
//                 ],
//               ),
//             ),
//           ),

//           // ── Related ──
//           const SliverToBoxAdapter(
//             child: Padding(
//               padding: EdgeInsets.only(top: 32),
//               child: MovieTrend(),
//             ),
//           ),

//           const SliverToBoxAdapter(child: SizedBox(height: 40)),
//         ],
//       ),
//     );
//   }
// }

// // ─── Widgets ───────────────────────────────────────────────────

// class _HeroPoster extends StatelessWidget {
//   final Size size;
//   final String imageUrl;
//   const _HeroPoster({required this.size, required this.imageUrl});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: size.height * 0.58,
//       width: double.infinity,
//       foregroundDecoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             Colors.black.withOpacity(0.3),
//             Colors.transparent,
//             const Color(0xFF0A0A0A).withOpacity(0.8),
//             const Color(0xFF0A0A0A),
//           ],
//           stops: const [0.0, 0.2, 0.7, 1.0],
//         ),
//       ),
//       child: imageUrl.isNotEmpty
//           ? Image.network(
//               imageUrl,
//               fit: BoxFit.cover,
//               alignment: Alignment.topCenter,
//             )
//           : Container(color: const Color(0xFF1C1C1E)),
//     );
//   }
// }

// class _GlassIconButton extends StatelessWidget {
//   final IconData icon;
//   final VoidCallback onTap;
//   const _GlassIconButton({required this.icon, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 40,
//         height: 40,
//         decoration: BoxDecoration(
//           color: Colors.black.withOpacity(0.3),
//           shape: BoxShape.circle,
//           border: Border.all(color: Colors.white.withOpacity(0.1), width: 0.5),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.2),
//               blurRadius: 10,
//               offset: const Offset(0, 4),
//             ),
//           ],
//         ),
//         child: Icon(icon, color: Colors.white, size: 18),
//       ),
//     );
//   }
// }

// class _PlayButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {},
//       child: Container(
//         width: 72,
//         height: 72,
//         decoration: BoxDecoration(
//           color: Colors.white.withOpacity(0.15),
//           shape: BoxShape.circle,
//           border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.4),
//               blurRadius: 20,
//               spreadRadius: 2,
//             ),
//           ],
//         ),
//         child: const Icon(
//           Icons.play_arrow_rounded,
//           color: Colors.white,
//           size: 36,
//         ),
//       ),
//     );
//   }
// }

// class _MetaBadge extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final Color? color;
//   const _MetaBadge({required this.icon, required this.label, this.color});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Icon(icon, color: color ?? Colors.grey[400], size: 14),
//         const SizedBox(width: 4),
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 13,
//             color: color ?? Colors.grey[300],
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _FilledTag extends StatelessWidget {
//   final String label;
//   const _FilledTag({required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.08),
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: Colors.white.withOpacity(0.08), width: 1),
//       ),
//       child: Text(
//         label,
//         style: const TextStyle(
//           fontSize: 12,
//           color: Colors.white,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     );
//   }
// }

// class _MainActionButton extends StatelessWidget {
//   final String label;
//   final IconData icon;
//   final VoidCallback onTap;
//   const _MainActionButton({
//     required this.label,
//     required this.icon,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: 52,
//         decoration: BoxDecoration(
//           color: const Color(0xFF7C3AED),
//           borderRadius: BorderRadius.circular(14),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, color: Colors.white, size: 22),
//             const SizedBox(width: 8),
//             Text(
//               label,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _SecondaryActionButton extends StatelessWidget {
//   final String label;
//   final IconData icon;
//   final VoidCallback onTap;
//   const _SecondaryActionButton({
//     required this.label,
//     required this.icon,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: 52,
//         decoration: BoxDecoration(
//           color: Colors.white.withOpacity(0.08),
//           borderRadius: BorderRadius.circular(14),
//           border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, color: Colors.white, size: 20),
//             const SizedBox(width: 8),
//             Text(
//               label,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 15,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _SectionTitle extends StatelessWidget {
//   final String title;
//   const _SectionTitle({required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       title,
//       style: const TextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.w800,
//         color: Colors.white,
//         letterSpacing: -0.3,
//       ),
//     );
//   }
// }

// class _CastCard extends StatelessWidget {
//   final String name;
//   final String role;
//   final String imageUrl;
//   const _CastCard({
//     required this.name,
//     required this.role,
//     required this.imageUrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 100,
//       margin: const EdgeInsets.only(right: 16),
//       child: Column(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(14),
//             child: Image.network(
//               imageUrl,
//               width: 100,
//               height: 100,
//               fit: BoxFit.cover,
//             ),
//           ),
//           const SizedBox(height: 10),
//           Text(
//             name,
//             style: const TextStyle(
//               fontSize: 13,
//               color: Colors.white,
//               fontWeight: FontWeight.w600,
//             ),
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 2),
//           Text(
//             role,
//             style: TextStyle(fontSize: 12, color: Colors.grey[500]),
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _InfoRow extends StatelessWidget {
//   final String label;
//   final String value;
//   const _InfoRow({required this.label, required this.value});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           width: 80,
//           child: Text(
//             label,
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.grey[500],
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//         Expanded(
//           child: Text(
//             value,
//             style: const TextStyle(
//               fontSize: 14,
//               color: Colors.white,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice_ui/apps/movieapp/utils/movie_trend.dart';

// ── TMDB Genre ID map (common genres) ──
const Map<int, String> _genreMap = {
  28: 'Action',
  12: 'Adventure',
  16: 'Animation',
  35: 'Comedy',
  80: 'Crime',
  99: 'Documentary',
  18: 'Drama',
  10751: 'Family',
  14: 'Fantasy',
  36: 'History',
  27: 'Horror',
  10402: 'Music',
  9648: 'Mystery',
  10749: 'Romance',
  878: 'Sci-Fi',
  10770: 'TV Movie',
  53: 'Thriller',
  10752: 'War',
  37: 'Western',
  10759: 'Action & Adventure',
  10762: 'Kids',
  10763: 'News',
  10764: 'Reality',
  10765: 'Sci-Fi & Fantasy',
  10766: 'Soap',
  10767: 'Talk',
  10768: 'War & Politics',
};

class MovieDetailPage extends StatefulWidget {
  final Map<String, dynamic> movie;
  const MovieDetailPage({super.key, required this.movie});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  bool _isLoadingExtras = true;
  List<Map<String, dynamic>> _cast = [];
  String _runtime = 'TBA';
  String _studio = 'TBA';
  List<String> _genres = [];
  String _director = 'TBA';

  // ── Basic getters from passed movie map ──
  String get _title =>
      widget.movie['title'] ?? widget.movie['name'] ?? 'Unknown';

  String get _posterUrl {
    final path = widget.movie['poster_path'] ?? widget.movie['backdrop_path'];
    if (path != null && path.toString().isNotEmpty) {
      return 'https://image.tmdb.org/t/p/w500$path';
    }
    return widget.movie['imageUrl'] ?? '';
  }

  double get _rating =>
      (widget.movie['vote_average'] as num?)?.toDouble() ??
      (widget.movie['rating'] as num?)?.toDouble() ??
      0.0;

  String get _year {
    final date =
        widget.movie['release_date'] ?? widget.movie['first_air_date'] ?? '';
    if (date.toString().isNotEmpty) {
      final parsed = DateTime.tryParse(date.toString());
      return parsed?.year.toString() ?? 'TBD';
    }
    return widget.movie['year']?.toString() ?? 'TBD';
  }

  String get _synopsis =>
      (widget.movie['overview']?.toString().isNotEmpty == true)
      ? widget.movie['overview']
      : "A forgotten hero faces mounting pressure and a powerful new enemy emerges in this thrilling adventure.";

  bool get _isMovie => widget.movie['title'] != null;
  String get _mediaType => _isMovie ? 'movie' : 'tv';

  @override
  void initState() {
    super.initState();
    _loadExtras();
  }

  // ── Fetch cast, runtime, studio, genres & director ──
  Future<void> _loadExtras() async {
    final movieId = widget.movie['id'];
    if (movieId == null) {
      _fallbackGenres();
      setState(() => _isLoadingExtras = false);
      return;
    }

    try {
      // TODO: Replace YOUR_API_KEY with your TMDB key or import from all_api_link.dart
      const apiKey = "b29feca7df52a803ebea1a9800cf3ec3";
      final creditsUrl =
          'https://api.themoviedb.org/3/$_mediaType/$movieId/credits?api_key=$apiKey';
      final detailsUrl =
          'https://api.themoviedb.org/3/$_mediaType/$movieId?api_key=$apiKey';

      final responses = await Future.wait([
        http.get(Uri.parse(creditsUrl)),
        http.get(Uri.parse(detailsUrl)),
      ]);

      if (!mounted) return;

      // ── Parse Credits ──
      if (responses[0].statusCode == 200) {
        final data = jsonDecode(responses[0].body);
        final castList = data['cast'] as List<dynamic>? ?? [];
        _cast = castList
            .take(12)
            .map(
              (c) => {
                'name': c['name'] ?? 'Unknown',
                'role':
                    c['character'] ?? c['roles']?[0]?['character'] ?? 'Unknown',
                'imageUrl': c['profile_path'] != null
                    ? 'https://image.tmdb.org/t/p/w200${c['profile_path']}'
                    : '',
              },
            )
            .toList();

        final crew = data['crew'] as List<dynamic>? ?? [];
        final dir = crew.firstWhere(
          (c) => c['job'] == 'Director',
          orElse: () => null,
        );
        if (dir != null) _director = dir['name'];
      }

      // ── Parse Details ──
      if (responses[1].statusCode == 200) {
        final data = jsonDecode(responses[1].body);
        final mins = data['runtime'] as int? ?? data['episode_run_time']?[0];
        if (mins != null && mins > 0) {
          final h = mins ~/ 60;
          final m = mins % 60;
          _runtime = h > 0 ? '${h}h ${m}m' : '${m}m';
        }

        final companies = data['production_companies'] as List<dynamic>? ?? [];
        if (companies.isNotEmpty) {
          _studio = companies[0]['name']?.toString() ?? 'TBA';
        }

        final genreList = data['genres'] as List<dynamic>? ?? [];
        _genres = genreList.map((g) => g['name'].toString()).toList();
      }

      if (_genres.isEmpty) _fallbackGenres();
    } catch (e) {
      _fallbackGenres();
    }

    if (mounted) setState(() => _isLoadingExtras = false);
  }

  void _fallbackGenres() {
    final ids = widget.movie['genre_ids'] as List<dynamic>? ?? [];
    _genres = ids
        .map((id) => _genreMap[id as int])
        .whereType<String>()
        .toList();
    if (_genres.isEmpty) _genres = ['Action', 'Fantasy', 'Adventure'];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // ── Hero ──
          SliverToBoxAdapter(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                _HeroPoster(size: size, imageUrl: _posterUrl),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.2),
                          Colors.transparent,
                          const Color(0xFF0A0A0A).withOpacity(0.4),
                          const Color(0xFF0A0A0A),
                        ],
                        stops: const [0.0, 0.25, 0.6, 1.0],
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _GlassIconButton(
                          icon: Icons.arrow_back_ios_new_rounded,
                          onTap: () => Navigator.pop(context),
                        ),
                        Row(
                          children: [
                            _GlassIconButton(
                              icon: Icons.bookmark_border_rounded,
                              onTap: () {},
                            ),
                            const SizedBox(width: 10),
                            _GlassIconButton(
                              icon: Icons.share_outlined,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.18,
                  left: 0,
                  right: 0,
                  child: const Center(child: _PlayButton()),
                ),
                Positioned(
                  bottom: -40,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _title,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            letterSpacing: -0.5,
                            height: 1.1,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            _MetaBadge(
                              icon: Icons.star_rounded,
                              label: _rating.toStringAsFixed(1),
                              color: Colors.amber,
                            ),
                            const SizedBox(width: 12),
                            _MetaBadge(
                              icon: Icons.schedule_rounded,
                              label: _runtime,
                            ),
                            const SizedBox(width: 12),
                            _MetaBadge(
                              icon: Icons.calendar_today_rounded,
                              label: _year,
                            ),
                            const SizedBox(width: 12),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Text(
                                'HD',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: _genres
                              .map((g) => _FilledTag(label: g))
                              .toList(),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: _MainActionButton(
                                label: 'Watch Now',
                                icon: Icons.play_arrow_rounded,
                                onTap: () {},
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              flex: 2,
                              child: _SecondaryActionButton(
                                label: 'Download',
                                icon: Icons.download_rounded,
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 60)),

          // ── Synopsis ──
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _SectionTitle(title: 'Synopsis'),
                  const SizedBox(height: 12),
                  Text(
                    _synopsis,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[400],
                      height: 1.7,
                      letterSpacing: 0.1,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Cast (dynamic + circular) ──
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const _SectionTitle(title: 'Top Cast'),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: const Text(
                            'See all',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF8B5CF6),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 160,
                    child: _isLoadingExtras
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Color(0xFF7C3AED),
                              strokeWidth: 2,
                            ),
                          )
                        : _cast.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              'No cast information available',
                              style: TextStyle(color: Colors.grey[500]),
                            ),
                          )
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            physics: const BouncingScrollPhysics(),
                            itemCount: _cast.length,
                            itemBuilder: (context, index) {
                              final c = _cast[index];
                              return _CastCard(
                                name: c['name'],
                                role: c['role'],
                                imageUrl: c['imageUrl'],
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),

          // ── Details ──
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _SectionTitle(title: 'Details'),
                  const SizedBox(height: 16),
                  _InfoRow(label: 'Director', value: _director),
                  const SizedBox(height: 10),
                  _InfoRow(label: 'Studio', value: _studio),
                  const SizedBox(height: 10),
                  _InfoRow(
                    label: 'Language',
                    value: (widget.movie['original_language'] ?? 'en')
                        .toString()
                        .toUpperCase(),
                  ),
                ],
              ),
            ),
          ),

          // ── Related ──
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 32),
              child: MovieTrend(),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }
}

// ─── Widgets ───────────────────────────────────────────────────

class _HeroPoster extends StatelessWidget {
  final Size size;
  final String imageUrl;
  const _HeroPoster({required this.size, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.58,
      width: double.infinity,
      foregroundDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.3),
            Colors.transparent,
            const Color(0xFF0A0A0A).withOpacity(0.8),
            const Color(0xFF0A0A0A),
          ],
          stops: const [0.0, 0.2, 0.7, 1.0],
        ),
      ),
      child: imageUrl.isNotEmpty
          ? Image.network(
              imageUrl,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            )
          : Container(color: const Color(0xFF1C1C1E)),
    );
  }
}

class _GlassIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _GlassIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withOpacity(0.1), width: 0.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 72,
        height: 72,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        child: const Icon(
          Icons.play_arrow_rounded,
          color: Colors.white,
          size: 36,
        ),
      ),
    );
  }
}

class _MetaBadge extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;
  const _MetaBadge({required this.icon, required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color ?? Colors.grey[400], size: 14),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: color ?? Colors.grey[300],
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _FilledTag extends StatelessWidget {
  final String label;
  const _FilledTag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withOpacity(0.08), width: 1),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _MainActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  const _MainActionButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: const Color(0xFF7C3AED),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 22),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SecondaryActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  const _SecondaryActionButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w800,
        color: Colors.white,
        letterSpacing: -0.3,
      ),
    );
  }
}

class _CastCard extends StatelessWidget {
  final String name;
  final String role;
  final String imageUrl;
  const _CastCard({
    required this.name,
    required this.role,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          // ── CIRCLE IMAGE ──
          ClipOval(
            child: imageUrl.isNotEmpty
                ? Image.network(
                    imageUrl,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 100,
                      height: 100,
                      color: const Color(0xFF2A2A2A),
                      child: const Icon(Icons.person, color: Colors.white54),
                    ),
                  )
                : Container(
                    width: 100,
                    height: 100,
                    color: const Color(0xFF2A2A2A),
                    child: const Icon(Icons.person, color: Colors.white54),
                  ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 2),
          Text(
            role,
            style: TextStyle(fontSize: 12, color: Colors.grey[500]),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
