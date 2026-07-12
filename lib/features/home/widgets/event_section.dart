import 'package:flutter/material.dart';

import '../models/event.dart';
import 'event_card.dart';

class EventSection extends StatelessWidget {
  const EventSection({super.key});

  @override
  Widget build(BuildContext context) {
    final events = [
      const Event(
        title: 'Ancol Fireworks',
        time: '19:00',
        iconPath: 'assets/icons/fireworks.svg',
      ),

      const Event(
        title: 'Biokids Color',
        time: '17:00',
        iconPath: 'assets/icons/biokids.svg',
      ),

      const Event(
        title: 'Ancol Move n’ Fit',
        time: '15:30',
        iconPath: 'assets/icons/move.svg',
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Today's Events",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),

              TextButton(
                onPressed: () {},
                child: const Text(
                  'View All',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          ...events.map((event) => EventCard(event: event)),
        ],
      ),
    );
  }
}
