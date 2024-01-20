import '../../../ledger/domain/entity/ledger_entity.dart';
import '../../../ledger/domain/ledger_debit_credit_service.dart';

class CurrentMonthEntity extends LedgerEntity with LedgerDebitCreditService {
  const CurrentMonthEntity({
    super.year,
    super.month,
    super.bill,
    super.balance,
    super.departmentKey,
    super.departmentName,
  });
}
