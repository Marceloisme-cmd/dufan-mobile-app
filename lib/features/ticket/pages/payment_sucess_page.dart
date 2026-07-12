import 'package:flutter/material.dart';
import '../../profile/pages/my_tickets_page.dart';
import '../models/ticket_model.dart';

class PaymentSuccessPage extends StatelessWidget {
  final TicketModel ticket;

  const PaymentSuccessPage({super.key, required this.ticket});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),

              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle,
                  size: 90,
                  color: Colors.green,
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                "Payment Successful!",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              const Text(
                "Your ticket has been successfully created.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),

              const SizedBox(height: 30),

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
                  children: [
                    const Icon(
                      Icons.confirmation_number,
                      size: 40,
                      color: Color(0xFFEF4444),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      ticket.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      ticket.id,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEF4444),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const MyTicketsPage()),
                      (route) => false,
                    );
                  },
                  child: const Text(
                    "View My Tickets",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: const Text("Back to Home"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
