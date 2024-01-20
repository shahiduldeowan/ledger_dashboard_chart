extension DateTimeService on DateTime {
  DateTime get firstDayOfTheMonth => DateTime(year, month, 0, 24, 01, 00, 000);

  DateTime get lastDayOfTheMonth => DateTime(year, month + 1, 0, 23, 59, 59, 999);
}
