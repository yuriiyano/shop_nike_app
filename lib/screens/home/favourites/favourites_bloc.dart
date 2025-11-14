import 'package:injectable/injectable.dart';

import 'package:shop_nike_app/models/index.dart';
import 'package:shop_nike_app/repositories/index.dart';

typedef FavouritesState = NetworkListState<Product>;

@lazySingleton
class FavouritesBloc extends NetworkListBloc<Product, FavouritesState> {
  final ProductsRepository productsRepository;
  final FavoriteProductsRepository favoriteProductsRepository;

  FavouritesBloc({
    required this.productsRepository,
    required this.favoriteProductsRepository,
  }) : super(const FavouritesState(data: []));

  @override
  Future<List<Product>> onLoadAsync() async {
    final (products, favoriteProductsIds) = await (
      productsRepository.getProducts(),
      favoriteProductsRepository.getFavoriteProductsIds(),
    ).wait;

    return Future.value(
      products
          .where(
            (product) => favoriteProductsIds.contains(product.id.toString()),
          )
          .map((product) => product.copyWith(isFavorite: true))
          .toList(),
    );
  }

  @override
  bool equals(Product item1, Product item2) {
    return item1.id == item2.id;
  }
}
