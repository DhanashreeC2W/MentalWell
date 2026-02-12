import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static Future<String> askRag(String text) async {
    final url = Uri.parse("http://127.0.0.1:8000/ask");
    log("In APIService");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"text": text}),
    );

    final data = jsonDecode(response.body);
    return data["answer"];
  }
}
