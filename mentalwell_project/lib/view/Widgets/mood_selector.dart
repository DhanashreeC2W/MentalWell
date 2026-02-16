import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentalwell_project/model/mood_model.dart';


class MoodSelector extends StatelessWidget {
  final List<MoodModel> moods;
  final Function(int) onMoodSelected;

  const MoodSelector({
    super.key,
    required this.moods,
    required this.onMoodSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How are you feeling today?',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: moods.map((mood) {
              return _buildMoodItem(mood);
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildMoodItem(MoodModel mood) {
    return GestureDetector(
      onTap: () => onMoodSelected(moods.indexOf(mood)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
          color: mood.isSelected 
              ? mood.color.withOpacity(0.2)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: mood.isSelected ? mood.color : Colors.transparent,
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Text(
              mood.emoji,
              style: const TextStyle(fontSize: 28),
            ),
            const SizedBox(height: 4),
            Text(
              mood.name,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: mood.isSelected ? mood.color : const Color(0xFF7F8C8D),
              ),
            ),
          ],
        ),
      ),
    );
  }
}