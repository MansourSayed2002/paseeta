import 'package:flutter/widgets.dart';
import 'package:paseeta/core/constant/extensions/mediaquery_extensions.dart';
import 'package:paseeta/core/constant/image/image_app.dart';

class CustomLoadingApp extends StatelessWidget {
  const CustomLoadingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.mediawidth,
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(ImageApp.loading))),
    );
  }
}
