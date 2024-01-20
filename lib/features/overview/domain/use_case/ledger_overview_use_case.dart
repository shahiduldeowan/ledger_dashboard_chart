import '../../../../core/resources/data_state.dart';
import '../../../../core/use_case/use_case.dart';
import '../entity/ledger_overview_entity.dart';
import '../repo/ledger_overview_repo.dart';

class LedgerOverviewUseCase extends UseCase<DataState<LedgerOverviewEntity>, void> {
  LedgerOverviewUseCase(this._overviewRepo);

  final LedgerOverviewRepo _overviewRepo;

  @override
  Future<DataState<LedgerOverviewEntity>> call({void param}) {
    return _overviewRepo.getOverview();
  }
}
