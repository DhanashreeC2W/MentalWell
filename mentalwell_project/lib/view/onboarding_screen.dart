import 'package:flutter/material.dart';
import 'package:mentalwell_project/view/Widgets/onboarding_page.dart';
import 'package:mentalwell_project/view/welcome_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPageData> _pages = [
    OnboardingPageData(
      title: 'Your Personal\nMental Wellness Guide',
      description:
          'Get AI-powered emotional support tailored to your needs, available 24/7 for whenever you need someone to talk to.',
      imagePath: 'assets/onboarding/emotional_support.svg',
      color: const Color(0xFF6A67CE),
      icon: Icons.emoji_emotions_outlined,
      subtitle: 'EMOTIONAL SUPPORT',
    ),
    OnboardingPageData(
      title: 'Smart Emotion\nDetection',
      description:
          'Our advanced machine learning analyzes your text to understand your emotional state and provide personalized responses.',
      imagePath: 'assets/onboarding/ai_detection.svg',
      color: const Color(0xFF4ECDC4),
      icon: Icons.psychology_outlined,
      subtitle: 'AI INTELLIGENCE',
    ),
    OnboardingPageData(
      title: 'Accurate & Reliable\nGuidance',
      description:
          'Retrieval-Augmented Generation (RAG) ensures responses are based on curated mental-health knowledge, reducing AI hallucinations.',
      imagePath: 'assets/onboarding/accurate_responses.svg',
      color: const Color(0xFFFF9A76),
      icon: Icons.verified_outlined,
      subtitle: 'TRUSTED RESPONSES',
    ),
    OnboardingPageData(
      title: 'Privacy-First\nArchitecture',
      description:
          'Your conversations and journal entries are protected with secure client-server communication and encrypted storage.',
      imagePath: 'assets/onboarding/privacy.svg',
      color: const Color(0xFF1B9C85),
      icon: Icons.lock_outline,
      subtitle: 'SECURE & PRIVATE',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final currentPageColor = _pages[_currentPage].color;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFD),
      body: SafeArea(
        child: Column(
          children: [
            // Skip button at top
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WelcomeScreen(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: currentPageColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Page View
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingPageWidget(
                    page: _pages[index],
                    isLastPage: index == _pages.length - 1,
                  );
                },
              ),
            ),

            // Bottom controls
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
                vertical: 24.0,
              ),
              child: Column(
                children: [
                  // Page indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: _pages.length,
                        effect: ExpandingDotsEffect(
                          activeDotColor: currentPageColor,
                          dotColor: Colors.grey.shade300,
                          dotHeight: 8,
                          dotWidth: 8,
                          spacing: 8,
                          expansionFactor: 3,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Navigation button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_currentPage < _pages.length - 1) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOutCubic,
                          );
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WelcomeScreen(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: currentPageColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 2,
                        shadowColor: currentPageColor.withOpacity(0.3),
                      ),
                      child: Text(
                        _currentPage < _pages.length - 1
                            ? 'Continue'
                            : 'Get Started',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Progress text
                  Text(
                    '${_currentPage + 1} of ${_pages.length}',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
