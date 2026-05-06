import 'package:flutter/material.dart';
import 'createcourse_screen.dart';

class CoursesListScreen extends StatelessWidget {
  const CoursesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF007BFF), // Same blue as header
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Courses List",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
  icon: const Icon(Icons.add_box, color: Colors.white, size: 30),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateCourseScreen(),
      ),
    );
  },
),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
          color: Color(0xFFF8F9FA), // Slightly off-white background
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Toggle Buttons: Active / Achieved
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  _buildToggleButton("Active", isActive: true),
                  const SizedBox(width: 10),
                  _buildToggleButton("Achieved", isActive: false),
                ],
              ),
            ),
            const SizedBox(height: 15),
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // List of Courses
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _courseCard("Web Development", "G 10 . 32 Students", 0.25, "25% Complete"),
                  _courseCard("Backend Development", "G 10 . 32 Students", 0.75, "75% Complete"),
                  _courseCard("Frontend Development", "G 10 . 32 Students", 0.80, "80% Complete"),
                  _courseCard("UX/UI Designer", "G 10 . 32 Students", 0.80, "80% Complete"),
                ],
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
      
    );
  }

  Widget _buildToggleButton(String text, {required bool isActive}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF007BFF) : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: isActive ? null : Border.all(color: Colors.grey.shade300),
        boxShadow: isActive ? [BoxShadow(color: Colors.blue.withOpacity(0.3), blurRadius: 5)] : null,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _courseCard(String title, String subtitle, double progress, String progressText) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          // Image Placeholder (You can use AppImages.build here)
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.image, color: Colors.white),
          ),
          const SizedBox(width: 12),
          // Info and Progress
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    const Icon(Icons.more_horiz, color: Colors.grey, size: 18),
                  ],
                ),
                Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 11)),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                    minHeight: 6,
                  ),
                ),
                const SizedBox(height: 4),
                Text(progressText, style: const TextStyle(fontSize: 10, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}