import 'package:latlong2/latlong.dart';
import '../../../core/enums/map_item_type.dart';
import '../../../core/enums/attraction_category.dart';
import '../../home/models/attraction.dart';
import '../data/exploredata_by.dart';

final List<Attraction> eventAttractions = [
  ...EventArea.entries.expand((entry) {
    return entry.value.map((e) {
      return Attraction(
        name: e['name'] as String,
        image: e['image'] as String,
        category: AttractionCategory.keluarga,
        type: MapItemType.event,
        rating: (e['rating'] as num).toDouble(),
        queueTime: 0,
        minHeight: 0,
        description: e['description'] as String,
        position: _getPosition(e['name'] as String),
      );
    });
  }),
];

LatLng _getPosition(String name) {
  switch (name) {
    // Dufan
    case 'Fireworks Show':
      return const LatLng(-6.121578778316748, 106.83183001008732);

    case 'Theater Musical Show':
      return const LatLng(-6.1243881468832555, 106.83162855847999);

    case 'Magical Night Show':
      return const LatLng(-6.124055995055849, 106.83148675214996);

    // Ancol Area
    case 'Sea World Exhibition':
      return const LatLng(-6.125565092327198, 106.8427950947829);

    case 'Camping Under The Sea':
      return const LatLng(-6.124270845615412, 106.84347904225801);

    case 'Ancol Championship 2026':
      return const LatLng(-6.116656733575507, 106.85679424204011);

    // Nearby Events
    case 'Pasar Seni Ancol':
      return const LatLng(-6.125438592931168, 106.83899335767269);

    default:
      return const LatLng(-6.1220, 106.8340);
  }
}
