import 'package:firebase_messaging/firebase_messaging.dart';

getToken() async {
  String? token = await FirebaseMessaging.instance.getToken();
  return token;
}
