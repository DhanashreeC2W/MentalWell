// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentalwell_project/view/Widgets/auth_text_feild.dart';
import 'package:mentalwell_project/view/Widgets/social_auth_button.dart';
import 'package:mentalwell_project/view/home_screen.dart';
import 'package:mentalwell_project/view/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFD),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
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

              // Welcome text
              Text(
                'Welcome Back',
                style: GoogleFonts.inter(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1E293B),
                  height: 1.2,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Sign in to continue your mental wellness journey',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: const Color(0xFF64748B),
                ),
              ),

              const SizedBox(height: 40),

              // Login Form
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    AuthTextField(
                      controller: _emailController,
                      label: 'Email Address',
                      hintText: 'Enter your email',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icons.email_outlined,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter your email';
                      //   }
                      //   if (!RegExp(
                      //     r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      //   ).hasMatch(value)) {
                      //     return 'Please enter a valid email';
                      //   }
                      //   return null;
                      // },
                    ),

                    const SizedBox(height: 20),

                    AuthTextField(
                      controller: _passwordController,
                      label: 'Password',
                      hintText: 'Enter your password',
                      obscureText: !_isPasswordVisible,
                      isPassword: true,
                      onTogglePasswordVisibility: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter your password';
                      //   }
                      //   if (value.length < 6) {
                      //     return 'Password must be at least 6 characters';
                      //   }
                      //   return null;
                      // },
                    ),

                    const SizedBox(height: 16),

                    // Forgot password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          _showForgotPasswordDialog(context);
                        },
                        child: Text(
                          'Forgot Password?',
                          style: GoogleFonts.inter(
                            color: const Color(0xFF6A67CE),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Login button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _login,
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
                        child: _isLoading
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              )
                            : Text(
                                'Sign In',
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Divider
              Row(
                children: [
                  Expanded(
                    child: Divider(color: Colors.grey.shade300, thickness: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'or continue with',
                      style: GoogleFonts.inter(
                        color: const Color(0xFF64748B),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(color: Colors.grey.shade300, thickness: 1),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Social login buttons
              Column(
                children: [
                  SocialAuthButton(
                    text: 'Continue with Google',
                    iconPath: 'assets/icons/google.svg',
                    color: const Color(0xFFDB4437),
                    onPressed: () {
                      _handleSocialLogin('google');
                    },
                  ),
                  const SizedBox(height: 16),
                  SocialAuthButton(
                    text: 'Continue with Apple',
                    iconPath: 'assets/icons/apple.svg',
                    color: Colors.black,
                    onPressed: () {
                      _handleSocialLogin('apple');
                    },
                  ),
                  const SizedBox(height: 16),
                  SocialAuthButton(
                    text: 'Continue with Facebook',
                    iconPath: 'assets/icons/facebook.svg',
                    color: const Color(0xFF4267B2),
                    onPressed: () {
                      _handleSocialLogin('facebook');
                    },
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Sign up link
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: GoogleFonts.inter(
                        color: const Color(0xFF64748B),
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.inter(
                          color: const Color(0xFF6A67CE),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Privacy notice
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'By signing in, you agree to our Terms of Service and Privacy Policy.',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF94A3B8),
                      fontSize: 12,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => HomeScreen()));
      });

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login successful!', style: GoogleFonts.inter()),
          backgroundColor: const Color(0xFF1B9C85),
        ),
      );

      // Navigate to home screen
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => HomeScreen()),
      // );
    }
  }

  void _handleSocialLogin(String provider) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Signing in with ${provider.capitalize()}...',
          style: GoogleFonts.inter(),
        ),
        backgroundColor: const Color(0xFF6A67CE),
      ),
    );
  }

  void _showForgotPasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final emailController = TextEditingController();
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            'Reset Password',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1E293B),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter your email address and we\'ll send you a link to reset your password.',
                style: GoogleFonts.inter(color: const Color(0xFF64748B)),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: GoogleFonts.inter(color: const Color(0xFF64748B)),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Reset link sent to ${emailController.text}',
                      style: GoogleFonts.inter(),
                    ),
                    backgroundColor: const Color(0xFF1B9C85),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6A67CE),
                foregroundColor: Colors.white,
              ),
              child: Text(
                'Send Link',
                style: GoogleFonts.inter(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
