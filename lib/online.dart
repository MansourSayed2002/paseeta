import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:paseeta/core/constant/getpages.dart';

class OnlineView extends StatelessWidget {
  const OnlineView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'cairo'),
            locale: const Locale('ar'),
            initialRoute: '/',
            getPages: getPages,
          );
        });
  }
}
