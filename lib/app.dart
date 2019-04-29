import 'package:flower_shop/page/coupon.dart';
import 'package:flutter/material.dart';
import 'router.dart';
import 'page/home.dart';
import 'page/user.dart';
import 'page/subject.dart';
import 'path.dart' as Path;

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
    route.add(Path.Home, Home());
    route.add(Path.User, User());
    route.add(Path.Subject, Subject());
    route.add(Path.Coupon, Coupon());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "App", initialRoute: '/' ,onGenerateRoute: router);
  }
}
