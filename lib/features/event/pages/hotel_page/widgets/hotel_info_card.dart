import 'package:flutter/material.dart';

class HotelInfoCard extends StatelessWidget {
  final Map<String, dynamic> hotel;

  const HotelInfoCard({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 12),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber),

              const SizedBox(width: 6),

              Text(
                hotel['rating'].toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              const Spacer(),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "Mulai dari",
                    style: TextStyle(color: Colors.grey),
                  ),

                  Text(
                    "${hotel['price']} / malam",
                    style: const TextStyle(
                      color: Color(0xFFEF4444),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          const Text(
            "Deskripsi",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),

          const SizedBox(height: 10),

          Text(
            hotel['description'],
            style: const TextStyle(height: 1.6, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
