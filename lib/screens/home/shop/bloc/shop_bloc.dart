import 'dart:async';

import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:darq/darq.dart';

import 'package:shop_nike_app/models/index.dart';
import 'package:shop_nike_app/repositories/index.dart';

part 'shop_event.dart';
part 'shop_state.dart';

@lazySingleton
class ShopBloc
    extends NetworkFilterableListBloc<Product, ProductFilterModel, ShopState> {
  final ProductsRepository productsRepository;
  final FavoriteProductsRepository favoriteProductsRepository;

  ShopBloc({
    required this.productsRepository,
    required this.favoriteProductsRepository,
  }) : super(const ShopState(data: [], visibleData: [])) {
    on<ShopEventToggleFavorite>(_toggleFavoriteProduct);
  }

  bool isProductFavorite({required int productId}) =>
      state.data
          .firstWhereOrNull((product) => product.id == productId)
          ?.isFavorite ??
      false;

  List<Product> filterProductsByCategory({required String category}) =>
      state.data.where((product) => category == product.category).toList();

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
        onStateChanged(
          DataChangeReason.itemEdited,
          state.copyWith(
            data: state.data.map((product) {
              if (product.id == productId) {
                return product.copyWith(isFavorite: !product.isFavorite);
              }

              return product;
            }).toList(),
          ),
        ),
      );
    }
  }

  @override
  ShopState onStateChanged(DataChangeReason reason, ShopState state) {
    var visibleData = state.data;
    final query = state.query;

    if (query?.isNotEmpty ?? false) {
      visibleData = state.searchByQuery(
        products: visibleData,
        query: query,
      );
    }

    if (state.filter != null) {
      if (state.filter!.productSortOrderType != null) {
        visibleData = state.sortProducts(
          products: visibleData,
          sortType: state.filter!.productSortOrderType,
        );
      }

      if (state.filter!.priceRange.isNotEmpty) {
        visibleData = state.filterByPrice(
          products: visibleData,
          priceRanges: state.filter!.priceRange,
        );
      }

      if (state.filter!.categories.isNotEmpty) {
        visibleData = state.filterByCategories(
          products: visibleData,
          categories: state.filter!.categories,
        );
      }
    }

    return state.copyWith(visibleData: visibleData);
  }

  @override
  bool equals(Product item1, Product item2) {
    return item1.id == item2.id;
  }
}
