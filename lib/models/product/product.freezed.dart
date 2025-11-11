// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Product {
  int get id;
  String get title;
  double get price;
  String get description;
  String get category;
  String get image;
  ProductRating get rating;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get isFavorite;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductCopyWith<Product> get copyWith =>
      _$ProductCopyWithImpl<Product>(this as Product, _$identity);

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Product &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    price,
    description,
    category,
    image,
    rating,
    isFavorite,
  );

  @override
  String toString() {
    return 'Product(id: $id, title: $title, price: $price, description: $description, category: $category, image: $image, rating: $rating, isFavorite: $isFavorite)';
  }
}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) =
      _$ProductCopyWithImpl;
  @useResult
  $Res call({
    int id,
    String title,
    double price,
    String description,
    String category,
    String image,
    ProductRating rating,
    @JsonKey(includeFromJson: false, includeToJson: false) bool isFavorite,
  });

  $ProductRatingCopyWith<$Res> get rating;
}

/// @nodoc
class _$ProductCopyWithImpl<$Res> implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? price = null,
    Object? description = null,
    Object? category = null,
    Object? image = null,
    Object? rating = null,
    Object? isFavorite = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _self.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        price: null == price
            ? _self.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double,
        description: null == description
            ? _self.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _self.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        image: null == image
            ? _self.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String,
        rating: null == rating
            ? _self.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as ProductRating,
        isFavorite: null == isFavorite
            ? _self.isFavorite
            : isFavorite // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductRatingCopyWith<$Res> get rating {
    return $ProductRatingCopyWith<$Res>(_self.rating, (value) {
      return _then(_self.copyWith(rating: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Product implements Product {
  const _Product({
    this.id = 0,
    this.title = '',
    this.price = 0,
    this.description = '',
    this.category = '',
    this.image = '',
    this.rating = const ProductRating(),
    @JsonKey(includeFromJson: false, includeToJson: false)
    this.isFavorite = false,
  });
  factory _Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final double price;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String category;
  @override
  @JsonKey()
  final String image;
  @override
  @JsonKey()
  final ProductRating rating;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final bool isFavorite;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductCopyWith<_Product> get copyWith =>
      __$ProductCopyWithImpl<_Product>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProductToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Product &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    price,
    description,
    category,
    image,
    rating,
    isFavorite,
  );

  @override
  String toString() {
    return 'Product(id: $id, title: $title, price: $price, description: $description, category: $category, image: $image, rating: $rating, isFavorite: $isFavorite)';
  }
}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) =
      __$ProductCopyWithImpl;
  @override
  @useResult
  $Res call({
    int id,
    String title,
    double price,
    String description,
    String category,
    String image,
    ProductRating rating,
    @JsonKey(includeFromJson: false, includeToJson: false) bool isFavorite,
  });

  @override
  $ProductRatingCopyWith<$Res> get rating;
}

/// @nodoc
class __$ProductCopyWithImpl<$Res> implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? price = null,
    Object? description = null,
    Object? category = null,
    Object? image = null,
    Object? rating = null,
    Object? isFavorite = null,
  }) {
    return _then(
      _Product(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _self.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        price: null == price
            ? _self.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double,
        description: null == description
            ? _self.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _self.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        image: null == image
            ? _self.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String,
        rating: null == rating
            ? _self.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as ProductRating,
        isFavorite: null == isFavorite
            ? _self.isFavorite
            : isFavorite // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductRatingCopyWith<$Res> get rating {
    return $ProductRatingCopyWith<$Res>(_self.rating, (value) {
      return _then(_self.copyWith(rating: value));
    });
  }
}

/// @nodoc
mixin _$ProductRating {
  double get rate;
  int get count;

  /// Create a copy of ProductRating
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductRatingCopyWith<ProductRating> get copyWith =>
      _$ProductRatingCopyWithImpl<ProductRating>(
        this as ProductRating,
        _$identity,
      );

  /// Serializes this ProductRating to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductRating &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rate, count);

  @override
  String toString() {
    return 'ProductRating(rate: $rate, count: $count)';
  }
}

/// @nodoc
abstract mixin class $ProductRatingCopyWith<$Res> {
  factory $ProductRatingCopyWith(
    ProductRating value,
    $Res Function(ProductRating) _then,
  ) = _$ProductRatingCopyWithImpl;
  @useResult
  $Res call({double rate, int count});
}

/// @nodoc
class _$ProductRatingCopyWithImpl<$Res>
    implements $ProductRatingCopyWith<$Res> {
  _$ProductRatingCopyWithImpl(this._self, this._then);

  final ProductRating _self;
  final $Res Function(ProductRating) _then;

  /// Create a copy of ProductRating
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? rate = null, Object? count = null}) {
    return _then(
      _self.copyWith(
        rate: null == rate
            ? _self.rate
            : rate // ignore: cast_nullable_to_non_nullable
                  as double,
        count: null == count
            ? _self.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _ProductRating implements ProductRating {
  const _ProductRating({this.rate = 0, this.count = 0});
  factory _ProductRating.fromJson(Map<String, dynamic> json) =>
      _$ProductRatingFromJson(json);

  @override
  @JsonKey()
  final double rate;
  @override
  @JsonKey()
  final int count;

  /// Create a copy of ProductRating
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductRatingCopyWith<_ProductRating> get copyWith =>
      __$ProductRatingCopyWithImpl<_ProductRating>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProductRatingToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductRating &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rate, count);

  @override
  String toString() {
    return 'ProductRating(rate: $rate, count: $count)';
  }
}

/// @nodoc
abstract mixin class _$ProductRatingCopyWith<$Res>
    implements $ProductRatingCopyWith<$Res> {
  factory _$ProductRatingCopyWith(
    _ProductRating value,
    $Res Function(_ProductRating) _then,
  ) = __$ProductRatingCopyWithImpl;
  @override
  @useResult
  $Res call({double rate, int count});
}

/// @nodoc
class __$ProductRatingCopyWithImpl<$Res>
    implements _$ProductRatingCopyWith<$Res> {
  __$ProductRatingCopyWithImpl(this._self, this._then);

  final _ProductRating _self;
  final $Res Function(_ProductRating) _then;

  /// Create a copy of ProductRating
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? rate = null, Object? count = null}) {
    return _then(
      _ProductRating(
        rate: null == rate
            ? _self.rate
            : rate // ignore: cast_nullable_to_non_nullable
                  as double,
        count: null == count
            ? _self.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}
