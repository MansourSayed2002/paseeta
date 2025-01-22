import 'package:flutter/material.dart';
import 'package:paseeta/core/constant/extensions/mediaquery_extensions.dart';
import 'package:paseeta/core/constant/image/image_app.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.mediawidth,
        height: context.mediaheight,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(ImageApp.error))),
      ),
    );
  }
}
