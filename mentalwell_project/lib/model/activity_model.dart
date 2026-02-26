import 'package:flutter/material.dart';

enum ActivityCategory {
  journal,
  meditation,
  games,
  health,
}

enum ActivityDifficulty {
  beginner,
  intermediate,
  advanced,
}

class ActivityModel {
  final String id;
  final String title;
  final String subtitle;
  final String duration;
  final int xpReward;
  final IconData icon;
  final Color color;
  final ActivityCategory category;
  final ActivityDifficulty difficulty;
  final bool isNew;
  final bool isPremium;
  final String imageAsset;
  final VoidCallback? onTap;

  ActivityModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.xpReward,
    required this.icon,
    required this.color,
    required this.category,
    required this.difficulty,
    this.isNew = false,
    this.isPremium = false,
    this.imageAsset = '',
    this.onTap,
  });

  // Sample data for different categories
  static List<ActivityModel> getJournalActivities() {
    return [
      ActivityModel(
        id: 'journal_1',
        title: 'Daily Reflection',
        subtitle: '5-minute journaling prompt',
        duration: '5 mins',
        xpReward: 15,
        icon: Icons.edit_note_rounded,
        color: const Color(0xFF6C9EBF),
        category: ActivityCategory.journal,
        difficulty: ActivityDifficulty.beginner,
        isNew: true,
      ),
      ActivityModel(
        id: 'journal_2',
        title: 'Gratitude Practice',
        subtitle: 'Write 3 things you\'re grateful for',
        duration: '3 mins',
        xpReward: 10,
        icon: Icons.favorite_rounded,
        color: const Color(0xFFFF9A76),
        category: ActivityCategory.journal,
        difficulty: ActivityDifficulty.beginner,
      ),
      ActivityModel(
        id: 'journal_3',
        title: 'Mood Tracker',
        subtitle: 'Track your emotional patterns',
        duration: '2 mins',
        xpReward: 8,
        icon: Icons.mood_rounded,
        color: const Color(0xFFFFD93D),
        category: ActivityCategory.journal,
        difficulty: ActivityDifficulty.beginner,
      ),
      ActivityModel(
        id: 'journal_4',
        title: 'Deep Journaling',
        subtitle: 'Extended writing session',
        duration: '15 mins',
        xpReward: 30,
        icon: Icons.book_rounded,
        color: const Color(0xFFA8E6CF),
        category: ActivityCategory.journal,
        difficulty: ActivityDifficulty.advanced,
        isPremium: true,
      ),
    ];
  }

  static List<ActivityModel> getMeditationActivities() {
    return [
      ActivityModel(
        id: 'med_1',
        title: 'Namah Shivay Series',
        subtitle: 'About Shiva • Calming meditation',
        duration: '9 mins',
        xpReward: 10,
        icon: Icons.self_improvement_rounded,
        color: const Color(0xFF6C9EBF),
        category: ActivityCategory.meditation,
        difficulty: ActivityDifficulty.beginner,
        isNew: true,
      ),
      ActivityModel(
        id: 'med_2',
        title: 'Morning Mindfulness',
        subtitle: 'Start your day with peace',
        duration: '5 mins',
        xpReward: 8,
        icon: Icons.wb_sunny_rounded,
        color: const Color(0xFFFFD93D),
        category: ActivityCategory.meditation,
        difficulty: ActivityDifficulty.beginner,
      ),
      ActivityModel(
        id: 'med_3',
        title: 'Body Scan',
        subtitle: 'Release physical tension',
        duration: '10 mins',
        xpReward: 15,
        icon: Icons.accessibility_new_rounded,
        color: const Color(0xFFA8E6CF),
        category: ActivityCategory.meditation,
        difficulty: ActivityDifficulty.intermediate,
      ),
      ActivityModel(
        id: 'med_4',
        title: 'Loving-Kindness',
        subtitle: 'Cultivate compassion',
        duration: '12 mins',
        xpReward: 20,
        icon: Icons.favorite_rounded,
        color: const Color(0xFFFF9A76),
        category: ActivityCategory.meditation,
        difficulty: ActivityDifficulty.intermediate,
        isPremium: true,
      ),
      ActivityModel(
        id: 'med_5',
        title: 'Breathwork',
        subtitle: 'Self Guided • Pranayama',
        duration: '7 mins',
        xpReward: 12,
        icon: Icons.air_rounded,
        color: const Color(0xFF6C9EBF),
        category: ActivityCategory.meditation,
        difficulty: ActivityDifficulty.beginner,
        isNew: true,
      ),
    ];
  }

  static List<ActivityModel> getGameActivities() {
    return [
      ActivityModel(
        id: 'game_1',
        title: 'Memory Match',
        subtitle: 'Train your focus',
        duration: '5 mins',
        xpReward: 10,
        icon: Icons.psychology_rounded,
        color: const Color(0xFF6C9EBF),
        category: ActivityCategory.games,
        difficulty: ActivityDifficulty.beginner,
      ),
      ActivityModel(
        id: 'game_2',
        title: 'Mindful Puzzles',
        subtitle: 'Relaxing brain teasers',
        duration: '10 mins',
        xpReward: 15,
        icon: Icons.extension_rounded,
        color: const Color(0xFFFF9A76),
        category: ActivityCategory.games,
        difficulty: ActivityDifficulty.intermediate,
      ),
      ActivityModel(
        id: 'game_3',
        title: 'Breathing Game',
        subtitle: 'Follow the rhythm',
        duration: '3 mins',
        xpReward: 8,
        icon: Icons.air_rounded,
        color: const Color(0xFFA8E6CF),
        category: ActivityCategory.games,
        difficulty: ActivityDifficulty.beginner,
        isNew: true,
      ),
      ActivityModel(
        id: 'game_4',
        title: 'Focus Quest',
        subtitle: 'Adventure with mindfulness',
        duration: '15 mins',
        xpReward: 25,
        icon: Icons.explore_rounded,
        color: const Color(0xFFFFD93D),
        category: ActivityCategory.games,
        difficulty: ActivityDifficulty.advanced,
        isPremium: true,
      ),
    ];
  }

  static List<ActivityModel> getHealthActivities() {
    return [
      ActivityModel(
        id: 'health_1',
        title: 'Morning Stretch',
        subtitle: '5 gentle exercises',
        duration: '5 mins',
        xpReward: 10,
        icon: Icons.accessibility_new_rounded,
        color: const Color(0xFF6C9EBF),
        category: ActivityCategory.health,
        difficulty: ActivityDifficulty.beginner,
      ),
      ActivityModel(
        id: 'health_2',
        title: 'Yoga Flow',
        subtitle: 'Vinyasa for beginners',
        duration: '15 mins',
        xpReward: 20,
        icon: Icons.self_improvement_rounded,
        color: const Color(0xFFA8E6CF),
        category: ActivityCategory.health,
        difficulty: ActivityDifficulty.intermediate,
      ),
      ActivityModel(
        id: 'health_3',
        title: 'Desk Exercises',
        subtitle: 'Work-friendly movements',
        duration: '4 mins',
        xpReward: 8,
        icon: Icons.computer_rounded,
        color: const Color(0xFFFF9A76),
        category: ActivityCategory.health,
        difficulty: ActivityDifficulty.beginner,
        isNew: true,
      ),
      ActivityModel(
        id: 'health_4',
        title: 'Evening Wind-Down',
        subtitle: 'Prepare for restful sleep',
        duration: '8 mins',
        xpReward: 12,
        icon: Icons.nightlight_round_rounded,
        color: const Color(0xFF6C9EBF),
        category: ActivityCategory.health,
        difficulty: ActivityDifficulty.beginner,
      ),
      ActivityModel(
        id: 'health_5',
        title: 'Power Walk',
        subtitle: 'Guided walking meditation',
        duration: '20 mins',
        xpReward: 30,
        icon: Icons.directions_walk_rounded,
        color: const Color(0xFFFFD93D),
        category: ActivityCategory.health,
        difficulty: ActivityDifficulty.advanced,
        isPremium: true,
      ),
    ];
  }
}