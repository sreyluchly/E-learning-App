import 'package:flutter/material.dart';

// 1. Updated Model to include more specific UI data
class AssignmentItem {
  final String title;
  final String subject;
  final String status;
  final Color statusColor;
  final String ratioText; // e.g., "18/24"
  final double progressValue; // e.g., 0.75
  final String dueDate;
  final IconData icon;
  final Color iconBgColor;

  AssignmentItem({
    required this.title,
    required this.subject,
    required this.status,
    required this.statusColor,
    required this.ratioText,
    required this.progressValue,
    required this.dueDate,
    required this.icon,
    required this.iconBgColor,
  });
}

class AssignmentListScreen extends StatefulWidget {
  const AssignmentListScreen({super.key});

  @override
  State<AssignmentListScreen> createState() => _AssignmentListScreenState();
}

class _AssignmentListScreenState extends State<AssignmentListScreen> {
  int _selectedTab = 0;
  final List<String> _tabs = ['All', 'Active', 'Submitted'];

  // 2. Data source following your logic
  final List<AssignmentItem> _assignments = [
    AssignmentItem(
      title: "Java Research Logic",
      subject: "JavaScript · Class CS",
      status: "Active",
      statusColor: const Color(0xFF28A745),
      ratioText: "18/24",
      progressValue: 0.75,
      dueDate: "April 25, 2026",
      icon: Icons.code,
      iconBgColor: Colors.blue,
    ),
    AssignmentItem(
      title: "HTML Link Page",
      subject: "HTML · Class CS",
      status: "Active",
      statusColor: const Color(0xFF28A745),
      ratioText: "15/24",
      progressValue: 0.6,
      dueDate: "April 25, 2026",
      icon: Icons.html,
      iconBgColor: Colors.orange,
    ),
    AssignmentItem(
      title: "UX/UI Design App",
      subject: "UX/UI · Class CS",
      status: "Submitted",
      statusColor: Colors.orange,
      ratioText: "24/24",
      progressValue: 1.0,
      dueDate: "April 25, 2026",
      icon: Icons.brush,
      iconBgColor: Colors.purple,
    ),
  ];

  List<AssignmentItem> get _filteredAssignments {
    if (_selectedTab == 1) return _assignments.where((i) => i.status == 'Active').toList();
    if (_selectedTab == 2) return _assignments.where((i) => i.status == 'Submitted').toList();
    return _assignments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF007BFF), // Blue background for the "Stack" effect
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Assignment List", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search and Tabs Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: const Icon(Icons.search, color: Colors.white70),
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
          ),
          const SizedBox(height: 10),
          _buildTabToggle(),
          
          // Main List Section
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 25),
              decoration: const BoxDecoration(
                color: Color(0xFFF5F7F9),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  _buildHeaderRow(),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: _filteredAssignments.length,
                      itemBuilder: (context, index) => _AssignmentCard(item: _filteredAssignments[index]),
                    ),
                  ),
                  _buildCreateButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabToggle() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: List.generate(_tabs.length, (index) {
          bool isSelected = _selectedTab == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _selectedTab = index),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF007BFF) : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(_tabs[index], 
                    style: TextStyle(color: isSelected ? Colors.white : Colors.black87, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Assignments (${_filteredAssignments.length})", 
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Text("Sort by: Due Date", style: TextStyle(color: Color(0xFF007BFF), fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildCreateButton() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.add_circle_outline, color: Colors.white),
        label: const Text("Create New Assignment", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF007BFF),
          minimumSize: const Size(double.infinity, 55),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}

// 3. Extracted Card Widget for true reusability
class _AssignmentCard extends StatelessWidget {
  final AssignmentItem item;
  const _AssignmentCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: item.iconBgColor.withOpacity(0.15), borderRadius: BorderRadius.circular(10)),
                child: Icon(item.icon, color: item.iconBgColor),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(item.subject, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 14, color: Colors.blue),
                        const SizedBox(width: 5),
                        Text("Due: ${item.dueDate}", style: const TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(color: item.statusColor, borderRadius: BorderRadius.circular(20)),
                    child: Text(item.status, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 10),
                  const Icon(Icons.more_vert, color: Colors.grey),
                ],
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: item.progressValue,
                    backgroundColor: Colors.grey.shade200,
                    color: item.statusColor,
                    minHeight: 8,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text("${item.ratioText} Submitted", style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }
}