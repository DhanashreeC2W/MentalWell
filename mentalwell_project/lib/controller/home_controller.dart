import 'dart:developer';

import 'package:flutter/material.dart';
import '../model/mood_model.dart';
import '../model/wellness_card_model.dart';
import '../model/weekly_mood_model.dart';

class HomeController extends ChangeNotifier {
  List<MoodModel> _moods = [];
  List<WellnessCardModel> _wellnessCards = [];
  List<WeeklyMoodModel> _weeklyMoodData = [];
  int _selectedNavIndex = 0;
  String _greeting = 'Good Morning';
  // final DateTime _currentTime = DateTime.now();

  // Getters
  List<MoodModel> get moods => _moods;
  List<WellnessCardModel> get wellnessCards => _wellnessCards;
  List<WeeklyMoodModel> get weeklyMoodData => _weeklyMoodData;
  int get selectedNavIndex => _selectedNavIndex;
  String get greeting => _greeting;
  String get supportiveMessage => _getSupportiveMessage();

  HomeController() {
    _initializeData();
    _updateGreeting();
  }

  void _initializeData() {
    _moods = MoodModel.getDefaultMoods();
    _wellnessCards = WellnessCardModel.getDefaultCards();
    _weeklyMoodData = WeeklyMoodModel.getSampleData();
  }

  void _updateGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      _greeting = 'Good Morning';
    } else if (hour < 17) {
      _greeting = 'Good Afternoon';
    } else {
      _greeting = 'Good Evening';
    }
  }

  String _getSupportiveMessage() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Start your day with peace';
    } else if (hour < 17) {
      return 'Take a moment for yourself';
    } else {
      return 'Wind down gently';
    }
  }

  void selectMood(int index) {
    for (int i = 0; i < _moods.length; i++) {
      _moods[i] = _moods[i].copyWith(isSelected: i == index);
    }
    notifyListeners();
  }

  void setSelectedNavIndex(int index) {
    _selectedNavIndex = index;
    notifyListeners();
  }

// In your home screen widget
 navigateToChat() {
  log("Navigation to chat screen");
  // Navigator.push(
  //   context,
  //   MaterialPageRoute(
  //     builder: (context) => ChangeNotifierProvider(
  //       create: (context) => ChatController(),
  //       child: const ChatScreen(),
  //     ),
  //   ),
  // );
}

  void navigateToWellnessCard(String routeName) {
    // Navigation logic for wellness cards
    log('Navigating to $routeName');
  }
}