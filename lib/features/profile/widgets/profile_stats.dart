import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../services/ticket_service.dart';

class ProfileStats extends StatelessWidget {
  final String email;

  const ProfileStats({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box('tickets');

    return ValueListenableBuilder(
      valueListenable: box.listenable(),
      builder: (context, Box box, _) {
        final active = TicketService.getActiveTicketCount(email);
        final used = TicketService.getUsedTicketCount(email);

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFEF4444), Color(0xFF4A90E2)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              _buildStat(
                icon: Icons.confirmation_number,
                value: active,
                label: "Aktif",
              ),
              _divider(),
              _buildStat(
                icon: Icons.check_circle,
                value: used,
                label: "Digunakan",
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStat({
    required IconData icon,
    required int value,
    required String label,
  }) {
    return Expanded(
      child: _AnimatedStat(icon: icon, value: value, label: label),
    );
  }

  Widget _divider() {
    return Container(
      height: 40,
      width: 1,
      color: Colors.white.withOpacity(0.3),
    );
  }
}

class _AnimatedStat extends StatefulWidget {
  final IconData icon;
  final int value;
  final String label;

  const _AnimatedStat({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  State<_AnimatedStat> createState() => _AnimatedStatState();
}

class _AnimatedStatState extends State<_AnimatedStat>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _scale = Tween<double>(
      begin: 0.85,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant _AnimatedStat oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(widget.icon, color: Colors.white, size: 22),
        ),

        const SizedBox(height: 10),

        // 🔥 COUNT UP + SMOOTH ANIMATION
        TweenAnimationBuilder<int>(
          tween: IntTween(begin: 0, end: widget.value),
          duration: const Duration(milliseconds: 700),
          builder: (context, val, _) {
            return ScaleTransition(
              scale: _scale,
              child: Text(
                "$val",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),

        const SizedBox(height: 4),

        Text(
          widget.label,
          style: TextStyle(color: Colors.white.withOpacity(0.85), fontSize: 12),
        ),
      ],
    );
  }
}
