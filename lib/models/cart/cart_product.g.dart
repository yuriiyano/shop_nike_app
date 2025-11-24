// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartProduct _$CartProductFromJson(Map<String, dynamic> json) => _CartProduct(
  product: json['product'] == null
      ? const Product()
      : Product.fromJson(json['product'] as Map<String, dynamic>),
  cartCount: (json['cartCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CartProductToJson(_CartProduct instance) =>
    <String, dynamic>{
      'product': instance.product,
      'cartCount': instance.cartCount,
    };
