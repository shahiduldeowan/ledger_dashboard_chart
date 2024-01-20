import '../../../../core/resources/data_state.dart';
import '../entity/overview_entity.dart';

abstract class LedgerOverviewRepo {
  Future<DataState<OverviewEntity>> getOverview();
}
