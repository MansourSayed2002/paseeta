import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paseeta/core/class/shared_preferences.dart';
import 'package:paseeta/core/constant/onboarding.dart';
import 'package:paseeta/presentation/view/screen/auth/login_view.dart';

class NextOnboardingPageUseCase {
  next(indexpage, controller) {
    indexpage++;
    if (indexpage > onboarding.length - 1) {
      SharedPreferencesApp.setstring('step', '1');
      Get.offAll(
        () => const LoginView(),
        transition: Transition.leftToRight,
        duration: const Duration(milliseconds: 300),
      );
    }
    controller.animateToPage(indexpage,
        duration: const Duration(milliseconds: 300), curve: Curves.bounceIn);
  }
}
