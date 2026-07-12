import 'package:flutter/material.dart';

class HotelBottomBar extends StatelessWidget {
  final String totalPrice;
  final int totalNight;
  final int room;

  final VoidCallback onContinue;
  final bool isEnabled;

  const HotelBottomBar({
    super.key,
    required this.totalPrice,
    required this.totalNight,
    required this.room,
    required this.onContinue,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.06),
              blurRadius: 12,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Total Harga",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    totalPrice,
                    style: const TextStyle(
                      color: Color(0xFFEF4444),
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),

                  const SizedBox(height: 2),

                  Text(
                    "$totalNight malam • $room kamar",
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),

            SizedBox(
              width: 170,
              height: 55,
              child: ElevatedButton(
                onPressed: isEnabled ? onContinue : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEF4444),
                  disabledBackgroundColor: Colors.grey.shade400,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
