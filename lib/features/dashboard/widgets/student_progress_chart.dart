import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../core/app_color.dart';

class StudentProgressChart extends StatelessWidget {
  const StudentProgressChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5)],
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Student Progress", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
              Text("View All", style: TextStyle(color: AppColors.textLink, fontSize: 10)),
            ],
          ),
          const SizedBox(height: 15),
          const Text("Overall Process", style: TextStyle(fontSize: 10, color: Colors.grey)),
          Expanded(
            child: PieChart(
              PieChartData(
                sectionsSpace: 0,
                centerSpaceRadius: 0,
                sections: [
                  PieChartSectionData(value: 60, color: AppColors.chartOnTrack, title: 'On Track\n60%', radius: 65, titleStyle: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
                  PieChartSectionData(value: 30, color: AppColors.chartBehind, title: 'Behind\n30%', radius: 65, titleStyle: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
                  PieChartSectionData(value: 20, color: AppColors.chartNeedAttention, title: 'Need\nAttention\n20%', radius: 65, titleStyle: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}