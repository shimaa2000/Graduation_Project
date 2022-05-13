import 'dart:convert';

//login response

class AuthResponse {
  String? userId;
  String? token;

  AuthResponse({
    this.userId,
    this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'userID': userId,
      'token':token,
    };
  }

  factory AuthResponse.fromMap(Map<String, dynamic> map) {
    return AuthResponse(
      userId: map['userID'],
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthResponse.fromJson(String source) => AuthResponse.fromMap(json.decode(source));
}
