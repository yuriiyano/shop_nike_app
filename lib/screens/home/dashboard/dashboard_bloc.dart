import 'package:injectable/injectable.dart';

import 'package:shop_nike_app/models/index.dart';
import 'package:shop_nike_app/repositories/index.dart';

@lazySingleton
class DashboardBloc
    extends NetworkListBloc<Product, NetworkListState<Product>> {
  final ProductsRepository productsRepository;

  DashboardBloc({
    required this.productsRepository,
  }) : super(const NetworkListState(data: []));

  @override
  Future<List<Product>> onLoadAsync() {
    return productsRepository.getProducts(limit: 5);
  }

  @override
  bool equals(Product item1, Product item) {
    return item1.id == item.id;
  }
}
