import 'dart:async';
import 'package:flower_shop/lib/shopcart.dart';

class Event {
  StreamController streamController;

  Event({bool sync = false}) : streamController = StreamController.broadcast(sync: sync);

  Stream<T> on<T>(){
    return streamController.stream.where((event) => event is T).cast<T>();
  }

  void fire(event){
    streamController.add(event);
  }

  void destory() {
    streamController.close();
  }
}


var event = Event();

var shopCart = ShopCart();

class AddGoodsCount {}
