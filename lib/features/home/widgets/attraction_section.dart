import 'package:flutter/material.dart';
import 'attraction_card.dart';

class AttractionSection extends StatelessWidget {
  const AttractionSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Data list yang disesuaikan persis dengan warna gradasi pada gambar
    final List<Attraction> sampleAttractions = [
      Attraction(
        name: 'Halilintar',
        category: 'Extreme',
        rating: 4.8,
        queueTime: 15,
        minHeight: 140,
        iconPath: 'assets/icons/halilintar.svg', // Sesuaikan dengan path asset Anda
        gradientColors: [const Color(0xFFFF4E31), const Color(0xFFFF7600)],
      ),
      Attraction(
        name: 'Bianglala',
        category: 'Family',
        rating: 4.6,
        queueTime: 10,
        minHeight: 120,
        iconPath: 'assets/icons/bianglala.svg',
        gradientColors: [const Color(0xFF3B9DFF), const Color(0xFF00C4FF)],
      ),
      Attraction(
        name: 'Hysteria',
        category: 'Extreme',
        rating: 4.9,
        queueTime: 20,
        minHeight: 140,
        iconPath: 'assets/icons/hysteria.svg',
        gradientColors: [const Color(0xFFD946EF), const Color(0xFFA855F7)],
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header: Title & See All
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.trending_up_rounded,
                    color: Color(0xFFEF4444),
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Popular Attractions',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(50, 30),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text(
                  'See All',
                  style: TextStyle(
                    color: Color(0xFFEF4444),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),

        // List Item
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: sampleAttractions.length,
          itemBuilder: (context, index) {
            return AttractionCard(attraction: sampleAttractions[index]);
          },
        ),
      ],
    );
  }
}
