import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class GeminiService {
  final String _apiKey = "AIzaSyCqFAtAXUe7Z6uQrUPEeUKowcmMSrMF0ug";
  final String _url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent";
  
  // System prompt for MentalWell assistant
  final String _systemPrompt = """
You are Serena, a calm, empathetic, and supportive AI wellness assistant for the MentalWell app. 
Your role is to provide gentle, compassionate mental wellness guidance. 

Guidelines:
- Always respond with warmth and empathy
- Use a calm, soothing tone
- Keep responses supportive and non-clinical
- Acknowledge the user's feelings
- Offer gentle suggestions when appropriate
- Never provide medical advice or crisis intervention - instead suggest professional help
- If user expresses thoughts of self-harm, provide crisis resources immediately

Remember: You're here to listen and support, not to diagnose or treat.
""";

  Future<String> generateResponse(String userQuestion, String chatHistory) async {
    log("Receiving response :$userQuestion");
    try {
      final String prompt = """
$_systemPrompt

Previous Conversation:
$chatHistory

User: $userQuestion

Serena (respond with warmth and empathy):
""";

      final response = await http.post(
        Uri.parse("$_url?key=$_apiKey"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "contents": [{
            "parts": [{"text": prompt}]
          }],
          "generationConfig": {
            "temperature": 0.7,
            "topK": 40,
            "topP": 0.95,
            "maxOutputTokens": 1024,
          },
          "safetySettings": [
            {
              "category": "HARM_CATEGORY_HARASSMENT",
              "threshold": "BLOCK_MEDIUM_AND_ABOVE"
            },
            {
              "category": "HARM_CATEGORY_HATE_SPEECH",
              "threshold": "BLOCK_MEDIUM_AND_ABOVE"
            },
            {
              "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
              "threshold": "BLOCK_MEDIUM_AND_ABOVE"
            },
            {
              "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
              "threshold": "BLOCK_MEDIUM_AND_ABOVE"
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        log("Serena response is : $data");
        try {
          return data["candidates"][0]["content"]["parts"][0]["text"] ?? 
                 "I'm here to listen. Would you like to share more?";
        } catch (e) {
          return "I'm having trouble understanding. Could you rephrase that?";
        }
      } else {
        return "I'm having trouble connecting right now. Please try again in a moment.";
      }
    } catch (e) {
      return "Connection issue. Please check your internet and try again.";
    }
  }

  // Check for crisis keywords
  bool containsCrisisKeywords(String text) {
    final crisisKeywords = [
      'kill myself', 'suicide', 'end my life', 'want to die',
      'hurt myself', 'self-harm', 'can\'t go on', 'no reason to live'
    ];
    return crisisKeywords.any((keyword) => text.toLowerCase().contains(keyword));
  }

  // Crisis response
  String getCrisisResponse() {
    return """
I'm really concerned about what you're sharing. Your feelings are valid and important, and I want you to know that help is available.

Please reach out to a crisis counselor who can provide immediate support:

• National Suicide Prevention Lifeline: 988 or 1-800-273-8255
• Crisis Text Line: Text HOME to 741741
• Emergency Services: 911

Would you like me to help you connect with these resources? Remember, you're not alone, and there are people who care and want to help.
""";
  }
}