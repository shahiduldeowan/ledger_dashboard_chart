part of 'ledger_overview_bloc.dart';

class LedgerOverviewState extends Equatable {
  const LedgerOverviewState({this.overview});

  final OverviewEntity? overview;

  @override
  List<Object?> get props => [overview];
}

class LedgerOverviewLoadingState extends LedgerOverviewState {
  const LedgerOverviewLoadingState();
}

class LedgerOverviewFailedState extends LedgerOverviewState {
  const LedgerOverviewFailedState();
}

class LedgerOverviewLoadedState extends LedgerOverviewState {
  const LedgerOverviewLoadedState({required super.overview});

  LedgerOverviewLoadedState copyWith({OverviewEntity? overview}) {
    return LedgerOverviewLoadedState(
      overview: overview ?? this.overview,
    );
  }
}
