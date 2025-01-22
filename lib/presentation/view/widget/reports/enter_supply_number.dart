import 'package:flutter/material.dart';
import 'package:paseeta/core/constant/string_app/string_app.dart';
import 'package:paseeta/core/di/di.dart';
import 'package:paseeta/core/function/validation_field.dart';
import 'package:paseeta/core/shared/text_form_field_global.dart';
import 'package:paseeta/core/theme/color_app.dart';
import 'package:paseeta/core/theme/textstayle_app.dart';
import 'package:paseeta/presentation/cubit/reports_cubit/reports_cubit.dart';

class EnterSupplyNumber extends StatelessWidget {
  const EnterSupplyNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormFieldGlobal(
        hintText: StringApp.supplynumber,
        keyboardType: TextInputType.phone,
        suffix: const Icon(Icons.phone_outlined),
        textStyle: TextstyleApp.black18,
        borderSide: BorderSide(color: ColorApp.black),
        textStylehint:
            TextstyleApp.black18.copyWith(fontWeight: FontWeight.bold),
        obscuretext: false,
        validator: (value) {
          return validationField(11, 11, "phone", value!);
        },
        controller: getit<ReportsCubit>().supplyNumber);
  }
}
