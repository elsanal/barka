import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class DirectMessagePage extends StatefulWidget {
  const DirectMessagePage({super.key});

  @override
  State<DirectMessagePage> createState() => _DirectMessagePageState();
}

class _DirectMessagePageState extends State<DirectMessagePage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  final ScrollController _scrollController = ScrollController();

  bool _showEmojiPicker = false;

  bool get isOnline {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, now.day, 9, 0);
    final end = DateTime(now.year, now.month, now.day, 18, 0);
    return now.isAfter(start) && now.isBefore(end);
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add({
        "type": "text",
        "content": text.trim(),
        "sender": "user",
        "time": DateTime.now(),
      });
    });

    _controller.clear();
    _scrollToBottom();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _messages.add({
          "type": "text",
          "content": isOnline
              ? "Thanks for your message! How can I assist you?"
              : "Thanks for your message! Our team will respond during business hours.",
          "sender": "admin",
          "time": DateTime.now(),
        });
      });
      _scrollToBottom();
    });
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImage != null) {
      setState(() {
        _messages.add({
          "type": "image",
          "content": pickedImage.path,
          "sender": "user",
          "time": DateTime.now(),
        });
      });
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Direct Message"), centerTitle: true),
      body: Column(
        children: [
          // Status bar
          Container(
            padding: const EdgeInsets.all(8),
            color: isOnline ? Colors.green.shade100 : Colors.red.shade100,
            child: Row(
              children: [
                Icon(
                  isOnline ? Icons.circle : Icons.access_time,
                  size: 14,
                  color: isOnline ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 6),
                Text(
                  isOnline
                      ? "We’re online! Chat with us now."
                      : "We’re offline. Leave a message and we’ll reply later.",
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),

          // Messages
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              padding: const EdgeInsets.all(12),
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isUser = msg["sender"] == "user";

                Widget messageWidget;
                if (msg["type"] == "image") {
                  messageWidget = Image.file(File(msg["content"]), width: 200);
                } else {
                  messageWidget = Text(msg["content"]);
                }

                return Align(
                  alignment: isUser
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(10),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    decoration: BoxDecoration(
                      color: isUser
                          ? Colors.blue.shade100
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(12),
                        topRight: const Radius.circular(12),
                        bottomLeft: isUser
                            ? const Radius.circular(12)
                            : const Radius.circular(0),
                        bottomRight: isUser
                            ? const Radius.circular(0)
                            : const Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: isUser
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        messageWidget,
                        const SizedBox(height: 4),
                        Text(
                          DateFormat("HH:mm").format(msg["time"]),
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Input + Buttons
          SafeArea(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    border: Border(
                      top: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.emoji_emotions_outlined,
                          color: Colors.orange,
                        ),
                        onPressed: () {
                          setState(() {
                            _showEmojiPicker = !_showEmojiPicker;
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.image, color: Colors.green),
                        onPressed: _pickImage,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          minLines: 1,
                          maxLines: 5,
                          decoration: const InputDecoration(
                            hintText: "Type a message...",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send, color: Colors.blue),
                        onPressed: () => _sendMessage(_controller.text),
                      ),
                    ],
                  ),
                ),

                // Emoji picker widget
                _showEmojiPicker
                    ? SizedBox(
                        height: 250,
                        child: EmojiPicker(
                          onEmojiSelected: (category, emoji) {
                            _controller.text += emoji.emoji;
                          },
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
