import 'package:flutter/material.dart';

class MapFilterChips extends StatelessWidget {
  final String selectedFilter;
  final Function(String) onChanged;

  const MapFilterChips({
    super.key,
    required this.selectedFilter,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildChip('Semua'),
          const SizedBox(width: 8),
          _buildChip('Wahana'),
          const SizedBox(width: 8),
          _buildChip('Event'),
        ],
      ),
    );
  }

  Widget _buildChip(String label) {
    return ChoiceChip(
      label: Text(label),
      selected: selectedFilter == label,
      onSelected: (_) {
        onChanged(label);
      },
    );
  }
}
