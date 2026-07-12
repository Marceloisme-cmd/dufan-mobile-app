import 'package:flutter/material.dart';

import '../models/chat_message.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.isUser;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: isUser
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isUser) ...[
              const CircleAvatar(
                radius: 18,
                backgroundColor: Color(0xff1976D2),
                child: Icon(Icons.smart_toy, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 10),
            ],

            Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: isUser ? const Color(0xff1976D2) : Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(18),
                    topRight: const Radius.circular(18),
                    bottomLeft: Radius.circular(isUser ? 18 : 4),
                    bottomRight: Radius.circular(isUser ? 4 : 18),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.05),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.message,
                      style: TextStyle(
                        color: isUser ? Colors.white : Colors.black87,
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        _formatTime(message.time),
                        style: TextStyle(
                          fontSize: 11,
                          color: isUser ? Colors.white70 : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            if (isUser) ...[
              const SizedBox(width: 10),
              const CircleAvatar(
                radius: 18,
                backgroundColor: Color(0xff1976D2),
                child: Icon(Icons.person, color: Colors.white, size: 20),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');

    return "$hour:$minute";
  }
}
