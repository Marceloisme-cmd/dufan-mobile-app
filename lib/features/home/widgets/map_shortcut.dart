import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../map/map_page.dart';

class MapShortcut extends StatefulWidget {
  const MapShortcut({super.key});

  @override
  State<MapShortcut> createState() => _MapShortcutState();
}

class _MapShortcutState extends State<MapShortcut>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  final LatLng centerPoint = const LatLng(-6.3024, 106.8203); // contoh Dufan

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    _scaleAnim = Tween<double>(
      begin: 0.98,
      end: 1.02,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnim,
      builder: (context, child) {
        return Transform.scale(scale: _scaleAnim.value, child: child);
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const MapPage()),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFEF4444).withOpacity(0.25),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Stack(
              children: [
                // 🛰️ MINI SATELLITE MAP
                FlutterMap(
                  options: MapOptions(
                    initialCenter: centerPoint,
                    initialZoom: 15,
                    interactionOptions: const InteractionOptions(
                      flags: 0, // ❌ disable gesture
                    ),
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}",
                    ),
                  ],
                ),

                // DARK OVERLAY
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),

                // CONTENT
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(
                          Icons.map_rounded,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),

                      const SizedBox(width: 12),

                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Satellite Map",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Lihat area wahana & event",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                // PULSE DOT
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEF4444),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFEF4444).withOpacity(0.6),
                          blurRadius: 12,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
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
