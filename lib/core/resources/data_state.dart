import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? error;

  DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess({required super.data});
}

class DataEmpty<T> extends DataState<T> {
  DataEmpty();
}

class DataFailed<T> extends DataState<T> {
  DataFailed({super.error});
}
