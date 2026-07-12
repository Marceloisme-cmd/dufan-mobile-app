import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../../../../services/auth_service.dart';
import '../models/hotel_booking_model.dart';
import '../services/hotel_booking_service.dart';
import 'hotel_payment_loading_page.dart';

class HotelCheckoutPage extends StatefulWidget {
  final String hotelName;
  final String pricePerNight;

  final DateTime checkInDate;
  final DateTime checkOutDate;

  final int guest;
  final int room;

  const HotelCheckoutPage({
    super.key,
    required this.hotelName,
    required this.pricePerNight,
    required this.checkInDate,
    required this.checkOutDate,
    required this.guest,
    required this.room,
  });

  @override
  State<HotelCheckoutPage> createState() => _HotelCheckoutPageState();
}

class _HotelCheckoutPageState extends State<HotelCheckoutPage> {
  String paymentMethod = "ShopeePay";

  String formatPrice(int value) {
    return value.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    );
  }

  @override
  Widget build(BuildContext context) {
    final price = int.parse(
      widget.pricePerNight.replaceAll("Rp", "").replaceAll(".", "").trim(),
    );

    final totalNight = widget.checkOutDate
        .difference(widget.checkInDate)
        .inDays;

    final totalPrice = price * totalNight * widget.room;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Checkout Hotel",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            // ================= HOTEL CARD =================
            Container(
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
                children: [
                  const Icon(
                    Icons.hotel_rounded,
                    size: 60,
                    color: Color(0xFFEF4444),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    widget.hotelName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Rp ${formatPrice(price)} / malam",
                    style: const TextStyle(
                      color: Color(0xFFEF4444),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ================= RESERVATION =================
            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Detail Reservasi",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),

                  const SizedBox(height: 20),

                  _buildItem(
                    Icons.calendar_month,
                    "Check-in",
                    DateFormat(
                      "dd MMMM yyyy",
                      "id_ID",
                    ).format(widget.checkInDate),
                  ),

                  const Divider(height: 28),

                  _buildItem(
                    Icons.calendar_today,
                    "Check-out",
                    DateFormat(
                      "dd MMMM yyyy",
                      "id_ID",
                    ).format(widget.checkOutDate),
                  ),

                  const Divider(height: 28),

                  _buildItem(
                    Icons.nights_stay,
                    "Durasi Menginap",
                    "$totalNight Malam",
                  ),

                  const Divider(height: 28),

                  _buildItem(
                    Icons.people,
                    "Jumlah Tamu",
                    "${widget.guest} Orang",
                  ),

                  const Divider(height: 28),

                  _buildItem(Icons.bed, "Jumlah Kamar", "${widget.room} Kamar"),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Metode Pembayaran",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),

                  const SizedBox(height: 12),

                  RadioListTile(
                    value: "ShopeePay",
                    groupValue: paymentMethod,
                    activeColor: const Color(0xFFEF4444),
                    onChanged: (value) {
                      setState(() {
                        paymentMethod = value!;
                      });
                    },
                    title: const Text("ShopeePay"),
                  ),

                  RadioListTile(
                    value: "DANA",
                    groupValue: paymentMethod,
                    activeColor: const Color(0xFFEF4444),
                    onChanged: (value) {
                      setState(() {
                        paymentMethod = value!;
                      });
                    },
                    title: const Text("DANA"),
                  ),

                  RadioListTile(
                    value: "GoPay",
                    groupValue: paymentMethod,
                    activeColor: const Color(0xFFEF4444),
                    onChanged: (value) {
                      setState(() {
                        paymentMethod = value!;
                      });
                    },
                    title: const Text("GoPay"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFEF2F2),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Harga / Malam"),
                      Text(
                        "Rp ${formatPrice(price)}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [const Text("Durasi"), Text("$totalNight Malam")],
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Jumlah Kamar"),
                      Text("${widget.room}"),
                    ],
                  ),

                  const Divider(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total Pembayaran",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      Text(
                        "Rp ${formatPrice(totalPrice)}",
                        style: const TextStyle(
                          color: Color(0xFFEF4444),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 100),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEF4444),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () async {
                final email = await AuthService.getEmail();

                if (email == null || email.isEmpty) {
                  return;
                }

                final booking = HotelBookingModel(
                  id: const Uuid().v4(),

                  userEmail: email,

                  hotelName: widget.hotelName,

                  pricePerNight: widget.pricePerNight,

                  guest: widget.guest,

                  room: widget.room,

                  totalNight: totalNight,

                  totalPrice: totalPrice,

                  checkInDate: widget.checkInDate,

                  checkOutDate: widget.checkOutDate,

                  paymentMethod: paymentMethod,

                  bookingDate: DateTime.now(),

                  isCompleted: false,
                );

                await HotelBookingService.saveBooking(booking);

                if (!context.mounted) return;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HotelPaymentLoadingPage(booking: booking),
                  ),
                );
              },

              child: const Text(
                "Lanjut ke Pembayaran",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(IconData icon, String title, String value) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFFEF4444)),

        const SizedBox(width: 14),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),

              const SizedBox(height: 4),

              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
