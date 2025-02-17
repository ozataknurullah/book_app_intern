class BookModel {
  final int id;
  final String name;
  final String author;
  final double price;
  final String cover;
  final String description;
  final bool isFavorited;

  BookModel({
    required this.id,
    required this.name,
    required this.author,
    required this.price,
    required this.cover,
    required this.description,
    required this.isFavorited,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'] as int,
      name: json['name'] as String,
      author: json['author'] as String,
      price: json['price'].toDouble(),
      cover: json['cover'] as String,
      description: json['description'] as String,
      isFavorited: (json['likes_aggregate']?['aggregate']?['count'] ?? 0) > 0,
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
