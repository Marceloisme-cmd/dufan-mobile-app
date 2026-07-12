import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapConstants {
  static const LatLng dufanCenter = LatLng(
    -6.124197898175964,
    106.83217938797036,
  );

  static const double defaultZoom = 17;
  static const double markerZoom = 18.5;
  static const double minZoom = 14;
  static const double maxZoom = 20;

  static final LatLngBounds ancolBounds = LatLngBounds(
    const LatLng(-6.145, 106.800),
    const LatLng(-6.095, 106.875),
  );
}
