import 'package:retrofit/retrofit.dart';

typedef ApiCallBack<T> = Future<HttpResponse<T>> Function();

abstract class ApiHandler {
  Future makeApiCall();
}
