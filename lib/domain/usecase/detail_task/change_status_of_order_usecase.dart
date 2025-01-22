import 'package:paseeta/domain/repo_abstract/repo_abstraction.dart';

class ChangeStatusOfOrderUsecase {
  ChangeStatusOfOrderUsecase(this.repoAbstraction);

  late RepoAbstraction repoAbstraction;

  changeStatusOrderToApproved(var value, valueeq) async {
    var response =
        await repoAbstraction.changeStatusOrderToApproved(value, valueeq);
    return response;
  }

  changeStatusOrderToDelayOrCancel(status, column, value, valueeq) async {
    var response = await repoAbstraction.changeStatusOrderToDelayOrCancel(
        status, column, value, valueeq);
    return response;
  }
}
