import 'package:flutter/material.dart';
import '../layout/layout.dart' as layout;
import '../router.dart';
import '../widgets/home_banners.dart';

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
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Banners(toShopCart, toSearch, toUser),
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