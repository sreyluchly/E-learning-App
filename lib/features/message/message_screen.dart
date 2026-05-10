import 'package:flutter/material.dart';
import 'message_detail.dart';
// 1. ADD onTab to the model
class MessageItem {
  final String title;
  final String subtitle;
  final String time;
  final int unreadCount;
  final Color accentColor;
  final String category;
  final VoidCallback? onTap; // Added this to handle clicks

  MessageItem({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.unreadCount,
    required this.accentColor,
    required this.category,
    this.onTap,
  });
}

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  int _selectedIndex = 0;

  final List<String> images = [
    "https://i.pinimg.com/1200x/82/53/f4/8253f46af6e9eaa5699b8bf1387653e9.jpg",
    "https://i.pinimg.com/736x/5f/cb/0a/5fcb0a5578d81bba2917013c511cc247.jpg",
    "https://i.pinimg.com/736x/62/ff/b4/62ffb4415bea4923b0f064d335b8a3f9.jpg",
    "https://i.pinimg.com/736x/3c/0b/aa/3c0baabe899969c74ba35264695b7646.jpg",
    "https://i.pinimg.com/1200x/35/3d/7a/353d7a34da6baa266f4557b8181cb33c.jpg",
  ];

  final List<String> _tabs = ['All', 'Classes', 'Students', 'Announcements'];

  // 2. FIXED SYNTAX: Removed 'on press' and used 'onTap'
  late final List<MessageItem> _messages = [
    MessageItem(
      title: 'Class CS Weekend',
      subtitle: 'Don\'t forget about the quiz assign for Friday!',
      time: '10:30 AM',
      unreadCount: 3,
      accentColor: const Color(0xFF007BFF),
      category: 'Classes',
    ),
    MessageItem(
      title: 'SreyLuch LY',
      subtitle: 'Thank you for your help!',
      time: '10:30 AM',
      unreadCount: 1,
      accentColor: const Color(0xFF4A4A4A),
      category: 'Students',
      onTap: () {
         // This now correctly triggers navigation
         Navigator.push(
           context,
           MaterialPageRoute(builder: (context) => const MessageDetailScreen()),
         );
      },
    ),
    MessageItem(
      title: 'Science Class',
      subtitle: 'Project guidelines attached.',
      time: 'Yesterday',
      unreadCount: 2,
      accentColor: const Color(0xFF6EC1E4),
      category: 'Classes',
    ),
    MessageItem(
      title: 'Sreypin Thim',
      subtitle: 'Can you share the notes?',
      time: 'May 7',
      unreadCount: 0,
      accentColor: const Color(0xFF8A6BFF),
      category: 'Students',
    ),
     MessageItem(
      title: 'Support Team',
      subtitle: 'Can you share the notes?',
      time: 'May 7',
      unreadCount: 0,
      accentColor: const Color(0xFF8A6BFF),
      category: 'classes',
    ),
  ];

  List<MessageItem> get _filteredMessages {
    if (_selectedIndex == 0) return _messages;
    return _messages.where((m) => m.category == _tabs[_selectedIndex]).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF007BFF),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    _buildTabs(),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: _filteredMessages.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          return _buildMessageTile(_filteredMessages[index], index);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= REUSABLE WIDGETS =================

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          _iconButton(Icons.notifications_active),
          const Expanded(
            child: Center(
              child: Text('Messages', 
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(width: 46),
        ],
      ),
    );
  }

  Widget _iconButton(IconData icon) {
    return Container(
      width: 46, height: 46,
      decoration: BoxDecoration(color: Colors.white24, shape: BoxShape.circle),
      child: Icon(icon, color: Colors.white),
    );
  }

  Widget _buildTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(color: const Color(0xFFF5F7FB), borderRadius: BorderRadius.circular(22)),
        padding: const EdgeInsets.all(6),
        child: Row(
          children: List.generate(_tabs.length, (index) {
            bool selected = _selectedIndex == index;
            return Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _selectedIndex = index),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: selected ? const Color(0xFF007BFF) : Colors.transparent,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Center(
                    child: Text(_tabs[index], 
                      style: TextStyle(color: selected ? Colors.white : Colors.black54, fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildMessageTile(MessageItem item, int index) {
    return GestureDetector(
      onTap: item.onTap, // 3. CLICK HANDLER ATTACHED HERE
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFEFEFF3)),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4))],
        ),
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            _buildAvatar(index),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(item.subtitle, maxLines: 1, overflow: TextOverflow.ellipsis, 
                    style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(width: 12),
            _buildTrailing(item),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(int index) {
    return CircleAvatar(
      radius: 22,
      backgroundImage: NetworkImage(images[index % images.length]),
    );
  }

  Widget _buildTrailing(MessageItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(item.time, style: const TextStyle(fontSize: 11, color: Colors.grey)),
        const SizedBox(height: 6),
        if (item.unreadCount > 0)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(color: const Color(0xFF007BFF), borderRadius: BorderRadius.circular(12)),
            child: Text(item.unreadCount.toString(), 
              style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
          ),
      ],
    );
  }
}