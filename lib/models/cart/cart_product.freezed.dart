// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartProduct {
  Product get product;
  int get cartCount;

  /// Create a copy of CartProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CartProductCopyWith<CartProduct> get copyWith =>
      _$CartProductCopyWithImpl<CartProduct>(this as CartProduct, _$identity);

  /// Serializes this CartProduct to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CartProduct &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.cartCount, cartCount) ||
                other.cartCount == cartCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, product, cartCount);

  @override
  String toString() {
    return 'CartProduct(product: $product, cartCount: $cartCount)';
  }
}

/// @nodoc
abstract mixin class $CartProductCopyWith<$Res> {
  factory $CartProductCopyWith(
    CartProduct value,
    $Res Function(CartProduct) _then,
  ) = _$CartProductCopyWithImpl;
  @useResult
  $Res call({Product product, int cartCount});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$CartProductCopyWithImpl<$Res> implements $CartProductCopyWith<$Res> {
  _$CartProductCopyWithImpl(this._self, this._then);

  final CartProduct _self;
  final $Res Function(CartProduct) _then;

  /// Create a copy of CartProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? product = null, Object? cartCount = null}) {
    return _then(
      _self.copyWith(
        product: null == product
            ? _self.product
            : product // ignore: cast_nullable_to_non_nullable
                  as Product,
        cartCount: null == cartCount
            ? _self.cartCount
            : cartCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of CartProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_self.product, (value) {
      return _then(_self.copyWith(product: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _CartProduct implements CartProduct {
  const _CartProduct({this.product = const Product(), this.cartCount = 0});
  factory _CartProduct.fromJson(Map<String, dynamic> json) =>
      _$CartProductFromJson(json);

  @override
  @JsonKey()
  final Product product;
  @override
  @JsonKey()
  final int cartCount;

  /// Create a copy of CartProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CartProductCopyWith<_CartProduct> get copyWith =>
      __$CartProductCopyWithImpl<_CartProduct>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CartProductToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CartProduct &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.cartCount, cartCount) ||
                other.cartCount == cartCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, product, cartCount);

  @override
  String toString() {
    return 'CartProduct(product: $product, cartCount: $cartCount)';
  }
}

/// @nodoc
abstract mixin class _$CartProductCopyWith<$Res>
    implements $CartProductCopyWith<$Res> {
  factory _$CartProductCopyWith(
    _CartProduct value,
    $Res Function(_CartProduct) _then,
  ) = __$CartProductCopyWithImpl;
  @override
  @useResult
  $Res call({Product product, int cartCount});

  @override
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$CartProductCopyWithImpl<$Res> implements _$CartProductCopyWith<$Res> {
  __$CartProductCopyWithImpl(this._self, this._then);

  final _CartProduct _self;
  final $Res Function(_CartProduct) _then;

  /// Create a copy of CartProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? product = null, Object? cartCount = null}) {
    return _then(
      _CartProduct(
        product: null == product
            ? _self.product
            : product // ignore: cast_nullable_to_non_nullable
                  as Product,
        cartCount: null == cartCount
            ? _self.cartCount
            : cartCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of CartProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_self.product, (value) {
      return _then(_self.copyWith(product: value));
    });
  }
}
