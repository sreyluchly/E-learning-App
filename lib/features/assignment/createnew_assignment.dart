import 'package:flutter/material.dart';

class CreateNewAssignment extends StatefulWidget {
  const CreateNewAssignment({super.key});

  @override
  State<CreateNewAssignment> createState() => _CreateNewAssignmentState();
}

class _CreateNewAssignmentState extends State<CreateNewAssignment> {
  String? selectedClass, selectedPoints;
  DateTime? selectedDate;

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );
    if (picked != null) setState(() => selectedDate = picked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F7),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.blue,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Create New Assignment", 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _section("Title", const CustomInputField(hint: "Enter Assignment title")),
            _section("Description", const CustomInputField(hint: "Add Details About the assignment....", maxLines: 5)),
            _section("Subject / Class", _buildDropdown(["Class 1", "Class 2", "Class 3"], selectedClass, (v) => setState(() => selectedClass = v))),
            _section("Due Date", _buildDatePicker()),
            _section("Points", _buildDropdown(["50pts", "100pts", "150pts"], selectedPoints, (v) => setState(() => selectedPoints = v))),
            
            // --- NEW ATTACHMENT SECTION ---
            _section("Attach Files", _buildAttachmentField()),

            const SizedBox(height: 20),
            _publishButton(),
          ],
        ),
      ),
    );
  }

  // ================= UI HELPERS =================

  Widget _section(String title, Widget child) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  Widget _buildAttachmentField() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: const Color(0xFFD9E7F7), // Light blueish background from your image
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.blue.withOpacity(0.2), width: 1),
      ),
      child: Column(
        children: [
          const Icon(Icons.cloud_upload, color: Color(0xFF4A90E2), size: 40),
          const SizedBox(height: 10),
          const Text("Upload File (PDF, images, docs)", 
            style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500)),
          Text("Max size 10 MB", 
            style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildDropdown(List<String> items, String? value, ValueChanged<String?> onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: _commonBox(),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
          items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildDatePicker() {
    return GestureDetector(
      onTap: _pickDate,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: _commonBox(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(selectedDate == null ? "Select Date" : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"),
            const Icon(Icons.calendar_today_outlined, color: Colors.grey, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _publishButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: () => Navigator.pop(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF007BFF),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        child: const Text("Publish Assignment", 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }

  BoxDecoration _commonBox() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(14),
    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5, offset: const Offset(0, 2))],
  );
}

class CustomInputField extends StatelessWidget {
  final String hint;
  final int maxLines;
  const CustomInputField({super.key, required this.hint, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5, offset: const Offset(0, 2))],
      ),
      child: Column(
        children: [
          TextField(
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
            ),
          ),
          if (maxLines > 1) ...[
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  _icon(Icons.format_bold),
                  _icon(Icons.format_italic),
                  _icon(Icons.format_list_bulleted),
                  _icon(Icons.format_list_numbered),
                  _icon(Icons.link),
                ],
              ),
            ),
          ]
        ],
      ),
    );
  }

  Widget _icon(IconData icon) => IconButton(
    visualDensity: VisualDensity.compact,
    icon: Icon(icon, color: Colors.black38, size: 22),
    onPressed: () {},
  );
}