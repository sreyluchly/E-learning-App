import 'package:flutter/material.dart';

class AssignmentlistScreen extends StatefulWidget {
  const AssignmentlistScreen({super.key});

  @override
  State<AssignmentlistScreen> createState() => _AssignmentlistScreenState();
}

class _AssignmentlistScreenState extends State<AssignmentlistScreen> {
  int _selectedTab = 0;

  final List<String> _tabs = ['All', 'Active', 'Submitted'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF007BFF), // Same blue as header
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Assignments List",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
          color: Color(0xFFF8F9FA), // Slightly off-white background
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 30),
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search assignments...",
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black54,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Toggle Buttons: All / Active / Submitted
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFB3B3B6), // Light blue background
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: List.generate(_tabs.length, (index) {
                    final bool selected = _selectedTab == index;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedTab = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selected
                                ? const Color(0xFF007BFF)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 8,
                          ),
                          child: Center(
                            child: Text(
                              _tabs[index],
                              style: TextStyle(
                                color: selected ? Colors.white : Colors.white70,
                                fontWeight: FontWeight.w900,
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
            // Assignments Header with Count and Sort
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Assignments (5)",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle sort option
                    },
                    child: const Text(
                      "Sort by: Due Date",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF007BFF),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            // Assignment Cards List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                children: [
                  _buildAssignmentCard(
                    title: "Java Research Logic",
                    subject: "JavaScript · Class CS",
                    status: "Active",
                    statusColor: const Color(0xFF28A745),
                    progress: "18/24",
                    progressColor: const Color(0xFFA855F7),
                    dueDate: "Due: April 25, 2026",
                    iconColor: const Color(0xFF007BFF),
                  ),
                  const SizedBox(height: 12),
                  _buildAssignmentCard(
                    title: "HTML Link Page",
                    subject: "HTML · Class CS",
                    status: "Active",
                    statusColor: const Color(0xFF28A745),
                    progress: "15/24",
                    progressColor: const Color(0xFF00B4D8),
                    dueDate: "Due: April 25, 2026",
                    iconColor: const Color(0xFFFFA500),
                  ),
                  const SizedBox(height: 12),
                  _buildAssignmentCard(
                    title: "CSS New Style",
                    subject: "CSS · Class CS",
                    status: "Overdue",
                    statusColor: const Color(0xFFDC3545),
                    progress: "20/24",
                    progressColor: const Color(0xFFDC3545),
                    dueDate: "Due: April 25, 2026",
                    iconColor: const Color(0xFFFF6B6B),
                  ),
                  const SizedBox(height: 12),
                  _buildAssignmentCard(
                    title: "UX/UI Design App",
                    subject: "UX/UI · Class CS",
                    status: "Submitted",
                    statusColor: const Color(0xFFFFA500),
                    progress: "22/24",
                    progressColor: const Color(0xFFFFA500),
                    dueDate: "Due: April 25, 2026",
                    iconColor: const Color(0xFF28A745),
                  ),
                  const SizedBox(height: 12),
                  _buildAssignmentCard(
                    title: "C# Logic",
                    subject: "C# · Class CS",
                    status: "Active",
                    statusColor: const Color(0xFF28A745),
                    progress: "18/24",
                    progressColor: const Color(0xFF28A745),
                    dueDate: "Due: April 25, 2026",
                    iconColor: const Color(0xFFAE67FA),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAssignmentCard({
    required String title,
    required String subject,
    required String status,
    required Color statusColor,
    required String progress,
    required Color progressColor,
    required String dueDate,
    required Color iconColor,
  }) {
    // Parse progress to get percentage
    final progressParts = progress.split('/');
    final completed = int.parse(progressParts[0]);
    final total = int.parse(progressParts[1]);
    final progressPercentage = completed / total;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          // Top Row: Icon, Title, and Status Badge
          Row(
            children: [
              // Colored Circle Icon (smaller)
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.2),
                  //shape: BorderRadius.circular(20),
                                        borderRadius: BorderRadius.circular(3),

                ),
                child: Icon(Icons.description, color: iconColor, size: 22),
              ),
              const SizedBox(width: 10),
              // Title
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              // Status Column - Top Right
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: statusColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    "Submitted",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 6),
          // Subject and Meta Info
          Row(
            children: [
              Container(width: 40, height: 40),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subject,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          dueDate,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          progress,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF28A745),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Progress Bar - Green
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: LinearProgressIndicator(
              value: progressPercentage,
              minHeight: 8,
              backgroundColor: Colors.grey.shade200,
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFF28A745),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
