import 'package:flower_shop/widgets/card.dart';
import 'package:flower_shop/widgets/title.dart';
import 'package:flutter/material.dart';
import '../router.dart';
import 'base.dart';
import 'package:flutter_svg/flutter_svg.dart';

var User = () => BodyPage.formBuild((ctx, params, NoRoute router){

  var UserAvatar = CardBox(
    height: 120,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(width: 10),
        ClipOval(
            child: Container(
              width: 80,
              height: 80,
              child: Image.network("https://st-gdx.dancf.com/gaodingx/8/design/20190416-104501-cd9f.png?x-oss-process=image/resize,w_760/interlace,1", fit: BoxFit.cover,),
            )
        ),
        Expanded(child: Padding(padding: EdgeInsets.all(20), child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("花钱买罪", textScaleFactor: 1.2,),
            Text("一个一个一个一个一个人", textScaleFactor: .9, overflow: TextOverflow.ellipsis, maxLines: 2,)
          ],
        ),))
      ],
    ),
  );


  var SelectItem = (String text, String path) =>
      GestureDetector(
        onTap: () => router.to(ctx, path, {}),
        child: Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(child: Text(text, textScaleFactor: 1.1)),
              SvgPicture.asset("assets/svg/right.svg", height: 16),
            ],
          ),
        ),
      );

  return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ATitle("个人中心"),
            UserAvatar,
            SizedBox(height: 10),
            SelectItem("购物车", "/shopcart"),
            SelectItem("优惠券", "/coupon"),
            SelectItem("修改密码", "/change_pass"),
            Divider(),
            SelectItem("退出", "/exit"),
          ],
        )
      )
  );
});