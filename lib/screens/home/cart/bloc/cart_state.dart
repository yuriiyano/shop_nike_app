part of 'cart_bloc.dart';

typedef CartState = NetworkListState<CartProduct>;

extension CartStateX on CartState {
  double singleProductTotalCost(CartProduct cartProduct) =>
      cartProduct.product.price * cartProduct.cartCount;

  double allProductsTotalCost({List<CartProduct>? cartProducts}) =>
      (cartProducts ?? data).map(singleProductTotalCost).sum;

  CartProduct? getProductInCart({
    required int productId,
    CartState? cartState,
  }) => (cartState ?? this).data.singleWhereOrNull(
    (cartProduct) => cartProduct.product.id == productId,
  );

  int productItemsCount({
    required int productId,
    CartState? cartState,
  }) =>
      getProductInCart(
        productId: productId,
        cartState: cartState,
      )?.cartCount ??
      0;
}
