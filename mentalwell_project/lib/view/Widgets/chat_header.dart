import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatHeader extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onClearChat;
  final VoidCallback onBackPressed;

  const ChatHeader({
    super.key,
    required this.onClearChat,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              // Back button
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onBackPressed,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      color: Color(0xFF6C9EBF),
                      size: 24,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(width: 8),

              // Avatar and title
              Container(
                width: 40,
                height: 40,
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
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.auto_awesome,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              
              const SizedBox(width: 12),

              // Title and subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Serena',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF2C3E50),
                      ),
                    ),
                    Text(
                      'Your wellness companion',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: const Color(0xFF7F8C8D),
                      ),
                    ),
                  ],
                ),
              ),

              // Clear chat button
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onClearChat,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.delete_outline,
                      color: Color(0xFFE57373),
                      size: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}