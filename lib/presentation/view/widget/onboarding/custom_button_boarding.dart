import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paseeta/core/constant/string_app/string_app.dart';
import 'package:paseeta/core/di/di.dart';
import 'package:paseeta/core/function/get_token.dart';
import 'package:paseeta/core/theme/textstayle_app.dart';
import 'package:paseeta/presentation/cubit/onboarding_cubit/onboarding_cubit.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: index == 2
          ? () async {
              var token = await getToken();
              QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                title: StringApp.token,
                widget: PrettyQrView.data(
                  data: token.toString(),
                ),
              );
            }
          : null,
      onTap: () async {
        getit<OnboardingCubit>().next();
      },
      child: Container(
          padding: EdgeInsets.all(20.0.r),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: index == 2 ? BorderRadius.circular(20.0.r) : null,
            shape: index != 2 ? BoxShape.circle : BoxShape.rectangle,
          ),
          child: index != 2
              ? Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 50.0.r,
                )
              : Text(
                  StringApp.getStarted,
                  style: TextstyleApp.white38.copyWith(fontSize: 25.0.sp),
                )),
    );
  }
}
