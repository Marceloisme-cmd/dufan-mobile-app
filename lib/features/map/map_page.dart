import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';

import 'constants/map_constants.dart';
import '../home/data/attractions_data.dart';
import '../event/mapper/event_map_mapper.dart';
import '../home/models/attraction.dart';
import '../../../core/enums/map_item_type.dart';

import 'services/map_style_service.dart';

import 'widgets/map_filter_chips.dart';
import 'widgets/map_legend.dart';
import 'widgets/map_marker_bottom_sheet.dart';
import 'widgets/map_search_bar.dart';

class MapPage extends StatefulWidget {
  final LatLng? focusPosition;
  final String? focusName;

  const MapPage({super.key, this.focusPosition, this.focusName});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with TickerProviderStateMixin {
  late final AnimatedMapController animatedMapController;
  late final AnimationController _pulseController; // 🔥 Controller Animasi

  String _getMarkerIcon(MapItemType type) {
    switch (type) {
      case MapItemType.event:
        return 'assets/icons/event_marker.svg';

      case MapItemType.attraction:
        return 'assets/icons/marker.svg';
    }
  }

  String selectedFilter = 'Semua';
  String searchQuery = '';
  String mapStyle = 'satellite';

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    animatedMapController = AnimatedMapController(vsync: this);

    // 🔥 INISIALISASI ANIMASI KELAP-KELIP (Durasi 800ms bolak-balik)
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.focusPosition != null) {
        await animatedMapController.animateTo(
          dest: widget.focusPosition!,
          zoom: MapConstants.markerZoom,
          duration: const Duration(milliseconds: 1200),
          curve: Curves.easeInOutCubic,
        );
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    _pulseController.dispose(); // 🔥 Wajib dibuang biar gak memory leak
    super.dispose();
  }

  List<Attraction> get allItems => [...attractions, ...eventAttractions];

  List<Attraction> get filteredItems {
    return allItems.where((a) {
      final matchSearch = a.name.toLowerCase().contains(
        searchQuery.toLowerCase(),
      );

      switch (selectedFilter) {
        case 'Wahana':
          return matchSearch && a.type == MapItemType.attraction;
        case 'Event':
          return matchSearch && a.type == MapItemType.event;
        default:
          return matchSearch;
      }
    }).toList();
  }

  List<Attraction> get suggestions {
    if (searchQuery.isEmpty) return [];
    return allItems
        .where((a) => a.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: const Text('Dufan Map'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔍 SEARCH
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 12,
                    color: Colors.black12,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: MapSearchBar(
                controller: searchController,
                onChanged: (value) {
                  setState(() => searchQuery = value);
                },
              ),
            ),

            // 🔎 SUGGESTIONS
            if (suggestions.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(blurRadius: 10, color: Colors.black12),
                  ],
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: suggestions.length,
                  itemBuilder: (context, index) {
                    final a = suggestions[index];

                    return ListTile(
                      leading: SvgPicture.asset(
                        _getMarkerIcon(a.type),
                        width: 28,
                        height: 28,
                      ),
                      title: Text(a.name),
                      onTap: () async {
                        searchController.text = a.name;
                        setState(() => searchQuery = '');

                        await animatedMapController.animateTo(
                          dest: a.position,
                          zoom: MapConstants.markerZoom,
                          duration: const Duration(milliseconds: 1200),
                          curve: Curves.easeInOutCubic,
                        );

                        if (!context.mounted) return;
                        showMapMarkerBottomSheet(context, a);
                      },
                    );
                  },
                ),
              ),

            const SizedBox(height: 12),

            // 🎯 FILTER
            MapFilterChips(
              selectedFilter: selectedFilter,
              onChanged: (value) {
                setState(() => selectedFilter = value);
              },
            ),

            const SizedBox(height: 12),

            // 🗺 MAP
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Stack(
                  children: [
                    FlutterMap(
                      mapController: animatedMapController.mapController,
                      options: MapOptions(
                        initialCenter: MapConstants.dufanCenter,
                        initialZoom: MapConstants.defaultZoom,
                        minZoom: MapConstants.minZoom,
                        maxZoom: MapConstants.maxZoom,
                        cameraConstraint: CameraConstraint.contain(
                          bounds: MapConstants.ancolBounds,
                        ),
                      ),
                      children: [
                        TileLayer(
                          urlTemplate: MapStyleService.getUrl(mapStyle),
                          subdomains: mapStyle == 'light'
                              ? const ['a', 'b', 'c', 'd']
                              : const [],
                        ),
                        MarkerLayer(
                          markers: filteredItems.map((a) {
                            // 🔥 1. LOGIKA WARNA KEMACETAN ANTREAN
                            Color statusColor;
                            if (a.queueTime >= 40) {
                              statusColor = const Color(0xFFEF4444); // Merah
                            } else if (a.queueTime >= 20) {
                              statusColor = const Color(0xFFF97316); // Oranye
                            } else {
                              statusColor = const Color(0xFF10B981); // Hijau
                            }

                            return Marker(
                              point: a.position,
                              width:
                                  70, // Diperlebar agar badge tidak terpotong
                              height:
                                  70, // Dipertinggi agar badge tidak terpotong
                              child: GestureDetector(
                                onTap: () async {
                                  await animatedMapController.animateTo(
                                    dest: a.position,
                                    zoom: MapConstants.markerZoom,
                                    duration: const Duration(
                                      milliseconds: 1200,
                                    ),
                                    curve: Curves.easeInOutCubic,
                                  );

                                  if (!context.mounted) return;
                                  showMapMarkerBottomSheet(context, a);
                                },
                                // STACK MARKER & BADGE
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.center,
                                  children: [
                                    // Ikon asli
                                    SvgPicture.asset(
                                      _getMarkerIcon(a.type),
                                      width: 36,
                                      height: 36,
                                    ),

                                    // 🔥 2. BADGE KELAP KELIP DENGAN IKON DINAMIS
                                    Positioned(
                                      top: 4,
                                      right: 0,
                                      child: AnimatedBuilder(
                                        animation: _pulseController,
                                        builder: (context, child) {
                                          // Tentukan ikon berdasarkan kepadatan
                                          IconData statusIcon;
                                          if (a.queueTime >= 40) {
                                            statusIcon = Icons
                                                .local_fire_department; // Api
                                          } else if (a.queueTime >= 20) {
                                            statusIcon =
                                                Icons.groups; // Orang kumpul
                                          } else {
                                            statusIcon = Icons
                                                .directions_walk; // Jalan santai
                                          }

                                          // Efek kelap-kelip hanya aktif jika antrean >= 20 menit
                                          final isBlinking = a.queueTime >= 20;
                                          // Jika kelap-kelip, bayangannya membesar-mengecil
                                          final glowSpread = isBlinking
                                              ? (_pulseController.value * 4)
                                              : 1.0;
                                          final glowOpacity = isBlinking
                                              ? 0.4 +
                                                    (_pulseController.value *
                                                        0.4)
                                              : 0.6;

                                          return Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 6,
                                              vertical: 3,
                                            ),
                                            decoration: BoxDecoration(
                                              color: statusColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 1.5,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: statusColor.withValues(
                                                    alpha: glowOpacity,
                                                  ),
                                                  blurRadius: 6,
                                                  spreadRadius: glowSpread,
                                                ),
                                              ],
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  statusIcon,
                                                  size: 10,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(width: 2),
                                                Text(
                                                  '${a.queueTime}m',
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),

                    // 🧭 LAYERS BUTTON (orange theme)
                    Positioned(
                      top: 12,
                      right: 12,
                      child: FloatingActionButton.small(
                        backgroundColor: const Color(0xFFEF4444),
                        heroTag: 'layer_btn',
                        onPressed: _showMapStylePicker,
                        child: const Icon(Icons.layers, color: Colors.white),
                      ),
                    ),

                    // 🏠 HOME BUTTON
                    Positioned(
                      top: 72,
                      right: 12,
                      child: FloatingActionButton.small(
                        backgroundColor: Colors.white,
                        heroTag: 'home_btn',
                        onPressed: () async {
                          await animatedMapController.animateTo(
                            dest: MapConstants.dufanCenter,
                            zoom: MapConstants.defaultZoom,
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.easeInOutCubic,
                          );
                        },
                        child: const Icon(Icons.home, color: Color(0xFFEF4444)),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            // 📌 LEGEND
            MapLegend(totalItems: filteredItems.length),
          ],
        ),
      ),
    );
  }

  void _showMapStylePicker() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Pilih Tema Peta',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.satellite_alt),
                title: const Text('Satellite'),
                trailing: mapStyle == 'satellite'
                    ? const Icon(Icons.check, color: Color(0xFFEF4444))
                    : null,
                onTap: () {
                  setState(() => mapStyle = 'satellite');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.map),
                title: const Text('Light Map'),
                trailing: mapStyle == 'light'
                    ? const Icon(Icons.check, color: Color(0xFFEF4444))
                    : null,
                onTap: () {
                  setState(() => mapStyle = 'light');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
