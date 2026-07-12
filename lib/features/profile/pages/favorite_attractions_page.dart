import 'package:flutter/material.dart';

class FavoriteAttractionsPage extends StatelessWidget {
  const FavoriteAttractionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wahana Favorit"), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.construction_rounded,
                size: 90,
                color: Colors.orange.shade400,
              ),

              const SizedBox(height: 24),

              const Text(
                "Halaman Dalam Pengembangan",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              const Text(
                "Fitur Wahana Favorit sedang kami kembangkan agar dapat memberikan pengalaman yang lebih baik.\n\nSilakan kembali lagi pada pembaruan berikutnya.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.grey, height: 1.6),
              ),

              const SizedBox(height: 30),

              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text("Kembali"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEF4444),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
