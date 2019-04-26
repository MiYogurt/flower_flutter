import 'package:flutter/material.dart';
import '../model/goods.dart';

class GoodBox extends StatelessWidget {
  String name;
  String imgUrl;
  GoodBox(this.name, this.imgUrl);
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth / 2 - 20,
      child: Column(
        children: <Widget>[
          Image.network(this.imgUrl),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(this.name),
          )
        ],
      ),
    );
  }
}

class GoodList extends StatelessWidget {
  List<Goods> goods;
  GoodList(this.goods);

  List<Widget> list()
  {
    return List.generate(goods.length, (i){
      var item = goods[i];
      return GoodBox(item.name, item.imgUrl);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Wrap(
          spacing: 10,
          runSpacing: 10.0,
          children: list(),
        ),
      ),
    );
  }
}
