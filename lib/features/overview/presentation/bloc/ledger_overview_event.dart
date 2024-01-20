part of 'ledger_overview_bloc.dart';

abstract class LedgerOverviewEvent extends Equatable {
  const LedgerOverviewEvent();

  @override
  List<Object> get props => [];
}

class GetLedgerOverviewEvent extends LedgerOverviewEvent {
  const GetLedgerOverviewEvent();
}
