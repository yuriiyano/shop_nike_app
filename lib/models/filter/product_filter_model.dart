class ProductFilterModel {
  final ProductSortOrderType? productSortOrderType;
  final List<PriceRange> priceRange;
  final List<String> categories;

  const ProductFilterModel({
    this.productSortOrderType,
    required this.priceRange,
    required this.categories,
  });

  factory ProductFilterModel.empty() {
    return const ProductFilterModel(priceRange: [], categories: []);
  }
}

enum ProductSortOrderType {
  lowHigh,
  highLow,
  aZ,
  zA,
}

extension ProductSortOrderTypeX on ProductSortOrderType {
  String get label => switch (this) {
    ProductSortOrderType.lowHigh => 'Price: Low-High',
    ProductSortOrderType.highLow => 'Price: High-Low',
    ProductSortOrderType.aZ => 'Name: A-Z',
    ProductSortOrderType.zA => 'Name: Z-A',
  };
}

class PriceRange {
  const PriceRange({required this.min, this.max});

  final double min;
  final double? max;

  String get label => '\$$min${max == null ? '+' : '-\$$max'}';
}
