import 'package:test_work/core/api/end_point.dart';

class UserDataModel {
 final String name;
 final String phone;
 final String email;
 final String profilePic;
 final String createdAt;


  UserDataModel({required this.createdAt, required this.name, required this.phone, required this.email, required this.profilePic});

  factory UserDataModel.fromJson(Map<String,dynamic>jsonData){
    return UserDataModel(
      name: jsonData['user'][ApiKey.name],
      phone: jsonData['user'][ApiKey.phone],
      email: jsonData['user'][ApiKey.email],
      profilePic: jsonData['user'][ApiKey.profilePic],
      createdAt :jsonData['user'][ApiKey.createdAt]
    
      );
  }
}