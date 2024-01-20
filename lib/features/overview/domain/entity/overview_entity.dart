import '../../../ledger/domain/entity/ledger_entity.dart';
import '../../../ledger/domain/ledger_balance_service.dart';

class OverviewEntity extends LedgerEntity with LedgerBalanceService {
  const OverviewEntity({
    super.bill,
    super.balance,
    super.payableAmount,
    super.creditLimit,
  });
}
