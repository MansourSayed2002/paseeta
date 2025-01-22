import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:paseeta/core/class/get_navigator.dart';
import 'package:paseeta/domain/usecase/status/get_all_tasks_to_day_usecase.dart';
import 'package:paseeta/presentation/view/screen/details_task/details_task_view.dart';

part 'status_state.dart';

class StatusCubit extends Cubit<StatusState> {
  StatusCubit(this.getAllTasksToDayUsecase) : super(StatusInitial());

  GetAllTasksToDayUsecase getAllTasksToDayUsecase;

  List allTasksToDay = [];

  allTasks() async {
    allTasksToDay.clear();
    emit(StatusLoading());
    try {
      var response = await getAllTasksToDayUsecase.getAllTaskToDayUsecase();
      allTasksToDay = response;
      if (allTasksToDay.isNotEmpty) {
        await Future.delayed(const Duration(seconds: 3));
        emit(StatusSuccess(allTasksToDay));
      } else {
        emit(StatusNoData());
      }
    } catch (e) {
      StatusError(e.toString());
    }
  }

  goToDetailsTask(task) {
    GetNavigatorApp.to(() => DetailsTaskView(task: task));
  }
}
