part of 'cart_bloc.dart';

class CartEventAddProductToCart extends NetworkEventBase {
  final CartProduct cartProduct;

  CartEventAddProductToCart({required this.cartProduct});
}

class CartEventEditProductInCart extends NetworkEventBase {
  final CartProduct cartProduct;

  CartEventEditProductInCart({required this.cartProduct});
}

class CartEventDeleteProductFromCart extends NetworkEventBase {
  final int productId;

  CartEventDeleteProductFromCart({required this.productId});
}


class CartEventDeleteAllProductsFromCart extends NetworkEventBase {
  CartEventDeleteAllProductsFromCart();
}
