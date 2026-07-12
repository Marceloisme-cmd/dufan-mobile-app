import 'package:flutter/material.dart';

import '../home/home_page.dart';
import '../event/event_page.dart';
import '../map/map_page.dart';
import '../ticket/pages/ticket_page.dart';
import '../profile/profile_page.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    EventPage(),
    const MapPage(),
    const TicketPage(),
    const ProfilePage(),
  ];

  void _onTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFEF4444);

    return Scaffold(
      body: _pages[_selectedIndex],

      // 🔥 CUSTOM CURVED NAV BAR
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          // NAV BACKGROUND
          Container(
            height: 75,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 20,
                  offset: const Offset(0, -5),
                ),
              ],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.home, 0, "Beranda", primaryColor),
                _buildNavItem(Icons.event, 1, "Jelajahi", primaryColor),

                const SizedBox(width: 50), // space for center button

                _buildNavItem(Icons.map, 2, "Map", primaryColor),
                _buildNavItem(Icons.person, 4, "Aktifitas", primaryColor),
              ],
            ),
          ),

          // 🔥 CENTER BUY BUTTON
          Positioned(
            top: -25,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 3; // Ticket Page
                });
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFFEF4444), Color(0xFFFF6B6B)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.4),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.local_activity_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    int index,
    String label,
    Color primaryColor,
  ) {
    final isActive = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onTab(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isActive ? primaryColor : Colors.grey),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: isActive ? primaryColor : Colors.grey,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
