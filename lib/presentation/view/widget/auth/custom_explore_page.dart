import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paseeta/core/function/sizebox_app.dart';
import 'package:paseeta/core/theme/textstayle_app.dart';

class Custom_explorePage extends StatelessWidget {
  const Custom_explorePage({
    super.key,
    required this.title,
    required this.body,
  });
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextstyleApp.black30blod,
        ),
        sizedBoxheight(10.0.h),
        Text(
          body,
          style: TextstyleApp.black18,
        ),
      ],
    );
  }
}
