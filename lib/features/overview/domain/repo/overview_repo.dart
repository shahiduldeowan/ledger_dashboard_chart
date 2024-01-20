import '../../../../core/resources/data_state.dart';
import '../entity/overview_entity.dart';

abstract class OverviewRepo {
  Future<DataState<OverviewEntity>> getOverview();
}
