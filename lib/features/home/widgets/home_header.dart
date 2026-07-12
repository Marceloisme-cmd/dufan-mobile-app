import 'package:flutter/material.dart';
import '../../../services/auth_service.dart';
import '../../profile/pages/notifications_page.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  Future<String> _getUserName() async {
    final name = await AuthService.getName();
    return name ?? 'User';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Greeting
          FutureBuilder<String>(
            future: _getUserName(),
            builder: (context, snapshot) {
              final name = snapshot.data ?? 'User';

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Selamat Datang,',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$name 👋',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            },
          ),

          // Notification Button
          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NotificationsPage()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.notifications_none_rounded),
            ),
          ),
        ],
      ),
    );
  }
}
