import 'package:flower_shop/lib/actions.dart';
import 'package:flower_shop/widgets/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flower_shop/lib/store.dart';
import 'package:transparent_image/transparent_image.dart';

import 'base.dart';

class ShopCartInnerPage extends StatefulWidget {
  @override
  _ShopCartInnerPageState createState() => _ShopCartInnerPageState();
}

class _ShopCartInnerPageState extends State<ShopCartInnerPage> {
  Widget goodsList() {
    return StoreConnector(
        builder: (ctx, List<Goods> list) {
          return ListView.builder(
            itemBuilder: (ctx, i) {
              var goods = list[i];
              return Row(
                children: <Widget>[
                  Checkbox(
                      value: goods.checked,
                      activeColor: Colors.deepOrange,
                      onChanged: (v) {
                        store.dispatch(ToogleGoodsCheckeAction(i, v));
                      }),
                  FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: goods.imgUrl,
                      width: 80),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(goods.name),
                          Text("种类："+ goods.type),
                          Text("价格：￥" + goods.price.toString()),
                          Counter(
                            count: goods.count,
                            up: () => store.dispatch(AddCountAction(i)),
                            down: () => store.dispatch(RemoveCountAction(i)),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
            itemCount: list.length,
          );
        },
        converter: (Store<AppState> store) => store.state.shopCart);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          RaisedButton(
              onPressed: () {
                store.dispatch(fetchData());
              },
              child: Text("fetch Data")),
          Expanded(child: goodsList()),
        ],
      ),
    );
  }
}

var ShopCart = () => BodyPage.formBuild((ctx, params, router) {
      return ShopCartInnerPage();
    }, noAnimate: false);
