import 'package:flutter/material.dart';
import '../../map/map_page.dart';
import 'package:latlong2/latlong.dart';

class AttractionDetailPage extends StatelessWidget {
  final String name;
  final String image;
  final String category;
  final double rating;
  final int queueTime;
  final int minHeight;
  final String description;
  final LatLng position;

  const AttractionDetailPage({
    super.key,
    required this.name,
    required this.image,
    required this.category,
    required this.rating,
    required this.queueTime,
    required this.minHeight,
    required this.description,
    required this.position,
  });

  Widget _glassCard(IconData icon, String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFFEF4444), size: 22),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _mapButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MapPage(focusPosition: position, focusName: name),
          ),
        );
      },
      child: Container(
        height: 58,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(
            colors: [Color(0xFFEF4444), Color(0xFFFB7185)],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFEF4444).withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.map_outlined, color: Colors.white),
            SizedBox(width: 10),
            Text(
              "Jelajahi di Map",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HERO
            SizedBox(
              height: 340,
              width: double.infinity,
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
                          Colors.black.withOpacity(0.2),
                          Colors.black.withOpacity(0.75),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    bottom: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            category,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _glassCard(
                          Icons.star,
                          rating.toString(),
                          "Rating",
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _glassCard(
                          Icons.access_time,
                          "$queueTime min",
                          "Queue",
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _glassCard(
                          Icons.height,
                          "$minHeight cm",
                          "Height",
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    "Tentang",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Text(
                      description,
                      style: const TextStyle(
                        fontSize: 15,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // 🔥 FIXED BUTTON (MORE PREMIUM)
                  _mapButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
