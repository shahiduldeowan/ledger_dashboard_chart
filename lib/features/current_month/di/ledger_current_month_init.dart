import '../../../core/di/dependencies_setup.dart';
import '../data/repo/ledger_current_month_repo_impl.dart';
import '../domain/repo/ledger_current_month_repo.dart';
import '../domain/use_case/ledger_current_month_use_case.dart';
import '../presentation/bloc/ledger_current_month_bloc.dart';

void ledgerCurrentMonthInit() {
  getIt
    ..registerSingleton<LedgerCurrentMonthRepo>(LedgerCurrentMonthRepoImpl(getIt(), getIt()))
    ..registerSingleton<LedgerCurrentMonthUseCase>(LedgerCurrentMonthUseCase(getIt()))
    ..registerFactory<LedgerCurrentMonthBloc>(() => LedgerCurrentMonthBloc(getIt()));
}
