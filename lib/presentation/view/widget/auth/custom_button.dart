import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paseeta/core/constant/extensions/mediaquery_extensions.dart';
import 'package:paseeta/core/theme/textstayle_app.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.title,
    this.colorcard,
    this.textStyletitle,
  });
  final void Function()? onTap;
  final String title;
  final Color? colorcard;
  final TextStyle? textStyletitle;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: context.mediawidth,
        padding: EdgeInsets.all(10.0.r),
        margin: EdgeInsets.all(10.0.r),
        decoration: BoxDecoration(
          color: colorcard ?? Colors.black,
          borderRadius: BorderRadius.circular(20.0.r),
        ),
        child: Text(
          title,
          style: textStyletitle ??
              TextstyleApp.white38.copyWith(fontSize: 25.0.sp),
        ),
      ),
    );
  }
}
