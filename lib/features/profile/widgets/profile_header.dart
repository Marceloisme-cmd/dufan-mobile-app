import 'package:flutter/material.dart';
import '../models/profile_model.dart'; // Sesuaikan dengan path projectmu

class ProfileHeader extends StatelessWidget {
  final UserModel user;

  const ProfileHeader({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              // Banner Image
              Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(28),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(user.bannerUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(28),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.1),
                        Colors.black.withOpacity(0.4),
                      ],
                    ),
                  ),
                ),
              ),
              // User Info
              Positioned(
                bottom: 16,
                left: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      user.email,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              // Floating Avatar
              Positioned(
                bottom: -20,
                left: 20,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const CircleAvatar(
                    radius: 36,
                    backgroundColor: Color(0xFFE3F2FD),
                    child: Icon(Icons.person, size: 44, color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
        ],
      ),
    );
  }
}
