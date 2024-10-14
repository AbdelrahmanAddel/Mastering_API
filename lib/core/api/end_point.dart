class EndPoint {
  static String baseUrl='https://food-api-omega.vercel.app/api/v1/';
  static String signUp='user/signup';
  static String signIn='user/signin';
  static String updata='user/update';


  

 static String getUserId({required String id}){
    return 'user/get-user/$id';
  }



}
class ApiKey{
  static String name='name';
  static String phone='phone';
  static String email='email';
  static String password='password';
  static String confirmPassword='confirmPassword';
  static String location='location';
  static String profilePic='profilePic';
  static String message='message';
  static String token='token';
  static String createdAt='createdAt';


  




}