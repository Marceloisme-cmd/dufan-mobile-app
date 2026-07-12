import 'package:flutter/material.dart';

class HotelReservationCard extends StatelessWidget {
  final DateTime? checkInDate;
  final DateTime? checkOutDate;

  final int guest;
  final int room;

  final VoidCallback onCheckIn;
  final VoidCallback onCheckOut;

  final VoidCallback onGuestMinus;
  final VoidCallback onGuestPlus;

  final VoidCallback onRoomMinus;
  final VoidCallback onRoomPlus;

  const HotelReservationCard({
    super.key,
    required this.checkInDate,
    required this.checkOutDate,
    required this.guest,
    required this.room,
    required this.onCheckIn,
    required this.onCheckOut,
    required this.onGuestMinus,
    required this.onGuestPlus,
    required this.onRoomMinus,
    required this.onRoomPlus,
  });

  String formatDate(DateTime? date) {
    if (date == null) return "Pilih Tanggal";

    return "${date.day}/${date.month}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
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
            "Reservasi Hotel",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),

          const SizedBox(height: 20),

          // CHECK IN
          ListTile(
            onTap: onCheckIn,
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.login),
            title: const Text("Check-in"),
            subtitle: Text(formatDate(checkInDate)),
            trailing: const Icon(Icons.chevron_right),
          ),

          const Divider(),

          // CHECK OUT
          ListTile(
            onTap: onCheckOut,
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.logout),
            title: const Text("Check-out"),
            subtitle: Text(formatDate(checkOutDate)),
            trailing: const Icon(Icons.chevron_right),
          ),

          const Divider(),

          // JUMLAH TAMU
          Row(
            children: [
              const Icon(Icons.people),

              const SizedBox(width: 12),

              const Expanded(
                child: Text("Jumlah Tamu", style: TextStyle(fontSize: 16)),
              ),

              IconButton(
                onPressed: onGuestMinus,
                icon: const Icon(Icons.remove_circle_outline),
              ),

              Text(
                "$guest",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              IconButton(
                onPressed: onGuestPlus,
                color: const Color(0xFFEF4444),
                icon: const Icon(Icons.add_circle),
              ),
            ],
          ),

          const Divider(),

          // JUMLAH KAMAR
          Row(
            children: [
              const Icon(Icons.bed),

              const SizedBox(width: 12),

              const Expanded(
                child: Text("Jumlah Kamar", style: TextStyle(fontSize: 16)),
              ),

              IconButton(
                onPressed: onRoomMinus,
                icon: const Icon(Icons.remove_circle_outline),
              ),

              Text(
                "$room",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              IconButton(
                onPressed: onRoomPlus,
                color: const Color(0xFFEF4444),
                icon: const Icon(Icons.add_circle),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF7ED),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info_outline, color: Colors.orange),

                SizedBox(width: 10),

                Expanded(
                  child: Text(
                    "Check-in mulai pukul 14.00 WIB\nCheck-out maksimal pukul 12.00 WIB",
                    style: TextStyle(color: Colors.black87, height: 1.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
