class PostModel {
  final int id;
  final String name;
  final String date;
  final String ImgUrl;
  final String title;
  final double price;
  final String size;
  final bool isFav;
  final String type;
  final String gender;
  final String description;
  final String height;
  final String width;

  const PostModel({
    required this.id,
    required this.name,
    required this.date,
    required this.ImgUrl,
    required this.title,
    required this.price,
    required this.size,
    this.isFav = false,
    required this.gender,
    required this.description,
    required this.width,
    required this.height,
    required this.type,
  });
}
