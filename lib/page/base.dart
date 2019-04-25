import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../layout/layout.dart' as layout;
import '../router.dart';
import '../path.dart' as Path;

typedef Widget BuildFn(BuildContext ctx, Map params, NoRoute router);

class BodyPage extends Page {
  BodyPage();
  BuildFn _build;
  bool noAnimate = true;
  bottomNavigationBar(ctx, path, NoRoute router){
    var _selectedIndex = -1;
    print(path);
    switch(path){
      case Path.Home:
        _selectedIndex = 0;
        break;
      case Path.Subject:
        _selectedIndex = 1;
        break;
      case Path.User:
        _selectedIndex = 2;
        break;
    }

    if(_selectedIndex == -1) return null;
    const IconData home = IconData(0xe60d, fontFamily: 'Nav');
    const IconData gift = IconData(0xe616, fontFamily: 'Nav');
    const IconData contact = IconData(0xe64a, fontFamily: 'Nav');

    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(home), title: Text('首页')),
        BottomNavigationBarItem(icon: Icon(gift), title: Text('专题')),
        BottomNavigationBarItem(icon: Icon(contact), title: Text('用户')),
      ],
      currentIndex: _selectedIndex,
      fixedColor: Colors.deepOrange,
      onTap: (index){
        if(_selectedIndex == index)  return;
        switch (index){
          case 0:
            router.to(ctx, Path.Home, {});
            break;
          case 1:
            router.to(ctx, Path.Subject, {});
            break;
          case 2:
            router.to(ctx, Path.User, {});
            break;
        }
      }
    );
  }
  build(Map params, router) {
    if(noAnimate)
    {
      return PageRouteBuilder(
        pageBuilder: (ctx, _, __){
          return Scaffold(
              body: _build(ctx, params, router),
              bottomNavigationBar: bottomNavigationBar(ctx, params["path"] ?? "/", router),
              drawer: layout.drawer(ctx)
          );
        }
      );
   }
   return MaterialPageRoute(builder: (ctx){
      return Scaffold(
        body: _build(ctx, params, router),
        bottomNavigationBar: bottomNavigationBar(ctx, params["path"] ?? "/", router),
        drawer: layout.drawer(ctx)
      );
    },
    );
  }

  BodyPage.formBuild(BuildFn build) {
    _build = build;
  }
}