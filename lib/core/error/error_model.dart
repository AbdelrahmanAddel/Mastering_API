class ErrorModel {
  final int statusCode;
  final String errorMessage;
  final List<dynamic> error;

  ErrorModel({required this.statusCode, required this.errorMessage, required this.error});


factory ErrorModel.fromJson(Map<String,dynamic>jsonData){
  return ErrorModel(
    statusCode: jsonData['status'],
    errorMessage: jsonData['ErrorMessage'],
    error: jsonData['Error']);

}

}