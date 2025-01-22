import 'package:get/get.dart';
import 'package:paseeta/core/services/services.dart';

class SharedPreferencesApp {
  static MyServices myServices = Get.find();

  static setstring(key, value) {
    myServices.sharedPre.setString(key, value.toString());
  }

  static sethive(key, value) {
    myServices.mybox!.put(key, value.toString());
  }

  static Future<void> secureWrite(key, value) async {
    await myServices.storage.write(key: key, value: value.toString());
  }

  static gethive(key) => myServices.mybox!.get(key);

  static getstring(key) => myServices.sharedPre.getString(key);

  static secureRead(key) async {
    var value = await myServices.storage.read(key: key);
    return value;
  }
}
