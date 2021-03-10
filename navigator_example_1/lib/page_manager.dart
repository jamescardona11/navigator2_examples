import 'package:flutter/material.dart';
import 'package:navigator_example_1/main.dart';
import 'package:navigator_example_1/my_app_path.dart';
import 'package:provider/provider.dart';

class PageManager extends ChangeNotifier {
  static PageManager of(BuildContext context) {
    return Provider.of<PageManager>(context, listen: false);
  }

  List<Page> get pages => List.unmodifiable(_pages);
  MyAppPath get currentPath => MyAppPath.parse(_pages.last.name);

  final List<Page> _pages = [
    MaterialPage(key: UniqueKey(), child: ListPage(), name: '/'),
  ];

  void openDetails(int index) {
    _pages.add(
      MaterialPage(
        key: UniqueKey(),
        name: '/detail/$index',
        child: DetailPage(
          index: index,
        ),
      ),
    );
    notifyListeners();
  }

  bool didPop(Page page) {
    _pages.remove(page);
    notifyListeners();
    return true;
  }

  Future<void> setNewRoutePath(MyAppPath path) async {
    if (path.isUnknown) {
    } else if (path.isDetailPage) {
      openDetails(path.id);
    } else if (path.isHomePage) {
      _pages.removeWhere((element) => element.name != '/');
      notifyListeners();
    }
  }
}
