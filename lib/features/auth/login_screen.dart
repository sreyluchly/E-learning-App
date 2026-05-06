import 'package:flutter/material.dart';
import 'package:e_learning_app/core/app_images.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _validateAndLogin() {
    if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      Navigator.pushNamed(context, '/dashboard');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill in your Email and Password"),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF007BFF),
      body: Stack(
        children: [
          // 1. TOP ILLUSTRATION (PNG)
          Positioned(
            top: 60, left: 0, right: 0,
            child: AppImages.build(
              asset: AppImages.login,
              height: 220, // Increased slightly for better visibility
              fit: BoxFit.contain,
            ),
          ),

          // 2. BOTTOM WHITE SHEET
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.65,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), 
                  topRight: Radius.circular(150),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 3. BRAND LOGO (SVG)
                    // Center(
                    //   child: AppImages.logoWidget(height: 60),
                    // ),
                    const SizedBox(height: 20),
                    
                    const Text(
                      "Log In", 
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black87)
                    ),
                    const SizedBox(height: 25),
                    
                    _buildTextField("Email Address", Icons.email_outlined, _emailController),
                    const SizedBox(height: 20),
                    
                    _buildTextField("Password", Icons.lock_outline, _passwordController, isPassword: true),
                    
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {}, 
                        child: const Text("Forgot Password?")
                      ),
                    ),
                    const SizedBox(height: 10),
                    
                    ElevatedButton(
                      onPressed: _validateAndLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF007BFF), // Match theme
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 55),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                      child: const Text("Log In", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint, IconData icon, TextEditingController controller, {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: const Color(0xFF007BFF)),
        hintText: hint,
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15), 
          borderSide: BorderSide.none
        ),
      ),
    );
  }
}