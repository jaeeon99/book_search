import 'package:flitter_book_search_app/UI/detail/detail_page.dart';
import 'package:flitter_book_search_app/UI/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      // home: DetailPage(),
    );
  }
}
