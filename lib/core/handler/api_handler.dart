import 'package:retrofit/retrofit.dart';

import '../resources/data_state.dart';

typedef ApiCallBack<T> = Future<HttpResponse<T>> Function();

abstract class ApiHandler {
  Future<DataState<T>> makeApiCall<T>(ApiCallBack<T> callBack);
}
