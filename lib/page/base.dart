import 'package:flutter/material.dart';
import '../layout/layout.dart' as layout;
import '../router.dart';
import '../path.dart' as Path;

typedef Widget BuildFn(BuildContext ctx, Map params, NoRoute router);

class BodyPage extends Page {
  BodyPage();
  BuildFn _build;
  bottomNavigationBar(ctx, path, NoRoute router){
    var _selectedIndex = -1;
    print(path);
    switch(path){
      case Path.Home:
        _selectedIndex = 0;
        break;
      case Path.Category:
        _selectedIndex = 1;
        break;
      case Path.User:
        _selectedIndex = 2;
        break;
    }

    if(_selectedIndex == -1) return null;

    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
        BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('专题')),
        BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('用户')),
      ],
      currentIndex: _selectedIndex,
      fixedColor: Colors.deepOrange,
      onTap: (index){
        print(index);
        print(_selectedIndex);
        if(_selectedIndex == index)  return;
        switch (index){
          case 0:
            router.to(ctx, Path.Home, {});
            _selectedIndex = index;
            break;
          case 1:
            router.to(ctx, Path.Category, {});
            _selectedIndex = index;
            break;
          case 2:
            router.to(ctx, Path.User, {});
            _selectedIndex = index;
            break;
        }
      }
    );
  }
  build(Map params, router) {
   return MaterialPageRoute(builder: (ctx){
      return Scaffold(
        body: _build(ctx, params, router),
        bottomNavigationBar: bottomNavigationBar(ctx, params["path"] ?? "/", router),
        drawer: layout.drawer(ctx)
      );
    });
  }

  BodyPage.formBuild(BuildFn build) {
    _build = build;
  }
}