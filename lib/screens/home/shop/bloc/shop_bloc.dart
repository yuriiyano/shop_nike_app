import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';

import 'package:shop_nike_app/models/index.dart';
import 'package:shop_nike_app/repositories/index.dart';

part 'shop_state.dart';
part 'shop_event.dart';

@lazySingleton
class ShopBloc extends NetworkListBloc<Product, ShopState> {
  final ProductsRepository productsRepository;
  final FavoriteProductsRepository favoriteProductsRepository;

  ShopBloc({
    required this.productsRepository,
    required this.favoriteProductsRepository,
  }) : super(const ShopState()) {
    on<ShopEventToggleFavorite>(_toggleFavoriteProduct);
  }

  @override
  Future<List<Product>> onLoadAsync() async {
    final (products, favoriteProductIds) = await (
      productsRepository.getProducts(),
      favoriteProductsRepository.getFavoriteProductsIds(),
    ).wait;

    final updatedProducts = products
        .map(
          (product) => favoriteProductIds.contains(product.id.toString())
              ? product.copyWith(isFavorite: true)
              : product,
        )
        .toList();

    return Future.value(updatedProducts);
  }

  FutureOr<void> _toggleFavoriteProduct(
    ShopEventToggleFavorite event,
    Emitter<ShopState> emit,
  ) async {
    final productId = event.productId;
    final toggledWithSuccess = await favoriteProductsRepository
        .toggleFavoriteProduct(id: productId.toString());

    if (toggledWithSuccess) {
      emit(
        state.copyWith(
          data: state.data.map((product) {
            if (product.id == productId) {
              return product.copyWith(isFavorite: !product.isFavorite);
            }

            return product;
          }).toList(),
        ),
      );
    }
  }

  @override
  bool equals(Product item1, Product item2) {
    return item1.id == item2.id;
  }
}
