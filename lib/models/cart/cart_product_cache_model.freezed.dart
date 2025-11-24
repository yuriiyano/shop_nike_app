// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_product_cache_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartProductCacheModel {
  int get productId;
  int get cartCount;

  /// Create a copy of CartProductCacheModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CartProductCacheModelCopyWith<CartProductCacheModel> get copyWith =>
      _$CartProductCacheModelCopyWithImpl<CartProductCacheModel>(
        this as CartProductCacheModel,
        _$identity,
      );

  /// Serializes this CartProductCacheModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CartProductCacheModel &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.cartCount, cartCount) ||
                other.cartCount == cartCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productId, cartCount);

  @override
  String toString() {
    return 'CartProductCacheModel(productId: $productId, cartCount: $cartCount)';
  }
}

/// @nodoc
abstract mixin class $CartProductCacheModelCopyWith<$Res> {
  factory $CartProductCacheModelCopyWith(
    CartProductCacheModel value,
    $Res Function(CartProductCacheModel) _then,
  ) = _$CartProductCacheModelCopyWithImpl;
  @useResult
  $Res call({int productId, int cartCount});
}

/// @nodoc
class _$CartProductCacheModelCopyWithImpl<$Res>
    implements $CartProductCacheModelCopyWith<$Res> {
  _$CartProductCacheModelCopyWithImpl(this._self, this._then);

  final CartProductCacheModel _self;
  final $Res Function(CartProductCacheModel) _then;

  /// Create a copy of CartProductCacheModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? productId = null, Object? cartCount = null}) {
    return _then(
      _self.copyWith(
        productId: null == productId
            ? _self.productId
            : productId // ignore: cast_nullable_to_non_nullable
                  as int,
        cartCount: null == cartCount
            ? _self.cartCount
            : cartCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _CartProductCacheModel implements CartProductCacheModel {
  const _CartProductCacheModel({this.productId = 0, this.cartCount = 0});
  factory _CartProductCacheModel.fromJson(Map<String, dynamic> json) =>
      _$CartProductCacheModelFromJson(json);

  @override
  @JsonKey()
  final int productId;
  @override
  @JsonKey()
  final int cartCount;

  /// Create a copy of CartProductCacheModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CartProductCacheModelCopyWith<_CartProductCacheModel> get copyWith =>
      __$CartProductCacheModelCopyWithImpl<_CartProductCacheModel>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$CartProductCacheModelToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CartProductCacheModel &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.cartCount, cartCount) ||
                other.cartCount == cartCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productId, cartCount);

  @override
  String toString() {
    return 'CartProductCacheModel(productId: $productId, cartCount: $cartCount)';
  }
}

/// @nodoc
abstract mixin class _$CartProductCacheModelCopyWith<$Res>
    implements $CartProductCacheModelCopyWith<$Res> {
  factory _$CartProductCacheModelCopyWith(
    _CartProductCacheModel value,
    $Res Function(_CartProductCacheModel) _then,
  ) = __$CartProductCacheModelCopyWithImpl;
  @override
  @useResult
  $Res call({int productId, int cartCount});
}

/// @nodoc
class __$CartProductCacheModelCopyWithImpl<$Res>
    implements _$CartProductCacheModelCopyWith<$Res> {
  __$CartProductCacheModelCopyWithImpl(this._self, this._then);

  final _CartProductCacheModel _self;
  final $Res Function(_CartProductCacheModel) _then;

  /// Create a copy of CartProductCacheModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? productId = null, Object? cartCount = null}) {
    return _then(
      _CartProductCacheModel(
        productId: null == productId
            ? _self.productId
            : productId // ignore: cast_nullable_to_non_nullable
                  as int,
        cartCount: null == cartCount
            ? _self.cartCount
            : cartCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}
