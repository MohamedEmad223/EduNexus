import 'package:edunexus/core/helper/app_images.dart';
import 'package:flutter/widgets.dart';

class ImageWidgets extends StatelessWidget {
  const ImageWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(AppImages.splashLogo, alignment: Alignment.center),
    );
  }
}
