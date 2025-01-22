import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paseeta/core/constant/extensions/mediaquery_extensions.dart';
import 'package:paseeta/core/constant/onboarding.dart';
import 'package:paseeta/core/di/di.dart';
import 'package:paseeta/core/function/sizebox_app.dart';
import 'package:paseeta/core/theme/textstayle_app.dart';
import 'package:paseeta/presentation/cubit/onboarding_cubit/onboarding_cubit.dart';
import 'package:paseeta/presentation/view/widget/onboarding/custom_button_boarding.dart';
import 'package:paseeta/presentation/view/widget/onboarding/custom_controller.dart';

class CustomAppToThis extends StatelessWidget {
  const CustomAppToThis({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: context.mediawidth,
        height: context.mediaheight,
        child: PageView.builder(
          onPageChanged: (value) {
            getit<OnboardingCubit>().changeindexpage(value);
          },
          controller: getit<OnboardingCubit>().pagecontroller,
          itemCount: onboarding.length,
          itemBuilder: (context, index) => Column(
            children: [
              sizedBoxheight(50.0.h),
              Container(
                padding: EdgeInsets.all(10.0.r),
                width: context.mediawidth,
                height: context.mediaheight / 2,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(onboarding[index].image),
                        fit: BoxFit.contain)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: Text(
                  onboarding[index].title,
                  style: TextstyleApp.white38,
                ),
              ),
              CustomController(
                indexpage: index,
              ),
              // sizedBoxheight(100.0),
              CustomBotton(
                index: index,
              ),
            ],
          ),
        ));
  }
}
