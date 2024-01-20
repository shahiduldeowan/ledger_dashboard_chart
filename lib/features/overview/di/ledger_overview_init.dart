import '../../../core/di/dependencies_setup.dart';
import '../data/repo/ledger_overview_repo_impl.dart';
import '../domain/repo/ledger_overview_repo.dart';
import '../domain/use_case/ledger_overview_use_case.dart';

void ledgerOverviewInit() {
  getIt
    ..registerSingleton<LedgerOverviewRepo>(LedgerOverviewRepoImpl(getIt(), getIt()))
    ..registerSingleton<LedgerOverviewUseCase>(LedgerOverviewUseCase(getIt()));
}
