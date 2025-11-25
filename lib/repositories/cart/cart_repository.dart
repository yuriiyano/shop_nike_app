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

  Future<int> addProductInCart({
    required int productId,
    required int cartCount,
  }) {
    return cartStorage.addProductInCart(
      CartProductCacheModel(
        productId: productId,
        cartCount: cartCount,
      ),
    );
  }

  Future<int> updateProductInCart({
    required int productId,
    required int cartCount,
  }) {
    return cartStorage.updateProductInCart(
      CartProductCacheModel(
        productId: productId,
        cartCount: cartCount,
      ),
    );
  }

  Future<bool> deleteProductFromCart(int productId) {
    return cartStorage.deleteProductFromCart(productId);
  }

  Future<bool> deleteAllProductsFromCart() {
    return cartStorage.deleteAllProductsFromCart();
  }
}
