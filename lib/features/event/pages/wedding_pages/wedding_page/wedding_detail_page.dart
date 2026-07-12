import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/wedding_bottom_bar.dart';
import '../widgets/wedding_facilities.dart';
import '../widgets/wedding_header.dart';
import '../widgets/wedding_info_card.dart';
import '../widgets/wedding_reservation_card.dart';

class WeddingDetailPage extends StatefulWidget {
  final Map<String, dynamic> wedding;

  const WeddingDetailPage({super.key, required this.wedding});

  @override
  State<WeddingDetailPage> createState() => _WeddingDetailPageState();
}

class _WeddingDetailPageState extends State<WeddingDetailPage> {
  DateTime? tanggalAcara;

  final namaController = TextEditingController();
  final teleponController = TextEditingController();
  final catatanController = TextEditingController();

  int jumlahTamu = 100;

  @override
  void initState() {
    super.initState();

    namaController.addListener(() => setState(() {}));
    teleponController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    namaController.dispose();
    teleponController.dispose();
    catatanController.dispose();
    super.dispose();
  }

  Future<void> pilihTanggal() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 7)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2035),
    );

    if (picked != null) {
      setState(() {
        tanggalAcara = picked;
      });
    }
  }

  Future<void> kirimWhatsApp() async {
    final pesan =
        '''
Halo Admin Dufan,

Saya ingin mengajukan reservasi paket pernikahan.

📌 Paket
${widget.wedding['name']}

👤 Nama Pemesan
${namaController.text}

📞 Nomor WhatsApp
${teleponController.text}

📅 Tanggal Acara
${tanggalAcara?.day}-${tanggalAcara?.month}-${tanggalAcara?.year}

👥 Jumlah Tamu
$jumlahTamu Orang

📝 Catatan
${catatanController.text}

Mohon informasi mengenai ketersediaan jadwal dan penawaran paket.

Terima kasih.
''';

    // Ganti dengan nomor admin
    const nomorAdmin = "6282279740635";

    final uri = Uri.parse(
      "https://wa.me/$nomorAdmin?text=${Uri.encodeComponent(pesan)}",
    );
    final result = await launchUrl(uri, mode: LaunchMode.externalApplication);

    debugPrint("Launch Result = $result");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      body: CustomScrollView(
        slivers: [
          WeddingHeader(wedding: widget.wedding),

          SliverToBoxAdapter(
            child: Column(
              children: [
                WeddingInfoCard(wedding: widget.wedding),

                const WeddingFacilities(),

                WeddingReservationCard(
                  tanggalAcara: tanggalAcara,

                  namaController: namaController,
                  teleponController: teleponController,
                  catatanController: catatanController,

                  jumlahTamu: jumlahTamu,

                  onSelectDate: pilihTanggal,

                  onGuestMinus: () {
                    if (jumlahTamu > 50) {
                      setState(() => jumlahTamu -= 50);
                    }
                  },

                  onGuestPlus: () {
                    setState(() => jumlahTamu += 50);
                  },
                ),

                const SizedBox(height: 120),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: WeddingBottomBar(
        price: widget.wedding['price'],

        isEnabled:
            tanggalAcara != null &&
            namaController.text.trim().isNotEmpty &&
            teleponController.text.trim().isNotEmpty,

        onSubmit: kirimWhatsApp,
      ),
    );
  }
}
