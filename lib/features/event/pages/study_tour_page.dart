import 'package:flutter/material.dart';

class StudyTourPage extends StatelessWidget {
  const StudyTourPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Study Tour"), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.school_rounded, size: 90, color: Colors.blue.shade400),

              const SizedBox(height: 24),

              const Text(
                "Halaman Dalam Pengembangan",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              const Text(
                "Fitur Study Tour sedang kami kembangkan untuk memudahkan sekolah atau instansi dalam melakukan reservasi kunjungan edukasi ke Dufan.\n\nSilakan kembali pada pembaruan berikutnya.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.grey, height: 1.6),
              ),

              const SizedBox(height: 30),

              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
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
