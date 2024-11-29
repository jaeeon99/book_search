import 'package:flitter_book_search_app/data/model/repository/book_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'BookRepository',
    () async {
      //
      BookRepository bookRepository = BookRepository();
      final books = await bookRepository.searchBooks('harry');
      expect(books.isEmpty, false);
      for (var book in books) {
        print(book.toJson());
      }
    },
  );
}
