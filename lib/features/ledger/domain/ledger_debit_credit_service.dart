import '../../../core/constants/strings.dart';
import 'entity/ledger_entity.dart';

mixin LedgerDebitCreditService on LedgerEntity {
  /// Determines whether the transaction is a credit based on the department key.
  ///
  /// Consider using a configuration or a more flexible approach.
  bool get isCredit => (departmentKey ?? 0) == Strings.creditKey;
}
