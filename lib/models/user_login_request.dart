// login request post method
class LoginRequest {
  String? email;
  String? password;

  LoginRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }
}
