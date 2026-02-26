import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivitySectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAll;
  final bool showViewAll;

  const ActivitySectionHeader({
    super.key,
    required this.title,
    this.onViewAll,
    this.showViewAll = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF2C3E50),
            ),
          ),
          if (showViewAll)
            GestureDetector(
              onTap: onViewAll,
              child: Row(
                children: [
                  Text(
                    'View All',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: const Color(0xFF6C9EBF),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 12,
                    color: const Color(0xFF6C9EBF),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}