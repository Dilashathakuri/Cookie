

class LoginResponse {
  final String token;
  final String message;
  final String userId;
  LoginResponse(
      {required this.token, required this.message, required this.userId});
  factory LoginResponse.fromjson(Map<String, dynamic> json) {
    return LoginResponse(
        token: json['token'], message: json['message'], userId: json['userId']);
  }
}
