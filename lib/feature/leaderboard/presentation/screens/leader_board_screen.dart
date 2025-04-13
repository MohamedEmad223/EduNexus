import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/feature/leaderboard/presentation/widgets/information_of_leaderbord_widgets.dart';
import 'package:edunexus/feature/leaderboard/presentation/widgets/row_of_ircle_avatar_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeaderBoardScreen extends StatelessWidget {
  const LeaderBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,

      appBar: AppBar(
        title: const Text('Leader Board'),
        centerTitle: true,
        backgroundColor: AppColor.backGroundColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Center(child: RowOfcircleAvatarWidgets()),
          SizedBox(height: 40.h),

          // ✅ Fix is here:
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => InformationOfLeaderbordWidgets(),
              separatorBuilder:
                  (context, index) => SizedBox(height: 10.h), // 👈 spacing here
            ),
          ),
        ],
      ),
    );
  }
}
