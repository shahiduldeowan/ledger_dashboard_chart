import '../../domain/entity/current_month_entity.dart';

class CurrentMonthModel extends CurrentMonthEntity {
  const CurrentMonthModel({
    super.year,
    super.month,
    super.bill,
    super.balance,
    super.departmentKey,
    super.departmentName,
  });

  factory CurrentMonthModel.fromJson(Map<String, dynamic> json) => CurrentMonthModel(
        year: json['year'],
        month: json['month'],
        bill: json['bill'],
        balance: json['balance'],
        departmentKey: json['departmentkey'],
        departmentName: json['departmentName'],
      );
}
