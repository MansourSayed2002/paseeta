import 'package:flutter/material.dart';
import 'package:paseeta/core/constant/extensions/mediaquery_extensions.dart';
import 'package:paseeta/core/constant/image/image_app.dart';

class CustomNoData extends StatelessWidget {
  const CustomNoData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.mediawidth,
      height: context.mediaheight,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageApp.nodata), fit: BoxFit.contain)),
    );
  }
}
