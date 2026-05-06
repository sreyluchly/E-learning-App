import 'package:flutter/material.dart';
import '../../core/app_color.dart';
import '../../core/app_images.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // List of page data to keep the build method clean
  final List<Map<String, String>> _pages = [
    {
      'image': AppImages.welcome1,
      'title': "EDU START",
      'description': "Welcome to a place where learning is an adventure, curiosity is encouraged, and every student matters.",
    },
    {
      'image': AppImages.welcome2,
      'title': "Enjoy Your Education at Your Fingertips!",
      'description': "Access your courses anywhere, anytime with our interactive mobile platform.",
    },
    {
      'image': AppImages.welcome3,
      'title': "Track Your Success",
      'description': "Monitor your progress and stay on top of your assignments with ease.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
        child: Column(
          children: [
            // Skip button often found in the top right
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
                child: const Text("Skip", style: TextStyle(color: Colors.white70)),
              ),
            ),
            
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return _buildPageContent(
                    image: _pages[index]['image']!,
                    title: _pages[index]['title']!,
                    description: _pages[index]['description']!,
                  );
                },
              ),
            ),
            
            // Page Indicator (Dots)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length, 
                (index) => _buildDot(index)
              ),
            ),
            
            const SizedBox(height: 40),
            
            // "Get Started" Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: OutlinedButton(
                onPressed: () {
                  if (_currentPage == _pages.length - 1) {
                    Navigator.pushNamed(context, '/login');
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300), 
                      curve: Curves.easeInOut
                    );
                  }
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white, width: 2),
                  shape: const StadiumBorder(),
                  minimumSize: const Size(double.infinity, 55),
                ),
                child: Text(
                  _currentPage == _pages.length - 1 ? "Get Started" : "Next",
                  style: const TextStyle(
                    color: Colors.white, 
                    fontSize: 18, 
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildPageContent({required String image, required String title, required String description}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Use Image.asset to avoid HandshakeException
          Image.asset(
            image,
            height: 280,
            fit: BoxFit.contain,
            // Fallback if image is missing during development
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.image, size: 100, color: Colors.white24);
            },
          ),
          const SizedBox(height: 40),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 15,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 10,
      width: _currentPage == index ? 25 : 10, // Modern elongated dot for active page
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.white : Colors.white38,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}