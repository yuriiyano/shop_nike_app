part of 'shop_bloc.dart';

typedef ShopState = NetworkFilterableListState<Product, ProductFilterModel>;

extension ShopStateX on ShopState {
  List<Product> searchByQuery({
    required List<Product> products,
    required String? query,
  }) {
    if (query == null || products.isEmpty) return products;

    return products
        .where(
          (product) =>
              product.title.toUpperCase().contains(query.toUpperCase()),
        )
        .toList();
  }

  List<Product> sortProducts({
    required List<Product> products,
    ProductSortOrderType? sortType,
  }) {
    if (sortType == null || products.isEmpty) return products;

    return switch (sortType) {
      ProductSortOrderType.lowHigh => products.orderBy((p) => p.price).toList(),
      ProductSortOrderType.highLow =>
        products.orderByDescending((p) => p.price).toList(),
      ProductSortOrderType.aZ => products.orderBy((p) => p.title).toList(),
      ProductSortOrderType.zA =>
        products.orderByDescending((p) => p.title).toList(),
    };
  }

  List<Product> filterByPrice({
    required List<Product> products,
    required List<PriceRange> priceRanges,
  }) {
    if (priceRanges.isEmpty || products.isEmpty) return products;

    return products.where((product) {
      final price = product.price;

      return priceRanges.any((range) {
        return range.min <= price && price <= (range.max ?? double.infinity);
      });
    }).toList();
  }

  List<Product> filterByCategories({
    required List<Product> products,
    required List<String> categories,
  }) {
    if (categories.isEmpty || products.isEmpty) return products;

    return products.where((p) => categories.contains(p.category)).toList();
  }
}
