import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:paseeta/core/class/shared_preferences.dart';

class MiddlewareOnboarding extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (SharedPreferencesApp.getstring('step') == '1') {
      return const RouteSettings(name: '/LoginView');
    } else if (SharedPreferencesApp.getstring('step') == '2') {
      return const RouteSettings(name: '/HomeView');
    }

    return null;
  }
}
