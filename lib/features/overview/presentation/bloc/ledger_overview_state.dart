part of 'ledger_overview_bloc.dart';

class LedgerOverviewState extends Equatable {
  const LedgerOverviewState({this.overviewBalance});

  final LedgerOverviewEntity? overviewBalance;

  @override
  List<Object?> get props => [overviewBalance];
}

class LedgerOverviewLoadingState extends LedgerOverviewState {
  const LedgerOverviewLoadingState();
}

class LedgerOverviewFailedState extends LedgerOverviewState {
  const LedgerOverviewFailedState();
}

class LedgerOverviewLoadedState extends LedgerOverviewState {
  const LedgerOverviewLoadedState({required super.overviewBalance});

  LedgerOverviewLoadedState copyWith({LedgerOverviewEntity? overviewBalance}) {
    return LedgerOverviewLoadedState(
      overviewBalance: overviewBalance ?? this.overviewBalance,
    );
  }
}
