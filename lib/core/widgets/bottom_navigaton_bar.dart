import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/feature/cart/presentation/screens/cart_screen.dart';
import 'package:edunexus/feature/chat/presentaion/screens/chat_screen.dart';
import 'package:edunexus/feature/courses/views/screens/courses_screen.dart';
import 'package:edunexus/feature/home/view/screens/home_screen.dart';
import 'package:edunexus/feature/settings/views/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: PersistentTabController(initialIndex: 0),
      screens: _buildScreens(),
      items: _buildNavBarsItems(),
      backgroundColor: AppColor.backGroundColor,
      navBarStyle: NavBarStyle.style1,
    );
  }
}

List<Widget> _buildScreens() {
  return [HomeScreen(), CartScreen(), CoursesScreen(), SettingsScreen(),ChatScreen()];
}

List<PersistentBottomNavBarItem> _buildNavBarsItems() {
  return [
    _buildNavBarItem(Icons.home, 'Home'),
    _buildNavBarItem(Icons.category_rounded, 'Cart'),
    _buildNavBarItem(Icons.video_call, 'Courses'),
    _buildNavBarItem(Icons.settings, "profile"),
    _buildNavBarItem(Icons.chat, "chat"),
  ];
}

PersistentBottomNavBarItem _buildNavBarItem(IconData icon, String label) {
  return PersistentBottomNavBarItem(
    icon: Icon(icon),
    inactiveColorPrimary: Colors.grey,
    title: label,
    iconSize: 15.w,
    activeColorPrimary: AppColor.primaryColor,
  );
}
