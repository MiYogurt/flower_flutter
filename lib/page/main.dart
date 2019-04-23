import 'package:flutter/material.dart';
import '../layout/layout.dart' as layout;
import '../router.dart';
import '../widgets/home_banners.dart';
import '../widgets/cate_list.dart';
import '../test_db/cate.dart';

class Main extends Page {
  build(Map params, router) {
   return MaterialPageRoute(builder: (ctx){
    // Banner 调转回调
     VoidCallback toShopCart = () => router.to(ctx, "/shop_cart", {});
     VoidCallback toSearch = () => router.to(ctx, "/search", {});
     VoidCallback toUser = () => router.to(ctx, "/person", {});

     return Scaffold(
//        appBar: layout.appBar(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Banners(toShopCart, toSearch, toUser),
              Container(
                child: Text("分类", textScaleFactor: 1.4),
                margin: EdgeInsets.all(10),
              ),
              CategoryList(categorys),
              Text("to other"),
              FlatButton(child: Text("to other!"),onPressed: (){
                router.to(ctx, '/other', {"hello":"world"});
              })
            ],
          )
        ),
        drawer: layout.drawer(ctx)
      );
    });
  }
}