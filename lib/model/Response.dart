class ApiLoginResponse {
  final String code;
  final String responseType;
  final String token;

  ApiLoginResponse(this.code, this.responseType, this.token);

  factory ApiLoginResponse.fromMap(Map<String, dynamic> json) {
    String code =  json['code'];
    String responseType = json['responseType'];
    String token = json['token'];
    return ApiLoginResponse(code, responseType, token);
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["code"] = code;
    map["responseType"] = responseType;
    map["token"] = token;
    return map;
  }
}
