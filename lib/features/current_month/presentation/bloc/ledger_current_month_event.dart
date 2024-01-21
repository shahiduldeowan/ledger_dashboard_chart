part of 'ledger_current_month_bloc.dart';

abstract class LedgerCurrentMonthEvent extends Equatable {
  const LedgerCurrentMonthEvent();

  @override
  List<Object> get props => [];
}

class GetLedgerCurrentMonthEvent extends LedgerCurrentMonthEvent {
  const GetLedgerCurrentMonthEvent();
}
