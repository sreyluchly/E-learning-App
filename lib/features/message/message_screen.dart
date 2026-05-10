import 'package:flutter/material.dart';

class MessageItem {
  final String title;
  final String subtitle;
  final String time;
  final int unreadCount;
  final Color accentColor;
  final String category;

  MessageItem({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.unreadCount,
    required this.accentColor,
    required this.category,
  });
}

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  int _selectedIndex = 0;

  final List<String> _tabs = ['All', 'Classes', 'Students', 'Announcements'];

  final List<MessageItem> _messages = [
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
      subtitle: 'Your request has been received.',
      time: 'May 7',
      unreadCount: 0,
      accentColor: const Color(0xFFB0B0B0),
      category: 'Announcements',
    ),
  ];

  List<MessageItem> get _filteredMessages {
    if (_selectedIndex == 0) {
      return _messages;
    }
    return _messages
        .where((message) => message.category == _tabs[_selectedIndex])
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF007BFF),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              child: Row(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.notifications_active,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Messages',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 62),
                ],
              ),
            ),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F7FB),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        padding: const EdgeInsets.all(6),
                        child: Row(
                          children: List.generate(_tabs.length, (index) {
                            final bool selected = _selectedIndex == index;
                            return Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 4.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: selected
                                        ? const Color(0xFF007BFF)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  child: Center(
                                    child: Text(
                                      _tabs[index],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: selected
                                            ? Colors.white
                                            : const Color(0xFF5A5A5A),
                                        fontWeight: selected
                                            ? FontWeight.w700
                                            : FontWeight.w500,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        itemCount: _filteredMessages.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final message = _filteredMessages[index];
                          return _buildMessageTile(message);
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

  Widget _buildMessageTile(MessageItem item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFEFEFF3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: item.accentColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(Icons.chat_bubble_outline, color: item.accentColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.subtitle,
                  maxLines: item.category == 'Announcements' ? 1 : 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF7A7A7A),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                item.time,
                style: const TextStyle(fontSize: 11, color: Color(0xFF9A9A9A)),
              ),
              const SizedBox(height: 6),
              if (item.unreadCount > 0)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF007BFF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    item.unreadCount.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
