import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:paseeta/core/di/di.dart';
import 'package:paseeta/firebase_options.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPre;
  late Box? mybox;
  late FlutterSecureStorage storage;

  openHive() async {
    if (!Hive.isBoxOpen('paseetabox')) {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }
    return Hive.openBox('paseetabox');
  }

  Future<MyServices> init() async {
    sharedPre = await SharedPreferences.getInstance();
    AndroidOptions getAndroidOptions() => const AndroidOptions(
          encryptedSharedPreferences: true,
        );
    storage = FlutterSecureStorage(aOptions: getAndroidOptions());
    mybox = await openHive();
    await dotenv.load(fileName: ".env");
    await ScreenUtil.ensureScreenSize();
    await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL'].toString(),
      anonKey: dotenv.env['SUPABASE_ANONKEY'].toString(),
    );
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await setupgetit();
    return this;
  }
}

Future setup() async {
  await Get.putAsync(() => MyServices().init());
}
