class WeeklyMoodModel {
  final String day;
  final double value;
  final String mood;

  WeeklyMoodModel({
    required this.day,
    required this.value,
    required this.mood,
  });

  // Factory method for sample weekly mood data
  static List<WeeklyMoodModel> getSampleData() {
    return [
      WeeklyMoodModel(day: 'M', value: 0.7, mood: 'Happy'),
      WeeklyMoodModel(day: 'T', value: 0.5, mood: 'Neutral'),
      WeeklyMoodModel(day: 'W', value: 0.8, mood: 'Calm'),
      WeeklyMoodModel(day: 'T', value: 0.4, mood: 'Anxious'),
      WeeklyMoodModel(day: 'F', value: 0.6, mood: 'Neutral'),
      WeeklyMoodModel(day: 'S', value: 0.9, mood: 'Happy'),
      WeeklyMoodModel(day: 'S', value: 0.7, mood: 'Calm'),
    ];
  }
}