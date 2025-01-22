import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:paseeta/core/class/get_navigator.dart';
import 'package:paseeta/domain/usecase/task/date_now_usecase.dart';
import 'package:paseeta/domain/usecase/task/get_task_usecase.dart';
import 'package:paseeta/presentation/view/screen/details_task/details_task_view.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit(this.dateNowUsecase, this.getTaskUsecase) : super(TaskInitial());

  late DateNowUsecase dateNowUsecase;

  late GetTaskUsecase getTaskUsecase;

  dateToday() => dateNowUsecase.dateNow();

  List task = [];

  getTaskToDay() async {
    task.clear();
    emit(TaskLoading());
    try {
      var response = await getTaskUsecase.getTask();
      task = response;
      if (task.isNotEmpty) {
        emit(TaskSuccess(task));
      } else {
        emit(TaskNoData());
      }
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  goToDetailsOfTask(order) {
    GetNavigatorApp.to(() => DetailsTaskView(
          task: order,
        ));
  }

  onReboard(oldIndex, newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    var item = task.removeAt(oldIndex);
    task.insert(newIndex, item);
  }
}
