import 'package:flutter/material.dart';

class TicketSectionHeader extends StatelessWidget {
  final String title;

  const TicketSectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
