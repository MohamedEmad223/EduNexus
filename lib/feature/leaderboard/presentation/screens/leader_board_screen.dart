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
      body: Text('data'),
    );
  }
}
