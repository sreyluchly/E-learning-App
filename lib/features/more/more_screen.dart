import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF007BFF),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              decoration: const BoxDecoration(
                color: Color(0xFF007BFF),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.person,
                            size: 36,
                            color: Color(0xFF007BFF),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Welcome,',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 0),
                            Text(
                              'Mrs. Stephania',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                                decorationThickness: 2,
                              ),
                            ),
                            SizedBox(height: 0),
                            Text(
                              'Computer Science',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.72,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                        offset: Offset(-5, 0),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 24.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _MoreMenuItem(
                          icon: Icons.person_outline,
                          label: 'Profile',
                          onTap: () {},
                        ),
                        _MoreMenuItem(
                          icon: Icons.schedule,
                          label: 'Schedule',
                          onTap: () {},
                        ),
                        _MoreMenuItem(
                          icon: Icons.grade,
                          label: 'Grades',
                          onTap: () {},
                        ),
                        _MoreMenuItem(
                          icon: Icons.event_available,
                          label: 'Attendance',
                          onTap: () {},
                        ),
                        _MoreMenuItem(
                          icon: Icons.assignment_turned_in,
                          label: 'Assignment & Submission',
                          onTap: () {},
                        ),
                        _MoreMenuItem(
                          icon: Icons.contact_support,
                          label: 'Contact Us',
                          onTap: () {},
                        ),
                        const Spacer(),
                        const Divider(),
                        const SizedBox(height: 12),
                        _MoreMenuItem(
                          icon: Icons.logout,
                          label: 'Logout',
                          onTap: () {},
                          textColor: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MoreMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color textColor;

  const _MoreMenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFFEDF3FF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: const Color(0xFF007BFF)),
      ),
      title: Text(
        label,
        style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: onTap,
    );
  }
}
