import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/entity/overview_entity.dart';
import '../../domain/use_case/ledger_overview_use_case.dart';

part 'ledger_overview_event.dart';
part 'ledger_overview_state.dart';

class LedgerOverviewBloc extends Bloc<LedgerOverviewEvent, LedgerOverviewState> {
  final LedgerOverviewUseCase _overviewUseCase;

  LedgerOverviewBloc(this._overviewUseCase) : super(const LedgerOverviewLoadingState()) {
    on<GetLedgerOverviewEvent>((event, emit) async {
      final result = await _overviewUseCase();

      if (result is DataSuccess) {
        if (result is! LedgerOverviewLoadedState) {
          emit(LedgerOverviewLoadedState(overview: result.data!));
          return;
        }

        final currentState = state as LedgerOverviewLoadedState;
        emit(currentState.copyWith(overview: result.data!));
        return;
      }

      emit(const LedgerOverviewFailedState());
    });
  }
}
