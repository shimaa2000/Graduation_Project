import 'dart:convert';



//sign up request post method
class UserSignUp {
  String? userName;
  String? fullName;
  String? email;
  String? password;
  String? gender;
  String? birthday;
  String? phoneNumber;
  String? address;

  UserSignUp(
      {this.userName,
        this.fullName,
        this.email,
        this.password,
        this.gender,
        this.birthday,
        this.phoneNumber,
        this.address});

  UserSignUp.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    fullName = json['fullName'];
    email = json['email'];
    password = json['password'];
    gender = json['gender'];
    birthday = json['birthday'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];

  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['userName'] = this.userName;
  //   data['fullName'] = this.fullName;
  //   data['email'] = this.email;
  //   data['password'] = this.password;
  //   data['gender'] = this.gender;
  //   data['birthday'] = this.birthday;
  //   data['phoneNumber'] = this.phoneNumber;
  //   data['address'] = this.address;
  //   return data;
  // }
}




//sign up get user data from ID

// class UserGet {
//   String? sId;
//   String? userName;
//   String? email;
//   String? password;
//   String? gender;
//   String? birthday;
//   List<String>? phoneNumber;
//   List<String>? address;
//   String? image;
//   List<Null>? products;
//   String? createdAt;
//   String? updatedAt;
//   int? iV;

  // UserGet(
  //     {this.sId,
  //       this.userName,
  //       this.email,
  //       this.password,
  //       this.gender,
  //       this.birthday,
  //       this.phoneNumber,
  //       this.address,
  //       this.image,
  //       this.products,
  //       this.createdAt,
  //       this.updatedAt,
  //       this.iV});
  //
  // UserGet.fromJson(Map<String, dynamic> json) {
  //   sId = json['_id'];
  //   userName = json['userName'];
  //   email = json['email'];
  //   password = json['password'];
  //   gender = json['gender'];
  //   birthday = json['birthday'];
  //   phoneNumber = json['phoneNumber'].cast<String>();
  //   address = json['address'].cast<String>();
  //   image = json['image'];
  //   if (json['products'] != null) {
  //     products = <Null>[];
  //     json['products'].forEach((v) {
  //      products!.add(jsonDecode(v));
  //     });
  //   }
  //   createdAt = json['createdAt'];
  //   updatedAt = json['updatedAt'];
  //   iV = json['__v'];
  // }

//}