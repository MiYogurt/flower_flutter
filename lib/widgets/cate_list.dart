import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../model/category.dart';
import 'card.dart';

typedef void CategoryClick(num index);

class MyBehavior  extends ScrollBehavior{
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    if(Platform.isAndroid || Platform.isFuchsia){
      return child;
    }else{
      return super.buildViewportChrome(context,child,axisDirection);
    }
  }
}

class CategoryList extends StatelessWidget {
  List<Category> categorys;
  CategoryClick handler;

  CategoryList(this.categorys, {this.handler});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView.builder(
            itemCount: categorys.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              var cate = categorys[index];
              return GestureDetector(
                  onTap: () => this.handler ?? this.handler(index),
                  child: CardBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.network(cate.imgUrl, width: 100, height: 100),
                        Container(
                          height: 40,
                          padding: EdgeInsets.only(top: 10),
                          child: Text(cate.name, textScaleFactor: 1.2),
                        )
                      ],
                    ),
                  ));
            }),
      )
    );
  }
}
