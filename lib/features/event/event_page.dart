import 'package:flutter/material.dart';

import '../event/pages/ai_assistant_page/ai_assistant_page.dart';
import '../../features/event/pages/hotel_page/pages/hotel_page.dart';
import 'pages/study_tour_page.dart';
import '../../features/event/pages/wedding_pages/wedding_page/wedding_page.dart';
import '../event/pages/explore_by_page.dart/explore_by_page.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),

      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        toolbarHeight: 90,

        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFEF4444), Color(0xFFEF4444)],
            ),
          ),
        ),

        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Jelajahi Dufan",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Temukan berbagai acara dan layanan di sekitar Dufan.",
              style: TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 20, 18, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Layanan populer",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: _menuCard(
                    context,
                    title: "Dufan\nAsisten AI",
                    subtitle: "Tanya apapun tentang explorasi anda",
                    image: "assets/images/dufanai.jpg",
                    height: 185,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AiAssistantPage(),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: _menuCard(
                    context,
                    title: "Reservasi\nHotel",
                    subtitle: "Menginap didekat Wisata Ancol.",
                    image: "assets/images/hotel.png",
                    height: 185,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const HotelPage()),
                      );
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Text(
              "Acara",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            _menuCard(
              context,
              title: "Jelajahi Acara",
              subtitle: "Temukan berbagai acara di sekitar Dufan & Ancol.",
              image: "assets/images/explore_area.jpg",
              height: 230,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ExploreByPage()),
                );
              },
            ),

            const SizedBox(height: 24),

            const Text(
              "Layanan lain",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: _menuCard(
                    context,
                    title: "Tur\nstudy",
                    subtitle: "Tur belajar anak",
                    image: "assets/images/studytour.jpg",
                    height: 185,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const StudyTourPage(),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: _menuCard(
                    context,
                    title: "Wedding",
                    subtitle: "Rayakan hari spesialmu ditempat yang indah",
                    image: "assets/images/wedding.jpg",
                    height: 185,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const WeddingPage()),
                      );
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _menuCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String image,
    required double height,
    required VoidCallback onTap,
  }) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: onTap,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(image, fit: BoxFit.cover),

              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(.35),
                      Colors.black.withOpacity(.85),
                    ],
                    stops: const [0.25, 0.65, 1],
                  ),
                ),
              ),

              Positioned(
                top: 16,
                right: 16,
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.18),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),

              Positioned(
                left: 18,
                right: 18,
                bottom: 18,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
