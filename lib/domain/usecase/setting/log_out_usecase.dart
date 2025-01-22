import 'package:paseeta/core/class/get_navigator.dart';
import 'package:paseeta/core/class/shared_preferences.dart';
import 'package:paseeta/presentation/view/screen/auth/login_view.dart';

class LogOutUsecase {
  logOut() {
    SharedPreferencesApp.myServices.mybox!.clear();
    SharedPreferencesApp.setstring('step', "1");
    SharedPreferencesApp.myServices.storage.deleteAll();
    GetNavigatorApp.offAll(() => const LoginView());
  }
}
