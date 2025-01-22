import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paseeta/core/constant/extensions/mediaquery_extensions.dart';
import 'package:paseeta/core/theme/textstayle_app.dart';

class CustomGridViewCard extends StatelessWidget {
  const CustomGridViewCard({
    super.key,
    required this.color,
    required this.image,
    required this.title,
    required this.ontap,
  });
  final Color color;
  final String image;
  final String title;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Column(
        children: [
          Container(
            height: context.mediaheight / 4.5,
            width: context.mediawidth / 2,
            padding: EdgeInsets.all(14.0.r),
            margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(40.0.r),
            ),
            child: Image.asset(image),
          ),
          Text(
            title,
            style: TextstyleApp.black18,
          )
        ],
      ),
    );
  }
}
