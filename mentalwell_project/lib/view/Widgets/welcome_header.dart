// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeHeader extends StatelessWidget {
  final String greeting;
  final String supportiveMessage;
  final String userName;

  const WelcomeHeader({
    super.key,
    required this.greeting,
    required this.supportiveMessage,
    this.userName = 'Friend',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$greeting,',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF2C3E50),
                    ),
                  ),
                  Text(
                    '$userName 👋',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF2C3E50),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    supportiveMessage,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: const Color(0xFF7F8C8D),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              // Profile avatar
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFFA8E6CF).withOpacity(0.5),
                      const Color(0xFFD4E2D4).withOpacity(0.5),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.person_outline,
                  color: Color(0xFF5D6D7E),
                  size: 28,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}