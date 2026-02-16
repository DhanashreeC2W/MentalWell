import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentalwell_project/view/chat_screen.dart';
import 'package:mentalwell_project/view/home_screen.dart';

class MentalWellBottomNavBar extends StatefulWidget {
  const MentalWellBottomNavBar({super.key});

  @override
  State<MentalWellBottomNavBar> createState() => _MentalWellBottomNavBarState();
}

class _MentalWellBottomNavBarState extends State<MentalWellBottomNavBar> {
  static int _selectedScreenIndex = 0;

  List<Widget> allScreensList = [const HomeScreen(), const ChatScreen()];
  void _onTapScreen(int index) {
    _selectedScreenIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: allScreensList.elementAt(_selectedScreenIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        onTap: _onTapScreen,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: const Color(0xFF6C9EBF),
        unselectedItemColor: const Color(0xFFB0BEC5),
        selectedLabelStyle: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: GoogleFonts.inter(fontSize: 12),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            activeIcon: Icon(Icons.book),
            label: 'Journal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            activeIcon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insights_outlined),
            activeIcon: Icon(Icons.insights),
            label: 'Insights',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.person_outline),
          //   activeIcon: Icon(Icons.person),
          //   label: 'Profile',
          // ),
        ],
      ),
    );
  }
}
