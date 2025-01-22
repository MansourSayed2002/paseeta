import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paseeta/core/theme/textstayle_app.dart';

class TextFormFieldGlobal extends StatelessWidget {
  const TextFormFieldGlobal({
    super.key,
    required this.hintText,
    required this.suffix,
    required this.obscuretext,
    required this.validator,
    required this.controller,
    this.textStyle,
    this.keyboardType,
    this.textStylehint,
    this.borderSide,
  });
  final String hintText;
  final Widget suffix;
  final bool obscuretext;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final TextStyle? textStyle;
  final TextStyle? textStylehint;
  final BorderSide? borderSide;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0.r),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        cursorColor: Colors.black,
        style: textStyle ??
            TextstyleApp.white38.copyWith(
              fontSize: 25.0.sp,
            ),
        obscureText: obscuretext,
        validator: validator,
        onEditingComplete: () => TextInput.finishAutofillContext(),
        decoration: InputDecoration(
          suffixIcon: suffix,
          hintText: hintText,
          hintStyle:
              textStylehint ?? TextstyleApp.white38.copyWith(fontSize: 20.0.sp),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0.r),
              borderSide: borderSide ?? const BorderSide(color: Colors.white)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0.r),
          ),
        ),
      ),
    );
  }
}
