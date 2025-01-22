import 'package:flutter/material.dart';
import 'package:paseeta/core/constant/image/image_app.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({
    super.key,
    required this.height,
    required this.width,
  });
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(ImageApp.logo))),
      ),
    );
  }
}
