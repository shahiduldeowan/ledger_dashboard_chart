import '../../domain/entity/overview_entity.dart';

class OverviewModel extends OverviewEntity {
  const OverviewModel({
    super.bill,
    super.balance,
    super.payableAmount,
    super.creditLimit,
  });

  factory OverviewModel.fromJson(Map<String, dynamic> json) => OverviewModel(
        bill: json['bill'],
        balance: json['balance'],
        payableAmount: json['payableAmount'],
        creditLimit: json['creditLimit'],
      );
}
