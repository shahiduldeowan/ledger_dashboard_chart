import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/entity/current_month_entity.dart';
import '../../domain/use_case/ledger_current_month_use_case.dart';

part 'ledger_current_month_event.dart';
part 'ledger_current_month_state.dart';

class LedgerCurrentMonthBloc extends Bloc<LedgerCurrentMonthEvent, LedgerCurrentMonthState> {
  final LedgerCurrentMonthUseCase _ledgerCurrentMonthUseCase;

  LedgerCurrentMonthBloc(this._ledgerCurrentMonthUseCase) : super(const LedgerCurrentMonthLoadingState()) {
    on<GetLedgerCurrentMonthEvent>((event, emit) async {
      final response = await _ledgerCurrentMonthUseCase();

      if (response is DataSuccess) {
        if (state is LedgerCurrentMonthLoadedState) {
          final currentState = state as LedgerCurrentMonthLoadedState;
          emit(currentState.copyWith(details: response.data));
          return;
        }

        emit(LedgerCurrentMonthLoadedState(details: response.data));
        return;
      }

      emit(const LedgerCurrentMonthEmptyState());
    });
  }
}
