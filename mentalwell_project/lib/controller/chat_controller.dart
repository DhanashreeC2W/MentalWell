import 'package:flutter/material.dart';
import '../model/chat_message_model.dart';
import '../service/gemini_service.dart';

class ChatController extends ChangeNotifier {
  final List<ChatMessageModel> _messages = [];
  final GeminiService _geminiService = GeminiService();
  
  bool _isLoading = false;
  String currentUserInput = '';

  // Getters
  List<ChatMessageModel> get messages => List.unmodifiable(_messages);
  bool get isLoading => _isLoading;
  bool get hasMessages => _messages.isNotEmpty;

  // Send message
  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    currentUserInput = text;

    // Add user message
    _addMessage(ChatMessageModel.user(text));

    // Check for crisis keywords
    if (_geminiService.containsCrisisKeywords(text)) {
      _addMessage(ChatMessageModel.assistant(
        _geminiService.getCrisisResponse(),
        isError: false,
      ));
      return;
    }

    // Show loading
    _setLoading(true);

    try {
      final response = await _geminiService.generateResponse(
        text,
        _getChatHistory(),
      );
      
      _addMessage(ChatMessageModel.assistant(response));
    } catch (e) {
      _addMessage(ChatMessageModel.assistant(
        "I'm having trouble responding right now. Please try again.",
        isError: true,
      ));
    } finally {
      _setLoading(false);
    }
  }

  // Clear chat
  void clearChat() {
    _messages.clear();
    notifyListeners();
  }

  // Delete last message
  void deleteLastMessage() {
    if (_messages.isNotEmpty) {
      _messages.removeLast();
      notifyListeners();
    }
  }

  // Private methods
  void _addMessage(ChatMessageModel message) {
    _messages.add(message);
    notifyListeners();
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  String _getChatHistory() {
    if (_messages.isEmpty) return "No previous conversation.";
    
    String history = "";
    for (var message in _messages) {
      history += "${message.isUser ? 'User' : 'Serena'}: ${message.text}\n";
    }
    return history;
  }
}