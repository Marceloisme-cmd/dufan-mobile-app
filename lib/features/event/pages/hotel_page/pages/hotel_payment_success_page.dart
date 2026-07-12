import 'package:flutter/material.dart';

import '../models/hotel_booking_model.dart';
import 'hotel_booking_page.dart';

class HotelPaymentSuccessPage extends StatelessWidget {
  final HotelBookingModel booking;

  const HotelPaymentSuccessPage({super.key, required this.booking});

  String formatPrice(int value) {
    return value.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Container(
            padding: const EdgeInsets.all(30),

            decoration: BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.circular(28),

              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 15),
              ],
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                Container(
                  padding: const EdgeInsets.all(20),

                  decoration: const BoxDecoration(
                    color: Color(0xFFDCFCE7),

                    shape: BoxShape.circle,
                  ),

                  child: const Icon(Icons.check, size: 50, color: Colors.green),
                ),

                const SizedBox(height: 24),

                const Text(
                  "Pembayaran Berhasil",

                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 12),

                Text(
                  booking.hotelName,

                  textAlign: TextAlign.center,

                  style: const TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 8),

                Text(
                  "Rp ${formatPrice(booking.totalPrice)}",

                  style: const TextStyle(
                    color: Color(0xFFEF4444),

                    fontWeight: FontWeight.bold,

                    fontSize: 22,
                  ),
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,

                  height: 55,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEF4444),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,

                        MaterialPageRoute(
                          builder: (_) => const HotelBookingPage(),
                        ),

                        (route) => false,
                      );
                    },

                    child: const Text(
                      "Lihat Reservasi",

                      style: TextStyle(
                        color: Colors.white,

                        fontWeight: FontWeight.bold,
                      ),
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
