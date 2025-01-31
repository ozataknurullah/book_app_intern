import 'package:book_app_intern_project/features/home/domain/models/book_model.dart';
import 'package:book_app_intern_project/features/home/domain/models/category_model.dart';

class CategoryDataSource {
  List<CategoryModel> fetchCategories() {
    return [
      CategoryModel(
        title: "Best Seller",
        books: [
          BookModel(
              id: "1",
              title: "Dune",
              author: "Frank Herbert",
              price: 87.75,
              summary:
                  "Dune is set in the distant future amidst a feudal interstellar society in which various noble houses control planetary fiefs. It tells the story of young Paul Atreides, whose family accepts the stewardship of the planet Arrakis. While the planet is an inhospitable and sparsely populated desert wasteland, it is the only source of melange, or spice, a drug that..."),
          BookModel(
              id: "2",
              title: "1984",
              author: "George Orwell",
              price: 35.75,
              summary:
                  "Dune is set in the distant future amidst a feudal interstellar society in which various noble houses control planetary fiefs. It tells the story of young Paul Atreides, whose family accepts the stewardship of the planet Arrakis. While the planet is an inhospitable and sparsely populated desert wasteland, it is the only source of melange, or spice, a drug that..."),
          BookModel(
              id: "3",
              title: "Dune",
              author: "Frank Herbert",
              price: 87.75,
              summary:
                  "Dune is set in the distant future amidst a feudal interstellar society in which various noble houses control planetary fiefs. It tells the story of young Paul Atreides, whose family accepts the stewardship of the planet Arrakis. While the planet is an inhospitable and sparsely populated desert wasteland, it is the only source of melange, or spice, a drug that..."),
          BookModel(
              id: "4",
              title: "1984",
              author: "George Orwell",
              price: 35.75,
              summary:
                  "Dune is set in the distant future amidst a feudal interstellar society in which various noble houses control planetary fiefs. It tells the story of young Paul Atreides, whose family accepts the stewardship of the planet Arrakis. While the planet is an inhospitable and sparsely populated desert wasteland, it is the only source of melange, or spice, a drug that..."),
          BookModel(
              id: "5",
              title: "Dune",
              author: "Frank Herbert",
              price: 87.75,
              summary:
                  "Dune is set in the distant future amidst a feudal interstellar society in which various noble houses control planetary fiefs. It tells the story of young Paul Atreides, whose family accepts the stewardship of the planet Arrakis. While the planet is an inhospitable and sparsely populated desert wasteland, it is the only source of melange, or spice, a drug that..."),
          BookModel(
              id: "6",
              title: "1984",
              author: "George Orwell",
              price: 35.75,
              summary:
                  "Dune is set in the distant future amidst a feudal interstellar society in which various noble houses control planetary fiefs. It tells the story of young Paul Atreides, whose family accepts the stewardship of the planet Arrakis. While the planet is an inhospitable and sparsely populated desert wasteland, it is the only source of melange, or spice, a drug that..."),
        ],
      ),
      CategoryModel(
        title: "Classics",
        books: [
          BookModel(
              id: "7",
              title: "Romeo ve Juliet",
              author: "William Shakespeare",
              price: 16.75,
              summary:
                  "Dune is set in the distant future amidst a feudal interstellar society in which various noble houses control planetary fiefs. It tells the story of young Paul Atreides, whose family accepts the stewardship of the planet Arrakis. While the planet is an inhospitable and sparsely populated desert wasteland, it is the only source of melange, or spice, a drug that..."),
          BookModel(
              id: "8",
              title: "Olağanüstü Bir Gece",
              author: "Stefan Zweig",
              price: 10.00,
              summary:
                  "Dune is set in the distant future amidst a feudal interstellar society in which various noble houses control planetary fiefs. It tells the story of young Paul Atreides, whose family accepts the stewardship of the planet Arrakis. While the planet is an inhospitable and sparsely populated desert wasteland, it is the only source of melange, or spice, a drug that..."),
          BookModel(
              id: "9",
              title: "Romeo ve Juliet",
              author: "William Shakespeare",
              price: 16.75,
              summary:
                  "Dune is set in the distant future amidst a feudal interstellar society in which various noble houses control planetary fiefs. It tells the story of young Paul Atreides, whose family accepts the stewardship of the planet Arrakis. While the planet is an inhospitable and sparsely populated desert wasteland, it is the only source of melange, or spice, a drug that..."),
          BookModel(
              id: "10",
              title: "Olağanüstü Bir Gece",
              author: "Stefan Zweig",
              price: 10.00,
              summary:
                  "Dune is set in the distant future amidst a feudal interstellar society in which various noble houses control planetary fiefs. It tells the story of young Paul Atreides, whose family accepts the stewardship of the planet Arrakis. While the planet is an inhospitable and sparsely populated desert wasteland, it is the only source of melange, or spice, a drug that..."),
          BookModel(
              id: "11",
              title: "Romeo ve Juliet",
              author: "William Shakespeare",
              price: 16.75,
              summary:
                  "Dune is set in the distant future amidst a feudal interstellar society in which various noble houses control planetary fiefs. It tells the story of young Paul Atreides, whose family accepts the stewardship of the planet Arrakis. While the planet is an inhospitable and sparsely populated desert wasteland, it is the only source of melange, or spice, a drug that..."),
          BookModel(
              id: "12",
              title: "Olağanüstü Bir Gece",
              author: "Stefan Zweig",
              price: 10.00,
              summary:
                  "Dune is set in the distant future amidst a feudal interstellar society in which various noble houses control planetary fiefs. It tells the story of young Paul Atreides, whose family accepts the stewardship of the planet Arrakis. While the planet is an inhospitable and sparsely populated desert wasteland, it is the only source of melange, or spice, a drug that..."),
        ],
      ),
      CategoryModel(
        title: "Children",
        books: [
          BookModel(
              id: "13",
              title: "Mor Bir Fil Gördüm Sanki",
              author: "Varol Yaşaroğlu",
              price: 25.00,
              summary:
                  "Dune is set in the distant future amidst a feudal interstellar society in which various noble houses control planetary fiefs. It tells the story of young Paul Atreides, whose family accepts the stewardship of the planet Arrakis. While the planet is an inhospitable and sparsely populated desert wasteland, it is the only source of melange, or spice, a drug that..."),
          BookModel(
              id: "14",
              title: "Alev Saçan Çocuk",
              author: "Christine Nöstlinger",
              price: 30.50,
              summary:
                  "Dune is set in the distant future amidst a feudal interstellar society in which various noble houses control planetary fiefs. It tells the story of young Paul Atreides, whose family accepts the stewardship of the planet Arrakis. While the planet is an inhospitable and sparsely populated desert wasteland, it is the only source of melange, or spice, a drug that..."),
          BookModel(
              id: "15",
              title: "Mor Bir Fil Gördüm Sanki",
              author: "Varol Yaşaroğlu",
              price: 25.00,
              summary:
                  "Dune is set in the distant future amidst a feudal interstellar society in which various noble houses control planetary fiefs. It tells the story of young Paul Atreides, whose family accepts the stewardship of the planet Arrakis. While the planet is an inhospitable and sparsely populated desert wasteland, it is the only source of melange, or spice, a drug that..."),
          BookModel(
              id: "16",
              title: "Alev Saçan Çocuk",
              author: "Christine Nöstlinger",
              price: 30.50,
              summary:
                  "Dune is set in the distant future amidst a feudal interstellar society in which various noble houses control planetary fiefs. It tells the story of young Paul Atreides, whose family accepts the stewardship of the planet Arrakis. While the planet is an inhospitable and sparsely populated desert wasteland, it is the only source of melange, or spice, a drug that..."),
          BookModel(
              id: "17",
              title: "Mor Bir Fil Gördüm Sanki",
              author: "Varol Yaşaroğlu",
              price: 25.00,
              summary:
                  "Dune is set in the distant future amidst a feudal interstellar society in which various noble houses control planetary fiefs. It tells the story of young Paul Atreides, whose family accepts the stewardship of the planet Arrakis. While the planet is an inhospitable and sparsely populated desert wasteland, it is the only source of melange, or spice, a drug that..."),
          BookModel(
              id: "18",
              title: "Alev Saçan Çocuk",
              author: "Christine Nöstlinger",
              price: 30.50,
              summary:
                  "Dune is set in the distant future amidst a feudal interstellar society in which various noble houses control planetary fiefs. It tells the story of young Paul Atreides, whose family accepts the stewardship of the planet Arrakis. While the planet is an inhospitable and sparsely populated desert wasteland, it is the only source of melange, or spice, a drug that..."),
        ],
      ),
    ];
  }
}
