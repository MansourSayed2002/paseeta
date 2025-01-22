import 'package:paseeta/core/enum/statusRequest.dart';
import 'package:paseeta/domain/repo_abstract/repo_abstraction.dart';

class CheckVerifycodeUseCase {
  CheckVerifycodeUseCase(this.repoAbstraction);

  late RepoAbstraction repoAbstraction;

  checkVerifyCode(phone, verifycode) async {
    List response = await repoAbstraction.checkVerifyCode(phone, verifycode);
    if (response.isNotEmpty) {
      return response;
    } else {
      return Statusrequest.nodata;
    }
  }
}
