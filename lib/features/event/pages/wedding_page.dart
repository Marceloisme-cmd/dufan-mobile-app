import 'package:flutter/material.dart';

class WeddingPage extends StatelessWidget {
  const WeddingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wedding"), centerTitle: true),
      body: const Center(
        child: Text(
          "Wedding Package Page\nComing Soon",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
