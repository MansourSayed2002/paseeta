import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paseeta/core/constant/string_app/string_app.dart';
import 'package:paseeta/core/di/di.dart';
import 'package:paseeta/core/function/sizebox_app.dart';
import 'package:paseeta/core/shared/custom_button_arrow_back.dart';
import 'package:paseeta/core/theme/color_app.dart';
import 'package:paseeta/presentation/cubit/verifycode_cubit/verifycode_cubit.dart';
import 'package:paseeta/presentation/view/widget/auth/custom_explore_page.dart';
import 'package:pinput/pinput.dart';

class VerifyCodeview extends StatelessWidget {
  const VerifyCodeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.primary,
        leading: const CustomButtonArrowBack(
          iconData: Icons.arrow_back,
        ),
      ),
      backgroundColor: ColorApp.primary,
      body: Form(
        key: getit<VerifycodeCubit>().key,
        child: Column(
          children: [
            sizedBoxheight(150.0.h),
            const Custom_explorePage(
              title: StringApp.verifycode,
              body: StringApp.enterverifycode,
            ),
            sizedBoxheight(10.0.h),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Pinput(
                  controller: getit<VerifycodeCubit>().opt,
                  keyboardType: TextInputType.number,
                  length: 5,
                  onCompleted: (val) {
                    getit<VerifycodeCubit>().checkverifycode();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
