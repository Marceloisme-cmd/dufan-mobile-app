import 'package:flutter/material.dart';

import '../widgets/hotel_bottom_bar.dart';
import '../widgets/hotel_facilities.dart';
import '../widgets/hotel_header.dart';
import '../widgets/hotel_info_card.dart';
import '../widgets/hotel_reservation_card.dart';
import '../pages/hotel_checkout_page.dart';

class HotelDetailPage extends StatefulWidget {
  final Map<String, dynamic> hotel;

  const HotelDetailPage({super.key, required this.hotel});

  @override
  State<HotelDetailPage> createState() => _HotelDetailPageState();
}

class _HotelDetailPageState extends State<HotelDetailPage> {
  DateTime? checkInDate;
  DateTime? checkOutDate;

  int guest = 2;
  int room = 1;

  // ================= PRICE =================

  int get pricePerNight {
    return int.parse(
      widget.hotel['price']
          .replaceAll('Rp', '')
          .replaceAll('.', '')
          .replaceAll(',', '')
          .trim(),
    );
  }

  int get totalNight {
    if (checkInDate == null || checkOutDate == null) {
      return 1;
    }

    final day = checkOutDate!.difference(checkInDate!).inDays;

    return day <= 0 ? 1 : day;
  }

  int get totalPrice {
    return pricePerNight * totalNight * room;
  }

  String formatPrice(int value) {
    return "Rp ${value.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) => '${match[1]}.')}";
  }

  // ================= DATE PICKER =================

  Future<void> selectCheckIn() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2035),
    );

    if (picked != null) {
      setState(() {
        checkInDate = picked;

        if (checkOutDate != null && !checkOutDate!.isAfter(checkInDate!)) {
          checkOutDate = null;
        }
      });
    }
  }

  Future<void> selectCheckOut() async {
    if (checkInDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Silakan pilih tanggal Check-in terlebih dahulu."),
        ),
      );
      return;
    }

    final picked = await showDatePicker(
      context: context,
      initialDate: checkInDate!.add(const Duration(days: 1)),
      firstDate: checkInDate!.add(const Duration(days: 1)),
      lastDate: DateTime(2035),
    );

    if (picked != null) {
      setState(() {
        checkOutDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      body: CustomScrollView(
        slivers: [
          HotelHeader(hotel: widget.hotel),

          SliverToBoxAdapter(
            child: Column(
              children: [
                HotelInfoCard(hotel: widget.hotel),

                HotelFacilities(hotel: widget.hotel),

                HotelReservationCard(
                  checkInDate: checkInDate,
                  checkOutDate: checkOutDate,

                  guest: guest,
                  room: room,

                  onCheckIn: selectCheckIn,
                  onCheckOut: selectCheckOut,

                  onGuestMinus: () {
                    if (guest > 1) {
                      setState(() => guest--);
                    }
                  },

                  onGuestPlus: () {
                    setState(() => guest++);
                  },

                  onRoomMinus: () {
                    if (room > 1) {
                      setState(() => room--);
                    }
                  },

                  onRoomPlus: () {
                    setState(() => room++);
                  },
                ),

                const SizedBox(height: 120),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: HotelBottomBar(
        totalPrice: formatPrice(totalPrice),
        totalNight: totalNight,
        room: room,

        isEnabled: checkInDate != null && checkOutDate != null,

        onContinue: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => HotelCheckoutPage(
                hotelName: widget.hotel['name'],
                pricePerNight: widget.hotel['price'],
                checkInDate: checkInDate!,
                checkOutDate: checkOutDate!,
                guest: guest,
                room: room,
              ),
            ),
          );
        },
      ),
    );
  }
}
