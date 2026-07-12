import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../event/data/exploredata_by.dart';
import '../../event/pages/event_detail_page.dart';

class HeroBanner extends StatefulWidget {
  const HeroBanner({super.key});

  @override
  State<HeroBanner> createState() => _HeroBannerState();
}

class _HeroBannerState extends State<HeroBanner> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.88);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> allEvents = [
      ...?EventArea['Ancol Area'],
      ...?EventArea['Dufan'],
      ...?EventArea['Nearby Events'],
    ];

    return Column(
      children: [
        SizedBox(
          height: 320,
          child: PageView.builder(
            controller: _controller,
            itemCount: allEvents.length,
            physics: const BouncingScrollPhysics(),

            itemBuilder: (context, index) {
              final event = allEvents[index];

              return AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  double scale = 1.0;

                  if (_controller.position.haveDimensions) {
                    scale = (1 - ((_controller.page ?? 0) - index).abs() * 0.08)
                        .clamp(0.92, 1.0);
                  }

                  return Transform.scale(scale: scale, child: child);
                },

                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EventDetailPage(
                          name: event['name'],
                          image: event['image'],
                          rating: event['rating'],
                          date: event['date'],
                          description: event['description'],
                        ),
                      ),
                    );
                  },

                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: .18),
                            blurRadius: 18,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(28),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(event['image'], fit: BoxFit.cover),

                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withValues(alpha: .85),
                                    Colors.black.withValues(alpha: .35),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),

                            Positioned(
                              top: 18,
                              left: 18,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 7,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Text(
                                  "EVENT",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),

                            Positioned(
                              left: 20,
                              right: 20,
                              bottom: 22,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    event['name'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 6),

                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.calendar_today,
                                        color: Colors.white70,
                                        size: 15,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        event['date'],
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 14),

                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 9,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Explore",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(width: 6),
                                        Icon(Icons.arrow_forward, size: 18),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 18),

        SmoothPageIndicator(
          controller: _controller,
          count: allEvents.length,
          effect: WormEffect(
            dotHeight: 8,
            dotWidth: 8,
            spacing: 8,
            activeDotColor: Colors.redAccent,
            dotColor: Colors.grey.shade300,
          ),
        ),
      ],
    );
  }
}
