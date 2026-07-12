import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/quick_menu.dart';

class QuickMenuItem extends StatelessWidget {
  final QuickMenu menu;

  const QuickMenuItem({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: SvgPicture.asset(menu.iconPath, width: 24, height: 24),
          ),
        ),

        const SizedBox(height: 8),

        Text(menu.title, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
