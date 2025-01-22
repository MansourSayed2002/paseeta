part of 'status_cubit.dart';

@immutable
sealed class StatusState {}

final class StatusInitial extends StatusState {}

final class StatusLoading extends StatusState {}

final class StatusNoData extends StatusState {}

final class StatusSuccess extends StatusState {
  StatusSuccess(this.data);
  final List data;
}

final class StatusError extends StatusState {
  StatusError(this.message);
  final String? message;
}
