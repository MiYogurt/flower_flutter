// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goods.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Goods _$GoodsFromJson(Map<String, dynamic> json) {
  return Goods(
      imgUrl: json['imgUrl'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      price: json['price'] as num,
      count: json['count'] as int,
      checked: json['checked'] as bool);
}

Map<String, dynamic> _$GoodsToJson(Goods instance) => <String, dynamic>{
      'imgUrl': instance.imgUrl,
      'name': instance.name,
      'type': instance.type,
      'price': instance.price,
      'count': instance.count,
      'checked': instance.checked
    };
