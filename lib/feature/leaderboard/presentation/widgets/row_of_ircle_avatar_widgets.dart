import 'package:edunexus/feature/leaderboard/presentation/widgets/custom_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowOfcircleAvatarWidgets extends StatelessWidget {
  const RowOfcircleAvatarWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(children: [SizedBox(height: 80.h), CustomCircleAvatar()]),

        Column(children: [SizedBox(height: 30.h), CustomCircleAvatar()]),
        Column(children: [SizedBox(height: 80.h), CustomCircleAvatar()]),
      ],
    );
  }
}
