import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paseeta/core/constant/extensions/mediaquery_extensions.dart';
import 'package:paseeta/core/di/di.dart';
import 'package:paseeta/core/theme/color_app.dart';
import 'package:paseeta/presentation/cubit/onboarding_cubit/onboarding_cubit.dart';
import 'package:paseeta/presentation/view/widget/onboarding/custom_app_to_this.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.primary,
      body: BlocProvider(
        create: (context) => getit<OnboardingCubit>(),
        child: const CustomBody(),
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.mediawidth,
      height: context.mediaheight,
      child: const CustomAppToThis(),
    );
  }
}
