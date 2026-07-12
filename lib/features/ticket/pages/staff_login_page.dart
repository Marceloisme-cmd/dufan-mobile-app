import 'package:flutter/material.dart';

import 'scanner_page.dart';

class StaffLoginPage extends StatefulWidget {
  const StaffLoginPage({super.key});

  @override
  State<StaffLoginPage> createState() => _StaffLoginPageState();
}

class _StaffLoginPageState extends State<StaffLoginPage> {
  final pinController = TextEditingController();

  static const String staffPin = "123456";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Staff Verification")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.admin_panel_settings, size: 80),

            const SizedBox(height: 20),

            const Text(
              "Petugas Verification",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 24),

            TextField(
              controller: pinController,
              obscureText: true,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "PIN Petugas",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (pinController.text == staffPin) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const ScannerPage()),
                    );
                  } else {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text("PIN salah")));
                  }
                },
                child: const Text("Masuk"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
