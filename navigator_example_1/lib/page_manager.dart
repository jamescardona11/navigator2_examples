import 'package:flutter/material.dart';
import 'package:navigator_example_1/main.dart';
import 'package:provider/provider.dart';

class PageManager extends ChangeNotifier {
  static PageManager of(BuildContext context) {
    return Provider.of<PageManager>(context, listen: false);
  }

  List<Page> get pages => List.unmodifiable(_pages);

  final List<Page> _pages = [
    MaterialPage(key: UniqueKey(), child: ListPage(), name: '/'),
  ];

  void openDetails(int index) {
    _pages.add(
      MaterialPage(
        key: UniqueKey(),
        name: '/category/$index',
        child: DetailPage(
          index: index,
        ),
      ),
    );

    notifyListeners();
  }
}
