abstract class ApiConsumer {
  Future<dynamic>post({required endPoint,Object?data ,Map<String ,dynamic > ?queryParameters ,bool isFormData =false});
  patch({required String endPoint,Object?data ,Map<String ,dynamic > ?queryParameters  ,bool isFormData =false});
  delete({required String endPoint,Object?data ,Map<String ,dynamic > ?queryParameters });
  put({required String endPoint,Object?data ,Map<String ,dynamic > ?queryParameters });
  get({required String endPoint,Object?data ,Map<String ,dynamic > ?queryParameters });


}
