import 'package:paseeta/core/class/shared_preferences.dart';

class CheckExpireUsecase {
  checkExpireAccount() async {
    var expired =
        DateTime.parse(SharedPreferencesApp.gethive('deliveryman_expired'));
    var today = DateTime.now().toString().split(' ').first;
    var date = DateTime.parse(today);
    if (expired.isBefore(date)) {
      SharedPreferencesApp.sethive('expired', '1');
    } else if (expired.isAfter(date)) {
      SharedPreferencesApp.sethive('expired', '2');
    } else {
      SharedPreferencesApp.sethive('expired', '0');
    }
  }
}
