import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/strings.dart';
import '../../../../core/handler/api_handler.dart';
import '../../../../core/log/logger.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utility/date_time_service.dart';
import '../../../ledger/data/model/ledger_request_model.dart';
import '../../../ledger/data/source/ledger_api_service.dart';
import '../../../ledger/domain/entity/ledger_entity.dart';
import '../../../ledger/domain/entity/ledger_request_entity.dart';
import '../../domain/entity/overview_entity.dart';
import '../../domain/repo/overview_repo.dart';

class OverviewRepoImpl implements OverviewRepo {
  OverviewRepoImpl(this._apiHandler, this._apiService);

  final ApiHandler _apiHandler;
  final LedgerApiService _apiService;

  @override
  Future<DataState<OverviewEntity>> getOverview() async {
    final previousMonth = await _getPreviousMonthLedger();
    final currentMonth = await _getCurrentMonthLedger();
    final currentMonthUses = await _getCurrentMonthUses();

    if (previousMonth != null || currentMonth != null) {
      return DataSuccess(
        data: OverviewEntity(
          creditLimit: currentMonth?.creditLimit, // Current month credit limit
          payableAmount: currentMonth?.payableAmount, // Total due
          bill: previousMonth?.payableAmount, // Previous month due
          balance: currentMonthUses?.bill, // Current month balance
        ),
      );
    } else {
      return DataEmpty();
    }
  }

  Future<LedgerEntity?> _getResult(Future<HttpResponse<List<LedgerEntity>>> Function() callback) async {
    try {
      final result = await _apiHandler.makeApiCall(() => callback());

      if (result is DataSuccess && (result.data?.isNotEmpty ?? false)) {
        return result.data?.first;
      }

      if (result is DataFailed) {
        Logger.dioLogger(dioError: result.error!, name: '$runtimeType');
        return null;
      }

      return null;
    } catch (err, stk) {
      Logger.logger(error: err, stackTrace: stk, name: '$runtimeType');
      return null;
    }
  }

  Future<LedgerEntity?> _getPreviousMonthLedger() async {
    final now = DateTime.now();
    DateTime? fromDate = DateTime.tryParse(Strings.ledgerPredefinedDateString);
    DateTime toDate = DateTime(now.year, now.month - 1, now.day);

    final requestBody = LedgerRequestEntity(fromDate: fromDate, toDate: toDate.lastDayOfTheMonth);

    return _getResult(
      () => _apiService.getPreviousMonthLedger(
        LedgerRequestModel.fromEntity(
          requestBody,
        ),
      ),
    );
  }

  Future<LedgerEntity?> _getCurrentMonthLedger() async {
    final now = DateTime.now();
    DateTime? fromDate = DateTime.tryParse(Strings.ledgerPredefinedDateString);
    final requestBody = LedgerRequestEntity(fromDate: fromDate, toDate: now.lastDayOfTheMonth);

    return _getResult(
      () => _apiService.getCurrentMonthLedger(
        LedgerRequestModel.fromEntity(
          requestBody,
        ),
      ),
    );
  }

  Future<LedgerEntity?> _getCurrentMonthUses() async {
    final now = DateTime.now();
    final requestBody = LedgerRequestEntity(fromDate: now.firstDayOfTheMonth, toDate: now.lastDayOfTheMonth);

    return _getResult(
      () => _apiService.getCurrentMonthUsesLedger(
        LedgerRequestModel.fromEntity(
          requestBody,
        ),
      ),
    );
  }
}
