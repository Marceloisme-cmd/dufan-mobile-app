import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../models/ticket_model.dart';

class TicketDetailPage extends StatelessWidget {
  final TicketModel ticket;

  const TicketDetailPage({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      appBar: AppBar(
        title: const Text(
          "Ticket Detail",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 15),
            ],
          ),

          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Color(0xFFEF4444),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.confirmation_number,
                      color: Colors.white,
                      size: 50,
                    ),

                    const SizedBox(height: 12),

                    Text(
                      ticket.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    QrImageView(data: ticket.id, size: 240),

                    const SizedBox(height: 16),

                    const Text(
                      "Show this QR code at entrance",
                      style: TextStyle(color: Colors.grey),
                    ),

                    const SizedBox(height: 24),

                    const Divider(),

                    const SizedBox(height: 16),

                    _row("Status", ticket.isUsed ? "USED" : "ACTIVE"),

                    _row("Price", "Rp ${ticket.price}"),

                    _row("Email", ticket.userEmail),

                    _row(
                      "Date",
                      "${ticket.date.day}/${ticket.date.month}/${ticket.date.year}",
                    ),

                    const SizedBox(height: 24),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Ticket ID",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            ticket.id,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _row(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
