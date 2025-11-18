part of 'product_filter_model.dart';

extension ProductSortOrderTypeX on ProductSortOrderType {
  String get label => switch (this) {
    ProductSortOrderType.lowHigh => 'Price: Low-High',
    ProductSortOrderType.highLow => 'Price: High-Low',
    ProductSortOrderType.aZ => 'Name: A-Z',
    ProductSortOrderType.zA => 'Name: Z-A',
  };
}

extension PriceRangeX on PriceRange {
  String get label => '\$$min${max == null ? '+' : '-\$$max'}';
}
