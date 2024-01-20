import 'entity/ledger_entity.dart';

mixin LedgerBalanceService on LedgerEntity {
  /// Calculate the available balance by subtracting the payable amount from the credit limit.
  ///
  /// Handles potential null values using the null-aware operator (`??`), defaulting to 0.0.
  double get getAvailableBalance => (creditLimit ?? 0.0) - (payableAmount ?? 0.0);

  double get getCreditLimit => creditLimit ?? 0.0;

  double get getTotalDue => payableAmount ?? 0.0;

  double get getPreviousMonthBalance => bill ?? 0.0;

  double get getCurrentMonthBalance => balance ?? 0.0;

  /// Calculate the percentage of the total due amount in relation to the credit limit.
  ///
  /// Includes basic error handling to return 0.0 if any exception occur during calculation.
  double get expenseWithPercent {
    try {
      double expenseWithPercent = (getTotalDue / getCreditLimit) * 100;
      return expenseWithPercent / 100;
    } catch (e) {
      return 0.0;
    }
  }

  /// Calculations the remaining available balance as a percentage of the credit limit.
  ///
  /// Also includes basic error handling for potential exceptions.
  double get getRemainWithPercent {
    try {
      double remainWithPercent = (getAvailableBalance / getCreditLimit) * 100;
      return remainWithPercent / 100;
    } catch (e) {
      return 0.0;
    }
  }
}
