import 'package:flitter_book_search_app/data/model/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class DetailPage extends StatelessWidget {
  DetailPage(this.book);
  Book book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(book.link),
        ),
      ),
    );
  }
}
