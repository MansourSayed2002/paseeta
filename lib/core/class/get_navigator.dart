import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class GetNavigatorApp {
  GetNavigatorApp._();

  static final _instance = GetNavigatorApp._();

  factory GetNavigatorApp() => _instance;

  static offAll(Function? predicate) {
    Get.offAll(predicate,
        transition: Transition.leftToRight,
        duration: const Duration(milliseconds: 300));
  }

  static to(Function? predicate) {
    Get.to(predicate,
        transition: Transition.leftToRight,
        duration: const Duration(milliseconds: 300));
  }

  static offAllNamed(String newRouteName) {
    Get.offAllNamed(
      newRouteName,
    );
  }
}
