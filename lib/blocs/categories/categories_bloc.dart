import 'package:injectable/injectable.dart';

import 'package:shop_nike_app/models/index.dart';
import 'package:shop_nike_app/repositories/index.dart';

@lazySingleton
class CategoriesBloc extends NetworkListBloc<String, NetworkListState<String>> {
  final CategoriesRepository categoriesRepository;

  CategoriesBloc({required this.categoriesRepository})
    : super(const NetworkListState(data: []));

  @override
  Future<List<String>> onLoadAsync() {
    return categoriesRepository.getCategories();
  }

  @override
  bool equals(String item1, String item2) {
    return item1 == item2;
  }
}
