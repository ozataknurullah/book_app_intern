class BookModel {
  final int id;
  final String name;
  final String author;
  final double price;
  final String cover;
  final String description;

  BookModel({
    required this.id,
    required this.name,
    required this.author,
    required this.price,
    required this.cover,
    required this.description,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'] as int,
      name: json['name'] as String,
      author: json['author'] as String,
      price: json['price'].toDouble(),
      cover: json['cover'] as String,
      description: json['description'] as String,
    );
  }

  // Map<String, dynamic> toJson{
  //   return{
  //     "id": id,
  //     "title": title,
  //     "author": author,
  //     "price": price,
  //     "cover": cover,
  //     "description": description,

  //   };
  // }
}
