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

  bool isProductFavorite({required int productId}) => data
      .firstWhere((e) => e.id == productId, orElse: () => const Product())
      .isFavorite;

  List<Product> filterProductsByCategory({required String category}) =>
      data.where((e) => category == e.category).toList();
}
