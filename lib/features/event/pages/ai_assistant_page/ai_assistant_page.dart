import 'package:dufan_app/features/event/pages/ai_assistant_page/data/dufan_ai_formatter.dart';
import 'package:flutter/material.dart';

import '../ai_assistant_page/models/chat_message.dart';
import '../ai_assistant_page/widgets/chat_bubble.dart';
import '../ai_assistant_page/services/gemini_services.dart';

import '../../../home/data/attractions_data.dart';
import '../../data/event_data.dart';

class AiAssistantPage extends StatefulWidget {
  const AiAssistantPage({super.key});

  @override
  State<AiAssistantPage> createState() => _AiAssistantPageState();
}

class _AiAssistantPageState extends State<AiAssistantPage> {
  final GeminiService geminiService = GeminiService();

  final TextEditingController controller = TextEditingController();

  final ScrollController scrollController = ScrollController();

  bool isLoading = false;

  final List<ChatMessage> messages = [
    ChatMessage(
      message:
          "Halo 👋\n"
          "Saya Dufan AI Assistant.\n\n"
          "Saya bisa membantu kamu mencari wahana, "
          "event, dan rekomendasi perjalanan di Dufan 🎢",

      isUser: false,

      time: DateTime.now(),
    ),
  ];

  String getAttractionsData() {
    String data = "";

    for (final item in attractions) {
      data +=
          """

Nama: ${item.name}
Kategori: ${item.category}
Rating: ${item.rating}
Antrian: ${item.queueTime} menit
Minimal tinggi: ${item.minHeight} cm
Deskripsi: ${item.description}

""";
    }

    return data;
  }

  String getEventsData() {
    String data = "";

    events.forEach((category, list) {
      data += "\nKategori: $category\n";

      for (final event in list) {
        data +=
            """

Nama: ${event['name']}
Rating: ${event['rating']}
Tanggal: ${event['date']}
Harga: ${event['price'] ?? '-'}
Deskripsi: ${event['description']}

""";
      }
    });

    return data;
  }

  Future<void> sendMessage() async {
    final text = controller.text.trim();

    if (text.isEmpty) return;

    setState(() {
      messages.add(
        ChatMessage(message: text, isUser: true, time: DateTime.now()),
      );

      controller.clear();

      isLoading = true;
    });

    scrollBottom();

    final response = await geminiService.sendMessage(
      message: text,

      attractionsData: getAttractionsData(),

      eventsData: getEventsData(),

      exploreData: getExploreKnowledge(),
    );

    setState(() {
      messages.add(
        ChatMessage(message: response, isUser: false, time: DateTime.now()),
      );

      isLoading = false;
    });

    scrollBottom();
  }

  void scrollBottom() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,

          duration: const Duration(milliseconds: 300),

          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dufan AI Assistant")),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: scrollController,

              padding: const EdgeInsets.all(12),

              itemCount: messages.length,

              itemBuilder: (context, index) {
                return ChatBubble(message: messages[index]);
              },
            ),
          ),

          if (isLoading)
            const Padding(
              padding: EdgeInsets.all(8),

              child: Text("AI sedang mengetik..."),
            ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),

              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,

                      decoration: const InputDecoration(
                        hintText: "Tanyakan tentang Dufan...",

                        border: OutlineInputBorder(),
                      ),

                      onSubmitted: (_) {
                        sendMessage();
                      },
                    ),
                  ),

                  IconButton(
                    icon: const Icon(Icons.send),

                    onPressed: sendMessage,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
