import 'package:flutter/material.dart';

import '../../../../../services/auth_service.dart';
import '../models/hotel_booking_model.dart';
import '../services/hotel_booking_service.dart';

class HotelBookingPage extends StatefulWidget {
  const HotelBookingPage({super.key});

  @override
  State<HotelBookingPage> createState() => _HotelBookingPageState();
}

class _HotelBookingPageState extends State<HotelBookingPage> {
  String? email;

  @override
  void initState() {
    super.initState();

    loadUser();
  }

  Future<void> loadUser() async {
    final userEmail = await AuthService.getEmail();

    if (!mounted) return;

    setState(() {
      email = userEmail;
    });
  }

  String formatPrice(int value) {
    return value.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    );
  }

  String formatDate(DateTime date) {
    return "${date.day}-${date.month}-${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    if (email == null || email!.isEmpty) {
      return const Scaffold(body: Center(child: Text("User belum login")));
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      appBar: AppBar(
        backgroundColor: Colors.white,

        elevation: 0,

        centerTitle: true,

        title: const Text(
          "Reservasi Hotel",

          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<List<HotelBookingModel>>(
        future: HotelBookingService.getUserBookings(email!),

        builder: (context, snapshot) {
          // loading

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFFEF4444)),
            );
          }

          // error

          if (snapshot.hasError) {
            return const Center(
              child: Text("Terjadi kesalahan mengambil data booking"),
            );
          }

          final bookings = snapshot.data ?? [];

          // kosong

          if (bookings.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Icon(Icons.hotel_outlined, size: 70, color: Colors.grey),

                  SizedBox(height: 16),

                  Text(
                    "Belum ada reservasi hotel",

                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            );
          }

          // data ada

          return ListView.builder(
            padding: const EdgeInsets.all(16),

            itemCount: bookings.length,

            itemBuilder: (context, index) {
              final booking = bookings[index];

              return Container(
                margin: const EdgeInsets.only(bottom: 16),

                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(24),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.05),

                      blurRadius: 10,
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),

                          decoration: BoxDecoration(
                            color: const Color(0xFFFEE2E2),
                            borderRadius: BorderRadius.circular(12),
                          ),

                          child: const Icon(
                            Icons.hotel,
                            color: Color(0xFFEF4444),
                          ),
                        ),

                        const SizedBox(width: 14),

                        Expanded(
                          child: Text(
                            booking.hotelName,

                            maxLines: 1,

                            overflow: TextOverflow.ellipsis,

                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(width: 8),

                        // STATUS BOOKING
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),

                          decoration: BoxDecoration(
                            color: booking.isCompleted
                                ? Colors.grey.shade200
                                : Colors.green.shade100,

                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: Text(
                            booking.isCompleted ? "Selesai" : "Aktif",

                            style: TextStyle(
                              fontSize: 12,

                              fontWeight: FontWeight.bold,

                              color: booking.isCompleted
                                  ? Colors.grey
                                  : Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    _detail(
                      Icons.calendar_month,
                      "Check-in",
                      formatDate(booking.checkInDate),
                    ),

                    _detail(
                      Icons.calendar_today,
                      "Check-out",
                      formatDate(booking.checkOutDate),
                    ),

                    _detail(
                      Icons.nights_stay,
                      "Durasi",
                      "${booking.totalNight} malam",
                    ),

                    _detail(Icons.bed, "Kamar", "${booking.room} kamar"),

                    _detail(Icons.payment, "Pembayaran", booking.paymentMethod),

                    const Divider(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),

                        Text(
                          "Rp ${formatPrice(booking.totalPrice)}",

                          style: const TextStyle(
                            color: Color(0xFFEF4444),

                            fontSize: 18,

                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _detail(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey),

          const SizedBox(width: 12),

          Text("$title : ", style: const TextStyle(color: Colors.grey)),

          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
