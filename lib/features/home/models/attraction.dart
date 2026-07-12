import 'package:latlong2/latlong.dart';
import '../../../core/enums/attraction_category.dart';
import '../../../core/enums/map_item_type.dart';

class Attraction {
  final String name;
  final String image;

  final AttractionCategory category; // filter kategori wahana
  final MapItemType type; // map type (attraction / event)

  final double rating;
  final int queueTime;
  final int minHeight;
  final String description;

  final LatLng position;

  const Attraction({
    required this.name,
    required this.image,
    required this.category,
    required this.type,
    required this.rating,
    required this.queueTime,
    required this.minHeight,
    required this.description,
    required this.position,
  });
}
