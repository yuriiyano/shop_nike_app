import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';

import 'package:shop_nike_app/models/index.dart';
import 'package:shop_nike_app/repositories/index.dart';

part 'cart_state.dart';
part 'cart_event.dart';


@lazySingleton
class CartBloc extends NetworkListBloc<CartProduct, CartState> {
  final CartRepository cartRepository;
  final ProductsRepository productsRepository;

  CartBloc({
    required this.cartRepository,
    required this.productsRepository,
  }) : super(const NetworkListState(data: [])) {
    on<CartEventDeleteProductFromCart>(_deleteProductFromCart);
    on<CartEventDeleteAllProductsFromCart>(_deleteAllProductsFromCart);
  }

  @override
  Future<List<CartProduct>> onLoadAsync() async {
    final (cartProductCacheModels, products) = await (
      cartRepository.getCartProducts(),
      productsRepository.getProducts(),
    ).wait;

    final cartProducts = <CartProduct>[];
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

    return cartProducts;
  }


  FutureOr<void> _deleteProductFromCart(
    CartEventDeleteProductFromCart event,
    Emitter<CartState> emit,
  ) async {

    final cartProductId = event.productId;

    final cartProductInitial = state.getProductInCart(productId: cartProductId);
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
