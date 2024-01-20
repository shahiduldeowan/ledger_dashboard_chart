import '../../../ledger/domain/entity/ledger_entity.dart';
import '../../../ledger/domain/ledger_balance_service.dart';

class LedgerOverviewEntity extends LedgerEntity with LedgerBalanceService {
  const LedgerOverviewEntity({
    super.bill,
    super.balance,
    super.payableAmount,
    super.creditLimit,
  });

  LedgerOverviewEntity copyWith({
    double? bill,
    double? balance,
    double? payableAmount,
    double? creditLimit,
  }) =>
      LedgerOverviewEntity(
        bill: bill ?? this.bill,
        balance: balance ?? this.balance,
        payableAmount: payableAmount ?? this.payableAmount,
        creditLimit: creditLimit ?? this.creditLimit,
      );
}
