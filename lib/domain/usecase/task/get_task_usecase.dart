import 'package:paseeta/core/class/shared_preferences.dart';
import 'package:paseeta/domain/repo_abstract/repo_abstraction.dart';

class GetTaskUsecase {
  GetTaskUsecase(this.repoAbstraction);
  late RepoAbstraction repoAbstraction;

  getTask() async {
    var date = DateTime.now().toString().split(' ').first;
    var deliverymanId = SharedPreferencesApp.gethive('deliveryman_id');
    var response = await repoAbstraction.selectTask(deliverymanId, date);

    return response;
  }
}
