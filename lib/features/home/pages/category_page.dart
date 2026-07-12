import 'package:flutter/material.dart';
import 'package:dufan_app/core/enums/attraction_category.dart';

import '../data/attractions_data.dart';
import '../models/attraction.dart';
import 'attraction_detail_page.dart';

class CategoryPage extends StatelessWidget {
  final AttractionCategory category;

  const CategoryPage({super.key, required this.category});

  String _categoryDescription() {
    switch (category) {
      case AttractionCategory.ekstrim:
        return "Rasakan sensasi adrenalin dengan wahana paling menantang di Dufan.";

      case AttractionCategory.keluarga:
        return "Nikmati waktu berkualitas bersama keluarga dengan wahana yang menyenangkan.";

      case AttractionCategory.anak:
        return "Area bermain yang aman dan penuh keseruan untuk si kecil.";

      case AttractionCategory.air:
        return "Segarkan harimu dengan berbagai wahana air yang seru.";
    }
  }

  @override
  Widget build(BuildContext context) {
    final rides = attractions.where((e) => e.category == category).toList();

    final Attraction featured = rides.first;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),

      body: Column(
        children: [
          // ===========================
          // HEADER
          // ===========================
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              left: 22,
              right: 22,
              top: 56,
              bottom: 28,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFEF4444), Color(0xFFFB7185)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(34)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 46,
                    width: 46,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.18),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                Text(
                  category.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  _categoryDescription(),
                  style: TextStyle(
                    color: Colors.white.withOpacity(.92),
                    fontSize: 15,
                    height: 1.6,
                  ),
                ),

                const SizedBox(height: 22),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.local_activity,
                        color: Color(0xFFEF4444),
                        size: 20,
                      ),

                      const SizedBox(width: 8),

                      Text(
                        "${rides.length} Wahana Tersedia",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFEF4444),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
              children: [
                const Row(
                  children: [
                    Icon(Icons.workspace_premium, color: Color(0xFFEF4444)),
                    SizedBox(width: 8),
                    Text(
                      "Wahana Pilihan",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                _FeaturedCard(ride: featured),

                const SizedBox(height: 34),

                const Row(
                  children: [
                    Icon(Icons.attractions, color: Color(0xFFEF4444)),
                    SizedBox(width: 8),
                    Text(
                      "Jelajahi Wahana",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                ...rides.map(
                  (ride) => Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: _RideCard(ride: ride),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FeaturedCard extends StatelessWidget {
  final Attraction ride;

  const _FeaturedCard({required this.ride});

  Color _queueColor(int queue) {
    if (queue <= 10) return Colors.green;
    if (queue <= 20) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AttractionDetailPage(
              name: ride.name,
              image: ride.image,
              category: ride.category.name,
              rating: ride.rating,
              queueTime: ride.queueTime,
              minHeight: ride.minHeight,
              description: ride.description,
              position: ride.position,
            ),
          ),
        );
      },
      child: Container(
        height: 310,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.12),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Hero(
                tag: ride.name,
                child: Image.asset(ride.image, fit: BoxFit.cover),
              ),

              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(.12),
                      Colors.black.withOpacity(.35),
                      Colors.black.withOpacity(.85),
                    ],
                  ),
                ),
              ),

              // Badge Kategori
              Positioned(
                top: 18,
                left: 18,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.95),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    ride.category.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),

              // Rating
              Positioned(
                top: 18,
                right: 18,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.amber.withOpacity(.35),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        ride.rating.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                left: 22,
                right: 22,
                bottom: 22,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ride.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: _queueColor(ride.queueTime),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.schedule,
                                size: 16,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                "${ride.queueTime} Menit",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 10),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.height,
                                color: Colors.white,
                                size: 16,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                ride.minHeight == 0
                                    ? "Semua Umur"
                                    : "${ride.minHeight} cm",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),
                    SizedBox(
                      width: 170,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => AttractionDetailPage(
                                name: ride.name,
                                image: ride.image,
                                category: ride.category.name,
                                rating: ride.rating,
                                queueTime: ride.queueTime,
                                minHeight: ride.minHeight,
                                description: ride.description,
                                position: ride.position,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFEF4444),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Lihat Detail",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.white,
                              size: 18,
                            ),
                          ],
                        ),
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

class _RideCard extends StatelessWidget {
  final Attraction ride;

  const _RideCard({required this.ride});

  Color _queueColor(int queue) {
    if (queue <= 10) return Colors.green;
    if (queue <= 20) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AttractionDetailPage(
              name: ride.name,
              image: ride.image,
              category: ride.category.name,
              rating: ride.rating,
              queueTime: ride.queueTime,
              minHeight: ride.minHeight,
              description: ride.description,
              position: ride.position,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.06),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Hero(
              tag: ride.name,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(26),
                  bottomLeft: Radius.circular(26),
                ),
                child: Image.asset(
                  ride.image,
                  width: 125,
                  height: 165,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 16, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ride.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          ride.rating.toString(),
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: _queueColor(ride.queueTime),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.schedule,
                                size: 15,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "${ride.queueTime} Menit",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F5F9),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.height,
                                size: 15,
                                color: Color(0xFF2563EB),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                ride.minHeight == 0
                                    ? "Semua Umur"
                                    : "${ride.minHeight} cm",
                                style: const TextStyle(
                                  color: Color(0xFF2563EB),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEF4444),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
