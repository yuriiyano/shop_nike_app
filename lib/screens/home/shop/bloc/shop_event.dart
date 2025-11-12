part of 'shop_bloc.dart';

class ShopEventToggleFavorite extends NetworkEventBase {
  final int productId;

  ShopEventToggleFavorite({required this.productId});
}
