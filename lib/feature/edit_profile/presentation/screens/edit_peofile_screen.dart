import 'package:edunexus/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Edit Profile'),
        centerTitle: true,
        backgroundColor: AppColor.backGroundColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Name'),
              const TextField(),
              const SizedBox(height: 20),
              const Text('Email'),
              const TextField(),
              const SizedBox(height: 20),
              const Text('Phone Number'),
              const TextField(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle save action
                },
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
