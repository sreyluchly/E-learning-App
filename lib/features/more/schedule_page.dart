// File Path: lib/features/more/schedule/schedule_page.dart
import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState(); 
}

class _SchedulePageState extends State<SchedulePage> { 
  String selectedFilter = 'All';
  int selectedDayIndex = 2; // Default selected day (May 21)

  // Calendar dates sample data
  final List<Map<String, String>> calendarDays = [
    {'day': 'Sun', 'date': '19'},
    {'day': 'Mon', 'date': '20'},
    {'day': 'Tues', 'date': '21'},
    {'day': 'Wed', 'date': '22'},
    {'day': 'Thu', 'date': '23'},
    {'day': 'Fri', 'date': '25'},
    {'day': 'Sat', 'date': '26'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff007aff), // Brilliant blue top header background
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // ================= 1. CUSTOM TOP APP BAR WITH WORKING BACK ROLE =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new, 
                      color: Colors.white, 
                      size: 22,
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Safely navigates back
                    },
                  ),
                  const Text(
                    'Schedule',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_box, color: Colors.white, size: 28),
                  ),
                ],
              ),
            ),

            // ================= 2. MAIN BOTTOM CONTAINER =================
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFF2EDF3), // Muted lavender/grey background
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ================= 3. USER WELCOME BANNER =================
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_month, color: Colors.redAccent, size: 36),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Good morning,',
                                  style: TextStyle(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      'Ms.Davy !',
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                                    ),
                                    SizedBox(width: 4),
                                    Text('👋', style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                                const SizedBox(height: 2),
                                const Text(
                                  "Here's your schedule for today",
                                  style: TextStyle(fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // ================= 4. FILTER CHIPS ROW =================
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildFilterChip('All'),
                            _buildFilterChip('Classes'),
                            _buildFilterChip('Meetings'),
                            _buildFilterChip('Deadlines'),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Icon(Icons.filter_list, color: Colors.blue.shade400, size: 20),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // ================= 5. CALENDAR CARD WHEEL =================
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'May 2026',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.chevron_left, color: Colors.grey),
                                    const Icon(Icons.chevron_right, color: Colors.blue),
                                    const SizedBox(width: 12),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Text('Today', style: TextStyle(fontSize: 12, color: Colors.black54)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(calendarDays.length, (index) {
                                bool isSelected = index == selectedDayIndex;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedDayIndex = index;
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        calendarDays[index]['day']!,
                                        style: TextStyle(fontSize: 12, color: isSelected ? Colors.blue : Colors.grey),
                                      ),
                                      const SizedBox(height: 8),
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: isSelected ? Colors.grey.shade300 : Colors.transparent,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          calendarDays[index]['date']!,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: isSelected ? Colors.black87 : Colors.black54,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // ================= 6. SCHEDULE TASKS LIST =================
                      _buildScheduleCard(
                        title: 'JavaScript G.2023',
                        timeLocation: '9:00AM - 11:00AM . Room 305',
                        tagLabel: 'Class',
                        iconData: Icons.javascript,
                        cardBg: const Color(0xffbae0ff),
                        tagBg: const Color(0xff007aff),
                        iconColor: Colors.blueAccent,
                      ),
                      _buildScheduleCard(
                        title: 'Faculty Meeting',
                        timeLocation: '11:00AM - 12:00PM . Conference Room',
                        tagLabel: 'Meeting',
                        iconData: Icons.groups,
                        cardBg: const Color(0xfffcdbd9),
                        tagBg: const Color(0xffd46b08),
                        iconColor: Colors.deepOrangeAccent,
                      ),
                      _buildScheduleCard(
                        title: 'HTML G.2025',
                        timeLocation: '1:00PM - 2:00PM . Room 302',
                        tagLabel: 'Class',
                        iconData: Icons.code,
                        cardBg: const Color(0xffb7eb8f),
                        tagBg: const Color(0xff52c41a),
                        iconColor: Colors.green,
                      ),
                      _buildScheduleCard(
                        title: 'Grade Submission Due',
                        timeLocation: '9:00AM  HTML G.2023',
                        tagLabel: 'Deadline', 
                        iconData: Icons.add_box_outlined,
                        cardBg: const Color(0xfffff0f6),
                        tagBg: const Color(0xfff5222d),
                        iconColor: Colors.redAccent,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Properly inside the resolved state class now
  Widget _buildFilterChip(String label) {
    bool isSelected = selectedFilter == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = label;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff007aff) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? Colors.transparent : Colors.grey.shade300),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _buildScheduleCard({
    required String title,
    required String timeLocation,
    required String tagLabel,
    required IconData iconData,
    required Color cardBg,
    required Color tagBg,
    required Color iconColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(iconData, color: iconColor, size: 28),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black87),
                ),
                const SizedBox(height: 4),
                Text(
                  timeLocation,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: tagBg,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              tagLabel,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}