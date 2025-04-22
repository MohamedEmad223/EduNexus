import 'package:edunexus/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;

  const ChatMessage({super.key, required this.text, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color:
                  isUser ? AppColor.primaryColor : AppColor.lightGreyTextColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(text, style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
