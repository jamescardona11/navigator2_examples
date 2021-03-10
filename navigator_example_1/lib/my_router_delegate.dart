import 'package:flutter/material.dart';
import 'package:navigator_example_1/my_app_path.dart';
import 'package:navigator_example_1/page_manager.dart';
import 'package:provider/provider.dart';

class MyAppRouterDelegate extends RouterDelegate<MyAppPath> with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final pageManager = PageManager();

  MyAppRouterDelegate() {
    pageManager.addListener(notifyListeners);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: pageManager,
      child: Consumer<PageManager>(
        builder: (context, value, child) => Navigator(
          pages: List.of(value.pages),
          onPopPage: (route, result) => _onPopPage(route, result),
        ),
      ),
    );
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  MyAppPath get currentConfiguration => pageManager.currentPath;

  @override
  Future<void> setNewRoutePath(MyAppPath path) async {
    return pageManager.setNewRoutePath(path);
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }

    return pageManager.didPop(route.settings);
  }
}
