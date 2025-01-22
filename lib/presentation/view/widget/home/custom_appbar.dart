import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paseeta/core/constant/extensions/mediaquery_extensions.dart';
import 'package:paseeta/core/constant/image/image_app.dart';
import 'package:paseeta/core/theme/color_app.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.mediaheight / 6,
      padding: EdgeInsets.all(10.0.r),
      decoration: BoxDecoration(
          color: ColorApp.primary,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(14.0.r),
            bottomRight: Radius.circular(14.0.r),
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundColor: ColorApp.darkblue,
            backgroundImage: const AssetImage(ImageApp.profile),
          ),
          SizedBox(
            width: context.mediawidth / 6,
            child: Image.asset(
              ImageApp.logo,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
