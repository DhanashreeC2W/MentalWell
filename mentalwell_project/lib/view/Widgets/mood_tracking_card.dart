import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentalwell_project/model/weekly_mood_model.dart';

class MoodTrackingCard extends StatelessWidget {
  final List<WeeklyMoodModel> weeklyData;

  const MoodTrackingCard({
    super.key,
    required this.weeklyData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Weekly Mood Summary',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF2C3E50),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F0F5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'This Week',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: const Color(0xFF5D6D7E),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Mini mood graph
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: weeklyData.map((data) {
              return _buildMoodBar(data);
            }).toList(),
          ),
          const SizedBox(height: 16),
          // Mood stats
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMoodStat('Most frequent', 'Calm', const Color(0xFF6C9EBF)),
              _buildMoodStat('Mood trend', '↑ Improving', const Color(0xFFA8E6CF)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMoodBar(WeeklyMoodModel data) {
    return Column(
      children: [
        Container(
          width: 20,
          height: 60 * data.value,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                _getMoodColor(data.mood).withOpacity(0.7),
                _getMoodColor(data.mood).withOpacity(0.3),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          data.day,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: const Color(0xFF7F8C8D),
          ),
        ),
      ],
    );
  }

  Widget _buildMoodStat(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: const Color(0xFF7F8C8D),
            ),
          ),
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Color _getMoodColor(String mood) {
    switch (mood) {
      case 'Happy':
        return const Color(0xFFFFD93D);
      case 'Calm':
        return const Color(0xFF6C9EBF);
      case 'Anxious':
        return const Color(0xFFC3A5B1);
      case 'Neutral':
        return const Color(0xFFB0BEC5);
      default:
        return const Color(0xFFA8E6CF);
    }
  }
}