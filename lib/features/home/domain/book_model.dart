class BookModel {
  final String title;
  final String author;
  final double price;

  BookModel({
    required this.title,
    required this.author,
    required this.price,
  });

  static List<BookModel> bestSellerBooks = [
    BookModel(
      title: "Dune",
      author: "Frank Herbert",
      price: 87.75,
    ),
    BookModel(
      title: "1984",
      author: "George Orwell",
      price: 35.75,
    ),
  ];

  static List<BookModel> classicBooks = [
    BookModel(
      title: "Romeo ve Juliet",
      author: "William Shakespeare",
      price: 16.75,
    ),
    BookModel(
      title: "Olağanüstü Bir Gece",
      author: "Stefan Zweig",
      price: 10.00,
    ),
  ];

  static List<BookModel> childrenBooks = [
    BookModel(
      title: "Mor Bir Fil Gördüm Sanki",
      author: "Varol Yaşaroğlu",
      price: 25.00,
    ),
    BookModel(
      title: "Alev Saçan Çocuk",
      author: "Christine Nöstlinger",
      price: 30.50,
    ),
  ];
}
