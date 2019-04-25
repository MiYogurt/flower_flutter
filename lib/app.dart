import 'package:flutter/material.dart';
import 'router.dart';
import 'page/home.dart';
import 'page/user.dart';
import 'page/other.dart';

class DemoApp extends StatelessWidget {
  static RouteFactory router = (RouteSettings settings) {
    PageRoute widget;
    route.pages.forEach((path, page) {
      if (path == settings.name) {
        var args = settings.arguments;
        if(args == null){
          args = ({
            "name": settings.name
          }) as Object;
        } else {
          (args as Map)["path"] = settings.name;
        }
        widget = page.build(args, route);
      }
    });
    return widget;
  };
  static NoRoute route = NoRoute();

  DemoApp(){
    route.add('/', Home());
    route.add('/user', User());
    route.add('/category', Other());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "App", initialRoute: '/' ,onGenerateRoute: router);
  }
}
