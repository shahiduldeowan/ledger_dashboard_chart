part of 'ledger_current_month_bloc.dart';

abstract class LedgerCurrentMonthState extends Equatable {
  const LedgerCurrentMonthState({this.details});

  final List<LedgerCurrentMonthEntity>? details;

  @override
  List<Object?> get props => [details];
}

class LedgerCurrentMonthLoadingState extends LedgerCurrentMonthState {
  const LedgerCurrentMonthLoadingState();
}

class LedgerCurrentMonthEmptyState extends LedgerCurrentMonthState {
  const LedgerCurrentMonthEmptyState();
}

class LedgerCurrentMonthLoadedState extends LedgerCurrentMonthState {
  const LedgerCurrentMonthLoadedState({required super.details});

  LedgerCurrentMonthLoadedState copyWith({List<LedgerCurrentMonthEntity>? details}) {
    return LedgerCurrentMonthLoadedState(details: details ?? this.details);
  }
}
