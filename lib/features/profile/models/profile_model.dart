import 'package:flutter/material.dart';

// Model untuk Data User
class UserModel {
  final String name;
  final String email;
  final String avatarUrl;
  final String bannerUrl;
  final int visitsCount;
  final int ticketsCount;
  final int favoritesCount;

  UserModel({
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.bannerUrl,
    required this.visitsCount,
    required this.ticketsCount,
    required this.favoritesCount,
  });
}

// Model untuk Item Menu List
class ProfileMenuItemModel {
  final IconData icon;
  final Color iconBgColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  ProfileMenuItemModel({
    required this.icon,
    required this.iconBgColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
}
