import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paseeta/core/theme/color_app.dart';

class CustomCardGlobal extends StatelessWidget {
  const CustomCardGlobal(
      {super.key, required this.widget, required this.height});
  final Widget widget;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.all(10.0.r),
      padding: EdgeInsets.all(10.0.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0.r),
        color: ColorApp.white,
        boxShadow: [
          BoxShadow(
            color: ColorApp.black.withOpacity(.2),
            offset: const Offset(1, 2),
            spreadRadius: 2,
          ),
        ],
      ),
      child: widget,
    );
  }
}
