import 'dart:math';
import 'package:paseeta/core/class/shared_preferences.dart';
import 'package:paseeta/core/function/send_verifycode.dart';
import 'package:paseeta/domain/repo_abstract/repo_abstraction.dart';

class CreateAndSendVerifyCode {
  CreateAndSendVerifyCode(this.repoAbstraction);

  late RepoAbstraction repoAbstraction;

  createAndSendVerifyCode(phone) async {
    var verifycode = Random().nextInt(99999);
    if (verifycode > 9999) {
      await repoAbstraction.updateverifycode(verifycode, phone);
      sendVerifyCode(
        name: SharedPreferencesApp.gethive('deliveryman_name'),
        email: SharedPreferencesApp.gethive('deliveryman_egoogle'),
        subject: 'shipping Company',
        message: verifycode.toString(),
      );
    } else {
      createAndSendVerifyCode(phone);
    }
  }
}
