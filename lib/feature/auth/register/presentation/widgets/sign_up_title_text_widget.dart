import 'package:flutter/widgets.dart';

class SignUpTitleTextWidget extends StatelessWidget {
  const SignUpTitleTextWidget({
    super.key,
    required this.title,
    required this.style,
  });
  final String title;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(title, style: style));
  }
}
