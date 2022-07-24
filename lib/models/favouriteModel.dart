import 'dart:convert';

class Favourite {
  List<dynamic>? favourite;

  Favourite({this.favourite});

  factory Favourite.fromMap(Map<String, dynamic> map) {
    final List<FavouriteItems> favouriteList = [];
    if (map['favourites'] != null)
      map['favourites'].forEach((element) => favouriteList.add(element));
    return Favourite(favourite: favouriteList);
  }

  Map<String, dynamic> toMap() {
    return {'favourites': favourite};
  }

  String toJson() => json.encode(toMap());

  factory Favourite.fromList(List<dynamic> values) {
    return Favourite(favourite: values);
  }

  factory Favourite.fromJson(String source) {
    List<dynamic> values;
    values = json.decode(source);
    return Favourite.fromList(values);
  }
}

class FavouriteItems {
  String title;
  String price;
  Size? size;
  List<String>? images;
  User? user;

  FavouriteItems(
      {this.title = '', this.price = '0', this.user, this.size, this.images});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'size': size,
      'price': price,
      'images': images,
      'user': user,
    };
  }

  factory FavouriteItems.fromMap(Map<String, dynamic> map) {
    final List<String> imageList = [];
    if (map['images'] != null) {
      map['images'].forEach((element) => imageList.add(element));
    }
    return FavouriteItems(
      title: map['title'],
      price: map['price'],
      size: Size.fromMap(map['size']),
      user: User.fromMap(map['user']),
      images: imageList,
    );
  }

  String toJson() => json.encode(toMap());

  factory FavouriteItems.fromJson(String source) =>
      FavouriteItems.fromMap(json.decode(source));
}

class Size {
  String height;
  String width;
  String name;

  Size({this.height = '160', this.width = '60', this.name = 'small'});

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

class Images {
  String imgUrl;

  Images({this.imgUrl = ''});
}

class User {
  String userName;
  String profileImg;

  User({this.userName = 'Ahmed', this.profileImg = ''});

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'image': profileImg,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userName: map['userName'],
      profileImg: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
