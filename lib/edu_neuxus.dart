import 'package:edunexus/core/routes/app_rotes.dart';
import 'package:edunexus/core/routes/routes.dart';
import 'package:flutter/material.dart';

class EduNeuxus extends StatelessWidget {
  const EduNeuxus({super.key, required this.appRoutes});
  final AppRoutes appRoutes;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoutes.generateRoute,
      initialRoute: Routes.splash,
    );
  }
}
