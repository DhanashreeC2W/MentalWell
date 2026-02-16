// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool isLoading;
  final Function(String) onSendMessage;

  const ChatInputField({
    super.key,
    required this.controller,
    required this.isLoading,
    required this.onSendMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                constraints: const BoxConstraints(maxHeight: 120),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Colors.grey.shade200,
                    width: 1,
                  ),
                ),
                child: TextField(
                  controller: controller,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  textCapitalization: TextCapitalization.sentences,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: const Color(0xFF2C3E50),
                  ),
                  decoration: InputDecoration(
                    hintText: 'Message Serena...',
                    hintStyle: GoogleFonts.inter(
                      color: const Color(0xFFB0BEC5),
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                  ),
                  onSubmitted: (text) {
                    log("Send button pressed");
                    if (text.trim().isNotEmpty && !isLoading) {
                      onSendMessage(text);
                    }
                  },
                ),
              ),
            ),
            
            const SizedBox(width: 8),
            
            // Send button
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  if (controller.text.trim().isNotEmpty && !isLoading) {
                    onSendMessage(controller.text);
                  }
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6C9EBF), Color(0xFF8FB0C9)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF6C9EBF).withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            ),
                          )
                        : const Icon(
                            Icons.send_rounded,
                            color: Colors.white,
                            size: 22,
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}