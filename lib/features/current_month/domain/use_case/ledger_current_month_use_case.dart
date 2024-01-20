import '../../../../core/resources/data_state.dart';
import '../../../../core/use_case/use_case.dart';
import '../entity/current_month_entity.dart';
import '../repo/ledger_current_month_repo.dart';

class LedgerCurrentMonthUseCase extends UseCase<DataState<List<LedgerCurrentMonthEntity>>, void> {
  LedgerCurrentMonthUseCase(this._currentMonthRepo);

  final LedgerCurrentMonthRepo _currentMonthRepo;

  @override
  Future<DataState<List<LedgerCurrentMonthEntity>>> call({void param}) {
    return _currentMonthRepo.getDetails();
  }
}
