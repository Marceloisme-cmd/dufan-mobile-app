import 'package:flutter/material.dart';

import '../widgets/ticket_card.dart';
import '../widgets/ticket_section_header.dart';
import 'buy_ticket_page.dart';
import 'staff_login_page.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});
  Widget _infoItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: const Color(0xFFEF4444)),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,

        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFEF4444), Color(0xFFEF4444)],
            ),
          ),
        ),

        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tiket",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2),
            Text("", style: TextStyle(color: Colors.white70, fontSize: 12)),
          ],
        ),

        actions: [
          IconButton(
            icon: const Icon(
              Icons.qr_code_scanner_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const StaffLoginPage()),
              );
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // HERO SECTION
            Container(
              margin: const EdgeInsets.all(16),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: const DecorationImage(
                  image: AssetImage('assets/images/banner1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                  ),
                ),
                child: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tiket Dufan",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Pilih petualanganmu dan nikmati keseruannya",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TicketSectionHeader(title: "Tiket Tersedia"),

                  const SizedBox(height: 20),

                  TicketCard(
                    title: "Dufan Regular",
                    price: "250000",
                    onBuyPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const BuyTicketPage(
                            ticketTitle: "Dufan Regular",
                            ticketPrice: "250000",
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  TicketCard(
                    title: "Dufan Premium",
                    price: "350000",
                    onBuyPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const BuyTicketPage(
                            ticketTitle: "Dufan Premium",
                            ticketPrice: "350000",
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  TicketCard(
                    title: "Fast Track",
                    price: "500000",
                    onBuyPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const BuyTicketPage(
                            ticketTitle: "Fast Track",
                            ticketPrice: "500000",
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 24),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.info_outline, color: Color(0xFFEF4444)),
                            SizedBox(width: 8),
                            Text(
                              "Informasi Penting",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        _infoItem(
                          Icons.qr_code,
                          "Tunjukan QR tiket diloket dufan",
                        ),

                        _infoItem(
                          Icons.cancel_outlined,
                          "Tiket tidak bisa dikembalikan setelah pembayaran",
                        ),

                        _infoItem(
                          Icons.flash_on,
                          "Tiket fast track memiliki akses ke antrian fast track",
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
