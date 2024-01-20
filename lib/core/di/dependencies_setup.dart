import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../handler/api_handler.dart';
import '../handler/api_handler_impl.dart';

final GetIt getIt = GetIt.instance;

Future<void> dependenciesInjection() async {
  getIt
    ..registerLazySingleton<Dio>(() => Dio())
    ..registerLazySingleton<ApiHandler>(() => ApiHandlerImpl());
}
