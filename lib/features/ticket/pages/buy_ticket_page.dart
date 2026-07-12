import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../services/auth_service.dart';
import '../models/ticket_model.dart';
import 'checkout_page.dart';

class BuyTicketPage extends StatefulWidget {
  final String ticketTitle;
  final String ticketPrice;

  const BuyTicketPage({
    super.key,
    required this.ticketTitle,
    required this.ticketPrice,
  });

  @override
  State<BuyTicketPage> createState() => _BuyTicketPageState();
}

class _BuyTicketPageState extends State<BuyTicketPage> {
  int quantity = 1;
  String paymentMethod = "ShopeePay";

  String formatPrice(int value) {
    return value.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    );
  }

  @override
  Widget build(BuildContext context) {
    final price = int.parse(widget.ticketPrice);
    final total = price * quantity;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      appBar: AppBar(
        title: const Text(
          "Buy Ticket",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // TICKET CARD
            Container(
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
                children: [
                  const Icon(
                    Icons.confirmation_number,
                    size: 60,
                    color: Color(0xFFEF4444),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    widget.ticketTitle,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Rp ${formatPrice(price)}",
                    style: const TextStyle(
                      color: Color(0xFFEF4444),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // QUANTITY
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Quantity",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton.filled(
                        onPressed: quantity > 1
                            ? () => setState(() => quantity--)
                            : null,
                        icon: const Icon(Icons.remove),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "$quantity",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      IconButton.filled(
                        onPressed: () => setState(() => quantity++),
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // PAYMENT
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
                    "Payment Method",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),

                  RadioListTile(
                    value: "ShopeePay",
                    groupValue: paymentMethod,
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

            // TOTAL
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFEF2F2),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total Payment",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Rp ${formatPrice(total)}",
                    style: const TextStyle(
                      color: Color(0xFFEF4444),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
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
                final email = await AuthService.getEmail();

                if (email == null || email.isEmpty) return;

                final ticket = TicketModel(
                  id: const Uuid().v4(),
                  userEmail: email,
                  title: widget.ticketTitle,
                  price: widget.ticketPrice,
                  quantity: quantity,
                  totalPrice: total,
                  date: DateTime.now(),
                  isUsed: false,
                );

                if (!context.mounted) return;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CheckoutPage(
                      ticket: ticket,
                      quantity: quantity,
                      paymentMethod: paymentMethod,
                      totalPrice: total,
                    ),
                  ),
                );
              },
              child: const Text(
                "Continue",
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
}
