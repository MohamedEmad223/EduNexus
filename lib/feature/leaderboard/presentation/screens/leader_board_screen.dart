import 'package:edunexus/feature/leaderboard/presentation/widgets/row_of_ircle_avatar_widgets.dart';
import 'package:flutter/material.dart';

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
            child: RowOfcircleAvatarWidgets()
          ),
        ],
      ),
    );
  }
}
