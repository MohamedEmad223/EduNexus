import 'package:flutter/material.dart';

class CommentBox extends StatefulWidget {
  final String hintText;
  final String submitButtonText;
  final Function(String) onSubmit;
  final int maxLines;

  const CommentBox({
    super.key,
    this.hintText = 'Write your comment',
    this.submitButtonText = 'Comment',
    required this.onSubmit,
    this.maxLines = 5,
  });

  @override
  _CommentBoxState createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  final TextEditingController _controller = TextEditingController();
  bool _isButtonActive = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isButtonActive = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextFormField(
          controller: _controller,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.blue.shade400,
                width: 1.5,
              ),
            ),
            filled: true,
            fillColor: Colors.grey.shade50,
            contentPadding: const EdgeInsets.all(16),
          ),
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: _isButtonActive
              ? () {
                  widget.onSubmit(_controller.text);
                  _controller.clear();
                  setState(() {
                    _isButtonActive = false;
                  });
                }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade600,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: Text(widget.submitButtonText),
        ),
      ],
    );
  }
}