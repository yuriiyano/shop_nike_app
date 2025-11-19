import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

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
