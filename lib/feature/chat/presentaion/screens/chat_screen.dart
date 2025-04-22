import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Chat Screen Content',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}