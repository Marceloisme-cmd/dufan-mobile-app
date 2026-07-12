import 'package:flutter/material.dart';

import 'widgets/home_header.dart';
import 'widgets/hero_banner.dart';
import 'widgets/category_section.dart';
import 'widgets/ticket_shortcut.dart';
import 'widgets/map_shortcut.dart';
import '../ticket/pages/ticket_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),

        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const HomeHeader(),
                HeroBanner(),
                const CategorySection(),

                const SizedBox(height: 20),

                MapShortcut(),

                const SizedBox(height: 12),

                TicketShortcut(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const TicketPage()),
                    );
                  },
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
