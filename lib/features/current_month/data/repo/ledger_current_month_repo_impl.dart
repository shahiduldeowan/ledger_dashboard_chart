import '../../../../core/handler/api_handler.dart';
import '../../../../core/log/logger.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utility/date_time_service.dart';
import '../../../ledger/data/model/ledger_request_model.dart';
import '../../../ledger/data/source/ledger_api_service.dart';
import '../../../ledger/domain/entity/ledger_request_entity.dart';
import '../../domain/entity/current_month_entity.dart';
import '../../domain/repo/ledger_current_month_repo.dart';

class LedgerCurrentMonthRepoImpl implements LedgerCurrentMonthRepo {
  LedgerCurrentMonthRepoImpl(this._apiHandler, this._apiService);

  final ApiHandler _apiHandler;
  final LedgerApiService _apiService;

  @override
  Future<DataState<List<LedgerCurrentMonthEntity>>> getDetails() async {
    try {
      DateTime now = DateTime.now();
      final requestBody = LedgerRequestEntity(fromDate: now.firstDayOfTheMonth, toDate: now.lastDayOfTheMonth);

      final response = await _apiHandler.makeApiCall(
        () => _apiService.getLedgerDetails(
          LedgerRequestModel.fromEntity(requestBody),
        ),
      );

      if (response is DataSuccess && (response.data?.isNotEmpty ?? false)) {
        final result = List<LedgerCurrentMonthEntity>.from(response.data!.map((ledgerEntity) => LedgerCurrentMonthEntity.fromLedgerEntity(ledgerEntity)));
        return DataSuccess(data: result);
      }

      if (response is DataFailed) {
        Logger.dioLogger(dioError: response.error, name: '$runtimeType');
      }
    } catch (err, stk) {
      Logger.logger(error: err, stackTrace: stk, name: '$runtimeType');
    }

    return DataEmpty();
  }
}
