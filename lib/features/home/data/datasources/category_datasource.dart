import 'package:book_app_intern_project/features/home/domain/book_model.dart';
import 'package:book_app_intern_project/features/home/domain/category_model.dart';

class CategoryDataSource {
  List<CategoryModel> fetchCategories() {
    return [
      CategoryModel(
        title: "Best Seller",
        books: [
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
        ],
      ),
      CategoryModel(
        title: "Classics",
        books: [
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
        ],
      ),
      CategoryModel(
        title: "Children",
        books: [
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
        ],
      ),
    ];
  }
}
