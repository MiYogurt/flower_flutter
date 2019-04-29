import 'dart:io';

import 'package:flower_shop/widgets/card.dart';
import 'package:flower_shop/widgets/title.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import '../router.dart';
import 'base.dart';

var Coupon = () =>
    BodyPage.formBuild((BuildContext ctx, Map params, NoRoute router) {
      var _Coupons = (String title, num price, String timeEnd, String desc) =>
          CardBox(
              child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(title, textScaleFactor: 1.4, style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(desc, textScaleFactor: 1.1),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text(timeEnd, textScaleFactor: 0.9)),
                      SizedBox(
                        child: Text("￥" + price.toString(), textScaleFactor: 1.5, style: TextStyle(color: Colors.red)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ));

      var IOSNavBar = Offstage(
          offstage: !Platform.isIOS,
          child: GestureDetector(
            onTap: () {
              var nav = Navigator.of(ctx);
              if (nav.canPop()) {
                nav.pop();
              }
            },
            child: Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(ctx).size.width - 20,
              color: Color.fromRGBO(244, 244, 244, 1),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset("assets/svg/left.svg", width: 20)
                ],
              ),
            ),
          ));

      return SafeArea(
          child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: ListView(
              children: <Widget>[
                IOSNavBar,
                ATitle("购物券"),
                _Coupons("五一购物券", 99, "2019-11-1", "满 500 可用"),
                _Coupons("圣诞礼券", 109, "2019-11-1", "无限制")
              ],
            ))
          ],
        ),
      ));
    }, noAnimate: false);
