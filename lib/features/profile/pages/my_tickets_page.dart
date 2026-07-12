import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../services/auth_service.dart';
import '../../../services/ticket_service.dart';
import '../../ticket/models/ticket_model.dart';
import '../../ticket/pages/ticket_detail_page.dart';

class MyTicketsPage extends StatefulWidget {
  const MyTicketsPage({super.key});

  @override
  State<MyTicketsPage> createState() => _MyTicketsPageState();
}

class _MyTicketsPageState extends State<MyTicketsPage> {
  List<TicketModel> tickets = [];
  String? email;

  String formatPrice(int value) {
    return value.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    );
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    email = await AuthService.getEmail();
    loadTickets();
  }

  void loadTickets() {
    if (email == null || email!.isEmpty) return;

    final data = TicketService.getActiveTickets(email!);

    setState(() {
      tickets = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      appBar: AppBar(
        title: const Text(
          "Tiket Dufan saya",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: tickets.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.confirmation_number_outlined,
                    size: 80,
                    color: Colors.grey.shade400,
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    "Anda belum beli tiket",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Beli tiket",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: tickets.length,
              itemBuilder: (context, index) {
                final ticket = tickets[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TicketDetailPage(ticket: ticket),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 15,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // HEADER
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            color: Color(0xFFEF4444),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.confirmation_number,
                                color: Colors.white,
                              ),

                              const SizedBox(width: 10),

                              Expanded(
                                child: Text(
                                  ticket.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: ticket.isUsed
                                      ? Colors.grey
                                      : Colors.green,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  ticket.isUsed ? "USED" : "Aktif",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              _row(
                                "Price",
                                "Rp ${formatPrice(int.parse(ticket.price))}",
                              ),

                              _row("Quantity", "${ticket.quantity} Ticket"),

                              _row(
                                "Total Payment",
                                "Rp ${formatPrice(ticket.totalPrice)}",
                              ),

                              _row("Email", ticket.userEmail),

                              _row(
                                "Date",
                                "${ticket.date.day}/${ticket.date.month}/${ticket.date.year}",
                              ),

                              const SizedBox(height: 16),

                              _ticketDivider(),

                              const SizedBox(height: 20),

                              if (!ticket.isUsed) ...[
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade50,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: QrImageView(
                                    data: ticket.id,
                                    size: 180,
                                  ),
                                ),

                                const SizedBox(height: 12),

                                const Text(
                                  "Show this QR code at entrance gate",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                  ),
                                ),

                                Text(
                                  "Tap to view full ticket",
                                  style: TextStyle(
                                    color: Colors.red.shade400,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ] else ...[
                                const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 70,
                                ),

                                const SizedBox(height: 10),

                                const Text(
                                  "Ticket has been used",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],

                              const SizedBox(height: 20),

                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Column(
                                  children: [
                                    const Text(
                                      "Ticket ID",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey,
                                      ),
                                    ),

                                    const SizedBox(height: 4),

                                    Text(
                                      ticket.id,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
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
                );
              },
            ),
    );
  }

  Widget _row(String title, String value, {Color valueColor = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(fontWeight: FontWeight.w600, color: valueColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _ticketDivider() {
    return Row(
      children: List.generate(
        25,
        (index) => Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            height: 1,
            color: Colors.grey.shade300,
          ),
        ),
      ),
    );
  }
}
