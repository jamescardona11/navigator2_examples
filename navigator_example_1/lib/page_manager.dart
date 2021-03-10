import 'package:flutter/material.dart';
import 'package:navigator_example_1/main.dart';

class PageManager extends ChangeNotifier{
  static PageManager of(BuildContext context){
    return Provider.
  }

  final List<Page> _pages = [
    MaterialPage(
      key: UniqueKey(),
      child: ListPage(),
      name: '/'
    )
  ];

}