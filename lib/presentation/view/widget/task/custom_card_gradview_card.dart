import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paseeta/core/constant/extensions/mediaquery_extensions.dart';
import 'package:paseeta/core/function/sizebox_app.dart';
import 'package:paseeta/core/shared/custom_card.dart';
import 'package:paseeta/core/theme/color_app.dart';
import 'package:paseeta/core/theme/textstayle_app.dart';

class CustomCardGridViewTask extends StatelessWidget {
  const CustomCardGridViewTask({
    super.key,
    required this.address,
    required this.date,
    required this.name,
    required this.price,
    required this.ontap,
  });
  final String name;
  final String price;
  final String address;
  final String date;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: key,
      onTap: ontap,
      child: CustomCardGlobal(
        height: context.mediaheight / 5,
        widget: Padding(
          padding: EdgeInsets.all(10.0.r),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: context.mediawidth / 1.5,
                    child: Text(
                      name,
                      style: TextstyleApp.black30blod
                          .copyWith(overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  Text(
                    price,
                    style: TextstyleApp.red18blod,
                  ),
                ],
              ),
              sizedBoxheight(context.mediaheight / 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: context.mediawidth / 2,
                    child: Text(
                      address,
                      style: TextstyleApp.black18
                          .copyWith(overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  Text(
                    date.split('T').first,
                    style: TextstyleApp.black18
                        .copyWith(color: ColorApp.black.withOpacity(.3)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
