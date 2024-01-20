import 'package:equatable/equatable.dart';

class LedgerEntity extends Equatable {
  final String? userType;
  final String? orgUserId;
  final String? sysUserId;
  final String? ledgerMethod;
  final String? invoiceId;
  final int? year;
  final int? month;
  final double? bill;
  final double? balance;
  final double? payableAmount;
  final double? creditLimit;
  final int? departmentKey;
  final String? departmentName;
  final DateTime? fromDate;
  final DateTime? toDate;
  final String? date;

  const LedgerEntity({
    this.userType,
    this.orgUserId,
    this.sysUserId,
    this.ledgerMethod,
    this.invoiceId,
    this.year,
    this.month,
    this.bill,
    this.balance,
    this.payableAmount,
    this.creditLimit,
    this.departmentKey,
    this.departmentName,
    this.fromDate,
    this.toDate,
    this.date,
  });

  @override
  List<Object?> get props {
    return [
      userType,
      orgUserId,
      sysUserId,
      ledgerMethod,
      invoiceId,
      year,
      month,
      bill,
      balance,
      payableAmount,
      creditLimit,
      departmentKey,
      departmentName,
      fromDate,
      toDate,
      date,
    ];
  }
}
