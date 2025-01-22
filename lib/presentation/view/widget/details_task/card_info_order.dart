import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paseeta/core/constant/extensions/mediaquery_extensions.dart';
import 'package:paseeta/core/constant/string_app/string_app.dart';
import 'package:paseeta/core/di/di.dart';
import 'package:paseeta/core/function/status_order.dart';
import 'package:paseeta/core/shared/custom_card.dart';
import 'package:paseeta/core/theme/color_app.dart';
import 'package:paseeta/core/theme/textstayle_app.dart';
import 'package:paseeta/presentation/cubit/details_task_cubit/details_task_cubit.dart';
import 'package:paseeta/presentation/view/widget/details_task/card_rich_text.dart';
import 'package:paseeta/presentation/view/widget/details_task/custom_snackbar_status_order.dart';

class CardInfoOrder extends StatelessWidget {
  const CardInfoOrder({
    super.key,
    required this.address,
    required this.condition,
    required this.confirmapproved,
    required this.confirmcancel,
    required this.confirmdelay,
    required this.name,
    required this.office,
    required this.phone,
  });
  final String name;
  final String phone;
  final String address;
  final String office;
  final VoidCallback confirmapproved;
  final VoidCallback confirmcancel;
  final VoidCallback confirmdelay;
  final int condition;

  @override
  Widget build(BuildContext context) {
    var controller = getit<DetailsTaskCubit>();
    return CustomCardGlobal(
        height: context.mediaheight / 2,
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardRichText(title: StringApp.name, value: name),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardRichText(title: StringApp.phone, value: phone),
                IconButton(
                    onPressed: () {
                      controller.callClient(phone);
                    },
                    icon: const Icon(Icons.phone)),
              ],
            ),
            CardRichText(title: StringApp.address, value: address),
            CardRichText(title: StringApp.office, value: office),
            InkWell(
              onTap: () {
                if (condition == 0) {
                  Get.rawSnackbar(
                    backgroundColor: ColorApp.black,
                    duration: const Duration(seconds: 10),
                    messageText: CustomSnackBarStatusOrder(
                      confirmapproved: confirmapproved,
                      confirmcancel: confirmcancel,
                      confirmdelay: confirmdelay,
                    ),
                  );
                }
              },
              child: Container(
                padding: EdgeInsets.all(10.0.r),
                decoration: BoxDecoration(
                    color: statusOrder(condition, ColorApp.primary,
                        ColorApp.lightgreen, ColorApp.darkblue, ColorApp.red),
                    borderRadius: BorderRadius.circular(20.0.r)),
                child: Text(
                  statusOrder(condition, StringApp.pending, StringApp.approve,
                      StringApp.delay, StringApp.cancellation),
                  style: TextstyleApp.white25blod.copyWith(fontSize: 20.0.sp),
                ),
              ),
            ),
          ],
        ));
  }
}
