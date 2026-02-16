import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mentalwell_project/view/Widgets/chat_header.dart';
import 'package:mentalwell_project/view/Widgets/chat_input_feild.dart';
import 'package:mentalwell_project/view/Widgets/chat_message_bubble.dart';
import 'package:provider/provider.dart';
import '../controller/chat_controller.dart';
import 'Widgets/empy_chat_state.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Add listener for when messages change
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ChatController>().addListener(_scrollToBottom);
    });
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _handleSendMessage(String text) {
    final controller = context.read<ChatController>();
    controller.sendMessage(text);
    _controller.clear();
  }

  void _handleSuggestionTap(String suggestion) {
    _controller.text = suggestion;
    _handleSendMessage(suggestion);
  }

  void _clearChat() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          'Clear Chat',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        content: const Text('Are you sure you want to clear the conversation?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<ChatController>().clearChat();
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE57373),
              foregroundColor: Colors.white,
            ),
            child: const Text('Clear'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    log("In chat screen build");
    return Consumer<ChatController>(
      builder: (context, controller, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFF8FAFC),
          appBar: ChatHeader(
            onClearChat: _clearChat,
            onBackPressed: () => Navigator.pop(context),
          ),
          body: Column(
            children: [
              // Chat messages
              Expanded(
                child: controller.hasMessages
                    ? ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        itemCount: controller.messages.length,
                        itemBuilder: (context, index) {
                          return ChatMessageBubble(
                            message: controller.messages[index],
                          );
                        },
                      )
                    : EmptyChatState(onSuggestionTap: _handleSuggestionTap),
              ),

              // Input field
              ChatInputField(
                controller: _controller,
                isLoading: controller.isLoading,
                onSendMessage: _handleSendMessage,
              ),
            ],
          ),
        );
      },
    );
  }
}
