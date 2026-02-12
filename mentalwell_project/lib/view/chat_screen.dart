import 'dart:developer';

import 'package:flutter/material.dart';
import '../controller/api_service.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final controller = TextEditingController();
  String reply = "";

  void ask() async {
    log(controller.text);
    final response = await ApiService.askRag(controller.text);
    log(response);
    setState(() {
      reply = response;
    });
    
    log("User asked something :$response reaspones is : $reply");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Emi – MentalWell")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(labelText: "Share how you feel"),
            ),
            SizedBox(height: 12),
            ElevatedButton(onPressed: ask, child: Text("Ask Emi")),
            SizedBox(height: 20),
            Text(reply, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
