import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:paseeta/core/di/di.dart';
import 'package:paseeta/core/middleware/middleware_onboarding.dart';
import 'package:paseeta/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:paseeta/presentation/view/screen/auth/login_view.dart';
import 'package:paseeta/presentation/view/screen/auth/verifycode_view.dart';
import 'package:paseeta/presentation/view/screen/home/home_view.dart';
import 'package:paseeta/presentation/view/screen/onboarding/onboarding_view.dart';
import 'package:paseeta/presentation/view/screen/task/task_view.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(
      name: '/',
      page: () => const OnboardingView(),
      middlewares: [MiddlewareOnboarding()]),
  GetPage(
    name: '/LoginView',
    page: () => const LoginView(),
  ),
  GetPage(
    name: '/VerifyCodeview',
    page: () => const VerifyCodeview(),
  ),
  GetPage(
    name: '/HomeView',
    page: () => BlocProvider(
      create: (context) => getit<HomeCubit>(),
      child: const HomeView(),
    ),
  ),
  GetPage(
    name: '/TaskView',
    page: () => const TaskView(),
  ),
];
