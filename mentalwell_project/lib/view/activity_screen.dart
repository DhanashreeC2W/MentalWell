// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentalwell_project/view/Widgets/activity_title.dart';
import 'package:mentalwell_project/view/widgets/activity_section_header.dart';
import '../model/activity_model.dart';
import 'widgets/activity_category_card.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  String _selectedFilter = 'All';
  final List<String> _filters = ['All', 'New', 'Free', 'Recommended'];
  
  // Activity data
  final List<ActivityModel> _journalActivities = ActivityModel.getJournalActivities();
  final List<ActivityModel> _meditationActivities = ActivityModel.getMeditationActivities();
  final List<ActivityModel> _gameActivities = ActivityModel.getGameActivities();
  final List<ActivityModel> _healthActivities = ActivityModel.getHealthActivities();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Activities',
                        style: GoogleFonts.inter(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF2C3E50),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Nurture your mind & body',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: const Color(0xFF7F8C8D),
                        ),
                      ),
                    ],
                  ),
                  // XP Badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFFD93D), Color(0xFFFF9A76)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFFD93D).withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Colors.white,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '245 XP',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Filter Chips
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: _filters.length,
                itemBuilder: (context, index) {
                  final filter = _filters[index];
                  final isSelected = _selectedFilter == filter;
                  
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: FilterChip(
                      label: Text(filter),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          _selectedFilter = filter;
                        });
                      },
                      backgroundColor: Colors.white,
                      selectedColor: const Color(0xFF6C9EBF).withOpacity(0.1),
                      checkmarkColor: const Color(0xFF6C9EBF),
                      labelStyle: GoogleFonts.inter(
                        fontSize: 14,
                        color: isSelected 
                            ? const Color(0xFF6C9EBF) 
                            : const Color(0xFF7F8C8D),
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: isSelected 
                              ? const Color(0xFF6C9EBF) 
                              : Colors.grey.shade200,
                          width: 1,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 8),

            // Main Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // Categories Grid
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ActivityCategoryCard(
                            title: 'Journal',
                            icon: Icons.edit_note_rounded,
                            color: const Color(0xFF6C9EBF),
                            count: _journalActivities.length,
                            onTap: () {},
                          ),
                          ActivityCategoryCard(
                            title: 'Meditation',
                            icon: Icons.self_improvement_rounded,
                            color: const Color(0xFFA8E6CF),
                            count: _meditationActivities.length,
                            onTap: () {},
                          ),
                          ActivityCategoryCard(
                            title: 'Games',
                            icon: Icons.extension_rounded,
                            color: const Color(0xFFFF9A76),
                            count: _gameActivities.length,
                            onTap: () {},
                          ),
                          ActivityCategoryCard(
                            title: 'Health',
                            icon: Icons.fitness_center_rounded,
                            color: const Color(0xFFFFD93D),
                            count: _healthActivities.length,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Featured Section - Meditation
                    const ActivitySectionHeader(
                      title: 'Featured Meditations',
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: _meditationActivities.length,
                        itemBuilder: (context, index) {
                          return ActivityTile(
                            activity: _meditationActivities[index],
                            isHorizontal: true,
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Journal Section
                    const ActivitySectionHeader(
                      title: 'Journal',
                    ),
                    SizedBox(
                      height: 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: _journalActivities.length,
                        itemBuilder: (context, index) {
                          return ActivityTile(
                            activity: _journalActivities[index],
                            isHorizontal: false,
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Games Section
                    const ActivitySectionHeader(
                      title: 'Mindful Games',
                    ),
                    SizedBox(
                      height: 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: _gameActivities.length,
                        itemBuilder: (context, index) {
                          return ActivityTile(
                            activity: _gameActivities[index],
                            isHorizontal: false,
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Health Section
                    const ActivitySectionHeader(
                      title: 'Health & Exercise',
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: _healthActivities.length,
                        itemBuilder: (context, index) {
                          return ActivityTile(
                            activity: _healthActivities[index],
                            isHorizontal: true,
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 30),
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