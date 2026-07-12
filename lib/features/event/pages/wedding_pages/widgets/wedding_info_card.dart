import 'package:flutter/material.dart';

class WeddingInfoCard extends StatelessWidget {
  final Map<String, dynamic> wedding;

  const WeddingInfoCard({super.key, required this.wedding});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),

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
          Text(
            wedding['name'],
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber),

              const SizedBox(width: 6),

              Text(
                "${wedding['rating']}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),

              const Spacer(),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),

                decoration: BoxDecoration(
                  color: const Color(0xFFFEE2E2),

                  borderRadius: BorderRadius.circular(20),
                ),

                child: const Text(
                  "Reservasi",

                  style: TextStyle(
                    color: Color(0xFFEF4444),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          const Text("Harga Mulai", style: TextStyle(color: Colors.grey)),

          const SizedBox(height: 6),

          Text(
            wedding['price'],

            style: const TextStyle(
              color: Color(0xFFEF4444),
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            "Deskripsi",

            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),

          const SizedBox(height: 10),

          Text(
            wedding['description'],

            style: TextStyle(color: Colors.grey.shade700, height: 1.7),
          ),
        ],
      ),
    );
  }
}
