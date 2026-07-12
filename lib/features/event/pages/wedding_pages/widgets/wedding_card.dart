import 'package:flutter/material.dart';

import '../../wedding_pages/wedding_page/wedding_detail_page.dart';

class WeddingCard extends StatelessWidget {
  final Map<String, dynamic> wedding;

  const WeddingCard({super.key, required this.wedding});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => WeddingDetailPage(wedding: wedding),
          ),
        );
      },
      child: Hero(
        tag: wedding['name'],
        child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // IMAGE
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                  child: Image.asset(
                    wedding['image'],
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        wedding['name'],
                        style: const TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),

                          const SizedBox(width: 4),

                          Text(
                            "${wedding['rating']}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      Text(
                        wedding['description'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          height: 1.5,
                        ),
                      ),

                      const SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Mulai dari",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),

                              Text(
                                wedding['price'],
                                style: const TextStyle(
                                  color: Color(0xFFEF4444),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEF4444),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Row(
                              children: [
                                Text(
                                  "Lihat Detail",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                SizedBox(width: 6),

                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
