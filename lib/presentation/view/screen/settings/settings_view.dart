import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paseeta/core/constant/extensions/mediaquery_extensions.dart';
import 'package:paseeta/core/constant/image/image_app.dart';
import 'package:paseeta/core/constant/string_app/string_app.dart';
import 'package:paseeta/core/di/di.dart';
import 'package:paseeta/core/shared/custom_button_arrow_back.dart';
import 'package:paseeta/core/theme/color_app.dart';
import 'package:paseeta/presentation/cubit/setting_cubit/setting_cubit.dart';
import 'package:paseeta/presentation/view/widget/settings/custom_card.dart';
import 'package:quickalert/quickalert.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            width: context.mediawidth,
            height: context.mediaheight,
            child: CircleAvatar(
              backgroundColor: ColorApp.lightblue.withOpacity(.3),
              radius: 150.0.r,
              child: Image.asset(
                ImageApp.setting,
              ),
            ),
          ),
          Positioned(
              top: context.mediaheight / 12,
              child: const CustomButtonArrowBack(
                iconData: Icons.arrow_back,
              )),
          Positioned(bottom: 10.0.h, right: 130.0.w, child: const CustomBody()),
        ],
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCard(
          color: ColorApp.primary,
          title: StringApp.contectUs,
          ontap: () {},
        ),
        CustomCard(
          color: ColorApp.red,
          title: StringApp.logout,
          ontap: () {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.confirm,
              title: StringApp.logout,
              text: StringApp.sure,
              onConfirmBtnTap: () => getit<SettingCubit>().logOut(),
            );
          },
        ),
      ],
    );
  }
}
