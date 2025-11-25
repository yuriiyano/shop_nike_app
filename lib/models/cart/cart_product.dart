import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_nike_app/models/index.dart';

part 'cart_product.freezed.dart';
part 'cart_product.g.dart'; 

@freezed
sealed class CartProduct with _$CartProduct {
  const factory CartProduct({
    @Default(Product()) Product product,
    @Default(0) int cartCount,
  }) = _CartProduct;

  factory CartProduct.fromJson(Map<String, dynamic> json)
      => _$CartProductFromJson(json); 
}
