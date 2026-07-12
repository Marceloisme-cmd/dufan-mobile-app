import 'package:flutter/material.dart';

class EventDetailPage extends StatelessWidget {
  final String name;
  final String image;
  final double rating;
  final String date;
  final String description;

  const EventDetailPage({
    super.key,
    required this.name,
    required this.image,
    required this.rating,
    required this.date,
    required this.description,
  });

  void _showReminder(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Ingatkan Saya",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              ListTile(
                leading: const Icon(Icons.notifications_active),
                title: const Text("Saat event dimulai"),
                onTap: () => Navigator.pop(context),
              ),

              ListTile(
                leading: const Icon(Icons.access_time),
                title: const Text("1 jam sebelumnya"),
                onTap: () => Navigator.pop(context),
              ),

              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text("1 hari sebelumnya"),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // HEADER IMAGE
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false, // Menjaga judul agar tidak bergeser ke tengah
              titlePadding: const EdgeInsets.only(
                left: 16, // Jarak aman dari tepi kiri gambar
                bottom: 16, // Jarak aman dari tepi bawah gambar
                right: 16, // Jarak aman dari tepi kanan jika teks panjang
              ),
              // PERBAIKAN STYLING JUDUL
              title: Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold, // Membuat teks lebih tegas
                  fontSize: 20, // Ukuran ideal untuk judul aplikasi modern
                  shadows: [
                    Shadow(
                      offset: const Offset(0, 2), // Posisi bayangan (x, y)
                      blurRadius: 4.0, // Kelembutan bayangan
                      color: Colors.black.withOpacity(0.6), // Warna bayangan
                    ),
                  ],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(image, fit: BoxFit.cover),

                  // OPTIMALISASI GRADASI HITAM
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: const Alignment(
                          0.0,
                          0.0,
                        ), // Gradasi dimulai halus dari tengah gambar
                        end: Alignment
                            .bottomCenter, // Gelap pekat di bagian bawah (area judul)
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(
                            0.8,
                          ), // Dinaikkan ke 0.8 agar teks putih makin menonjol
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // CONTENT (Bagian ini tetap utuh, tidak ada perubahan)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // INFO ROW
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 18),
                      const SizedBox(width: 4),
                      Text(rating.toString()),

                      const SizedBox(width: 16),

                      const Icon(Icons.calendar_today, size: 16),
                      const SizedBox(width: 4),
                      Text(date),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // DESCRIPTION TITLE
                  const Text(
                    "Tentang Event",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // BUTTON
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () => _showReminder(context),
                      icon: const Icon(Icons.notifications_active),
                      label: const Text("Ingatkan Saya"),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // INFO CARD
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.info_outline),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Kamu akan mendapat pengingat sebelum event dimulai",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
