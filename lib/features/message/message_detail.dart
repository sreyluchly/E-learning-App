import 'package:flutter/material.dart';
//import 'message_detail.dart';
class MessageDetailScreen extends StatelessWidget {
  const MessageDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: const Color(0xFF007BFF),
        elevation: 0,
        title: const Text("Messages", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildUserInfoHeader(),
          Expanded(child: _buildChatList()),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildUserInfoHeader() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          const Icon(Icons.arrow_back_ios, size: 20),
          const SizedBox(width: 10),
          const CircleAvatar(backgroundImage: NetworkImage('https://via.placeholder.com/150')),
          const SizedBox(width: 12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("SreyLuch LY", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Active", style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          const Spacer(),
          IconButton(onPressed: () {}, icon: const Icon(Icons.phone_outlined, color: Colors.blue)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.chat_bubble_outline, color: Colors.blue)),
        ],
      ),
    );
  }

  Widget _buildChatList() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _bubble("Hello Teacher!", false, "9:35 AM"),
        _bubble("Yes hello Student", true, "10:35 AM"),
        _bubble("I would like to as permission leave for today.", false, "10:37 AM"),
        _bubble("Okay please take the rest and recover soon", true, "10:40 AM"),
        _bubble("Thank you teacher", false, "10:42 AM"),
      ],
    );
  }

  Widget _bubble(String text, bool isMe, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(time, style: const TextStyle(fontSize: 10, color: Colors.grey)),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.all(15),
            constraints: const BoxConstraints(maxWidth: 250),
            decoration: BoxDecoration(
              color: isMe ? const Color(0xFF007BFF) : Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5)],
            ),
            child: Text(text, style: TextStyle(color: isMe ? Colors.white : Colors.black87)),
          ),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.all(15),
      color: Colors.white,
      child: Row(
        children: [
          const Icon(Icons.add_circle, color: Colors.blue),
          const SizedBox(width: 10),
          const Icon(Icons.camera_alt, color: Colors.blue),
          const SizedBox(width: 10),
          const Icon(Icons.photo, color: Colors.blue),
          const SizedBox(width: 10),
          const Icon(Icons.mic, color: Colors.blue),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(25)),
              child: const TextField(decoration: InputDecoration(hintText: "Aa", border: InputBorder.none)),
            ),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.send, color: Colors.blue),
        ],
      ),
    );
  }
}