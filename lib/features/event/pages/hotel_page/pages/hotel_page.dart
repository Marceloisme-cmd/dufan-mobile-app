import 'package:flutter/material.dart';

import '../../../data/event_data.dart';
import '../../hotel_page/widgets/hotel_card.dart';

class HotelPage extends StatelessWidget {
  const HotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    final hotels = events['Hotels']!;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Hotel",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.hotel_rounded,
                      color: Color(0xFFEF4444),
                      size: 30,
                    ),

                    SizedBox(width: 10),

                    Text(
                      "Hotel & Resort",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                const Text(
                  "Pilih hotel terbaik di sekitar kawasan Dufan dan Ancol untuk pengalaman menginap yang nyaman.",
                  style: TextStyle(color: Colors.grey, height: 1.5),
                ),

                const SizedBox(height: 16),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEF4444).withOpacity(.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "${hotels.length} Hotel Tersedia",
                    style: const TextStyle(
                      color: Color(0xFFEF4444),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: hotels.length,
              separatorBuilder: (_, __) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                return HotelCard(hotel: hotels[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
