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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Add your leaderboard content here
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Example item count
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('User ${index + 1}'),
                    subtitle: Text('Score: ${100 - index * 10}'), // Example score
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
