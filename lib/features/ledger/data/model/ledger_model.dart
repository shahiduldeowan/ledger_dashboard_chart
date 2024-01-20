import '../../domain/entity/ledger_entity.dart';

class LedgerModel extends LedgerEntity {
  const LedgerModel({
    super.userType,
    super.orgUserId,
    super.sysUserId,
    super.ledgerMethod,
    super.invoiceId,
    super.year,
    super.month,
    super.bill,
    super.balance,
    super.payableAmount,
    super.creditLimit,
    super.departmentKey,
    super.departmentName,
    super.fromDate,
    super.toDate,
    super.date,
  });

  factory LedgerModel.fromJson(Map<String, dynamic> json) => LedgerModel(
        userType: json['userType'],
        orgUserId: json['orgUserId'],
        sysUserId: json['sysUserId'],
        ledgerMethod: json['ledgerMethod'],
        invoiceId: json['invoiceId'],
        year: json['year'],
        month: json['month'],
        bill: json['bill'],
        balance: json['balance'],
        payableAmount: json['payableAmount'],
        creditLimit: json['creditLimit'],
        departmentKey: json['departmentkey'],
        departmentName: json['departmentName'],
        fromDate: json['fromDate'],
        toDate: json['toDate'],
        date: json['date'],
      );
}
