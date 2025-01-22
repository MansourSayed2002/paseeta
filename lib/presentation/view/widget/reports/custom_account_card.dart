import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paseeta/core/constant/extensions/mediaquery_extensions.dart';
import 'package:paseeta/core/theme/color_app.dart';
import 'package:paseeta/core/theme/textstayle_app.dart';

class CustomAccountsCard extends StatelessWidget {
  const CustomAccountsCard({
    super.key,
    required this.count,
    required this.title,
    required this.color,
  });
  final String title;
  final String count;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.mediawidth / 2.3,
      height: context.mediaheight / 5,
      margin: EdgeInsets.all(10.0.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0.r),
        color: color,
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextstyleApp.white25blod,
          ),
          Divider(
            height: 50.0.r,
            indent: 10.0.r,
            endIndent: 10.0.r,
            color: ColorApp.black,
          ),
          Text(
            count,
            style: TextstyleApp.white25blod,
          ),
        ],
      ),
    );
  }
}
