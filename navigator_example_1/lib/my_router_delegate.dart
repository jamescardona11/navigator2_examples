import 'package:flutter/material.dart';
import 'package:navigator_example_1/my_app_path.dart';
import 'package:navigator_example_1/page_manager.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class MyAppRouterDelegate extends RouterDelegate<MyAppPath> with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final pageManager = PageManager();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: pageManager,
      child: Consumer<PageManager>(
        builder: (context, value, child) => Navigator(
          pages: List.of(value.pages),
          onPopPage: (route, result) => route.didPop(result),
        ),
      ),
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
