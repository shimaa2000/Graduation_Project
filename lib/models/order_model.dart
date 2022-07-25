import 'dart:convert';
import 'package:graduation_project/models/products.dart';

class Orders {
  List<dynamic>? ordered;

  Orders({this.ordered});

  factory Orders.fromMap(Map<String, dynamic> map) {
    final List<dynamic> orderedList = [];
    map['orders'].forEach((element) => orderedList.add(element));
    return Orders(ordered: orderedList);
  }

  Map<String, dynamic> toMap() {
    return {'orders': Product};
  }

  String toJson() => json.encode(toMap());

  factory Orders.fromList(List<dynamic> values) {
    return Orders(ordered: values);
  }

  factory Orders.fromJson(String source) {
    List<dynamic> values;
    values = json.decode(source);
    return Orders.fromList(values);
  }
}


class OrderedModel{
  int? totalPrice;
  Product? product;

  OrderedModel({this.totalPrice,this.product});

  Map<String, dynamic> toMap() {
    return {
      'totalPrice':totalPrice,
      'product':product,
    };
  }

  factory OrderedModel.fromMap(Map<String, dynamic> map) {
    return OrderedModel(
      totalPrice: map['totalPrice'],
      product: Product.fromMap(map['product']),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderedModel.fromJson(String source) => OrderedModel.fromMap(json.decode(source));
}