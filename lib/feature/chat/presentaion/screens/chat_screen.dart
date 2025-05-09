import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/feature/chat/data/gemini_services.dart';
import 'package:edunexus/feature/chat/presentaion/widgets/chat_message.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    if (text.trim().isEmpty) return;

    _textController.clear();

    ChatMessage userMessage = ChatMessage(text: text, isUser: true);

    setState(() {
      _messages.insert(0, userMessage);
    });

    _getBotResponse(text);
  }

  void _getBotResponse(String userText) async {
    ChatMessage loadingMessage = ChatMessage(text: "Typing...", isUser: false);

    setState(() {
      _messages.insert(0, loadingMessage);
    });

    String botResponse = await GeminiService.sendMessage(userText);

    setState(() {
      _messages.removeAt(0);
      _messages.insert(0, ChatMessage(text: botResponse, isUser: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('ChatBot', style: AppTextStyle.poppins16w600primaryColor),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.all(8.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) => _messages[index],
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: InputDecoration.collapsed(hintText: 'Send a message'),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(
              icon: Icon(Icons.send, color: AppColor.primaryColor),
              onPressed: () => _handleSubmitted(_textController.text),
            ),
          ),
        ],
      ),
    );
  }
}
