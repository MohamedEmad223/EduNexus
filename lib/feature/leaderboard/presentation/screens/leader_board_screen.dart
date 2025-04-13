import 'package:edunexus/feature/leaderboard/presentation/widgets/custom_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeaderBoardScreen extends StatelessWidget {
  const LeaderBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leader Board'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [SizedBox(height: 80.h), CustomCircleAvatar()],
                ),

                Column(
                  children: [SizedBox(height: 30.h), CustomCircleAvatar()],
                ),
                Column(
                  children: [SizedBox(height: 80.h), CustomCircleAvatar()],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
