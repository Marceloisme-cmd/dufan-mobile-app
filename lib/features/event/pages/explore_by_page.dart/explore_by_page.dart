import 'package:flutter/material.dart';
import '../event_detail_page.dart';
import '../../data/exploredata_by.dart';

class ExploreByPage extends StatelessWidget {
  const ExploreByPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = EventArea.keys.toList();

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),

        // 🔥 APPBAR CLEAN
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Events",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),

          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(62),
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),

              child: TabBar(
                isScrollable: true,
                dividerColor: Colors.transparent,

                // 🔥 CLEAN PILL INDICATOR (NO “NABRAK” FEEL)
                indicator: BoxDecoration(
                  color: const Color(0xFFEF4444),
                  borderRadius: BorderRadius.circular(30),
                ),

                indicatorSize: TabBarIndicatorSize.tab,

                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey.shade600,
                labelStyle: const TextStyle(fontWeight: FontWeight.w600),

                tabs: tabs.map((e) {
                  IconData icon;

                  switch (e) {
                    case "Ancol Area":
                      icon = Icons.beach_access;
                      break;
                    case "Dufan Area":
                      icon = Icons.celebration;
                      break;
                    case "Nearby Events":
                      icon = Icons.location_on;
                      break;
                    default:
                      icon = Icons.event;
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(icon, size: 16),
                        const SizedBox(width: 6),
                        Text(e),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),

        body: TabBarView(
          children: tabs.map((category) {
            final list = EventArea[category]!;

            return ListView.builder(
              padding: const EdgeInsets.only(top: 12, bottom: 20),
              itemCount: list.length,
              itemBuilder: (context, index) {
                final event = list[list.length - 1 - index];

                return GestureDetector(
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

                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    height: 220,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.asset(
                              event['image'],
                              fit: BoxFit.cover,
                            ),
                          ),

                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.75),
                                ],
                              ),
                            ),
                          ),

                          Positioned(
                            left: 16,
                            right: 16,
                            bottom: 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  event['name'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                Row(
                                  children: [
                                    _buildBadge(
                                      Icons.star,
                                      event['rating'].toString(),
                                    ),
                                    const SizedBox(width: 10),
                                    _buildBadge(
                                      Icons.calendar_today,
                                      event['date'],
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
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  // 🔥 BADGE WIDGET
  Widget _buildBadge(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 14),
          const SizedBox(width: 4),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}
