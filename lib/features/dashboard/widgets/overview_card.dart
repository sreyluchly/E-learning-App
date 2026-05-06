import 'package:flutter/material.dart';
import '../../../core/app_color.dart';

class OverviewGrid extends StatelessWidget {
  const OverviewGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTallCard('5', 'Active\nCourses', AppColors.cardActiveCourses),
        _buildTallCard('120', 'Total\nStudents', AppColors.cardTotalStudents),
        _buildTallCard('10', 'Assignments\nto Grade', AppColors.cardAssignments),
        _buildTallCard('3', 'My Class\ntoday', AppColors.cardClassToday),
      ],
    );
  }

  Widget _buildTallCard(String val, String title, Color color) {
    return Container(
      width: 75,
      height: 90,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(val, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 10, height: 1.1)),
        ],
      ),
    );
  }
}