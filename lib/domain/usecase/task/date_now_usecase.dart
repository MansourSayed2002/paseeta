class DateNowUsecase {
  dateNow() => DateTime.now().toString().split(' ').first;
}
