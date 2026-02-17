import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/home_controller.dart';
import 'widgets/welcome_header.dart';
import 'widgets/mood_selector.dart';
import 'widgets/ai_chat_card.dart';
import 'widgets/mood_tracking_card.dart';
import 'widgets/wellness_suggestions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Provider.of<HomeController>(context);
    log("In Home Build");
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            WelcomeHeader(
              greeting: controller.greeting,
              supportiveMessage: controller.supportiveMessage,
              userName: 'Dhanashree',
            ),

            // Main content (scrollable)
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // Mood selector
                    MoodSelector(
                      moods: controller.moods,
                      onMoodSelected: controller.selectMood,
                    ),

                    // AI Chat card
                    AiChatCard(
                      // onTap:controller.navigateToChat,
                    ),

                    // Mood tracking
                    MoodTrackingCard(weeklyData: controller.weeklyMoodData),

                    // Wellness suggestions
                    WellnessSuggestions(
                      cards: controller.wellnessCards,
                      onCardTap: controller.navigateToWellnessCard,
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
