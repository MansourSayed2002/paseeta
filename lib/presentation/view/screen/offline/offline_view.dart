import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paseeta/core/constant/image/image_app.dart';
import 'package:paseeta/core/theme/textstayle_app.dart';

class OfflineView extends StatelessWidget {
  const OfflineView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.red,
                title: Text(
                  'OffLine',
                  style: TextstyleApp.white25blod,
                ),
                centerTitle: true,
              ),
              body: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageApp.offline),
                        fit: BoxFit.contain)),
              ),
            ),
          );
        });
  }
}
