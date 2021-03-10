import 'package:flutter/material.dart';
import 'package:navigator_example_1/page_manager.dart';

import 'my_route_information_parser.dart';
import 'my_router_delegate.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  String currentItem;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Material App',
      routerDelegate: MyAppRouterDelegate(),
      routeInformationParser: MyAppRouteInformationParser(),
    );
  }
}

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: ListView.builder(
        itemCount: 200,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
              onTap: () {
                PageManager.of(context).openDetails(index);
              },
              child: Text('Item $index')),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({Key key, this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Container(
        child: Text('Number item -> $index'),
      ),
    );
  }
}
