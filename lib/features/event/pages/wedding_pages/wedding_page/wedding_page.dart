import 'package:flutter/material.dart';

import '../../../data/event_data.dart';
import '../widgets/wedding_card.dart';

class WeddingPage extends StatelessWidget {
  const WeddingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final weddings = events['Wedding']!;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,

        title: const Text(
          "Paket Pernikahan",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      body: Column(
        children: [
          // LIST PACKAGE
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: weddings.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: WeddingCard(wedding: weddings[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
