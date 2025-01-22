import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paseeta/core/constant/extensions/mediaquery_extensions.dart';
import 'package:paseeta/core/theme/textstayle_app.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.title,
    required this.color,
    required this.ontap,
  });
  final String title;
  final Color color;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: context.mediawidth,
        margin: EdgeInsets.all(10.0.r),
        padding: EdgeInsets.all(15.0.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0.r),
          color: color,
        ),
        child: Text(
          title,
          style: TextstyleApp.white25blod,
        ),
      ),
    );
  }
}
