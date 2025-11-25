import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_product_cache_model.freezed.dart';
part 'cart_product_cache_model.g.dart'; 

@freezed
sealed class CartProductCacheModel with _$CartProductCacheModel {
  const factory CartProductCacheModel({
    @Default(0) int productId,
    @Default(0) int cartCount,
  }) = _CartProductCacheModel;

  factory CartProductCacheModel.fromJson(Map<String, dynamic> json)
      => _$CartProductCacheModelFromJson(json); 
}
