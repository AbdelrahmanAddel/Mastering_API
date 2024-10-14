import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:test_work/core/api/api_consumer.dart';
import 'package:test_work/model/user_data_model.dart';
import '../../model/responce_model.dart';
import '../../model/sign_in_model.dart';
import '../api/end_point.dart';
import '../data/cache_helper.dart';
import '../error/server_exception.dart';
import '../functions/upload_image_to_api.dart';
import 'package:dartz/dartz.dart';

class UserRepositry {
  final ApiConsumer api;

  UserRepositry({required this.api});

  Future<Either<String, ResponceModel>> signUp({
    required String name,
    required String email,
    required String password,
    required String confirmPassowrd,
    required String phone,
    required XFile image,
  }) async {
    try {
      final responce = await api.post(
        endPoint: EndPoint.signUp,
        isFormData: true,
        data: {
          ApiKey.name: name,
          ApiKey.email: email,
          ApiKey.password: password,
          ApiKey.confirmPassword: confirmPassowrd,
          ApiKey.phone: phone,
          ApiKey.location: '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
          ApiKey.profilePic: await uploadImageToAPI(image),
        },
      );
      ResponceModel model = ResponceModel.fromJson(responce);
      return right(model);
    } on ServerException catch (e) {
      return left(e.error.errorMessage);
    }
  }

  Future<Either<String, SignInModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final responce = await api.post(
        endPoint: EndPoint.signIn,
        data: {
          ApiKey.email: email,
          ApiKey.password: password,
        },
      );
      SignInModel model = SignInModel.formJson(responce);

      final id = JwtDecoder.decode(model.token);
      await CacheHelper.setValue(key: 'token', value: model.token.toString());
      await CacheHelper.setValue(key: 'id', value: id['id']);
      return right(model);
    } on ServerException catch (e) {
      return left(e.error.errorMessage);
    }
  }

  Future<Either<String, UserDataModel>> getUserData() async {
    try {
      final responce = await api.get(
        endPoint: EndPoint.getUserId(id: CacheHelper.getValue(key: 'id')),
      );
      UserDataModel model = UserDataModel.fromJson(responce);
      return right(model);
    } on ServerException catch (e) {
      return left(e.error.errorMessage);
    }
  }

  Future<Either<String, String>> updataUserData({
    required String name,
    required String phone,
    required String location,
  }) async {
    try {
      final responce = await api.patch(
        endPoint: EndPoint.updata,
        isFormData: true,
        data: {
          ApiKey.name: name,
          ApiKey.phone: phone,
          ApiKey.location: location,
        },
      );
      await getUserData();
      ResponceModel model = ResponceModel.fromJson(responce);
      return right(model.message);
    } on ServerException catch (e) {
      return left(e.error.errorMessage);
    }
  }

Future<Either<String ,String>>deleteUserAccount()async{
    try {
  final responce =await api.delete(endPoint: EndPoint.delete,queryParameters: {
    'id':CacheHelper.getValue(key: 'id')
  });
   ResponceModel model =ResponceModel.fromJson(responce);
   return right(model.message);
} on ServerException catch (e) {
return left(e.error.errorMessage) ;
}

}

}
