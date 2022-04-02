class UserResponse {
  String? user;
  dynamic status;
  SignError? error;
  UserResponse({this.user, this.status, this.error});

  UserResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    status = json['status'];
    error =
        (json['errors'] != null ? SignError.fromJson(json['errors']) : null);
  }
}

class SignError {
  String? errorMail;
  String? errorPass;

  SignError.fromJson(Map<String, dynamic> json) {
    errorMail = json['email'];
    errorPass = json['password'];
  }
}
