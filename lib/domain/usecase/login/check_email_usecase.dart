import 'package:paseeta/core/enum/statusRequest.dart';
import 'package:paseeta/domain/repo_abstract/repo_abstraction.dart';

class CheckEmailUsecase {
  CheckEmailUsecase(this.repoAbstraction);

  late RepoAbstraction repoAbstraction;

  checkemailUse(phone) async {
    List response = await repoAbstraction.checkEmail(phone);
    if (response.isNotEmpty) {
      return response;
    } else if (response.isEmpty) {
      return Statusrequest.nodata;
    } else {
      return Statusrequest.failure;
    }
  }
}
