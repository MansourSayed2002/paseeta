part of 'reports_cubit.dart';

@immutable
sealed class ReportsState {}

final class ReportsInitial extends ReportsState {}

final class ReportsLoading extends ReportsState {}

final class ReportsSuccess extends ReportsState {
  ReportsSuccess(this.data);
  final List data;
}

final class ReportsNoData extends ReportsState {}

final class ReportsError extends ReportsState {
  ReportsError(this.message);
  final String message;
}
