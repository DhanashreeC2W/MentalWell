class ChatMessageModel {
  final String text;
  final bool isUser;
  final DateTime timestamp;
  final bool isError;

  ChatMessageModel({
    required this.text,
    required this.isUser,
    required this.timestamp,
    this.isError = false,
  });

  // Factory constructor for user message
  factory ChatMessageModel.user(String text) {
    return ChatMessageModel(
      text: text,
      isUser: true,
      timestamp: DateTime.now(),
    );
  }

  // Factory constructor for assistant message
  factory ChatMessageModel.assistant(String text, {bool isError = false}) {
    return ChatMessageModel(
      text: text,
      isUser: false,
      timestamp: DateTime.now(),
      isError: isError,
    );
  }

  // Copy with method
  ChatMessageModel copyWith({
    String? text,
    bool? isUser,
    DateTime? timestamp,
    bool? isError,
  }) {
    return ChatMessageModel(
      text: text ?? this.text,
      isUser: isUser ?? this.isUser,
      timestamp: timestamp ?? this.timestamp,
      isError: isError ?? this.isError,
    );
  }
}
