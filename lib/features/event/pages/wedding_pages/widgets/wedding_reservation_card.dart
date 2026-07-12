import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeddingReservationCard extends StatelessWidget {
  final DateTime? tanggalAcara;

  final TextEditingController namaController;
  final TextEditingController teleponController;
  final TextEditingController catatanController;

  final int jumlahTamu;

  final VoidCallback onSelectDate;

  final VoidCallback onGuestMinus;
  final VoidCallback onGuestPlus;

  const WeddingReservationCard({
    super.key,
    required this.tanggalAcara,
    required this.namaController,
    required this.teleponController,
    required this.catatanController,
    required this.jumlahTamu,
    required this.onSelectDate,
    required this.onGuestMinus,
    required this.onGuestPlus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 10),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Text(
            "Formulir Reservasi",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          // ================= TANGGAL =================
          const Text(
            "Tanggal Acara",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 8),

          InkWell(
            onTap: onSelectDate,
            borderRadius: BorderRadius.circular(14),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(14),
              ),

              child: Row(
                children: [
                  const Icon(Icons.calendar_month, color: Color(0xFFEF4444)),

                  const SizedBox(width: 12),

                  Text(
                    tanggalAcara == null
                        ? "Pilih tanggal acara"
                        : DateFormat(
                            'dd MMMM yyyy',
                            'id_ID',
                          ).format(tanggalAcara!),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // ================= NAMA =================
          TextField(
            controller: namaController,

            decoration: InputDecoration(
              labelText: "Nama Pemesan",

              prefixIcon: const Icon(Icons.person),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // ================= TELEPON =================
          TextField(
            controller: teleponController,
            keyboardType: TextInputType.phone,

            decoration: InputDecoration(
              labelText: "Nomor WhatsApp",

              prefixIcon: const Icon(Icons.phone),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // ================= TAMU =================
          const Text(
            "Jumlah Tamu",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              IconButton.filled(
                onPressed: onGuestMinus,
                icon: const Icon(Icons.remove),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "$jumlahTamu Orang",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              IconButton.filled(
                onPressed: onGuestPlus,
                icon: const Icon(Icons.add),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // ================= CATATAN =================
          TextField(
            controller: catatanController,
            maxLines: 4,

            decoration: InputDecoration(
              labelText: "Catatan Tambahan",

              alignLabelWithHint: true,

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
