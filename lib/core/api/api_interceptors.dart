import 'package:dio/dio.dart';
import 'package:test_work/core/api/end_point.dart';
import 'package:test_work/core/data/cache_helper.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  options.headers[ApiKey.token]='FOODAPI ${CacheHelper.getValue(key: 'token')}';
    super.onRequest(options, handler);
  }

}