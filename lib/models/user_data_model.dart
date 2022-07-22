import 'dart:convert';
import 'package:graduation_project/models/products.dart';

class UserData {
  String? id;
  String? userName;
  String? fullName;
  String? email;
  String? password;
  String? birthday;
  String? gender;
  List<dynamic>? phoneNumber;
  List<dynamic>? address;
  String? image;
  List<UserProducts>? userProducts;

  UserData(
      {this.userName,
      this.gender,
      this.userProducts,
      this.address,
      this.image,
      this.phoneNumber,
      this.id,
      this.fullName,
      this.password,
      this.birthday,
      this.email});

  factory UserData.fromMap(Map<String, dynamic> map) {
    final List<dynamic> addressList = [];
    map['address']?.forEach((element) => addressList.add(element));
    final List<dynamic> phoneList = [];
    map['phoneNumber']?.forEach((element) => phoneList.add(element));
    final List<UserProducts> productsList = [];
    map['products']
        ?.forEach((element) => productsList.add(UserProducts.fromMap(element)));

    return UserData(
      id: map["id"],
      userName: map["userName"],
      fullName: map["fullName"],
      password: map["password"],
      birthday: map["birthday"],
      email: map["email"],
      gender: map["gender"],
      image: map["image"],
      address: addressList,
      phoneNumber: phoneList,
      userProducts: productsList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'fullName': fullName,
      'password': password,
      'birthday': birthday,
      'email': email,
      'gender': gender,
      'image': image,
      'address': address,
      'phoneNumber': phoneNumber,
      'products': userProducts,
    };
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source));
}

class UserProducts {
  String? id;
  String? title;
  int? price;
  String? description;
  Size? size;
  String? color;
  String? type;
  String? publishDate;
  String? purpose;
  List<dynamic>? images = [];

  UserProducts({
    this.id,
    this.title,
    this.size,
    this.price,
    this.images,
    this.purpose,
    this.color,
    this.description,
    this.type,
    this.publishDate,
  });

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'title': title,
      'size': size,
      'price': price,
      'images': images,
      'purpose': purpose,
      'color': color,
      'description': description,
      'type': type,
      'publishDate': publishDate,
    };
  }

  factory UserProducts.fromMap(Map<String, dynamic> map) {
    final List<dynamic> imageList = [];
    if (map['images'] != null) {
      map['images'].forEach((element) => imageList.add(element));
    }
    return UserProducts(
      id: map['_id'],
      title: map['title'],
      price: map['price'],
      description: map['description'],
      size: map[Size.fromMap(map['size'])],
      color: map['color'],
      type: map['type'],
      publishDate: map['publishDate'],
      purpose: map['purpose'],
      images: imageList,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProducts.fromJson(String source) =>
      UserProducts.fromMap(json.decode(source));
}
