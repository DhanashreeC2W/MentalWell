import 'package:flutter/material.dart';

class OnboardingPageData {
  final String title;
  final String description;
  final String imagePath;
  final Color color;
  final IconData icon;
  final String subtitle;

  OnboardingPageData({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.color,
    required this.icon,
    required this.subtitle,
  });
}

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingPageData page;
  final bool isLastPage;

  const OnboardingPageWidget({
    super.key,
    required this.page,
    this.isLastPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Colorful header indicator
          Container(
            width: 60,
            height: 4,
            decoration: BoxDecoration(
              color: page.color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          
          const SizedBox(height: 32),
          
          // Icon container
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  page.color.withOpacity(0.2),
                  page.color.withOpacity(0.1),
                ],
              ),
              shape: BoxShape.circle,
              border: Border.all(
                color: page.color.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Icon(
              page.icon,
              size: 40,
              color: page.color,
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Subtitle
          Text(
            page.subtitle,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: page.color,
              letterSpacing: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 12),
          
          // Title
          Text(
            page.title,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: page.color,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 20),
          
          // Description
          Text(
            page.description,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF64748B),
              height: 1.6,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 48),
          
          // Illustration container
          Container(
            height: 220,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  page.color.withOpacity(0.05),
                  page.color.withOpacity(0.02),
                ],
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: page.color.withOpacity(0.1),
                width: 1,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon illustration
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: page.color.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      page.icon,
                      size: 60,
                      color: page.color.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Illustration label
                  Text(
                    'MentalWell Feature',
                    style: TextStyle(
                      color: page.color,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'AI-Powered Support',
                    style: TextStyle(
                      color: page.color.withOpacity(0.7),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}