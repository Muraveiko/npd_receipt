
class ApiErrorResponse {
  String? code; // налоговая поменяла формат ответа
  String? message;
  // additionalInfo - не знаю что такое

  ApiErrorResponse({this.code, this.message});

  static ApiErrorResponse fromJSON(Map<String, dynamic> data){
    final code = data['code'] as String?;
    final message = data['message'] as String?;
    return ApiErrorResponse(code: code, message: message);
  }
}