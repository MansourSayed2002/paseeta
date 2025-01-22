import 'package:flutter/material.dart';
import 'package:paseeta/core/constant/extensions/mediaquery_extensions.dart';
import 'package:paseeta/core/theme/color_app.dart';

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: context.mediawidth,
        height: context.mediaheight,
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          color: ColorApp.primary,
        ));
  }
}
