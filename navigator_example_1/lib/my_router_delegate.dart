import 'package:flutter/material.dart';
import 'package:navigator_example_1/my_app_path.dart';

import 'main.dart';

class MyAppRouterDelegate extends RouterDelegate<MyAppPath> with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [],
      onPopPage: (route, result) => route.didPop(result),
    );
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(MyAppPath path) async {
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }
}
