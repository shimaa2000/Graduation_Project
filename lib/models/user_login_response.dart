import 'dart:convert';

import 'package:flutter/material.dart';


//login response


class LoginResponse {
  dynamic status;
  String? user;
  LoginError? error;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    status = json['status'];
    error = (json['errors'] != null? LoginError.fromJson(json['errors']): null );
  }

}

class LoginError {
  String? errorMail;
  String? errorPass;

  LoginError.fromJson(Map<String , dynamic> json){
    errorMail = json['email'];
    errorPass = json['password'];

  }
}
