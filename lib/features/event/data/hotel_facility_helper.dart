import 'package:flutter/material.dart';

class HotelFacilityHelper {
  static IconData getIcon(String fasilitas) {
    switch (fasilitas) {
      case 'wifi':
        return Icons.wifi;

      case 'kolam_renang':
        return Icons.pool;

      case 'restoran':
        return Icons.restaurant;

      case 'sarapan':
        return Icons.free_breakfast;

      case 'parkir':
        return Icons.local_parking;

      case 'pusat_kebugaran':
        return Icons.fitness_center;

      case 'area_bermain_anak':
        return Icons.child_friendly;

      case 'resepsionis_24_jam':
        return Icons.support_agent;

      case 'akses_pantai':
        return Icons.beach_access;

      case 'pondok_pribadi':
        return Icons.cabin;

      case 'ruang_pertemuan':
        return Icons.meeting_room;

      case 'antar_jemput':
        return Icons.airport_shuttle;

      default:
        return Icons.check_circle;
    }
  }

  static String getTitle(String fasilitas) {
    switch (fasilitas) {
      case 'wifi':
        return 'WiFi Gratis';

      case 'kolam_renang':
        return 'Kolam Renang';

      case 'restoran':
        return 'Restoran';

      case 'sarapan':
        return 'Sarapan';

      case 'parkir':
        return 'Area Parkir';

      case 'pusat_kebugaran':
        return 'Pusat Kebugaran';

      case 'area_bermain_anak':
        return 'Area Bermain Anak';

      case 'resepsionis_24_jam':
        return 'Resepsionis 24 Jam';

      case 'akses_pantai':
        return 'Akses Pantai';

      case 'pondok_pribadi':
        return 'Pondok Pribadi';

      case 'ruang_pertemuan':
        return 'Ruang Pertemuan';

      case 'antar_jemput':
        return 'Layanan Antar Jemput';

      default:
        return fasilitas;
    }
  }
}
