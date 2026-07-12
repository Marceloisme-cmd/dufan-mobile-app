import 'package:flutter/material.dart';

class WeddingBottomBar extends StatelessWidget {
  final String price;
  final bool isEnabled;
  final VoidCallback onSubmit;

  const WeddingBottomBar({
    super.key,
    required this.price,
    required this.isEnabled,
    required this.onSubmit,
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
                    "Mulai dari",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    price,
                    style: const TextStyle(
                      color: Color(0xFFEF4444),
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),

                  const SizedBox(height: 2),

                  const Text(
                    "Belum termasuk biaya tambahan",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),

            SizedBox(
              width: 180,
              height: 55,
              child: ElevatedButton(
                onPressed: isEnabled ? onSubmit : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEF4444),
                  disabledBackgroundColor: Colors.grey.shade300,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  "Kirim Permintaan",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
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
