import 'package:flower_shop/test_db/goods.dart';
import 'package:flower_shop/widgets/goods_list.dart';
import 'package:flower_shop/widgets/home_banners.dart';
import 'package:flower_shop/widgets/title.dart';
import 'package:flutter/material.dart';

import 'base.dart';
import '../path.dart' as Path;


var Category = () => BodyPage.formBuild((ctx, param, router){
  VoidCallback toShopCart = () => router.to(ctx, "/shop_cart", {});
  VoidCallback toSearch = () => router.to(ctx, "/search", {});
  VoidCallback toUser = () => router.to(ctx, Path.User, {});

  return SafeArea(child: Column(
    children: <Widget>[
      Banners(toShopCart, toSearch, toUser),
      Expanded(child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ATitle("爱情鲜花"),
          ),
          GoodList(goods)
        ],
      ))

    ],
  ));
}, noAnimate: false);