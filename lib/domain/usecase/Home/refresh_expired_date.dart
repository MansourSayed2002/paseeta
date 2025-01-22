import 'package:paseeta/core/class/shared_preferences.dart';
import 'package:paseeta/domain/repo_abstract/repo_abstraction.dart';

class RefreshExpiredDate {
  RefreshExpiredDate(this.repoAbstraction);
  late RepoAbstraction repoAbstraction;

  refreshexpiredData() async {
    var deliverymanId = SharedPreferencesApp.gethive('deliveryman_id');
    List response = await repoAbstraction.refreshExpired(deliverymanId);
    SharedPreferencesApp.sethive(
        "deliveryman_expired", response.first['deliveryman_expired']);
  }
}
