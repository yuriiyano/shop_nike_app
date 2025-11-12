import 'package:injectable/injectable.dart';

import 'favorite_products_storage.dart';

@Injectable()
class FavoriteProductsRepository {
  final FavoriteProductsStorage favoriteProductsStorage;

  const FavoriteProductsRepository({required this.favoriteProductsStorage});

  Future<List<String>> getFavoriteProductsIds() {
    return favoriteProductsStorage.getFavoriteProductsIds();
  }

  Future<bool> toggleFavoriteProduct({required String id}) {
    return favoriteProductsStorage.toggleFavoriteProduct(id: id);
  }
}
