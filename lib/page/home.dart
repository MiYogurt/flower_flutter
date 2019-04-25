import 'package:flutter/material.dart';
import '../layout/layout.dart' as layout;
import '../router.dart';
import '../widgets/home_banners.dart';
import '../widgets/cate_list.dart';
import '../widgets/goods_list.dart';
import '../test_db/cate.dart';
import '../test_db/goods.dart';
import 'base.dart';

var Home = () => BodyPage.formBuild((ctx, params, router){
  VoidCallback toShopCart = () => router.to(ctx, "/shop_cart", {});
  VoidCallback toSearch = () => router.to(ctx, "/search", {});
  VoidCallback toUser = () => router.to(ctx, "/person", {});

  return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Banners(toShopCart, toSearch, toUser),
//          Expanded(
//            flex: 1,
//            child: SingleChildScrollView(
//              child: Column(
//                children: <Widget>[
//                  Container(
//                    child: Text("分类", textScaleFactor: 1.4),
//                    margin: EdgeInsets.all(10),
//                  ),
//                  CategoryList(categorys),
//                  GoodList(goods)
//                ],
//              ),
//            )
//          )
        ],
      ));
});
