import 'package:flutter/material.dart';

import '../models/quick_menu.dart';
import 'quick_menu_item.dart';

class QuickMenuSection extends StatelessWidget {
  const QuickMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    final menus = [
      const QuickMenu(title: 'Tickets', iconPath: 'assets/icons/ticket.svg'),
      const QuickMenu(title: 'Map', iconPath: 'assets/icons/map.svg'),
      const QuickMenu(title: 'Events', iconPath: 'assets/icons/event.svg'),
      const QuickMenu(title: 'Hotel', iconPath: 'assets/icons/hotel.svg'),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: menus.map((menu) => QuickMenuItem(menu: menu)).toList(),
      ),
    );
  }
}
