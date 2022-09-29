
class RawbtResponse {
  static const String RESPONSE_SUCCESS = "success";
  static const String RESPONSE_ERROR = "error";
  static const String RESPONSE_CANCELED = "canceled";
  static const String RESPONSE_PROGRESS = "progress";

  String? jobId;
  String? responseType;
  String? errorMessage;
  double? progress;

  RawbtResponse.fromJson(Map<String, dynamic> json):
        jobId = json['jobId'],
        responseType = json['responseType'],
        errorMessage = json['errorMessage'],
        progress = json['progress'];
}