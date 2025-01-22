import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paseeta/core/constant/extensions/mediaquery_extensions.dart';
import 'package:paseeta/core/constant/image/image_app.dart';
import 'package:paseeta/core/constant/string_app/string_app.dart';
import 'package:paseeta/core/di/di.dart';
import 'package:paseeta/core/function/sizebox_app.dart';
import 'package:paseeta/core/shared/custom_button_arrow_back.dart';
import 'package:paseeta/core/theme/color_app.dart';
import 'package:paseeta/presentation/cubit/details_task_cubit/details_task_cubit.dart';
import 'package:paseeta/presentation/view/widget/details_task/custom_card_status_order.dart';
import 'package:quickalert/quickalert.dart';

class CustomSnackBarStatusOrder extends StatelessWidget {
  const CustomSnackBarStatusOrder({
    super.key,
    required this.confirmapproved,
    required this.confirmcancel,
    required this.confirmdelay,
  });
  final VoidCallback confirmapproved;
  final VoidCallback confirmcancel;
  final VoidCallback confirmdelay;

  @override
  Widget build(BuildContext context) {
    var controller = getit<DetailsTaskCubit>();
    return Container(
      width: context.mediawidth,
      height: context.mediaheight / 1.9,
      padding: EdgeInsets.all(10.0.r),
      child: Column(
        children: [
          const CustomButtonArrowBack(
            iconData: Icons.arrow_drop_down_outlined,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomCardStatusOrder(
                color: ColorApp.lightgreen,
                image: ImageApp.approved,
                width: context.mediawidth / 2.4,
                ontap: () {
                  Get.back();
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.confirm,
                    title: StringApp.approve,
                    text: StringApp.sure,
                    onConfirmBtnTap: confirmapproved,
                  );
                },
              ),
              CustomCardStatusOrder(
                color: ColorApp.lightblue,
                image: ImageApp.delay,
                width: context.mediawidth / 2.4,
                ontap: () {
                  Get.back();
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.confirm,
                    title: StringApp.delay,
                    text: StringApp.sure,
                    widget: IconButton(
                        onPressed: () {
                          controller.chooseToDelayDelivery();
                        },
                        icon: const Icon(Icons.date_range_outlined)),
                    onConfirmBtnTap: confirmdelay,
                  );
                },
              ),
            ],
          ),
          sizedBoxheight(20.0.h),
          CustomCardStatusOrder(
            color: ColorApp.red,
            image: ImageApp.cencel,
            width: context.mediawidth,
            ontap: () {
              Get.back();
              QuickAlert.show(
                context: controller.key.currentContext!,
                type: QuickAlertType.confirm,
                title: StringApp.cancellation,
                text: StringApp.sure,
                onConfirmBtnTap: confirmcancel,
              );
            },
          ),
        ],
      ),
    );
  }
}
