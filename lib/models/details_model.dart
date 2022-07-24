import 'dart:convert';

import 'package:graduation_project/models/products.dart';

class ProductDetails {
  String? id;
  String? title;
  int? price;
  String? description;
  Size? size;
  String? color;
  String? type;
  String? publishDate;
  String? purpose;
  User? user;

  List<dynamic>? review;
  List<dynamic>? images = [];

  ProductDetails(
      {this.title = '',
      this.size,
      this.price = 0,
      this.images,
      this.id,
      this.purpose,
      this.color,
      this.description,
      this.type,
      this.publishDate,
      this.review,
      this.user});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'size': size,
      'price': price,
      'id': id,
      'images': images,
      'purpose': purpose,
      'color': color,
      'description': description,
      'type': type,
      'publishDate': publishDate,
      'user': user,
      'reviews': review
    };
  }

  factory ProductDetails.fromMap(Map<String, dynamic> map) {
    final List<dynamic> imageList = [];
    if (map['images'] != null) {
      map['images'].forEach((element) => imageList.add(element));
    }
    final List<dynamic> reviewList = [];
    if (map['reviews'] != null) {
      map['reviews'].forEach((element) => reviewList.add(element));
    }
    return ProductDetails(
      title: map['title'],
      price: map['price'],
      id: map['id'],
      description: map['description'],
      size: Size.fromMap(map['size']),
      color: map['color'],
      type: map['type'],
      publishDate: map['publishDate'],
      purpose: map['purpose'],
      user: User.fromMap(map['user']),
      review: reviewList,
      images: imageList,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDetails.fromJson(String source) =>
      ProductDetails.fromMap(json.decode(source));
}

//
class Reviews {
  List<dynamic>? listReview;

  Reviews({this.listReview});

  factory Reviews.fromMap(Map<String, dynamic> map) {
    final List<dynamic> productList = [];
    if (map['reviews'] != null)
      map['reviews'].forEach((element) => productList.add(element));
    return Reviews(listReview: productList);
  }

  Map<String, dynamic> toMap() {
    return {'reviews': Review};
  }

  String toJson() => json.encode(toMap());

  factory Reviews.fromList(List<dynamic> values) {
    return Reviews(listReview: values);
  }

  factory Reviews.fromJson(String source) {
    List<dynamic> values;
    values = json.decode(source);
    return Reviews.fromList(values);
  }
}

//
class Review {
  String? id;
  String? content;
  User? userData;

  Review({this.id, this.content, this.userData});

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'content': content,
      'user': userData,
    };
  }

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      id: map['_id'],
      userData: User.fromMap(map['user']),
      content: map['content'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Review.fromJson(String source) => Review.fromMap(json.decode(source));
}
