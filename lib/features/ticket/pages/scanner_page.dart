import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../services/ticket_service.dart';
import '../models/ticket_model.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  bool scanned = false;

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  Future<void> verifyTicket(String id) async {
    if (scanned) return;

    scanned = true;

    final TicketModel? ticket = TicketService.getTicketById(id);

    if (!mounted) return;

    // TIKET TIDAK DITEMUKAN
    if (ticket == null) {
      await showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Ticket Not Found"),
          content: const Text("QR Code tidak terdaftar."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );

      scanned = false;
      return;
    }

    // SUDAH DIGUNAKAN
    if (ticket.isUsed) {
      await showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Ticket Already Used"),
          content: Text("${ticket.title} sudah digunakan."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );

      scanned = false;
      return;
    }

    // VALID
    await TicketService.useTicket(ticket.id);
    if (!mounted) return;
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Ticket Valid"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 60),

            const SizedBox(height: 12),

            Text(ticket.title),

            const SizedBox(height: 6),

            Text(ticket.userEmail),

            const SizedBox(height: 6),

            const Text("Status berhasil diubah menjadi USED"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Continue"),
          ),
        ],
      ),
    );

    scanned = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(title: const Text("Ticket Scanner"), centerTitle: true),

      body: Stack(
        children: [
          MobileScanner(
            onDetect: (capture) {
              final barcode = capture.barcodes.first;

              final code = barcode.rawValue;

              if (code != null) {
                verifyTicket(code);
              }
            },
          ),

          Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 3),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),

          const Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Text(
              "Arahkan kamera ke QR Ticket",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
