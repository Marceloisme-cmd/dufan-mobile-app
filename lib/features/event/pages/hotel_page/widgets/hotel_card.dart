import 'package:flutter/material.dart';

import '../pages/hotel_detail_page.dart';

class HotelCard extends StatelessWidget {
  final Map<String, dynamic> hotel;

  const HotelCard({
    super.key,
    required this.hotel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => HotelDetailPage(
              hotel: hotel,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.06),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ================= IMAGE =================
            Stack(
              children: [
                Hero(
                  tag: hotel['name'],
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                    child: Image.asset(
                      hotel['image'],
                      width: double.infinity,
                      height: 220,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                /// Gradient
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black54,
                        ],
                      ),
                    ),
                  ),
                ),

                /// Badge
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.white,
                          size: 16,
                        ),
                        SizedBox(width: 6),
                        Text(
                          "Tersedia",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// Nama Hotel
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hotel['name'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 18,
                          ),

                          const SizedBox(width: 4),

                          Expanded(
                            child: Text(
                              hotel['distance'],
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            /// ================= CONTENT =================
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),

                      const SizedBox(width: 5),

                      Text(
                        hotel['rating'].toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      const Spacer(),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "Mulai dari",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),

                          Text(
                            "${hotel['price']} / malam",
                            style: const TextStyle(
                              color: Color(0xFFEF4444),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Text(
                    hotel['description'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}