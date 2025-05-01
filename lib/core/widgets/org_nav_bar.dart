import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/feature/chat/presentaion/screens/chat_screen.dart';
import 'package:edunexus/feature/courses/views/screens/courses_screen.dart';
import 'package:edunexus/feature/settings/views/screens/settings_screen.dart';

class orgnizationBottomNavBar extends StatefulWidget {
  const orgnizationBottomNavBar({super.key});

  @override
  State<orgnizationBottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<orgnizationBottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [

    CoursesScreen(),
    SettingsScreen(),
    ChatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: AppColor.backGroundColor,
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [

          _buildBottomNavItem(Icons.video_call, 'Courses'),
          _buildBottomNavItem(Icons.settings, 'Profile'),
          _buildBottomNavItem(Icons.chat, 'Chat'),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(icon: Icon(icon, size: 22.w), label: label);
  }
}
