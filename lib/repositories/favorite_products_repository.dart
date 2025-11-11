import 'package:injectable/injectable.dart';

import 'package:shop_nike_app/screens/home/shop/bloc/favorite_products_storage.dart';

@Injectable()
class FavoriteProductsRepository {
  final FavoriteProductsStorage favoriteProductsStorage;

  const FavoriteProductsRepository({required this.favoriteProductsStorage});

  Future<bool> toggleFavoriteProduct({required String id}) {
    return favoriteProductsStorage.toggleFavoriteProduct(id: id);
  }

  Future<List<String>> getFavoriteProductsIds() {
    return favoriteProductsStorage.getFavoriteProductsIds();
  }
}
