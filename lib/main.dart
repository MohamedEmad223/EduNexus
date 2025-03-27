import 'package:edunexus/core/routes/app_rotes.dart';
import 'package:edunexus/edu_neuxus.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(EduNeuxus(appRoutes: AppRoutes()));
}
