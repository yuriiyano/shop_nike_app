import 'dart:async';

import 'package:darq/darq.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';

import 'package:shop_nike_app/models/index.dart';
import 'package:shop_nike_app/repositories/index.dart';

part 'cart_event.dart';

typedef CartState = NetworkListState<CartProduct>;

@lazySingleton
class CartBloc extends NetworkListBloc<CartProduct, CartState> {
  final CartRepository cartRepository;
  final ProductsRepository productsRepository;

  CartBloc({
    required this.cartRepository,
    required this.productsRepository,
  }) : super(const NetworkListState(data: [])) {
    on<CartEventAddProductToCart>(_addProductToCart);
    on<CartEventEditProductInCart>(_editProductInCart);
    on<CartEventDeleteProductFromCart>(_deleteProductFromCart);
    on<CartEventDeleteAllProductsFromCart>(_deleteAllProductsFromCart);
  }

  double singleProductTotalCost(CartProduct cartProduct) =>
      cartProduct.product.price * cartProduct.cartCount;

  double allProductsTotalCost({List<CartProduct>? cartProducts}) =>
      (cartProducts ?? state.data).map(singleProductTotalCost).sum;

  CartProduct? getProductInCart({
    required int productId,
    CartState? cartState,
  }) => (cartState ?? state).data.singleWhereOrNull(
    (cartProduct) => cartProduct.product.id == productId,
  );

  bool isProductInCart({
    required int productId,
    required CartState cartState,
  }) =>
      getProductInCart(
        productId: productId,
        cartState: cartState,
      ) !=
      null;

  int productItemsCount({
    required int productId,
    CartState? cartState,
  }) =>
      getProductInCart(
        productId: productId,
        cartState: cartState,
      )?.cartCount ??
      0;

  @override
  Future<List<CartProduct>> onLoadAsync() async {
    final (cartProductCacheModels, products) = await (
      cartRepository.getCartProducts(),
      productsRepository.getProducts(),
    ).wait;

    final cartProducts = [];
    for (final cartProductCacheModel in cartProductCacheModels) {
      final productInCart = products.singleWhereOrNull(
        (product) => product.id == cartProductCacheModel.productId,
      );

      if (productInCart == null) continue;
      cartProducts.add(
        CartProduct(
          product: productInCart,
          cartCount: cartProductCacheModel.cartCount,
        ),
      );
    }

    return cartProducts.cast<CartProduct>().toList();
  }

  FutureOr<void> _addProductToCart(
    CartEventAddProductToCart event,
    Emitter<CartState> emit,
  ) async {
    emit(state.copyWithLoading());

    final cartProductId = event.cartProduct.product.id;

    final cartProductFromEvent = event.cartProduct;
    final cartProductInitial = getProductInCart(productId: cartProductId);
    var cartProductToAdd = cartProductFromEvent;

    var cartCount = cartProductFromEvent.cartCount;

    if (cartProductInitial != null) {
      cartCount += cartProductInitial.cartCount;
      cartProductToAdd = cartProductToAdd.copyWith(
        cartCount:
            cartProductFromEvent.cartCount + cartProductInitial.cartCount,
      );
    }

    final cartProductCacheModel = CartProductCacheModel(
      productId: cartProductId,
      cartCount: cartCount,
    );

    try {
      await Future.delayed(const Duration(seconds: 1));
      final addedToCart = await cartRepository.createProductInToCart(
        cartProductCacheModel,
      );

      if (addedToCart) {
        if (cartProductInitial != null) {
          final updatedCartProducts = state.data
              .replaceWhere(
                cartProductToAdd,
                (cartProduct) =>
                    cartProduct.product.id == cartProductToAdd.product.id,
              )
              .toList();
          update(updatedCartProducts);
        } else {
          addItem(cartProductToAdd);
        }
      }
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWithFailure());
    }
  }

  FutureOr<void> _editProductInCart(
    CartEventEditProductInCart event,
    Emitter<CartState> emit,
  ) async {
    emit(state.copyWithLoading());

    final cartProductFromEvent = event.cartProduct;
    final updatedCartProductCacheModel = CartProductCacheModel(
      productId: cartProductFromEvent.product.id,
      cartCount: cartProductFromEvent.cartCount,
    );

    try {
      final updatedInCart = await cartRepository.createProductInToCart(
        updatedCartProductCacheModel,
      );

      if (updatedInCart) {
        final updatedCartProducts = state.data
            .replaceWhere(
              cartProductFromEvent,
              (cartProduct) =>
                  cartProduct.product.id ==
                  updatedCartProductCacheModel.productId,
            )
            .toList();
        update(updatedCartProducts);
      }
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWithFailure());
    }
  }

  FutureOr<void> _deleteProductFromCart(
    CartEventDeleteProductFromCart event,
    Emitter<CartState> emit,
  ) async {
    emit(state.copyWithLoading());

    final cartProductId = event.productId;

    final cartProductInitial = getProductInCart(productId: cartProductId);
    if (cartProductInitial == null) {
      emit(state.copyWithSuccess(state.data));
      return;
    }

    try {
      final deletedFromCart = await cartRepository.deleteProductFromCart(
        cartProductId,
      );

      if (deletedFromCart) {
        removeItem(cartProductInitial);
      }
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWithFailure());
    }
  }

  FutureOr<void> _deleteAllProductsFromCart(
    CartEventDeleteAllProductsFromCart event,
    Emitter<CartState> emit,
  ) async {
    emit(state.copyWithLoading());

    final cartProducts = state.data;
    if (cartProducts.isEmpty) {
      emit(state.copyWithSuccess(cartProducts));
      return;
    }

    try {
      final deleteResult = await cartRepository.deleteAllProductsFromCart();

      if (deleteResult) {
        update([]);
      }
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWithFailure());
    }
  }

  @override
  bool equals(CartProduct item1, CartProduct item2) {
    return item1.product.id == item2.product.id;
  }
}
