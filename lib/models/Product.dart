import 'package:app/models/Category.dart';

class Product {
  final int id;
  final String title;
  final String date;
  final String image;
  final int mprice;
  final int sprice;
  final String description;
  final Category category;
  bool favorit;

  Product({
    this.id,
    this.title,
    this.date,
    this.image,
    this.mprice,
    this.sprice,
    this.description,
    this.category,
    this.favorit,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json["id"],
        title: json["title"],
        date: json["data"],
        image: json["image"],
        mprice: json["marcket_price"],
        sprice: json["selling_price"],
        description: json["description"],
        category: Category(
            id: json["category"]["id"],
            title: json["category"]["title"],
            date: json["category"]["date"]),
        favorit: json["favorit"]);
  }
}
