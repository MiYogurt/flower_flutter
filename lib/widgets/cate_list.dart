import 'package:flutter/material.dart';

import '../test_db/cate.dart';

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
                child: Container(
                  margin: EdgeInsets.all(5),
                  height: 120,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Color.fromRGBO(233, 233, 233, 1),
                          offset: Offset(0, 0),
                          spreadRadius: 0,
                        )
                      ]),
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
