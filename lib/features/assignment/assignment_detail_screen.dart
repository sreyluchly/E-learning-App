import 'package:flutter/material.dart';

class AssignmentDetailPage extends StatelessWidget {
  final String title;
  final String subject;
  final String description;
  final String dueDate;
  final String status;
  final double progressValue;
  final Color statusColor;

  const AssignmentDetailPage({
    super.key,
    required this.title,
    required this.subject,
    required this.description,
    required this.dueDate,
    required this.status,
    required this.progressValue,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Assignment Detail")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(subject, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  "Due: $dueDate",
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 20),
            LinearProgressIndicator(
              value: progressValue,
              color: statusColor,
              backgroundColor: Colors.grey.shade200,
              minHeight: 8,
            ),
            const SizedBox(height: 10),
            Text(
              "Progress: ${(progressValue * 100).toInt()}%",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              "Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(description),
          ],
        ),
      ),
    );
  }
}
