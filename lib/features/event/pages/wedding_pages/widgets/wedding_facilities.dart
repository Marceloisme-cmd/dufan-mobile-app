import 'package:flutter/material.dart';

class WeddingFacilities extends StatelessWidget {
  const WeddingFacilities({super.key});

  @override
  Widget build(BuildContext context) {
    final facilities = [
      {"icon": Icons.auto_awesome, "title": "Dekorasi"},
      {"icon": Icons.restaurant, "title": "Katering"},
      {"icon": Icons.photo_camera, "title": "Dokumentasi"},
      {"icon": Icons.music_note, "title": "Sound System"},
      {"icon": Icons.record_voice_over, "title": "MC"},
      {"icon": Icons.weekend, "title": "Ruang Pengantin"},
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Fasilitas Paket",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: facilities.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              childAspectRatio: 3.2,
            ),
            itemBuilder: (context, index) {
              final item = facilities[index];

              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: const Color(0xFFFEE2E2),
                      child: Icon(
                        item["icon"] as IconData,
                        color: const Color(0xFFEF4444),
                        size: 20,
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: Text(
                        item["title"] as String,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
