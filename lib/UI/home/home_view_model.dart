// 1. 상태 클래스 만들기
import 'package:flitter_book_search_app/data/model/book.dart';
import 'package:flitter_book_search_app/data/model/repository/book_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  List<Book> books;
  HomeState(this.books);
}

// 2. 뷰모델 만들기 - Notifier 상속
class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    return HomeState([]);
  }

  Future<void> searchBooks(String query) async {
    //
    final bookrepository = BookRepository();
    final books = await bookrepository.searchBooks(query);
    state = HomeState(books);
  }
}

// 3. 뷰모델 관리자 만들기 - NotifierProvider 객체
final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
