import '../../domain/entity/current_month_entity.dart';

class LedgerCurrentMonthModel extends CurrentMonthEntity {
  const LedgerCurrentMonthModel({
    super.year,
    super.month,
    super.bill,
    super.balance,
    super.departmentKey,
    super.departmentName,
  });

  factory LedgerCurrentMonthModel.fromJson(Map<String, dynamic> json) => LedgerCurrentMonthModel(
        year: json['year'],
        month: json['month'],
        bill: json['bill'],
        balance: json['balance'],
        departmentKey: json['departmentkey'],
        departmentName: json['departmentName'],
      );
}
