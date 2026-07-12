import '../../../../home/data/attractions_data.dart';
import '../../../data/event_data.dart';
import '../../../data/exploredata_by.dart';

String getAttractionsKnowledge() {
  String result = "";

  for (var item in attractions) {
    result +=
        """

Nama: ${item.name}
Kategori: ${item.category}
Rating: ${item.rating}
Waktu antre: ${item.queueTime} menit
Minimal tinggi: ${item.minHeight} cm
Deskripsi: ${item.description}

---------------------

""";
  }

  return result;
}

String getEventsKnowledge() {
  String result = "";

  events.forEach((category, list) {
    result +=
        """

Kategori: $category

""";

    for (var event in list) {
      result +=
          """

Nama: ${event['name']}
Rating: ${event['rating']}
Tanggal: ${event['date']}
Harga: ${event['price'] ?? '-'}
Deskripsi: ${event['description']}

---------------------

""";
    }
  });

  return result;
}

String getExploreKnowledge() {
  String result = "";

  EventArea.forEach((area, list) {
    result +=
        """

Area: $area

""";

    for (var item in list) {
      result +=
          """

Nama: ${item['name']}
Rating: ${item['rating']}
Tanggal: ${item['date']}
Deskripsi: ${item['description']}

---------------------

""";
    }
  });

  return result;
}
