import 'dart:convert';

//login response

class AuthResponse {
  String? userId;

  AuthResponse({
    this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'userID': userId,
    };
  }

  factory AuthResponse.fromMap(Map<String, dynamic> map) {
    return AuthResponse(
      userId: map['userID'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthResponse.fromJson(String source) => AuthResponse.fromMap(json.decode(source));
}
