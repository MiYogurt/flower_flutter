// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppState _$AppStateFromJson(Map<String, dynamic> json) {
  return AppState(
      shopCart: (json['shopCart'] as List)
          ?.map((e) =>
              e == null ? null : Goods.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$AppStateToJson(AppState instance) =>
    <String, dynamic>{'shopCart': instance.shopCart};
