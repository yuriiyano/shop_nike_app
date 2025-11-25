// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_cache_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartProductCacheModel _$CartProductCacheModelFromJson(
  Map<String, dynamic> json,
) => _CartProductCacheModel(
  productId: (json['productId'] as num?)?.toInt() ?? 0,
  cartCount: (json['cartCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CartProductCacheModelToJson(
  _CartProductCacheModel instance,
) => <String, dynamic>{
  'productId': instance.productId,
  'cartCount': instance.cartCount,
};
