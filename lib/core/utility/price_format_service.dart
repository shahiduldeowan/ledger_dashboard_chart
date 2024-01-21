import 'package:intl/intl.dart';

extension PriceFormatService on num {
  String get toFormatOfPrice => NumberFormat.simpleCurrency(name: '৳').format(this);
}
