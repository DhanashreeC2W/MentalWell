import 'package:flutter/material.dart';
import 'package:mentalwell_project/view/Widgets/feature_item.dart';
import 'package:mentalwell_project/view/login_screen.dart';
import 'package:mentalwell_project/view/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFD),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back button
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: Color(0xFF6A67CE),
                    size: 28,
                  ),
                ),

                const SizedBox(height: 20),

                // Logo/App Name
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              const Color(0xFF6A67CE).withOpacity(0.2),
                              const Color(0xFF4ECDC4).withOpacity(0.2),
                            ],
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF6A67CE).withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: const Icon(
                          Icons.psychology_rounded,
                          size: 40,
                          color: Color(0xFF6A67CE),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'MentalWell',
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF6A67CE),
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'AI-Powered Mental Wellness Companion',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF64748B),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 48),

                // Welcome message
                const Text(
                  'Welcome to Your\nSafe Space',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                    height: 1.2,
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  'Begin your journey towards better mental health with personalized AI support.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF64748B),
                    height: 1.6,
                  ),
                ),

                const SizedBox(height: 40),

                // Feature highlights
                const FeatureItem(
                  icon: Icons.emoji_emotions_outlined,
                  title: 'Emotional Intelligence',
                  description:
                      'AI that understands and responds to your feelings',
                  color: Color(0xFF6A67CE),
                ),

                const SizedBox(height: 16),

                const FeatureItem(
                  icon: Icons.health_and_safety_outlined,
                  title: 'Evidence-Based Support',
                  description:
                      'RAG-powered responses from curated mental health knowledge',
                  color: Color(0xFF4ECDC4),
                ),

                const SizedBox(height: 16),

                const FeatureItem(
                  icon: Icons.security_outlined,
                  title: 'End-to-End Privacy',
                  description:
                      'Secure client-server architecture protects your data',
                  color: Color(0xFF1B9C85),
                ),

                const SizedBox(height: 48),

                // Action buttons
                Column(
                  children: [
                    // Create Account button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to sign up
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => SignupScreen(),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6A67CE),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 2,
                          shadowColor: const Color(0xFF6A67CE).withOpacity(0.3),
                        ),
                        child: const Text(
                          'Create Free Account',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Sign In button
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          // Navigate to sign in
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF6A67CE),
                          side: const BorderSide(
                            color: Color(0xFF6A67CE),
                            width: 2,
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Privacy notice
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'By continuing, you agree to our Terms of Service and Privacy Policy. Your data is always encrypted and secure.',
                        style: TextStyle(
                          color: Color(0xFF94A3B8),
                          fontSize: 12,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Continue as guest
                    TextButton(
                      onPressed: () {
                        // Navigate to main app without authentication
                        // Navigator.pushReplacement(context, MaterialPageRoute(
                        //   builder: (context) => MainAppScreen(),
                        // ));
                      },
                      child: const Text(
                        'Continue as Guest',
                        style: TextStyle(
                          color: Color(0xFF6A67CE),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
