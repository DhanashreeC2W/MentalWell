import 'package:flutter/material.dart';

class MoodModel {
  final String name;
  final String emoji;
  final Color color;
  final bool isSelected;

  MoodModel({
    required this.name,
    required this.emoji,
    required this.color,
    this.isSelected = false,
  });

  MoodModel copyWith({bool? isSelected}) {
    return MoodModel(
      name: name,
      emoji: emoji,
      color: color,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  // Factory method for default moods
  static List<MoodModel> getDefaultMoods() {
    return [
      MoodModel(name: 'Happy', emoji: '😊', color: const Color(0xFFFFD93D)),
      MoodModel(name: 'Calm', emoji: '😌', color: const Color(0xFF6C9EBF)),
      MoodModel(name: 'Sad', emoji: '😔', color: const Color(0xFF9AA9B1)),
      MoodModel(name: 'Anxious', emoji: '😰', color: const Color(0xFFC3A5B1)),
      MoodModel(name: 'Angry', emoji: '😤', color: const Color(0xFFE57373)),
      MoodModel(name: 'Neutral', emoji: '😐', color: const Color(0xFFB0BEC5)),
    ];
  }
}