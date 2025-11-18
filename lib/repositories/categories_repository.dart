import 'package:injectable/injectable.dart';

import 'package:shop_nike_app/services/index.dart';

@Injectable()
class CategoriesRepository {
  final HttpClient httpClient;

  CategoriesRepository({required this.httpClient});

  Future<List<String>> getCategories() {
    return httpClient.get<List<String>>('/products/categories');
  }
}
