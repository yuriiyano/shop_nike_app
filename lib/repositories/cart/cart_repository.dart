import 'package:injectable/injectable.dart';

import 'package:shop_nike_app/models/index.dart';
import 'cart_storage.dart';

@Injectable()
class CartRepository {
  final CartStorage cartStorage;

  CartRepository({required this.cartStorage});

  Future<List<CartProductCacheModel>> getCartProducts() {
    return cartStorage.getCartProducts();
  }

  Future<bool> createProductInToCart(CartProductCacheModel cartProductCacheModel) {
    return cartStorage.createProductInToCart(cartProductCacheModel);
  }

  Future<bool> deleteProductFromCart(int productId) {
    return cartStorage.deleteProductFromCart(productId);
  }

  Future<bool> deleteAllProductsFromCart() {
    return cartStorage.deleteAllProductsFromCart();
  }
}
