import 'package:flutter/material.dart';
import 'router.dart';
import 'page/main.dart';
import 'page/user.dart';
import 'page/other.dart';

class DemoApp extends StatelessWidget {
  static RouteFactory router = (RouteSettings settings) {
    PageRoute widget;
    route.pages.forEach((path, page) {
      if (path == settings.name) {
        widget = page.build(settings.arguments, route);
      }
    });
    return widget;
  };
  static NoRoute route = NoRoute();

  DemoApp(){
    route.add('/', Main());
    route.add('/user', User());
    route.add('/other', Other());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "App", initialRoute: '/' ,onGenerateRoute: router);
  }
}
