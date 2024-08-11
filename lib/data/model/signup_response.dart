class SignupResponse {
  final String message;
  SignupResponse({required this.message});
  factory SignupResponse.fromjson(Map<String, dynamic> json) {
    return SignupResponse(
      message: json['message'],
    );
    
  }
}
