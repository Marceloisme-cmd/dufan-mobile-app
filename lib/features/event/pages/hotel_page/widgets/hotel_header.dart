import 'package:flutter/material.dart';

class HotelHeader extends StatelessWidget {
  final Map<String, dynamic> hotel;

  const HotelHeader({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 320,
      pinned: true,
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,

      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: CircleAvatar(
          backgroundColor: Colors.white.withOpacity(.9),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),

      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(.9),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border, color: Colors.black),
            ),
          ),
        ),
      ],

      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Hero(
              tag: hotel['name'],
              child: Image.asset(hotel['image'], fit: BoxFit.cover),
            ),

            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black54],
                ),
              ),
            ),

            Positioned(
              left: 20,
              right: 20,
              bottom: 24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hotel['name'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 18,
                      ),

                      const SizedBox(width: 4),

                      Text(
                        hotel['distance'],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
