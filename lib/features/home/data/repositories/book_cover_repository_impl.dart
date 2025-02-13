import 'package:book_app_intern_project/features/home/data/datasources/book_cover_data_source.dart';
import 'package:book_app_intern_project/features/home/domain/repositories/book_cover_repository.dart';

class BookCoverRepositoryImpl implements BookCoverRepository {
  final BookCoverDataSource bookCoverDataSource;
  BookCoverRepositoryImpl(this.bookCoverDataSource);
  @override
  Future<String> getBookCover(String fileName) async {
    return await bookCoverDataSource.getBookCover(fileName);
  }
}
