import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paseeta/core/constant/extensions/mediaquery_extensions.dart';
import 'package:paseeta/core/constant/image/image_app.dart';
import 'package:paseeta/core/function/sizebox_app.dart';
import 'package:paseeta/core/theme/color_app.dart';
import 'package:paseeta/core/theme/textstayle_app.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: context.mediawidth,
        height: context.mediaheight,
        child: Padding(
          padding: EdgeInsets.all(10.0.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100.0.r,
                backgroundColor: ColorApp.darkblue,
                child: Image.asset(ImageApp.profile),
              ),
              Text(
                "الاسم : منصور سيد ادم",
                style: TextstyleApp.black30blod.copyWith(fontSize: 25.0),
              ),
              sizedBoxheight(30.0.h),
              Text(
                "رقم الهاتف : 01113912230",
                style: TextstyleApp.black30blod.copyWith(fontSize: 25.0),
              ),
              sizedBoxheight(30.0.h),
              Text(
                "العنوان : الجيل الصفر / الخانكه / القليوبيه",
                style: TextstyleApp.black30blod.copyWith(fontSize: 25.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
