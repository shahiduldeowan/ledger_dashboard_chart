import '../../../../core/resources/data_state.dart';
import '../entity/ledger_overview_entity.dart';

abstract class LedgerOverviewRepo {
  Future<DataState<LedgerOverviewEntity>> getOverview();
}
