class Goods {
  String imgUrl;
  String name;
  String type;
  num price;
  int count;

  Goods({this.imgUrl, this.name, this.type, this.price, this.count});
}

// 添加商品
class AddAction {
  Goods goods;
  AddAction({this.goods});
}

// 移除商品
class RemoveAction {
  num index;
}

// 数量 + 1
class AddCountAction {
  num index;
}

class InitState {
  List<Goods> goods;
  InitState(this.goods);
}