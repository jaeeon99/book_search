import 'dart:convert';

import 'package:flitter_book_search_app/data/model/book.dart';
import 'package:http/http.dart';

class BookRepository {
  //
  Future<List<Book>> searchBooks(String query) async {
    final clint = Client();
    final response = await clint.get(
      Uri.parse('https://openapi.naver.com/v1/search/book.json?query=$query'),
      headers: {
        'X-Naver-Client-Id': '47W3Rbt6jOoaZ1Aa6pNC',
        'X-Naver-Client-Secret': 'S1QIg00VoS',
      },
    );
    // Get 요청 시 성공 => 200
    // 응답 코드가 200일 때!
    //    body 데이터를 JsonDecode 함수를 사용해서 map으로 바꾼 후 List<Book> 로 반환
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      final items = List.from(map['items']);
      // MappedIterable 이라는 클래스에 함수를 넘겨 줄테니
      // 나중에 요청하면, 그때 List(items) 들을 하나씩 반복문을 돌면서
      // 내가 넘겨준 함수를 실행시켜서 새로운 리스트로 돌려줘!
      final iterable = items.map((e) {
        return Book.fromJson(e);
      });

      final list = iterable.toList();
      return list;
    }
    // 아닐때 빈 리스트 반환
    return [];
  }
}
