import 'package:dio/dio.dart';
import 'package:test_work/core/api/api_consumer.dart';
import 'package:test_work/core/api/api_interceptors.dart';
import 'package:test_work/core/api/end_point.dart';

import '../error/server_exception.dart';

class DioConsumer  extends ApiConsumer{
final Dio dio;

  DioConsumer({required this.dio}){
    dio.options.baseUrl=EndPoint.baseUrl;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(LogInterceptor(
    requestBody : true,
    responseBody : true,

    ));
  }
  @override
  delete({required String endPoint, Object? data, Map<String, dynamic>? queryParameters}) {
   
  }

  @override
  Future <dynamic> get({required String endPoint, Object? data, Map<String, dynamic>? queryParameters}) async{
   try {
  final rsponce =await dio.get(endPoint,data: data ,queryParameters: queryParameters);
  return rsponce.data;
} on DioException catch (e) {
  dioError(e);

}
  }

  @override
 Future<dynamic> patch({required String endPoint, dynamic data, Map<String, dynamic>? queryParameters,bool isFormData =false}) async{
  try {
final responce =  await dio.patch(endPoint,data: isFormData?FormData.fromMap(data): data,queryParameters: queryParameters);
return responce.data;
} on DioException catch (e) {
  dioError(e);
}
  }


 
  @override
  put({required String endPoint, Object? data, Map<String, dynamic>? queryParameters}) {
    // TODO: implement put
    throw UnimplementedError();
  }
  
  @override
 Future  post({required  endPoint, dynamic data, Map<String, dynamic>? queryParameters, bool isFormData = false}) async{
  try {
  final responce =  await dio.post(endPoint,
  data:isFormData==true?FormData.fromMap(data): data ,
  queryParameters: queryParameters);
    return responce.data;
} on DioException catch (e) {
dioError(e);
}
  }
}