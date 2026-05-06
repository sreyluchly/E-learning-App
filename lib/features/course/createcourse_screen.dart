import 'package:flutter/material.dart';

class CreateCourseScreen extends StatelessWidget {
  const CreateCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF007BFF), // Main Blue Color
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // FIXED: Added GestureDetector to the back button
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.arrow_back_ios_new, size: 16, color: Colors.grey),
            ),
          ),
        ),
        title: const Text(
          "Create Course",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.menu_book, color: Colors.orange, size: 30),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Course Image", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 12),
              
              // Image Upload Area
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F4F9),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue.shade100),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_photo_alternate, size: 60, color: Colors.blue.shade300),
                    const Text("Upload Course Image", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                    const Text("Recommend Size: 16:9 (1280 x 720)", style: TextStyle(fontSize: 10, color: Colors.grey)),
                    const Text("Max Size: 10 MB", style: TextStyle(fontSize: 10, color: Colors.grey)),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              _buildLabel("Course Title"),
              _buildTextField(hint: "Enter course title", icon: Icons.title, maxLength: "0/100"),

              const SizedBox(height: 20),
              _buildLabel("Course Details"),
              _buildTextField(hint: "Description what your course is about...", icon: Icons.description, maxLength: "0/500", isMultiline: true),

              const SizedBox(height: 20),
              _buildLabel("Level"),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _LevelCard(label: "Beginner", icon: Icons.face, color: Color(0xFFDDE3F9)),
                  _LevelCard(label: "Intermediate", icon: Icons.trending_up, color: Color(0xFFF9E3DD)),
                  _LevelCard(label: "Advanced", icon: Icons.bolt, color: Color(0xFFDDF9E3)),
                  _LevelCard(label: "All", icon: Icons.all_inclusive, color: Color(0xFFF9F9DD)),
                ],
              ),

              const SizedBox(height: 40),
              
              // Create Course Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Usually you would save data here, then go back
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF007BFF),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text("Create Course", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: RichText(
        text: TextSpan(
          text: text,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
          children: const [TextSpan(text: " *", style: TextStyle(color: Colors.red))],
        ),
      ),
    );
  }

  Widget _buildTextField({required String hint, required IconData icon, required String maxLength, bool isMultiline = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 2))],
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Column(
        children: [
          TextField(
            maxLines: isMultiline ? 4 : 1,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
              prefixIcon: Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(8)),
                child: Icon(icon, size: 18, color: Colors.black54),
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0, bottom: 8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(maxLength, style: const TextStyle(fontSize: 10, color: Colors.grey)),
            ),
          )
        ],
      ),
    );
  }
}

class _LevelCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const _LevelCard({required this.label, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5)],
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.orange.shade700, size: 24),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}