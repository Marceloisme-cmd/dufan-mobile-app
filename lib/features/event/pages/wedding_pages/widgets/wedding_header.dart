import 'package:flutter/material.dart';

class WeddingHeader extends StatelessWidget {
  final Map<String, dynamic> wedding;

  const WeddingHeader({super.key, required this.wedding});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 320,
      pinned: true,
      backgroundColor: Colors.white,
      elevation: 0,

      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),

      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: wedding['name'],
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(wedding['image'], fit: BoxFit.cover),

              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black54, Colors.transparent],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
