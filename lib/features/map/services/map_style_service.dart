class MapStyleService {
  static String getUrl(String style) {
    switch (style) {
      case 'light':
        return 'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png';

      case 'satellite':
      default:
        return 'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}';
    }
  }
}
