import 'package:intl/intl.dart';

extension DateFormatService on DateTime {
  String get toGetMonthYearFormat => DateFormat.MMM().add_y().format(this);
}
