import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'product.freezed.dart';
part 'product.g.dart';

const _uuid = Uuid();

@freezed
sealed class Product with _$Product {
  const factory Product({
    @Default(0) int id,
    @Default('') String title,
    @Default(0) double price,
    @Default('') String description,
    @Default('') String category,
    @Default('') String image,
    @Default(ProductRating()) ProductRating rating,
    @Default(false) @JsonKey(includeFromJson: false, includeToJson: false) bool isFavorite,
  }) = _Product;

  factory Product.idGenerated({
    String title = '',
    double price = 0,
    String description = '',
    String category = '',
    String image = '',
    ProductRating rating = const ProductRating(),
  }) {
    return Product(
      id: _uuid.v1().hashCode,
      title: title,
      price: price,
      description: description,
      category: category,
      image: image,
      rating: rating,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@freezed
sealed class ProductRating with _$ProductRating {
  const factory ProductRating({
    @Default(0) double rate,
    @Default(0) int count,
  }) = _ProductRating;

  factory ProductRating.fromJson(Map<String, dynamic> json) =>
      _$ProductRatingFromJson(json);
}
