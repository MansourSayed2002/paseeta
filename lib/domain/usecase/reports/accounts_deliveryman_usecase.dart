import 'package:paseeta/core/class/shared_preferences.dart';
import 'package:paseeta/domain/repo_abstract/repo_abstraction.dart';

class AccountsDeliverymanUsecase {
  AccountsDeliverymanUsecase(this.repoAbstraction);

  late RepoAbstraction repoAbstraction;

  getAccounts() async {
    var response = await repoAbstraction
        .getAccounts(SharedPreferencesApp.gethive('deliveryman_id'));
    return response;
  }
}
