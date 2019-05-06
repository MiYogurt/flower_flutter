import 'package:json_annotation/json_annotation.dart';

part 'goods.g.dart';

@JsonSerializable()
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

  factory Goods.fromJson(Map<String, dynamic> json) => _$GoodsFromJson(json);
  Map<String, dynamic> toJson() => _$GoodsToJson(this);
}
