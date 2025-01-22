import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paseeta/core/constant/extensions/mediaquery_extensions.dart';
import 'package:paseeta/core/constant/string_app/string_app.dart';
import 'package:paseeta/core/di/di.dart';
import 'package:paseeta/core/function/validation_field.dart';
import 'package:paseeta/core/shared/logo_app.dart';
import 'package:paseeta/core/shared/text_form_field_global.dart';
import 'package:paseeta/core/theme/color_app.dart';
import 'package:paseeta/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:paseeta/presentation/view/widget/auth/custom_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.primary,
      body: BlocProvider(
        create: (context) => getit<LoginCubit>(),
        child: const CustomBody(),
      ),
    );
  }

  @override
  void dispose() {
    getit<LoginCubit>().phone.dispose();
    super.dispose();
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: getit<LoginCubit>().key,
      child: ListView(
        children: [
          LogoApp(
            height: context.mediaheight / 2,
            width: context.mediawidth,
          ),
          TextFormFieldGlobal(
            controller: getit<LoginCubit>().phone,
            hintText: StringApp.enterphone,
            keyboardType: TextInputType.phone,
            obscuretext: false,
            suffix: const Icon(
              Icons.phone_outlined,
              color: Colors.white,
            ),
            validator: (value) {
              return validationField(8, 50, "phone", value!);
            },
          ),
          CustomButton(
            title: StringApp.login,
            onTap: () async {
              getit<LoginCubit>().validation();
            },
          ),
        ],
      ),
    );
  }
}
