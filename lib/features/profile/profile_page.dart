import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import 'models/profile_model.dart';

import 'widgets/profile_header.dart';
import 'widgets/profile_stats.dart';
import 'widgets/profile_menu_title.dart';

import 'pages/my_tickets_page.dart';
import 'pages/favorite_attractions_page.dart';
import 'pages/notifications_page.dart';
import '../auth/auth_choice_page.dart';
import '../event/pages/hotel_page/pages/hotel_booking_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  Future<UserModel> _getUser() async {
    final name = await AuthService.getName();
    final email = await AuthService.getEmail();

    return UserModel(
      name: name ?? 'User',
      email: email ?? 'user@email.com',
      avatarUrl: '',
      bannerUrl:
          'https://images.unsplash.com/photo-1501281668745-f7f57925c3b4?auto=format&fit=crop&w=600&q=80',
      visitsCount: 12,
      ticketsCount: 24, // ❌ ini nanti boleh dihapus kalau mau clean
      favoritesCount: 8,
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<ProfileMenuItemModel> menuItems = [
      ProfileMenuItemModel(
        icon: Icons.confirmation_number_outlined,
        iconBgColor: Colors.orange,
        title: 'Tiket Dufan',
        subtitle: 'tiket dufan yang aktif',
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const MyTicketsPage()),
        ),
      ),
      ProfileMenuItemModel(
        icon: Icons.hotel_outlined,
        iconBgColor: Colors.red,
        title: 'Reservasi Hotel',
        subtitle: 'Lihat riwayat reservasi hotel',
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const HotelBookingPage()),
        ),
      ),

      ProfileMenuItemModel(
        icon: Icons.favorite,
        iconBgColor: Colors.pink,
        title: 'Wahana Favorit',
        subtitle: 'wahana dufan yan kamu sukai',
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const FavoriteAttractionsPage()),
        ),
      ),

      ProfileMenuItemModel(
        icon: Icons.notifications,
        iconBgColor: Colors.blue,
        title: 'Notifikasi',
        subtitle: 'Pemberitahuan',
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const NotificationsPage()),
        ),
      ),

      ProfileMenuItemModel(
        icon: Icons.logout,
        iconBgColor: Colors.red,
        title: 'Keluar',
        subtitle: 'Keluar dari akun',
        onTap: () async {
          final confirm = await showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text("Keluar"),
              content: const Text("Yakin mau keluar dari akun?"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text("Batal"),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text("Keluar"),
                ),
              ],
            ),
          );

          if (confirm != true) return;

          await AuthService.logout();

          if (!context.mounted) return;

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const AuthChoicePage()),
            (route) => false,
          );
        },
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFE9EBF1),

      body: FutureBuilder<UserModel>(
        future: _getUser(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final user = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              children: [
                const SizedBox(height: 20),

                ProfileHeader(user: user),

                const SizedBox(height: 16),

                // 🔥 AUTO REAL TIME STATS
                ProfileStats(email: user.email),

                const SizedBox(height: 16),

                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: menuItems.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    return ProfileMenuTile(item: menuItems[index]);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
