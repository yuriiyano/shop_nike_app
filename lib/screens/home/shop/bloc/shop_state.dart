part of 'shop_bloc.dart';

class ShopState extends NetworkListState<Product> {
  const ShopState({super.status, super.data = const []});

  @override
  ShopState copyWith({
    NetworkStatus? status,
    List<Product>? data,
  }) {
    return ShopState(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  bool isProductFavorite({required int productId}) =>
       data.firstWhereOrNull((product) => product.id == productId)?.isFavorite ?? false;

  List<Product> filterProductsByCategory({required String category}) =>
      data.where((product) => category == product.category).toList();
}
