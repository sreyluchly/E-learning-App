import 'package:flutter/material.dart';
import '../../core/app_color.dart';
import 'widgets/overview_card.dart';
import 'widgets/quick_action_card.dart';
import 'widgets/bottom_data_row.dart';
import 'package:e_learning_app/core/app_images.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            // 1. Blue Header Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppImages.build(
                        asset: AppImages.accountPf, 
                        width: 48, 
                        height: 48, 
                        fit: BoxFit.cover
                      ),
                      IconButton(
                        icon: const Icon(Icons.notifications, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text("Good morning, Ms. Davy! 👋", 
                    style: TextStyle(color: Colors.white70, fontSize: 16)),
                  const Text("Welcome back, Ms. Davy!", 
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            // 2. Main White Content Area
            Container(
              margin: const EdgeInsets.only(top: 140),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle("Teaching Overview", "This Week"),
                    const SizedBox(height: 12),
                    const OverviewGrid(),
                    
                    const SizedBox(height: 24),
                    _buildSectionTitle("Quick Actions", ""),
                    const SizedBox(height: 12),
                    const QuickActionsGrid(),
                    
                    const SizedBox(height: 24),
                    _buildSectionTitle("Subject", ""),
                    const SizedBox(height: 12),
                    const BottomDataRow(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // Removed bottomNavigationBar from here
    );
  }

  Widget _buildSectionTitle(String title, String trailing) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        if (trailing.isNotEmpty)
          Text(trailing, style: const TextStyle(color: AppColors.textLink, fontWeight: FontWeight.w600)),
      ],
    );
  }
}