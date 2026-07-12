import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dufan_app/features/home/pages/category_page.dart';
import 'package:dufan_app/features/home/pages/all_categories_page.dart';
import 'package:dufan_app/core/enums/attraction_category.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'type': AttractionCategory.ekstrim,
        'icon': 'assets/icons/extreme_logo.svg',
        'color': const Color(0xFFEF4444), // merah
      },
      {
        'type': AttractionCategory.anak,
        'icon': 'assets/icons/kids_logo.svg',
        'color': const Color(0xFF3B82F6), // biru
      },
      {
        'type': AttractionCategory.keluarga,
        'icon': 'assets/icons/family_logo.svg',
        'color': const Color(0xFF10B981), // hijau
      },
      {
        'type': AttractionCategory.air,
        'icon': 'assets/icons/air_logo.svg',
        'color': const Color(0xFF06B6D4), // cyan
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // HEADER (TIDAK DIUBAH)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Wahana Dufan',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AllCategoriesPage(),
                    ),
                  );
                },
                child: const Text('Lihat Semua'),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // ROW CATEGORY (LOGIC TETAP SAMA)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: categories.map((category) {
              final type = category['type'] as AttractionCategory;
              final color = category['color'] as Color;

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CategoryPage(category: type),
                    ),
                  );
                },

                child: Column(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 58,
                      height: 58,
                      padding: const EdgeInsets.all(12),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),

                        // 🔥 WARNA IKUT CATEGORY (SEPERTI ALL CATEGORIES)
                        gradient: LinearGradient(
                          colors: [color.withOpacity(0.18), Colors.white],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),

                        boxShadow: [
                          BoxShadow(
                            color: color.withOpacity(0.12),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),

                      child: SvgPicture.asset(
                        category['icon'] as String,
                        width: 24,
                        height: 24,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      type.name,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF334155),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
