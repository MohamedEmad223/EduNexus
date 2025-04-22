import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Disscussion extends StatefulWidget {
  const Disscussion({super.key});

  @override
  State<Disscussion> createState() => _DisscussionState();
}

class _DisscussionState extends State<Disscussion> {
  final TextEditingController _commentController = TextEditingController();
  final List<Map<String, dynamic>> _comments = [];

  int? activeReplyIndex;
  final TextEditingController _replyController = TextEditingController();

  void _addComment() {
    if (_commentController.text.trim().isEmpty) return;

    setState(() {
      _comments.insert(0, {
        'name': 'You',
        'text': _commentController.text.trim(),
        'time': 'Just now',
        'replies': [],
      });
      _commentController.clear();
    });
  }

  void _addReply(int index) {
    if (_replyController.text.trim().isEmpty) return;

    setState(() {
      _comments[index]['replies'].add({
        'name': 'You',
        'text': _replyController.text.trim(),
        'time': 'Just now',
      });
      activeReplyIndex = null;
      _replyController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _commentController,
                  decoration: InputDecoration(
                    hintText: 'Add your Comments...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide: const BorderSide(color: Color(0xffE9EAF0)),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              ElevatedButton(
                onPressed: _addComment,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor,
                ),
                child: Text(
                  'Comment',
                  style: TextStyle(fontSize: 14.sp, color: AppColor.whiteColor),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: ListView.builder(
              itemCount: _comments.length,
              itemBuilder: (context, index) {
                final comment = _comments[index];
                final replies = (comment['replies'] ?? []) as List;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildComment(
                      name: comment['name'],
                      text: comment['text'],
                      time: comment['time'],
                      onReply: () {
                        setState(() {
                          activeReplyIndex =
                              activeReplyIndex == index ? null : index;
                        });
                      },
                    ),
                    if (activeReplyIndex == index)
                      Padding(
                        padding: EdgeInsets.only(
                          left: 50.w,
                          top: 8.h,
                          bottom: 8.h,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _replyController,
                                decoration: InputDecoration(
                                  hintText: 'Write a reply...',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 10,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            ElevatedButton(
                              onPressed: () => _addReply(index),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.primaryColor,
                              ),
                              child: const Text('Reply'),
                            ),
                          ],
                        ),
                      ),
                    ...replies.map(
                      (reply) => Padding(
                        padding: EdgeInsets.only(left: 50.w, top: 5.h),
                        child: _buildComment(
                          name: reply['name'],
                          text: reply['text'],
                          time: reply['time'],
                          isReply: true,
                        ),
                      ),
                    ),
                    const Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComment({
    required String name,
    required String text,
    required String time,
    bool isReply = false,
    VoidCallback? onReply,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: isReply ? 15.r : 20.r,
            backgroundImage: Image.asset(AppImages.personIcon).image,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyle.poppins14secondBlackColor.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(text),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    if (onReply != null)
                      InkWell(
                        onTap: onReply,
                        child: Text(
                          'Reply',
                          style: AppTextStyle.poppins14secondBlackColor
                              .copyWith(color: AppColor.primaryColor),
                        ),
                      ),
                    SizedBox(width: 10.w),
                    Text(time, style: AppTextStyle.poppins12greyColor),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
