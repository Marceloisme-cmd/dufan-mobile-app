import 'package:flutter/material.dart';
import '../../../services/ticket_service.dart';
import '../models/ticket_model.dart';
import 'payment_sucess_page.dart';

class CheckoutPage extends StatelessWidget {
  final TicketModel ticket;
  final int quantity;
  final String paymentMethod;
  final int totalPrice;

  const CheckoutPage({
    super.key,
    required this.ticket,
    required this.quantity,
    required this.paymentMethod,
    required this.totalPrice,
  });

  String formatPrice(int value) {
    return value.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    );
  }

  Widget infoRow(String title, String value) {
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
              style: const TextStyle(fontWeight: FontWeight.w600),
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
        title: const Text(
          "Checkout",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ORDER SUMMARY
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Order Summary",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 20),

                  infoRow("Ticket", ticket.title),
                  infoRow("Email", ticket.userEmail),
                  infoRow("Quantity", quantity.toString()),
                  infoRow("Payment", paymentMethod),

                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total Payment",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Rp ${formatPrice(totalPrice)}",
                        style: const TextStyle(
                          color: Color(0xFFEF4444),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // INFO BOX
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFEF2F2),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFFECACA)),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info_outline, color: Color(0xFFEF4444)),

                  SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      "Pastikan detail pesanan sudah benar sebelum melanjutkan pembayaran. Tiket yang sudah dibeli tidak dapat dikembalikan.",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),

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
                await TicketService.buyTicket(ticket);

                if (!context.mounted) return;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PaymentSuccessPage(ticket: ticket),
                  ),
                );
              },
              child: const Text(
                "Pay Now",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
