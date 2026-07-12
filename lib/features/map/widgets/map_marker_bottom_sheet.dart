import 'package:flutter/material.dart';
import '../../home/models/attraction.dart';

void showMapMarkerBottomSheet(BuildContext context, Attraction attraction) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                attraction.image,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 12),

            // NAME
            Text(
              attraction.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 6),

            // RATING + QUEUE
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 18),
                Text("${attraction.rating}"),
                const SizedBox(width: 12),
                const Icon(Icons.access_time, size: 18),
                Text("${attraction.queueTime} min"),
              ],
            ),

            const SizedBox(height: 10),

            // DESCRIPTION
            Text(
              attraction.description,
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 16),
          ],
        ),
      );
    },
  );
}
