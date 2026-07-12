import 'package:flutter/material.dart';

class TicketShortcut extends StatelessWidget {
  final VoidCallback onTap;

  const TicketShortcut({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // ICON BLOCK (CTA STYLE)
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFEF4444), Color(0xFFEF4444)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.local_activity_rounded,
                color: Colors.white,
                size: 28,
              ),
            ),

            const SizedBox(width: 14),

            // TEXT SECTION
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Beli Tiket",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1E293B),
                    ),
                  ),

                  SizedBox(height: 4),

                  Text(
                    "Dapatkan tiket masuk anda secara instan",
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF94A3B8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 10),

                  Row(
                    children: [
                      Icon(
                        Icons.flash_on_rounded,
                        size: 14,
                        color: Color(0xFF22C55E),
                      ),
                      SizedBox(width: 4),
                      Text(
                        "Checkout cepat & QR instan",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Color(0xFF94A3B8),
            ),
          ],
        ),
      ),
    );
  }
}
