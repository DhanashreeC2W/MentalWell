import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialAuthButton extends StatelessWidget {
  final String text;
  final String iconPath;
  final Color color;
  final VoidCallback onPressed;

  const SocialAuthButton({
    super.key,
    required this.text,
    required this.iconPath,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Placeholder for social icon - you can use actual image assets
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(
                  _getIconForProvider(text),
                  color: Colors.white,
                  size: 16,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                text,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF334155),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIconForProvider(String provider) {
    switch (provider.toLowerCase()) {
      case 'continue with google':
        return Icons.g_translate;
      case 'continue with apple':
        return Icons.apple;
      case 'continue with facebook':
        return Icons.facebook;
      default:
        return Icons.person;
    }
  }
}