import 'dart:convert';

class EditPosts {
  List<dynamic>? editPost;

  EditPosts({this.editPost});

  factory EditPosts.fromMap(Map<String, dynamic> map) {
    final List<dynamic> productList = [];
    map['products'].forEach((element) => productList.add(element));
    return EditPosts(editPost: productList);
  }

  Map<String, dynamic> toMap() {
    return {'products': EditPost};
  }

  String toJson() => json.encode(toMap());

  factory EditPosts.fromList(List<dynamic> values) {
    return EditPosts(editPost: values);
  }

  factory EditPosts.fromJson(String source) {
    List<dynamic> values;
    values = json.decode(source);
    return EditPosts.fromList(values);
  }
}

class EditPost {
  String? id;
  String? title;
  int? price;
  String? description;

  EditPost({
    this.title = '',
    this.price = 0,
    this.id,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'price': price,
      'id': id,
      'description': description,
    };
  }

  factory EditPost.fromMap(Map<String, dynamic> map) {
    return EditPost(
      title: map['title'],
      price: map['price'],
      id: map['_id'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EditPost.fromJson(String source) =>
      EditPost.fromMap(json.decode(source));
}
