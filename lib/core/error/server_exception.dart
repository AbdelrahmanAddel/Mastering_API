import 'package:dio/dio.dart';

import 'error_model.dart';

class ServerException  implements Exception {
  final ErrorModel error;

  ServerException({required this.error});
 

}
 void dioError(DioException e) {
     switch(e.type) {
      case DioExceptionType.connectionTimeout:
        throw ServerException(error: ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.sendTimeout:
        throw ServerException(error: ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.receiveTimeout:
        throw ServerException(error: ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.badCertificate:
        throw ServerException(error: ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.cancel:
        throw ServerException(error: ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.connectionError:
        throw ServerException(error: ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.unknown:
        throw ServerException(error: ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.badResponse:
        switch(e.response?.statusCode){
          case 200:
        throw ServerException(error: ErrorModel.fromJson(e.response!.data));
          case 301:
        throw ServerException(error: ErrorModel.fromJson(e.response!.data));
          case 302:
        throw ServerException(error: ErrorModel.fromJson(e.response!.data));
          case 304:
        throw ServerException(error: ErrorModel.fromJson(e.response!.data));
          case 400:
        throw ServerException(error: ErrorModel.fromJson(e.response!.data));
        case 401:
        throw ServerException(error: ErrorModel.fromJson(e.response!.data));
          case 403:
        throw ServerException(error: ErrorModel.fromJson(e.response!.data));
          case 404:
        throw ServerException(error: ErrorModel.fromJson(e.response!.data));
          case 405:
        throw ServerException(error: ErrorModel.fromJson(e.response!.data));
          case 501:
        throw ServerException(error: ErrorModel.fromJson(e.response!.data));
          case 502:
        throw ServerException(error: ErrorModel.fromJson(e.response!.data));
          case 503:
        throw ServerException(error: ErrorModel.fromJson(e.response!.data));
          case 504:
        throw ServerException(error: ErrorModel.fromJson(e.response!.data));
        }
    }
  }