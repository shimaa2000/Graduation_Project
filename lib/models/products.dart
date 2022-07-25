import 'dart:convert';

class Products {
  List<dynamic>? homeProduct;

  Products({this.homeProduct});

  factory Products.fromMap(Map<String, dynamic> map) {
    final List<dynamic> productList = [];
    map['products'].forEach((element) => productList.add(element));
    return Products(homeProduct: productList);
  }

  Map<String, dynamic> toMap() {
    return {'products': Product};
  }

  String toJson() => json.encode(toMap());

  factory Products.fromList(List<dynamic> values) {
    return Products(homeProduct: values);
  }

  factory Products.fromJson(String source) {
    List<dynamic> values;
    values = json.decode(source);
    return Products.fromList(values);
  }
}

class Product {
  String? id;
  String? title;
  String? gender;
  int? price;
  String? description;
  Size? size;
  User? user;
  List<dynamic>? images = [];
  bool? fav;

  Product(
      {this.title = '',
      this.fav,
      this.size,
      this.price = 0,
      this.images,
      this.id,
        this.gender,
      this.description,
      this.user});

  Map<String, dynamic> toMap() {
    return {
      'gender':gender,
      'title': title,
      'fav': fav,
      'size': size,
      'price': price,
      'id': id,
      'images': images,
      // 'purpose': purpose,
      // 'color': color,
      'description': description,
      // 'type': type,
      // 'publishDate': publishDate,
      'user': user,
      // 'reviews': review
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    final List<dynamic> imageList = [];
    if (map['images'] != null) {
      map['images'].forEach((element) => imageList.add(element));
    }
    return Product(
      gender: map['gender'],
      title: map['title'],
      price: map['price'],
      fav: map['fav'],
      id: map['_id'],
      description: map['description'],
      size: Size.fromMap(map['size']),
      user: User.fromMap(map['user']),
      images: imageList,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
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

  User({this.userName = '', this.id, this.userImage});

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
