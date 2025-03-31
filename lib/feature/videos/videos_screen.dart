import 'package:flutter/material.dart';

class VideosScreen extends StatelessWidget {
  const VideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('videos'), centerTitle: true),
      body: Center(
        child: Text('Your videos is empty!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
