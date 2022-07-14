import 'dart:convert';

class Products {
  List<dynamic>? homeProducts;

  Products({this.homeProducts});

  factory Products.fromMap(Map<String, dynamic> map) {
    final List<HomeProducts> productList = [];
    map['products'].forEach((element) => productList.add(element));
    return Products(homeProducts: productList);
  }

  Map<String, dynamic> toMap() {
    return {'products': homeProducts};
  }

  String toJson() => json.encode(toMap());

  factory Products.fromList(List<dynamic> values) {
    return Products(homeProducts: values);
  }
  factory Products.fromJson(String source) {
    List<dynamic> values;
    values = json.decode(source);
    return Products.fromList(values);
  }
}

class HomeProducts {
  String title;
  int price;
  String? description;
  Size? size;
  String? color;
  String? type;
  String? publishDate;
  String? purpose;
  User? user;
//  Review? review;
  List<dynamic>? images = [];

  HomeProducts(
      {this.title='',
      this.size,
      this.price = 0,
      this.images,
      this.purpose,
      this.color,
      this.description,
      this.type,
      this.publishDate,
     // this.review,
      this.user});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'size': size,
      'price': price,
      'images': images,
      'purpose': purpose,
      'color': color,
      'description': description,
      'type': type,
      'publishDate': publishDate,
      'user': user,
     // 'reviews': review
    };
  }

  factory HomeProducts.fromMap(Map<String, dynamic> map) {
    // final List<dynamic> imageList = [];
    // map["images"].forEach((element) => imageList.add(element));
    return HomeProducts(
        title: map['title'],
        price: map['price'],
        description: map['description'],
        size: Size.fromMap(map['size']),
        color: map['color'],
        type: map['type'],
        publishDate: map['publishDate'],
        purpose: map['purpose'],
        user:User.fromMap(map['user']) ,
       // review: Review.fromMap(map['reviews']),
        //images: imageList,
        );
  }

  String toJson() => json.encode(toMap());

  factory HomeProducts.fromJson(String source) =>
      HomeProducts.fromMap(json.decode(source));
}

class Size {
  String? name;
  int? height;
  int? width;

  Size({this.name, this.height, this.width});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'height': height,
      'width': width,
    };
  }

  factory Size.fromMap(Map<String, dynamic> map) {
    return Size(
      name: map['name'],
      height: map['height'],
      width: map['width'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Size.fromJson(String source) => Size.fromMap(json.decode(source));
}

class User {
  String? id;
  String userName;
  String? userImage;
  User({this.userName='', this.id, this.userImage});
  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'userName': userName,
      'image': userImage,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'],
      userName: map['userName'],
      userImage: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}

// class Review {
//   String? id;
//   String? content;
//   User? userData;
//   Review({this.id, this.content, this.userData});
//   Map<String, dynamic> toMap() {
//     return {
//       '_id': id,
//       'content': content,
//       'user': userData,
//     };
//   }
//
//   factory Review.fromMap(Map<String, dynamic> map) {
//     return Review(
//       id: map['_id'],
//       userData: User.fromMap(map['user']),
//       content: map['content'],
//     );
//   }
//
//   String toJson() => json.encode(toMap());
//
//   factory Review.fromJson(String source) => Review.fromMap(json.decode(source));
// }
