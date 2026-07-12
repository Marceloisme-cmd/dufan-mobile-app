import 'package:flutter/material.dart';

class MapSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const MapSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: Color(0xFFEF4444), // orange accent kamu
          ),

          const SizedBox(width: 10),

          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              cursorColor: const Color(0xFFEF4444),
              decoration: const InputDecoration(
                hintText: 'Cari wahana atau event...',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                border: InputBorder.none,
              ),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),

          // optional clear button (UX upgrade)
          ValueListenableBuilder(
            valueListenable: controller,
            builder: (context, value, child) {
              return controller.text.isNotEmpty
                  ? GestureDetector(
                      onTap: () {
                        controller.clear();
                        onChanged('');
                      },
                      child: const Icon(
                        Icons.close,
                        size: 18,
                        color: Colors.grey,
                      ),
                    )
                  : const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
