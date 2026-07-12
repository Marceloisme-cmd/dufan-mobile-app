import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  final String title;
  final String price;
  final VoidCallback onBuyPressed;

  const TicketCard({
    super.key,
    required this.title,
    required this.price,
    required this.onBuyPressed,
  });

  String formatPrice(String value) {
    final number = int.tryParse(value) ?? 0;

    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    );
  }

  String getDescription() {
    switch (title) {
      case "Dufan Regular":
        return "Access to all regular rides and attractions.";
      case "Dufan Premium":
        return "Priority access with extra benefits.";
      case "Fast Track":
        return "Skip queues and enjoy faster access.";
      default:
        return "Enjoy your Dufan adventure.";
    }
  }

  IconData getIcon() {
    switch (title) {
      case "Dufan Regular":
        return Icons.attractions;
      case "Dufan Premium":
        return Icons.workspace_premium;
      case "Fast Track":
        return Icons.flash_on;
      default:
        return Icons.confirmation_number;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
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
        children: [
          Row(
            children: [
              Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF2F2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  getIcon(),
                  color: const Color(0xFFEF4444),
                  size: 30,
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      getDescription(),
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          const Divider(),

          const SizedBox(height: 12),

          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Starting from",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),

                  Text(
                    "Rp ${formatPrice(price)}",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFEF4444),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              SizedBox(
                height: 45,
                child: ElevatedButton.icon(
                  onPressed: onBuyPressed,
                  icon: const Icon(
                    Icons.shopping_cart_checkout,
                    color: Colors.white,
                    size: 18,
                  ),
                  label: const Text(
                    "Buy Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEF4444),
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
