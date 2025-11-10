// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard1_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Dashboard1Event {
  int get limit;

  /// Create a copy of Dashboard1Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Dashboard1EventCopyWith<Dashboard1Event> get copyWith =>
      _$Dashboard1EventCopyWithImpl<Dashboard1Event>(
        this as Dashboard1Event,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Dashboard1Event &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limit);

  @override
  String toString() {
    return 'Dashboard1Event(limit: $limit)';
  }
}

/// @nodoc
abstract mixin class $Dashboard1EventCopyWith<$Res> {
  factory $Dashboard1EventCopyWith(
    Dashboard1Event value,
    $Res Function(Dashboard1Event) _then,
  ) = _$Dashboard1EventCopyWithImpl;
  @useResult
  $Res call({int limit});
}

/// @nodoc
class _$Dashboard1EventCopyWithImpl<$Res>
    implements $Dashboard1EventCopyWith<$Res> {
  _$Dashboard1EventCopyWithImpl(this._self, this._then);

  final Dashboard1Event _self;
  final $Res Function(Dashboard1Event) _then;

  /// Create a copy of Dashboard1Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? limit = null}) {
    return _then(
      _self.copyWith(
        limit: null == limit
            ? _self.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _LoadProducts implements Dashboard1Event {
  const _LoadProducts({required this.limit});

  @override
  final int limit;

  /// Create a copy of Dashboard1Event
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadProductsCopyWith<_LoadProducts> get copyWith =>
      __$LoadProductsCopyWithImpl<_LoadProducts>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadProducts &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limit);

  @override
  String toString() {
    return 'Dashboard1Event.loadProducts(limit: $limit)';
  }
}

/// @nodoc
abstract mixin class _$LoadProductsCopyWith<$Res>
    implements $Dashboard1EventCopyWith<$Res> {
  factory _$LoadProductsCopyWith(
    _LoadProducts value,
    $Res Function(_LoadProducts) _then,
  ) = __$LoadProductsCopyWithImpl;
  @override
  @useResult
  $Res call({int limit});
}

/// @nodoc
class __$LoadProductsCopyWithImpl<$Res>
    implements _$LoadProductsCopyWith<$Res> {
  __$LoadProductsCopyWithImpl(this._self, this._then);

  final _LoadProducts _self;
  final $Res Function(_LoadProducts) _then;

  /// Create a copy of Dashboard1Event
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? limit = null}) {
    return _then(
      _LoadProducts(
        limit: null == limit
            ? _self.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
mixin _$Dashboard1State {
  NetworkStatus get status;
  List<Product> get products;
  String? get errorMessage;

  /// Create a copy of Dashboard1State
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Dashboard1StateCopyWith<Dashboard1State> get copyWith =>
      _$Dashboard1StateCopyWithImpl<Dashboard1State>(
        this as Dashboard1State,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Dashboard1State &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.products, products) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(products),
    errorMessage,
  );

  @override
  String toString() {
    return 'Dashboard1State(status: $status, products: $products, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $Dashboard1StateCopyWith<$Res> {
  factory $Dashboard1StateCopyWith(
    Dashboard1State value,
    $Res Function(Dashboard1State) _then,
  ) = _$Dashboard1StateCopyWithImpl;
  @useResult
  $Res call({
    NetworkStatus status,
    List<Product> products,
    String? errorMessage,
  });
}

/// @nodoc
class _$Dashboard1StateCopyWithImpl<$Res>
    implements $Dashboard1StateCopyWith<$Res> {
  _$Dashboard1StateCopyWithImpl(this._self, this._then);

  final Dashboard1State _self;
  final $Res Function(Dashboard1State) _then;

  /// Create a copy of Dashboard1State
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? products = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _self.copyWith(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as NetworkStatus,
        products: null == products
            ? _self.products
            : products // ignore: cast_nullable_to_non_nullable
                  as List<Product>,
        errorMessage: freezed == errorMessage
            ? _self.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _Dashboard1State implements Dashboard1State {
  const _Dashboard1State({
    this.status = NetworkStatus.loading,
    final List<Product> products = const [],
    this.errorMessage,
  }) : _products = products;

  @override
  @JsonKey()
  final NetworkStatus status;
  final List<Product> _products;
  @override
  @JsonKey()
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final String? errorMessage;

  /// Create a copy of Dashboard1State
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Dashboard1StateCopyWith<_Dashboard1State> get copyWith =>
      __$Dashboard1StateCopyWithImpl<_Dashboard1State>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Dashboard1State &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(_products),
    errorMessage,
  );

  @override
  String toString() {
    return 'Dashboard1State(status: $status, products: $products, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$Dashboard1StateCopyWith<$Res>
    implements $Dashboard1StateCopyWith<$Res> {
  factory _$Dashboard1StateCopyWith(
    _Dashboard1State value,
    $Res Function(_Dashboard1State) _then,
  ) = __$Dashboard1StateCopyWithImpl;
  @override
  @useResult
  $Res call({
    NetworkStatus status,
    List<Product> products,
    String? errorMessage,
  });
}

/// @nodoc
class __$Dashboard1StateCopyWithImpl<$Res>
    implements _$Dashboard1StateCopyWith<$Res> {
  __$Dashboard1StateCopyWithImpl(this._self, this._then);

  final _Dashboard1State _self;
  final $Res Function(_Dashboard1State) _then;

  /// Create a copy of Dashboard1State
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? products = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _Dashboard1State(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as NetworkStatus,
        products: null == products
            ? _self._products
            : products // ignore: cast_nullable_to_non_nullable
                  as List<Product>,
        errorMessage: freezed == errorMessage
            ? _self.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}
