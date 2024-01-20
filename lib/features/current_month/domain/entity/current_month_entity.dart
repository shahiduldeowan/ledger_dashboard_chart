import '../../../ledger/domain/entity/ledger_entity.dart';
import '../../../ledger/domain/ledger_debit_credit_service.dart';

class LedgerCurrentMonthEntity extends LedgerEntity with LedgerDebitCreditService {
  const LedgerCurrentMonthEntity({
    super.year,
    super.month,
    super.bill,
    super.balance,
    super.departmentKey,
    super.departmentName,
  });

  factory LedgerCurrentMonthEntity.fromLedgerEntity(LedgerEntity entity) => LedgerCurrentMonthEntity(
        year: entity.year,
        month: entity.month,
        bill: entity.bill,
        balance: entity.balance,
        departmentKey: entity.departmentKey,
        departmentName: entity.departmentName,
      );

  LedgerCurrentMonthEntity copyWith({
    int? year,
    int? month,
    double? bill,
    double? balance,
    int? departmentKey,
    String? departmentName,
  }) =>
      LedgerCurrentMonthEntity(
        year: year ?? this.year,
        month: month ?? this.month,
        bill: bill ?? this.bill,
        balance: balance ?? this.balance,
        departmentKey: departmentKey ?? this.departmentKey,
        departmentName: departmentName ?? this.departmentName,
      );
}
