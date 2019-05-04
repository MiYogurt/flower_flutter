import 'package:flower_shop/page/category.dart';
import 'package:flower_shop/page/change_pass.dart';
import 'package:flower_shop/page/coupon.dart';
import 'package:flower_shop/page/detail.dart';
import 'package:flower_shop/page/photo.dart';
import 'package:flower_shop/page/search.dart';
import 'package:flower_shop/page/subject_detail.dart';
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

  DemoApp(){
    route.add(Path.Home, Home());
    route.add(Path.User, User());
    route.add(Path.Subject, Subject());
    route.add(Path.Coupon, Coupon());
    route.add(Path.ChangePass, ChangePass());
    route.add(Path.Detail, Detail());
    route.add(Path.Photo, Photo());
    route.add(Path.Category, Category());
    route.add(Path.Search, Search());
    route.add(Path.SubjectDetail, SubjectDetail());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "App", initialRoute: '/' ,onGenerateRoute: router);
  }
}
