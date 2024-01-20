import '../../../ledger/domain/entity/ledger_entity.dart';
import '../../../ledger/domain/ledger_balance_service.dart';

class OverviewEntity extends LedgerEntity with LedgerBalanceService {
  const OverviewEntity({
    super.bill,
    super.balance,
    super.payableAmount,
    super.creditLimit,
  });

  OverviewEntity copyWith({
    double? bill,
    double? balance,
    double? payableAmount,
    double? creditLimit,
  }) =>
      OverviewEntity(
        bill: bill ?? this.bill,
        balance: balance ?? this.balance,
        payableAmount: payableAmount ?? this.payableAmount,
        creditLimit: creditLimit ?? this.creditLimit,
      );
}
