import 'package:flutter/material.dart';
import '../widgets/home_banners.dart';
import '../widgets/cate_list.dart';
import '../widgets/goods_list.dart';
import '../test_db/cate.dart';
import '../test_db/goods.dart';
import 'base.dart';
import '../path.dart' as Path;

var Home = () => BodyPage.formBuild((ctx, params, router) {
      VoidCallback toShopCart = () => router.to(ctx, "/shop_cart", {});
      VoidCallback toSearch = () => router.to(ctx, Path.Search, {});
      VoidCallback toUser = () => router.to(ctx, Path.User, {});

      return SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Banners(toShopCart, toSearch, toUser),
          Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowGlow();
            },
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Container(
                  child: Text("分类", textScaleFactor: 1.2),
                  margin: EdgeInsets.all(10),
                ),
                CategoryList(categorys, handler: (i) => router.to(ctx, Path.Category, params),),
                Container(
                  child: Text("鲜花", textScaleFactor: 1.2),
                  margin: EdgeInsets.all(10),
                ),
                GoodList(goods)
              ],
            ),
          ))
        ],
      ));
    });
