class UserMail {
  String? userMail;

  UserMail.fromJson(Map<String, dynamic> json) {
    userMail = json['email'];
  }
}

class ResetCodes {
  String? resetCode;

  ResetCodes.fromJson(Map<String, dynamic> json) {
    resetCode = json['resetCode'];
  }
}

class NewPass {
  String? newPassword;

  NewPass({this.newPassword});

  factory NewPass.fromMap(Map<String, dynamic> map) {
    return NewPass(
     newPassword: map['newPassword'],
    );
  }
}
