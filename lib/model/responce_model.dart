
class ResponceModel {
 final String message;

  ResponceModel({required this.message});
  factory ResponceModel.fromJson(Map<String ,dynamic>jsonData){
    return ResponceModel(
      message: jsonData['message']);
  }

}