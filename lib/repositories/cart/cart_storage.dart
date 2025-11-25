import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shop_nike_app/core/index.dart';
import 'package:shop_nike_app/models/index.dart';

@Injectable()
class CartStorage {
  final SharedPreferences _prefs;

  const CartStorage(this._prefs);

  Future<Map<int, CartProductCacheModel>> _getCartProductCacheModelsMap() {
    final rawData = _prefs.getString(AppConstants.cartProductsStateKey);
    if (rawData == null || rawData == '') {
      return Future.value({});
    }
    final decoded = jsonDecode(rawData) as Map<String, dynamic>;
    final cartProductsMap = decoded.map<int, CartProductCacheModel>(
      (key, value) => MapEntry(
        int.tryParse(key) ?? -1,
        CartProductCacheModel.fromJson(value as Map<String, dynamic>),
      ),
    );
    return Future.value(cartProductsMap);
  }

  Future<bool> _writeCartProductsCacheModelsToStorage(
    Map<int, CartProductCacheModel> cartProducts,
  ) {
    final encodedCartProducts = jsonEncode(
      cartProducts.map(
        (productId, cartProductCacheModel) =>
            MapEntry(productId.toString(), cartProductCacheModel.toJson()),
      ),
    );
    return _prefs.setString(
      AppConstants.cartProductsStateKey,
      encodedCartProducts,
    );
  }

  Future<List<CartProductCacheModel>> getCartProducts() async {
    final cartProductsMap = await _getCartProductCacheModelsMap();
    return cartProductsMap.values.toList();
  }

  Future<int> addProductInCart(
    CartProductCacheModel cartProductCacheModel,
  ) async {
    final cartProducts = await _getCartProductCacheModelsMap();
    final cartProductCacheModelFresh =
        cartProducts[cartProductCacheModel.productId];

    var cartProductCacheModelToAdd = cartProductCacheModel;
    if (cartProductCacheModelFresh != null) {
      cartProductCacheModelToAdd = cartProductCacheModelToAdd.copyWith(
        cartCount:
            cartProductCacheModelToAdd.cartCount +
            cartProductCacheModelFresh.cartCount,
      );
    }

    cartProducts[cartProductCacheModel.productId] = cartProductCacheModelToAdd;
    final success = await _writeCartProductsCacheModelsToStorage(cartProducts);

    if (!success) {
      throw Exception('Failed to add product to cart with id ${cartProductCacheModel.productId}');
    }
    return cartProductCacheModelToAdd.cartCount;
  }

  Future<int> updateProductInCart(
    CartProductCacheModel cartProductCacheModel,
  ) async {
    final cartProducts = await _getCartProductCacheModelsMap();

    cartProducts[cartProductCacheModel.productId] = cartProductCacheModel;
    final success = await _writeCartProductsCacheModelsToStorage(cartProducts);

    if (!success) {
      throw Exception('Failed to update product to cart with id ${cartProductCacheModel.productId}');
    }

    return cartProductCacheModel.cartCount;
  }

  Future<bool> deleteProductFromCart(int productId) async {
    final cartProducts = await _getCartProductCacheModelsMap();
    cartProducts.remove(productId);
    return _writeCartProductsCacheModelsToStorage(cartProducts);
  }

  Future<bool> deleteAllProductsFromCart() {
    return _prefs.setString(AppConstants.cartProductsStateKey, '');
  }
}
