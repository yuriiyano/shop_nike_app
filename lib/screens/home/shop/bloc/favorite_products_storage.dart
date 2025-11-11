import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shop_nike_app/core/index.dart';

@Injectable()
class FavoriteProductsStorage {
  final SharedPreferences _prefs;

  const FavoriteProductsStorage(this._prefs);

  Future<List<String>> getFavoriteProductsIds() => Future.value(
    _prefs.getStringList(AppConstants.favoriteProductsStateKey) ?? [],
  );

  Future<bool> toggleFavoriteProduct({required String id}) async {
    final favoriteProductsIds = await getFavoriteProductsIds();

    if (favoriteProductsIds.contains(id)) {
      favoriteProductsIds.remove(id);
    } else {
      favoriteProductsIds.add(id);
    }

    return _prefs.setStringList(
      AppConstants.favoriteProductsStateKey,
      favoriteProductsIds,
    );
  }
}
