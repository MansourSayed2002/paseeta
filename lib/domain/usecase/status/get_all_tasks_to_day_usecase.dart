import 'package:paseeta/core/class/shared_preferences.dart';
import 'package:paseeta/domain/repo_abstract/repo_abstraction.dart';

class GetAllTasksToDayUsecase {
  GetAllTasksToDayUsecase(this.repoAbstraction);

  late RepoAbstraction repoAbstraction;

  getAllTaskToDayUsecase() async {
    var date = DateTime.now().toString().split(" ").first;
    var deliverymanId = SharedPreferencesApp.gethive("deliveryman_id");
    var response = await repoAbstraction.getAllTasksToDay(deliverymanId, date);

    return response;
  }
}
