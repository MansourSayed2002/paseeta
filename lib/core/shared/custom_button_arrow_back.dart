import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonArrowBack extends StatelessWidget {
  const CustomButtonArrowBack({
    super.key,
    required this.iconData,
  });
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(iconData));
  }
}
