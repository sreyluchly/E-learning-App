import 'package:flutter/material.dart';
import '../../../core/app_color.dart';

class QuickActionsGrid extends StatelessWidget {
  const QuickActionsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 2.1,
      children: [
        _actionCard('Create Course', Icons.add, AppColors.actionCreateCourse),
        _actionCard('Upload Content', Icons.file_upload_outlined, AppColors.actionUploadContent),
        _actionCard('Create Quiz', Icons.assignment_outlined, AppColors.actionCreateQuiz),
        _actionCard('Live Class', Icons.videocam_outlined, AppColors.actionLiveClass),
      ],
    );
  }

  Widget _actionCard(String title, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.4), borderRadius: BorderRadius.circular(6)),
            child: Icon(icon, size: 18, color: Colors.blueGrey),
          ),
          const Spacer(),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        ],
      ),
    );
  }
}