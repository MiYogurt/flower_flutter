import 'package:flower_shop/lib/actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flower_shop/lib/store.dart';

import 'base.dart';

class ShopCartInnerPage extends StatefulWidget {
  @override
  _ShopCartInnerPageState createState() => _ShopCartInnerPageState();
}

class _ShopCartInnerPageState extends State<ShopCartInnerPage> {
  Widget goodsList(){
    return StoreConnector(builder: (ctx, List<Goods> list){
      return ListView.builder(itemBuilder: (ctx, i){
        var goods = list[i];
        return Container(
          child: Text(goods.name),
        );
      }, itemCount: list.length,);
    }, converter: (Store<AppState> store) => store.state.shopCart);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          RaisedButton(onPressed: (){
            store.dispatch(fetchData());
          }, child: Text("fetch Data")),
          Expanded(child: goodsList()),
        ],
      ),
    );
  }
}

var ShopCart = () => BodyPage.formBuild((ctx, params, router){
  return ShopCartInnerPage();
}, noAnimate: false);