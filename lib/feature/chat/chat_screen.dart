import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chats'), centerTitle: true),
      body: Center(
        child: Text('Your Chats is empty!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
