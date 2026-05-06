import 'package:e_learning_app/core/app_images.dart';
import 'package:flutter/material.dart';
import '../../../core/app_color.dart';
import 'student_progress_chart.dart';

class BottomDataRow extends StatelessWidget {
  const BottomDataRow({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Left side: Assignments & Messages
          Expanded(
            flex: 5,
            child: Column(
              children: [
                _buildInfoBox(
                  title: "Assignment to Grade",
                  actionText: "See All",
                  content: [
                    _assignmentItem("Research about Linux", "7 submissions"),
                    _assignmentItem("UX/UI Home work", "7 submissions"),
                    _assignmentItem("Mobile App research", "7 submissions"),
                  ],
                ),
                const SizedBox(height: 12),
                _buildInfoBox(
                  title: "Messages",
                  actionText: "View All",
                  content: [
                    _messageItem(
                      "SreyLuch Ly", 
                      "Hello teacher", 
                      AppImages.build(asset: AppImages.sreyluchIcon, width: 24, height: 24, fit: BoxFit.cover),
                    ),
                    _messageItem(
                      "Sreypin Thim", 
                      "In room 101.", 
                      AppImages.build(asset: AppImages.sreypinIcon, width: 24, height: 24, fit: BoxFit.cover),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Right side: Student Progress Chart
          const Expanded(
            flex: 4,
            child: StudentProgressChart(),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBox({required String title, required String actionText, required List<Widget> content}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              Text(actionText, style: const TextStyle(color: AppColors.textLink, fontSize: 10, fontWeight: FontWeight.bold)),
            ],
          ),
          const Divider(height: 20),
          ...content,
        ],
      ),
    );
  }

  Widget _assignmentItem(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(6)),
            child: const Icon(Icons.description_outlined, size: 16, color: Colors.grey),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
                Text(subtitle, style: const TextStyle(fontSize: 9, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // FIXED: Changed 'Color avatarColor' to 'Widget avatar'
  Widget _messageItem(String name, String text, Widget avatar) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          // Using ClipRRect to make the AppImages.build widget circular
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 24,
              height: 24,
              child: avatar,
            ),
          ),
          const SizedBox(width: 8),
          Text("$name: ", style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 11), overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }
}