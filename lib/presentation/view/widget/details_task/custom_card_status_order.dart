import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paseeta/core/constant/extensions/mediaquery_extensions.dart';

class CustomCardStatusOrder extends StatelessWidget {
  const CustomCardStatusOrder({
    super.key,
    required this.color,
    required this.image,
    required this.ontap,
    required this.width,
  });
  final String image;
  final Color color;
  final VoidCallback ontap;
  final double width;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: width,
        height: context.mediaheight / 5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0.r),
            color: color,
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.contain)),
      ),
    );
  }
}
