part 'product_filter_model.a.dart';

enum ProductSortOrderType {
  lowHigh,
  highLow,
  aZ,
  zA,
}

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

class PriceRange {
  final double min;
  final double? max;

  const PriceRange({required this.min, this.max});
}
