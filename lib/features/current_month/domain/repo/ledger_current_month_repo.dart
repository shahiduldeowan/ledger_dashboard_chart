import '../../../../core/resources/data_state.dart';
import '../entity/current_month_entity.dart';

abstract class LedgerCurrentMonthRepo {
  Future<DataState<List<LedgerCurrentMonthEntity>>> getDetails();
}
