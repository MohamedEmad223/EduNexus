import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/feature/cart/cart_screen.dart';
import 'package:edunexus/feature/chat/chat_screen.dart';
import 'package:edunexus/feature/home/view/screens/home_screen.dart';
import 'package:edunexus/feature/profile/profile_screen.dart';
import 'package:edunexus/feature/videos/videos_screen.dart';
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
      backgroundColor: AppColor.whiteColor,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
      ),
      navBarStyle: NavBarStyle.style1,
    );
  }
}

List<Widget> _buildScreens() {
  return [
    HomeScreen(),
    CartScreen(),
    VideosScreen(),
    ProfileScreen(),
    ChatScreen(),
  ];
}

List<PersistentBottomNavBarItem> _buildNavBarsItems() {
  return [
    _buildNavBarItem(Icons.home, 'Home'),
    _buildNavBarItem(Icons.category_rounded, 'Cart'),
    _buildNavBarItem(Icons.video_call, 'Videos'),
    _buildNavBarItem(Icons.card_giftcard, "profile"),
    _buildNavBarItem(Icons.chat_bubble, 'chatBot'),
  ];
}

PersistentBottomNavBarItem _buildNavBarItem(IconData icon, String label) {
  return PersistentBottomNavBarItem(
    icon: Icon(icon),
    inactiveColorPrimary: Colors.grey,
    title: label,
    iconSize: 15.w,
  );
}
