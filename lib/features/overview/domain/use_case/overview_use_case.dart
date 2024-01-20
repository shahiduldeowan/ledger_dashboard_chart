import '../../../../core/resources/data_state.dart';
import '../../../../core/use_case/use_case.dart';
import '../entity/overview_entity.dart';
import '../repo/overview_repo.dart';

class OverviewUseCase extends UseCase<DataState<OverviewEntity>, void> {
  OverviewUseCase(this._overviewRepo);

  final OverviewRepo _overviewRepo;

  @override
  Future<DataState<OverviewEntity>> call({void param}) {
    return _overviewRepo.getOverview();
  }
}
