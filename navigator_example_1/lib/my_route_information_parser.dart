import 'package:flutter/material.dart';
import 'package:navigator_example_1/my_app_path.dart';

class MyAppRouteInformationParser extends RouteInformationParser<MyAppPath> {
  @override
  Future<MyAppPath> parseRouteInformation(RouteInformation routeInformation) async {
    return MyAppPath.parse(routeInformation.location);
    // final uri = Uri.parse(routeInformation.location);
    //
    // if (uri.pathSegments.isEmpty) {
    //   return MyAppPath.home();
    // }
    //
    // if (uri.pathSegments.length == 2 && uri.pathSegments.first == 'detail') {
    //   return MyAppPath.detail(uri.pathSegments.last);
    // }
    //
    // return MyAppPath.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(MyAppPath path) {
    if (path.isUnknown) {
      return RouteInformation(location: '/404');
    }

    if (path.isHomePage) {
      return RouteInformation(location: '/');
    }

    if (path.isDetailPage) {
      return RouteInformation(location: '/detail/${path.id}');
    }

    return null;
  }
}
