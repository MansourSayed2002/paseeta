import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paseeta/core/constant/onboarding.dart';

class CustomController extends StatelessWidget {
  const CustomController({super.key, required this.indexpage});
  final int indexpage;
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          onboarding.length,
          (index) => AnimatedContainer(
              height: 10.0.h,
              width: indexpage == index ? 30.0.w : 10.0.w,
              margin: EdgeInsets.symmetric(horizontal: 3.0.w, vertical: 20.0.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0.r),
              ),
              duration: const Duration(
                milliseconds: 300,
              )),
        ));
  }
}
