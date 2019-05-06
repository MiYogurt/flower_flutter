class Goods {
  String imgUrl;
  String name;
  String type;
  num price;
  int count;
  bool checked;

  Goods(
      {this.imgUrl,
      this.name,
      this.type,
      this.price,
      this.count,
      this.checked = false});

  Goods copy() => Goods(
      imgUrl: this.imgUrl,
      name: this.name,
      type: this.type,
      price: this.price,
      count: this.count,
      checked: this.checked);
}

// 添加商品
class AddAction {
  Goods goods;

  AddAction({this.goods});
}

// 移除商品
class RemoveAction {
  num index;

  RemoveAction(this.index);
}

// 数量 + 1
class AddCountAction {
  num index;

  AddCountAction(this.index);
}

// 数量 - 1
class RemoveCountAction {
  num index;

  RemoveCountAction(this.index);
}

class ToogleGoodsCheckeAction {
  num index;
  bool value;

  ToogleGoodsCheckeAction(this.index, this.value);
}

class InitState {
  List<Goods> goods;

  InitState(this.goods);
}

