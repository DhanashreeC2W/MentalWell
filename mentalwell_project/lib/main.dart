import 'package:flutter/material.dart';
import 'package:mentalwell_project/view/Widgets/bottom_nav_bar.dart';

void main() {
  runApp(const MentalWellApp());
}

class MentalWellApp extends StatelessWidget {
  const MentalWellApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const MentalWellBottomNavBar(),
    );
  }
}