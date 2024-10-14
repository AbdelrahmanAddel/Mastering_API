import 'package:test_work/core/api/end_point.dart';

class SignInModel {
 final String message;
  final String token;

  SignInModel({required this.message, required this.token});
  factory SignInModel.formJson(Map<String ,dynamic>jsonData){
    return SignInModel(
      message:jsonData[ApiKey.message] ,
      token:jsonData[ApiKey.token] 
       );
  }

}