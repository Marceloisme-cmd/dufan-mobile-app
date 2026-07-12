import 'package:flutter/material.dart';

import '../../../data/hotel_facility_helper.dart';

class HotelFacilities extends StatelessWidget {
  final Map<String, dynamic> hotel;

  const HotelFacilities({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final facilities = hotel['facilities'] as List;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 12),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Fasilitas",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: facilities.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: .9,
            ),
            itemBuilder: (context, index) {
              final item = facilities[index];

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: const Color(0xFFEF4444).withOpacity(.1),
                    child: Icon(
                      HotelFacilityHelper.getIcon(item),
                      color: const Color(0xFFEF4444),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    HotelFacilityHelper.getTitle(item),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
