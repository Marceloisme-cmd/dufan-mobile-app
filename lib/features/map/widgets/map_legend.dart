import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapLegend extends StatelessWidget {
  final int totalItems;

  const MapLegend({super.key, required this.totalItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 16,
            color: Colors.black.withOpacity(0.08),
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔥 TITLE
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Info Marker",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              Text(
                "$totalItems lokasi",
                style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // 🔥 ITEMS
          Row(
            children: [
              _legendItem(
                icon: 'assets/icons/marker.svg',
                label: "Wahana",
                color: const Color(0xFFEF4444),
              ),

              const SizedBox(width: 18),

              _legendItem(
                icon: 'assets/icons/event_marker.svg',
                label: "Event",
                color: const Color(0xFF3B82F6),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 🔥 LEGEND ITEM
  Widget _legendItem({
    required String icon,
    required String label,
    required Color color,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: color.withOpacity(0.08),
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset(icon, width: 18, height: 18),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color(0xFF334155),
          ),
        ),
      ],
    );
  }
}
