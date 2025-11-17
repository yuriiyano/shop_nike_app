import 'package:injectable/injectable.dart';

import 'package:shop_nike_app/services/index.dart';

@Injectable()
class CategoriesRepository {
  CategoriesRepository({required this.httpClient});

  final HttpClient httpClient;

  Future<List<String>> getCategories() async {
    final categories = await httpClient.get<List<dynamic>>(
      '/products/categories',
    );
    return categories.cast<String>();
  }
}
