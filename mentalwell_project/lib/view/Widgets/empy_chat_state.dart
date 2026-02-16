// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyChatState extends StatelessWidget {
  final Function(String) onSuggestionTap;

  const EmptyChatState({
    super.key,
    required this.onSuggestionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated avatar
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFA8E6CF), Color(0xFF6C9EBF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF6C9EBF).withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Icon(
                Icons.auto_awesome,
                size: 50,
                color: Colors.white,
              ),
            ),
            
            const SizedBox(height: 24),
            
            Text(
              'Serena',
              style: GoogleFonts.inter(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF2C3E50),
              ),
            ),
            
            const SizedBox(height: 8),
            
            Text(
              'Your compassionate AI wellness companion',
              style: GoogleFonts.inter(
                fontSize: 16,
                color: const Color(0xFF7F8C8D),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Suggestion chips
            _buildSuggestionChip(
              'Feeling anxious about something',
              Icons.psychology_outlined,
            ),
            
            const SizedBox(height: 12),
            
            _buildSuggestionChip(
              'Need help with stress relief',
              Icons.self_improvement,
            ),
            
            const SizedBox(height: 12),
            
            _buildSuggestionChip(
              'Want to practice mindfulness',
              Icons.spa_outlined,
            ),
            
            const SizedBox(height: 12),
            
            _buildSuggestionChip(
              'Looking for emotional support',
              Icons.favorite_outline,
            ),
            
            const SizedBox(height: 40),
            
            // Privacy note
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 32),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.grey.shade200,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.security_outlined,
                    color: const Color(0xFF6C9EBF),
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Your conversations are private and encrypted',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: const Color(0xFF7F8C8D),
                        height: 1.4,
                      ),
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

  Widget _buildSuggestionChip(String text, IconData icon) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onSuggestionTap,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Colors.grey.shade200,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: const Color(0xFF6C9EBF), size: 18),
              const SizedBox(width: 8),
              Text(
                text,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: const Color(0xFF2C3E50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}