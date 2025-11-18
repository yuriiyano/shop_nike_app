import 'dart:math';

import 'package:injectable/injectable.dart';

import 'package:shop_nike_app/models/index.dart';
import 'package:shop_nike_app/services/index.dart';

@Injectable()
class ProductsRepository {
  final HttpClient httpClient;

  ProductsRepository(this.httpClient) {
    httpClient.registerType<Product>(Product.fromJson);
  }

  Future<List<Product>> getProducts({int? limit}) {
    return httpClient.get<List<Product>>(
      '/products',
      queryParameters: limit != null ? {'limit': max(1, limit)} : null,
    );
  }

  Future<Product> postProduct(Product product) {
    return httpClient.post<Product>(
      '/products',
      data: product.toJson(),
    );
  }
}
