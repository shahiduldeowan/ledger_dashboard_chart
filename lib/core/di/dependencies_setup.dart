import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/ledger/data/source/ledger_api_service.dart';
import '../handler/api_handler.dart';
import '../handler/api_handler_impl.dart';
import '../interceptor/dio_interceptor.dart';

final GetIt getIt = GetIt.instance;

Future<void> dependenciesInjection() async {
  getIt
    ..registerLazySingleton<Dio>(() => Dio()..interceptors.add(DioInterceptor()))
    ..registerLazySingleton<ApiHandler>(() => ApiHandlerImpl())
    ..registerSingleton<LedgerApiService>(LedgerApiService(getIt()));
}
