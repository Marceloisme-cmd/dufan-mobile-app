import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// 1. Deklarasi Model Data Attraction
class Attraction {
  final String name;
  final String category;
  final double rating;
  final int queueTime;
  final int minHeight;
  final String iconPath;
  final List<Color> gradientColors;

  Attraction({
    required this.name,
    required this.category,
    required this.rating,
    required this.queueTime,
    required this.minHeight,
    required this.iconPath,
    required this.gradientColors,
  });
}

// 2. Deklarasi Widget Utama
class AttractionCard extends StatelessWidget {
  final Attraction attraction;

  const AttractionCard({super.key, required this.attraction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: attraction.gradientColors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            padding: const EdgeInsets.all(14),

            // SVG LOGO
            child: Center(
              child: SvgPicture.asset(
                attraction.iconPath,
                width: 40, height:40,
              ),
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  attraction.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E293B),
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  attraction.category,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF94A3B8),
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                      size: 16,
                    ),

                    const SizedBox(width: 3),

                    Text(
                      attraction.rating.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(width: 10),

                    const Icon(
                      Icons.access_time_rounded,
                      size: 14,
                      color: Color(0xFF94A3B8),
                    ),

                    const SizedBox(width: 3),

                    Text(
                      '${attraction.queueTime} min',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF64748B),
                      ),
                    ),

                    const SizedBox(width: 10),

                    const Icon(
                      Icons.people_outline_rounded,
                      size: 14,
                      color: Color(0xFF94A3B8),
                    ),

                    const SizedBox(width: 3),

                    Text(
                      '${attraction.minHeight}cm',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
