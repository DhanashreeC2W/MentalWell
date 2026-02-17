import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mentalwell_project/controller/chat_controller.dart';
import 'package:mentalwell_project/controller/home_controller.dart';
import 'package:mentalwell_project/view/Widgets/bottom_nav_bar.dart';
import 'package:mentalwell_project/view/onboarding_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAzKcLIIXtK4iaCtFVDij83wuxOE2K3ehA",
      appId: "1:175790055920:android:1f6cc27d76c8b82aae3d35",
      messagingSenderId: "175790055920",
      projectId: "mentalwell-project",
    ),
  );
  log("Firebase Initialize Successfully");
  runApp(const MentalWellApp());
}

class MentalWellApp extends StatelessWidget {
  const MentalWellApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeController()),
        ChangeNotifierProvider(create: (context) => ChatController()),
      ],
      child: MaterialApp(
        title: 'MentalWell',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Inter',
          scaffoldBackgroundColor: const Color(0xFFF8FAFD),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFF8FAFD),
            elevation: 0,
            iconTheme: IconThemeData(color: Color(0xFF6A67CE)),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const OnboardingScreen(),
      ),
    );
  }
}
