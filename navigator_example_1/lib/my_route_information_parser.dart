import 'package:flutter/material.dart';
import 'package:navigator_example_1/my_app_path.dart';

class MyAppRouteInformationParser extends RouteInformationParser<MyAppPath> {
  @override
  Future<MyAppPath> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);

    if (uri.pathSegments.isEmpty) {
      return MyAppPath.home();
    }

    return MyAppPath.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(MyAppPath path) {
    if (path.isUnknown) {
      return RouteInformation(location: '/404');
    }

    if (path.isHomePage) {
      return RouteInformation(location: '/');
    }

    return null;
  }
}
