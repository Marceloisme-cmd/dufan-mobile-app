import 'dart:async';
import 'package:flutter/material.dart';

import '../models/hotel_booking_model.dart';
import 'hotel_payment_success_page.dart';

class HotelPaymentLoadingPage extends StatefulWidget {
  final HotelBookingModel booking;

  const HotelPaymentLoadingPage({super.key, required this.booking});

  @override
  State<HotelPaymentLoadingPage> createState() =>
      _HotelPaymentLoadingPageState();
}

class _HotelPaymentLoadingPageState extends State<HotelPaymentLoadingPage> {
  @override
  void initState() {
    super.initState();

    paymentProcess();
  }

  void paymentProcess() {
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HotelPaymentSuccessPage(booking: widget.booking),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const CircularProgressIndicator(color: Color(0xFFEF4444)),

            const SizedBox(height: 30),

            const Text(
              "Memproses Pembayaran...",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              widget.booking.hotelName,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
