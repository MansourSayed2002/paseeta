part of 'task_cubit.dart';

@immutable
sealed class TaskState {}

final class TaskInitial extends TaskState {}

final class TaskLoading extends TaskState {}

final class TaskSuccess extends TaskState {
  TaskSuccess(this.taskToDay);
  final List taskToDay;
}

final class TaskNoData extends TaskState {}

final class TaskError extends TaskState {
  TaskError(this.message);
  final String message;
}
