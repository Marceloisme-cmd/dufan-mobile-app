import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class GeminiService {
  static const String apiKey = "YOUR_API_KEY";

  static const String endpoint =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent";

  Future<String> sendMessage({
    required String message,
    required String attractionsData,
    required String eventsData,
    required String exploreData,
  }) async {
    final url = Uri.parse("$endpoint?key=$apiKey");

    final prompt =
        """
Kamu adalah **Dufan AI Assistant**, asisten virtual resmi Dunia Fantasi (Dufan).

====================================================
TUGAS
====================================================

- Membantu pengunjung mencari informasi wahana.
- Memberikan informasi event.
- Memberikan informasi Explore by Area.
- Memberikan rekomendasi wahana.
- Membantu menyusun itinerary kunjungan.
- Menjawab pertanyaan dengan Bahasa Indonesia yang ramah.

====================================================
ATURAN
====================================================

1. Gunakan HANYA data yang diberikan.

2. Jangan menggunakan pengetahuan di luar data.

3. Jangan mengarang informasi.

4. Jika informasi tidak tersedia pada data, jawab:

"Maaf, informasi tersebut belum tersedia pada data Dufan saat ini."

5. Jika pengguna meminta rekomendasi wahana:
- pertimbangkan rating
- kategori
- waktu antre
- tinggi minimum

6. Jika pengguna meminta itinerary:
- gunakan hanya wahana yang tersedia
- gunakan event yang tersedia
- susun urutan perjalanan yang masuk akal
- pertimbangkan waktu antre

7. Jawaban harus:
- singkat
- jelas
- mudah dipahami
- menggunakan Bahasa Indonesia

====================================================
DATA WAHANA
====================================================

$attractionsData

====================================================
DATA EVENT
====================================================

$eventsData

====================================================
DATA EXPLORE BY AREA
====================================================

$exploreData

====================================================
PERTANYAAN PENGUNJUNG
====================================================

$message

====================================================
JAWABAN
====================================================
""";
    try {
      final response = await http
          .post(
            url,
            headers: const {"Content-Type": "application/json"},
            body: jsonEncode({
              "contents": [
                {
                  "parts": [
                    {"text": prompt},
                  ],
                },
              ],

              "generationConfig": {
                "temperature": 0.4,
                "topP": 0.8,
                "topK": 20,
                "maxOutputTokens": 700,
              },

              "safetySettings": [
                {
                  "category": "HARM_CATEGORY_HARASSMENT",
                  "threshold": "BLOCK_NONE",
                },
                {
                  "category": "HARM_CATEGORY_HATE_SPEECH",
                  "threshold": "BLOCK_NONE",
                },
                {
                  "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
                  "threshold": "BLOCK_NONE",
                },
                {
                  "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
                  "threshold": "BLOCK_NONE",
                },
              ],
            }),
          )
          .timeout(const Duration(seconds: 30));

      if (response.statusCode != 200) {
        switch (response.statusCode) {
          case 400:
            return "Permintaan ke AI tidak valid.";

          case 403:
            return "API Key tidak valid.";

          case 404:
            return "Model AI tidak ditemukan.";

          case 429:
            return "AI sedang digunakan banyak pengguna. Silakan coba beberapa saat lagi.";

          case 500:
            return "Server AI sedang mengalami gangguan.";

          default:
            return "Terjadi kesalahan (${response.statusCode}).";
        }
      }

      final Map<String, dynamic> json =
          jsonDecode(response.body) as Map<String, dynamic>;

      if (json["candidates"] == null) {
        return "Maaf, AI tidak memberikan jawaban.";
      }

      final candidates = json["candidates"] as List;

      if (candidates.isEmpty) {
        return "Maaf, AI tidak memberikan jawaban.";
      }

      final content = candidates.first["content"];

      if (content == null) {
        return "Maaf, AI tidak memberikan jawaban.";
      }

      final parts = content["parts"] as List;

      if (parts.isEmpty) {
        return "Maaf, AI tidak memberikan jawaban.";
      }

      final text = parts.first["text"];

      if (text == null || text.toString().trim().isEmpty) {
        return "Maaf, AI tidak memberikan jawaban.";
      }

      return text.toString().trim();
    } on TimeoutException {
      return "Koneksi ke AI terlalu lama. Silakan coba kembali.";
    } on FormatException {
      return "Respon AI tidak dapat diproses.";
    } catch (e) {
      return "Terjadi kesalahan saat menghubungkan ke AI.";
    }
  }
}
