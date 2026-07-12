import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/event.dart';

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: const LinearGradient(
                colors: [Color(0xFF9C4DFF), Color(0xFFFF4FB1)],
              ),
            ),
            padding: const EdgeInsets.all(8),
            child: SvgPicture.asset(event.iconPath),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  event.time,
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF1F1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Remind',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
