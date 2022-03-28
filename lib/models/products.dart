import 'package:flutter/material.dart';
class Products{
  Size? size;
  String? sId;
  String? title;
  int? price;
  String? description;
  String? color;
  String? publishDate;
  String? purpose;
  List<String>? images;
  List<String>? reviews;
  User? user;
  int? iV;

  Products(
      {this.size,
        this.sId,
        this.title,
        this.price,
        this.description,
        this.color,
        this.publishDate,
        this.purpose,
        this.images,
        this.reviews,
        this.user,
        this.iV});

  Products.fromJson(Map<String, dynamic> json) {
    size = json['size'] != null ? new Size.fromJson(json['size']) : null;
    sId = json['_id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    color = json['color'];
    publishDate = json['publishDate'];
    purpose = json['purpose'];
    images = json['Images'].cast<String>();
    reviews = json['reviews'].cast<String>();
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.size != null) {
      data['size'] = this.size!.toJson();
    }
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['color'] = this.color;
    data['publishDate'] = this.publishDate;
    data['purpose'] = this.purpose;
    data['Images'] = this.images;
    data['reviews'] = this.reviews;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Size {
  String? name;
  int? hieght;
  int? width;

  Size({this.name, this.hieght, this.width});

  Size.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    hieght = json['hieght'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['hieght'] = this.hieght;
    data['width'] = this.width;
    return data;
  }
}

class User {
  String? sId;
  String? userName;
  String? image;

  User({this.sId, this.userName, this.image});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['userName'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userName'] = this.userName;
    data['image'] = this.image;
    return data;
  }
}
