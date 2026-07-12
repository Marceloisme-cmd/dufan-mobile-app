import '../../../core/enums/attraction_category.dart';
import '../../../core/enums/map_item_type.dart';
import 'package:latlong2/latlong.dart';
import '../models/attraction.dart';

final List<Attraction> attractions = [
  // EXTREME
  Attraction(
    name: 'Halilintar',
    image: 'assets/images/halilintar1.png',
    category: AttractionCategory.ekstrim,
    rating: 4.8,
    queueTime: 15,
    minHeight: 140,
    description:
        'Rasakan sensasi melaju dengan kecepatan tinggi melalui lintasan penuh tikungan tajam, tanjakan curam, dan turunan yang memacu adrenalin. Halilintar menjadi salah satu roller coaster paling ikonik di Dufan yang siap memberikan pengalaman menegangkan sekaligus tak terlupakan bagi para pencinta wahana ekstrem.',
    position: const LatLng(-6.122072076224207, 106.83379560908539),
    type: MapItemType.attraction,
  ),

  Attraction(
    name: 'Kora-Kora',
    image: 'assets/images/korakora1.png',
    category: AttractionCategory.ekstrim,
    rating: 4.8,
    queueTime: 15,
    minHeight: 140,
    description:
        'Rasakan sensasi melaju dengan kecepatan tinggi melalui lintasan penuh tikungan tajam, tanjakan curam, dan turunan yang memacu adrenalin. Halilintar menjadi salah satu roller coaster paling ikonik di Dufan yang siap memberikan pengalaman menegangkan sekaligus tak terlupakan bagi para pencinta wahana ekstrem.',
    position: const LatLng(-6.122978144175837, 106.83178856675701),
    type: MapItemType.attraction,
  ),

  Attraction(
    name: 'Kicir-kicir',
    image: 'assets/images/kicir1.png',
    category: AttractionCategory.ekstrim,
    rating: 4.6,
    queueTime: 12,
    minHeight: 140,
    description:
        'Rasakan sensasi melaju diputar kesegala arah dengan kecepatan tinggi melalui lintasan penuh tikungan tajam, tanjakan curam, dan turunan yang memacu adrenalin. Kicir-kicir menjadi salah satu wahana paling ikonik di Dufan yang siap memberikan pengalaman menegangkan sekaligus tak terlupakan bagi para pencinta wahana ekstrem.',
    position: const LatLng(-6.12221741422505, 106.83101713662776),
    type: MapItemType.attraction,
  ),

  Attraction(
    name: 'Hysteria',
    image: 'assets/images/hysteria1.png',
    category: AttractionCategory.ekstrim,
    rating: 4.9,
    queueTime: 20,
    minHeight: 140,
    description:
        'Uji keberanianmu dengan sensasi jatuh bebas dari ketinggian yang membuat jantung berdebar. Hysteria akan mengangkatmu perlahan sebelum meluncur turun dalam hitungan detik dengan kecepatan tinggi, menghadirkan pengalaman yang mendebarkan dan sulit dilupakan.',
    position: const LatLng(-6.122122105668784, 106.831954231292),
    type: MapItemType.attraction,
  ),

  Attraction(
    name: 'Tornado',
    image: 'assets/images/tornado1.png',
    category: AttractionCategory.ekstrim,
    rating: 4.7,
    queueTime: 18,
    minHeight: 140,
    description:
        'Nikmati sensasi diputar dan diayunkan ke berbagai arah dengan kecepatan tinggi layaknya berada di tengah pusaran angin tornado. Kombinasi putaran dan ayunan ekstrem menjadikan wahana ini salah satu favorit bagi pencari tantangan di Dufan.',
    position: const LatLng(-6.1233355475722275, 106.83128565096362),
    type: MapItemType.attraction,
  ),

  // KIDS
  Attraction(
    name: 'Komidi Putar',
    image: 'assets/images/komidiputar1.png',
    category: AttractionCategory.anak,
    rating: 4.5,
    queueTime: 5,
    minHeight: 80,
    description:
        'Komidi Putar menghadirkan pengalaman bermain yang menyenangkan dengan berbagai pilihan kuda dan kendaraan warna-warni. Iringan musik ceria serta suasana yang hangat menjadikannya wahana favorit anak-anak sekaligus tempat yang sempurna untuk mengabadikan momen bersama keluarga.',
    position: const LatLng(-6.123356882820865, 106.83118909141756),
    type: MapItemType.attraction,
  ),

  Attraction(
    name: 'Faunaland',
    image: 'assets/images/rumahlebah1.png',
    category: AttractionCategory.anak,
    rating: 4.4,
    queueTime: 8,
    minHeight: 80,
    description:
        'Faunaland menawarkan pengalaman edukatif yang memadukan rekreasi dengan pembelajaran mengenai berbagai satwa. Pengunjung dapat menikmati suasana alam yang asri sambil mengenal lebih dekat beragam hewan melalui aktivitas interaktif yang cocok untuk anak-anak maupun keluarga.',
    position: const LatLng(-6.124018665494032, 106.83583851447156),
    type: MapItemType.attraction,
  ),

  Attraction(
    name: 'Kolibri',
    image: 'assets/images/kolibri1.png',
    category: AttractionCategory.anak,
    rating: 4.5,
    queueTime: 10,
    minHeight: 0,
    description:
        'Kolibri Dufan adalah wahana yang terinspirasi dari burung Kolibri yang lincah dan bisa melayang di udara. Wahana ini dirancang khusus untuk memberikan sensasi melayang di udara dengan menggunakan kursi yang tergantung dan berputar lembut mengikuti alur musik dan lampu yang menarik. Ini cocok untuk semua keluarga, termasuk anak-anak dan orang dewasa yang ingin merasakan keseruan terbang sambil menikmati pemandangan indah sekitar wahana dari ketinggian.',
    position: const LatLng(-6.1247713173915574, 106.83431357149455),
    type: MapItemType.attraction,
  ),

  // FAMILY
  Attraction(
    name: 'Bianglala',
    image: 'assets/images/bianglala1.png',
    category: AttractionCategory.keluarga,
    rating: 4.6,
    queueTime: 10,
    minHeight: 120,
    description:
        'Naiklah ke puncak Bianglala dan nikmati panorama indah kawasan Dufan serta Teluk Jakarta dari ketinggian. Putarannya yang tenang membuat wahana ini cocok dinikmati bersama keluarga maupun pasangan sambil menikmati pemandangan yang memukau.',
    position: const LatLng(-6.123254409027085, 106.83183366012825),
    type: MapItemType.attraction,
  ),

  Attraction(
    name: 'Istana Boneka',
    image: 'assets/images/istanaboneka1.png',
    category: AttractionCategory.keluarga,
    rating: 4.5,
    queueTime: 7,
    minHeight: 0,
    description:
        'Berlayarlah menyusuri dunia penuh warna yang dihiasi ribuan boneka dari berbagai daerah di Indonesia dan mancanegara. Dengan suasana yang tenang dan penuh cerita, Istana Boneka menjadi pilihan tepat untuk dinikmati oleh seluruh anggota keluarga tanpa batasan usia.',
    position: const LatLng(-6.122569482538611, 106.82993618398274),
    type: MapItemType.attraction,
  ),

  // WATER
  Attraction(
    name: 'Arung Jeram',
    image: 'assets/images/arumjeram1.png',
    category: AttractionCategory.air,
    rating: 4.7,
    queueTime: 12,
    minHeight: 120,
    description:
        'Siapkan dirimu untuk petualangan seru menyusuri derasnya arus sungai buatan dengan berbagai tikungan dan percikan air yang menyegarkan. Arung Jeram menawarkan pengalaman penuh tawa dan keseruan yang cocok dinikmati bersama teman maupun keluarga.',
    position: const LatLng(-6.12298512082207, 106.83394203560752),
    type: MapItemType.attraction,
  ),

  Attraction(
    name: 'Niagara Gara',
    image: 'assets/images/niagaragara1.png',
    category: AttractionCategory.air,
    rating: 4.8,
    queueTime: 15,
    minHeight: 120,
    description:
        'Rasakan sensasi meluncur dari ketinggian menggunakan perahu sebelum dihantam percikan air yang spektakuler di akhir lintasan. Kombinasi ketegangan dan kesegaran menjadikan Niagara Gara sebagai salah satu wahana air paling populer yang wajib dicoba saat berkunjung ke Dufan.',
    position: const LatLng(-6.1238409421275035, 106.83053706258919),
    type: MapItemType.attraction,
  ),
];