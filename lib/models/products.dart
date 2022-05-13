import 'dart:convert';

class Products {
  String? title;
  String? price;
  String? description;
  Size? size;
  String? color;
  String? type;
  String? date;
  String? purpose;
  List<String>? images = [];
  User? user;
  Reviews? reviews;

  Products(
      {this.title,
      this.reviews,
      this.user,
      this.size,
      this.price,
      this.images,
      this.purpose,
      this.color,
      this.description,
      this.type,
      this.date});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'reviews': reviews,
      'user': user,
      'size': size,
      'price': price,
      'images': images,
      'purpose': purpose,
      'color': color,
      'description': description,
      'type': type,
      'date': date,
    };
  }

  factory Products.fromMap(Map<String, dynamic> map) {
    final List<String> imageList = [];
    map["images"].forEach((element) => imageList.add(element));
    return Products(
      title: map['title'],
      price: map['price'],
      description: map['description'],
      size: map['size'],
      color: map['color'],
      type: map['type'],
      date: map['date'],
      purpose: map['purpose'],
      images: imageList,
      user: map['user'],
      reviews: map['reviews'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Products.fromJson(String source) =>
      Products.fromMap(json.decode(source));

// Products.fromJson(Map<String, dynamic> json) {
//   title = json['title'];
//   price = json['price'];
//   description = json['description'];
//   size = json['size'];
//   color = json['color'];
//   type = json['type'];
//   date = json['date'];
//   purpose = json['purpose'];
//   images = json['Images'].forEach((element) {
//     images.add(element);
//   });
//   user = json['user'];
//   reviews = json['reviews'];
// }
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
// Size.fromJson(Map<String, dynamic> json) {
//   name = json['name'];
//   height = json['height'];
//   width = json['width'];
// }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['name'] = this.name;
//   data['height'] = this.height;
//   data['width'] = this.width;
//   return data;
// }
}

class User {
  String? user_id;
  String? userName;
  String? image;
  User({this.userName,this.user_id,this.image});
Map<String, dynamic> toMap() {
  return {
    'user_id': user_id,
    'userName': userName,
    'image': image,
  };
}

factory User.fromMap(Map<String, dynamic> map) {
return User(
  image: map['image'],
user_id: map['user_id'],
userName: map['userName'],
);
}

String toJson() => json.encode(toMap());

factory User.fromJson(String source) => User.fromMap(json.decode(source));
  // User.fromJson(Map<String, dynamic> json) {
  //   user_id = json['_id'];
  //   userName = json['userName'];
  //   image = json['image'];
  // }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['_id'] = this.user_id;
//   data['userName'] = this.userName;
//   data['image'] = this.image;
//   return data;
// }
}

class Reviews {
  String? review_id;
  String? content;
  User? user_review;
  Reviews({this.user_review,this.content,this.review_id});
  Map<String, dynamic> toMap() {
    return {
      'review_id': review_id,
      'content': content,
      'user_review': user_review,
    };
  }

  factory Reviews.fromMap(Map<String, dynamic> map) {
    return Reviews(
      review_id: map['review_id'],
      user_review: map['user_review'],
      content: map['content'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Reviews.fromJson(String source) => Reviews.fromMap(json.decode(source));

  // Reviews.fromJson(Map<String, dynamic> json) {
  //   review_id = json['_id'];
  //   content = json['content'];
  //   review_id = json['_id'];
  //   user_review = (json['user'] != null
  //       ? User.fromJson(json['user'])
  //       : 'No Reviews Yet..' as User?);
  // }
}
