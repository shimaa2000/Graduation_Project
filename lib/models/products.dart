import 'dart:convert';

class Products{
  List<HomeProducts>? homeProducts;
  Products({this.homeProducts});
  factory Products.fromMap(Map<String, dynamic> map){
    final List<HomeProducts> productList=[];
    map['products'].forEach((element)=> productList.add(element));
    return Products(
        homeProducts :productList
    );
  }
  Map<String  , dynamic> toMap(){
    return {
      'products': homeProducts
    };
  }
  String toJson()=>json.encode(toMap());
  factory Products.fromJson(String source)=> Products.fromMap(json.decode(source));
}

class HomeProducts {
  String? title;
  String? price;
  String? description;
  Size? size;
  String? color;
  String? type;
  String? publishDate;
  String? purpose;
  List<dynamic>? images = [];
  HomeProducts(
      {this.title,
        this.size,
        this.price,
        this.images,
        this.purpose,
        this.color,
        this.description,
        this.type,
        this.publishDate});
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
    };
  }
  factory HomeProducts.fromMap(Map<String, dynamic> map) {
    final List<dynamic> imageList = [];
    map["images"].forEach((element) => imageList.add(element));
    return HomeProducts(
      title: map['title'],
      price: map['price'],
      description: map['description'],
      size: map['size'],
      color: map['color'],
      type: map['type'],
      publishDate: map['publishDate'],
      purpose: map['purpose'],
      images: imageList,
    );
  }
  String toJson() => json.encode(toMap());

  factory HomeProducts.fromJson(String source) =>
      HomeProducts.fromMap(json.decode(source));


}
class Size{
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