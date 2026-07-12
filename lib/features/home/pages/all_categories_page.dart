import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'category_page.dart';
import '../../../core/enums/attraction_category.dart';

class AllCategoriesPage extends StatelessWidget {
  const AllCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'type': AttractionCategory.ekstrim,
        'icon': 'assets/icons/extreme_logo.svg',
        'color': const Color(0xFFEF4444),
      },
      {
        'type': AttractionCategory.anak,
        'icon': 'assets/icons/kids_logo.svg',
        'color': const Color(0xFF3B82F6),
      },
      {
        'type': AttractionCategory.keluarga,
        'icon': 'assets/icons/family_logo.svg',
        'color': const Color(0xFF10B981),
      },
      {
        'type': AttractionCategory.air,
        'icon': 'assets/icons/air_logo.svg',
        'color': const Color(0xFF06B6D4),
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),

      appBar: AppBar(
        title: const Text(
          'All Categories',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];
            final color = category['color'] as Color;

            return _CategoryCard(
              icon: category['icon'] as String,
              color: color,
              label: (category['type'] as AttractionCategory).name,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CategoryPage(
                      category: category['type'] as AttractionCategory,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _CategoryCard extends StatefulWidget {
  final String icon;
  final Color color;
  final String label;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.icon,
    required this.color,
    required this.label,
    required this.onTap,
  });

  @override
  State<_CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<_CategoryCard> {
  double scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => scale = 0.96),
      onTapUp: (_) {
        setState(() => scale = 1.0);
        widget.onTap();
      },
      onTapCancel: () => setState(() => scale = 1.0),

      child: AnimatedScale(
        duration: const Duration(milliseconds: 120),
        scale: scale,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: LinearGradient(
              colors: [widget.color.withOpacity(0.15), Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.color.withOpacity(0.15),
                ),
                child: SvgPicture.asset(widget.icon, width: 42, height: 42),
              ),

              const SizedBox(height: 14),

              Text(
                widget.label.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey.shade800,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
