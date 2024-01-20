import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../resources/data_state.dart';
import 'api_handler.dart';

class ApiHandlerImpl implements ApiHandler {
  ApiHandlerImpl();

  /// The function `makeApiCall` makes an API call using the provided `callBack` function and returns a
  /// `DataState` object representing the response or an error.
  ///
  /// Args:
  ///   callBack (ApiCallBack<T>): The `callBack` parameter is a function that makes the API call. It
  /// should return a `Future` that resolves to the API response.
  ///
  /// Returns:
  ///   The method is returning a Future object of type DataState<T>.
  @override
  Future<DataState<T>> makeApiCall<T>(ApiCallBack<T> callBack) async {
    try {
      final response = await callBack();
      return _getResponse(response);
    } on DioException catch (err) {
      return DataFailed(error: err);
    }
  }

  DataState<T> _getResponse<T>(HttpResponse<T> response) {
    if (response.response.statusCode == HttpStatus.ok) {
      return DataSuccess(data: response.data);
    }

    return DataFailed(
      error: DioException(
        error: response.response.statusMessage,
        response: response.response,
        type: DioExceptionType.badResponse,
        requestOptions: response.response.requestOptions,
      ),
    );
  }
}
