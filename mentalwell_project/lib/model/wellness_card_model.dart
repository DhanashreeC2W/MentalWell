import 'package:flutter/material.dart';

class WellnessCardModel {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String routeName;

  WellnessCardModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.routeName,
  });

  // Factory method for default wellness cards
  static List<WellnessCardModel> getDefaultCards() {
    return [
      WellnessCardModel(
        title: 'Breathing Exercise',
        subtitle: '5 min • Calm your mind',
        icon: Icons.air,
        color: const Color(0xFFA8E6CF),
        routeName: '/breathing',
      ),
      WellnessCardModel(
        title: 'Mindfulness Session',
        subtitle: '10 min • Stay present',
        icon: Icons.self_improvement,
        color: const Color(0xFFD4E2D4),
        routeName: '/mindfulness',
      ),
      WellnessCardModel(
        title: 'Journal Your Thoughts',
        subtitle: 'Reflect & release',
        icon: Icons.edit_note,
        color: const Color(0xFFF9D56E),
        routeName: '/journal',
      ),
    ];
  }
}