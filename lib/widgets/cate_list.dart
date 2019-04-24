import 'package:flutter/material.dart';
import '../model/category.dart';
import '../test_db/cate.dart';
import 'card.dart';

typedef void CategoryClick(num index);

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
    );
  }
}
