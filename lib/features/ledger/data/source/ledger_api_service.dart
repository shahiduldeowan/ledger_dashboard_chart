import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_urls.dart' show baseUrl, ledgerDetailsEndpoint, ledgerEndpoint, previousLedgerEndpoint;
import '../model/ledger_model.dart';
import '../model/ledger_request_model.dart';

part 'ledger_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class LedgerApiService {
  factory LedgerApiService(Dio dio) = _LedgerApiService;

  @POST(previousLedgerEndpoint)
  Future<HttpResponse<List<LedgerModel>>> getPreviousMonthLedger(
    @Body() LedgerRequestModel requestValue,
  );

  @POST(previousLedgerEndpoint)
  Future<HttpResponse<List<LedgerModel>>> getCurrentMonthLedger(
    @Body() LedgerRequestModel requestValue,
  );

  @POST(ledgerEndpoint)
  Future<HttpResponse<List<LedgerModel>>> getCurrentMonthUsesLedger(
    @Body() LedgerRequestModel requestValue,
  );

  @POST(ledgerDetailsEndpoint)
  Future<HttpResponse<List<LedgerModel>>> getLedgerDetails(
    @Body() LedgerRequestModel requestValue,
  );
}
