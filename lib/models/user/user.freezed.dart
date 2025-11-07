// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfile {
  int get id;
  String get email;
  String get username;
  String get password;
  String get phone;
  UserAddress get address;
  UserFullname get name;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<UserProfile> get copyWith =>
      _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserProfile &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    email,
    username,
    password,
    phone,
    address,
    name,
  );

  @override
  String toString() {
    return 'UserProfile(id: $id, email: $email, username: $username, password: $password, phone: $phone, address: $address, name: $name)';
  }
}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
    UserProfile value,
    $Res Function(UserProfile) _then,
  ) = _$UserProfileCopyWithImpl;
  @useResult
  $Res call({
    int id,
    String email,
    String username,
    String password,
    String phone,
    UserAddress address,
    UserFullname name,
  });

  $UserAddressCopyWith<$Res> get address;
  $UserFullnameCopyWith<$Res> get name;
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res> implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? username = null,
    Object? password = null,
    Object? phone = null,
    Object? address = null,
    Object? name = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        email: null == email
            ? _self.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _self.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _self.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _self.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        address: null == address
            ? _self.address
            : address // ignore: cast_nullable_to_non_nullable
                  as UserAddress,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as UserFullname,
      ),
    );
  }

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserAddressCopyWith<$Res> get address {
    return $UserAddressCopyWith<$Res>(_self.address, (value) {
      return _then(_self.copyWith(address: value));
    });
  }

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserFullnameCopyWith<$Res> get name {
    return $UserFullnameCopyWith<$Res>(_self.name, (value) {
      return _then(_self.copyWith(name: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _UserProfile implements UserProfile {
  const _UserProfile({
    this.id = 0,
    this.email = '',
    this.username = '',
    this.password = '',
    this.phone = '',
    this.address = const UserAddress(),
    this.name = const UserFullname(),
  });
  factory _UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String phone;
  @override
  @JsonKey()
  final UserAddress address;
  @override
  @JsonKey()
  final UserFullname name;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserProfileCopyWith<_UserProfile> get copyWith =>
      __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserProfileToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserProfile &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    email,
    username,
    password,
    phone,
    address,
    name,
  );

  @override
  String toString() {
    return 'UserProfile(id: $id, email: $email, username: $username, password: $password, phone: $phone, address: $address, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(
    _UserProfile value,
    $Res Function(_UserProfile) _then,
  ) = __$UserProfileCopyWithImpl;
  @override
  @useResult
  $Res call({
    int id,
    String email,
    String username,
    String password,
    String phone,
    UserAddress address,
    UserFullname name,
  });

  @override
  $UserAddressCopyWith<$Res> get address;
  @override
  $UserFullnameCopyWith<$Res> get name;
}

/// @nodoc
class __$UserProfileCopyWithImpl<$Res> implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? username = null,
    Object? password = null,
    Object? phone = null,
    Object? address = null,
    Object? name = null,
  }) {
    return _then(
      _UserProfile(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        email: null == email
            ? _self.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _self.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _self.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _self.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        address: null == address
            ? _self.address
            : address // ignore: cast_nullable_to_non_nullable
                  as UserAddress,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as UserFullname,
      ),
    );
  }

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserAddressCopyWith<$Res> get address {
    return $UserAddressCopyWith<$Res>(_self.address, (value) {
      return _then(_self.copyWith(address: value));
    });
  }

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserFullnameCopyWith<$Res> get name {
    return $UserFullnameCopyWith<$Res>(_self.name, (value) {
      return _then(_self.copyWith(name: value));
    });
  }
}

/// @nodoc
mixin _$UserAddress {
  String get city;
  String get street;
  int get number;
  String get zipcode;
  UserGeo get geolocation;

  /// Create a copy of UserAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserAddressCopyWith<UserAddress> get copyWith =>
      _$UserAddressCopyWithImpl<UserAddress>(this as UserAddress, _$identity);

  /// Serializes this UserAddress to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserAddress &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.zipcode, zipcode) || other.zipcode == zipcode) &&
            (identical(other.geolocation, geolocation) ||
                other.geolocation == geolocation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, city, street, number, zipcode, geolocation);

  @override
  String toString() {
    return 'UserAddress(city: $city, street: $street, number: $number, zipcode: $zipcode, geolocation: $geolocation)';
  }
}

/// @nodoc
abstract mixin class $UserAddressCopyWith<$Res> {
  factory $UserAddressCopyWith(
    UserAddress value,
    $Res Function(UserAddress) _then,
  ) = _$UserAddressCopyWithImpl;
  @useResult
  $Res call({
    String city,
    String street,
    int number,
    String zipcode,
    UserGeo geolocation,
  });

  $UserGeoCopyWith<$Res> get geolocation;
}

/// @nodoc
class _$UserAddressCopyWithImpl<$Res> implements $UserAddressCopyWith<$Res> {
  _$UserAddressCopyWithImpl(this._self, this._then);

  final UserAddress _self;
  final $Res Function(UserAddress) _then;

  /// Create a copy of UserAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? street = null,
    Object? number = null,
    Object? zipcode = null,
    Object? geolocation = null,
  }) {
    return _then(
      _self.copyWith(
        city: null == city
            ? _self.city
            : city // ignore: cast_nullable_to_non_nullable
                  as String,
        street: null == street
            ? _self.street
            : street // ignore: cast_nullable_to_non_nullable
                  as String,
        number: null == number
            ? _self.number
            : number // ignore: cast_nullable_to_non_nullable
                  as int,
        zipcode: null == zipcode
            ? _self.zipcode
            : zipcode // ignore: cast_nullable_to_non_nullable
                  as String,
        geolocation: null == geolocation
            ? _self.geolocation
            : geolocation // ignore: cast_nullable_to_non_nullable
                  as UserGeo,
      ),
    );
  }

  /// Create a copy of UserAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserGeoCopyWith<$Res> get geolocation {
    return $UserGeoCopyWith<$Res>(_self.geolocation, (value) {
      return _then(_self.copyWith(geolocation: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _UserAddress implements UserAddress {
  const _UserAddress({
    this.city = '',
    this.street = '',
    this.number = 0,
    this.zipcode = '',
    this.geolocation = const UserGeo(),
  });
  factory _UserAddress.fromJson(Map<String, dynamic> json) =>
      _$UserAddressFromJson(json);

  @override
  @JsonKey()
  final String city;
  @override
  @JsonKey()
  final String street;
  @override
  @JsonKey()
  final int number;
  @override
  @JsonKey()
  final String zipcode;
  @override
  @JsonKey()
  final UserGeo geolocation;

  /// Create a copy of UserAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserAddressCopyWith<_UserAddress> get copyWith =>
      __$UserAddressCopyWithImpl<_UserAddress>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserAddressToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserAddress &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.zipcode, zipcode) || other.zipcode == zipcode) &&
            (identical(other.geolocation, geolocation) ||
                other.geolocation == geolocation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, city, street, number, zipcode, geolocation);

  @override
  String toString() {
    return 'UserAddress(city: $city, street: $street, number: $number, zipcode: $zipcode, geolocation: $geolocation)';
  }
}

/// @nodoc
abstract mixin class _$UserAddressCopyWith<$Res>
    implements $UserAddressCopyWith<$Res> {
  factory _$UserAddressCopyWith(
    _UserAddress value,
    $Res Function(_UserAddress) _then,
  ) = __$UserAddressCopyWithImpl;
  @override
  @useResult
  $Res call({
    String city,
    String street,
    int number,
    String zipcode,
    UserGeo geolocation,
  });

  @override
  $UserGeoCopyWith<$Res> get geolocation;
}

/// @nodoc
class __$UserAddressCopyWithImpl<$Res> implements _$UserAddressCopyWith<$Res> {
  __$UserAddressCopyWithImpl(this._self, this._then);

  final _UserAddress _self;
  final $Res Function(_UserAddress) _then;

  /// Create a copy of UserAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? city = null,
    Object? street = null,
    Object? number = null,
    Object? zipcode = null,
    Object? geolocation = null,
  }) {
    return _then(
      _UserAddress(
        city: null == city
            ? _self.city
            : city // ignore: cast_nullable_to_non_nullable
                  as String,
        street: null == street
            ? _self.street
            : street // ignore: cast_nullable_to_non_nullable
                  as String,
        number: null == number
            ? _self.number
            : number // ignore: cast_nullable_to_non_nullable
                  as int,
        zipcode: null == zipcode
            ? _self.zipcode
            : zipcode // ignore: cast_nullable_to_non_nullable
                  as String,
        geolocation: null == geolocation
            ? _self.geolocation
            : geolocation // ignore: cast_nullable_to_non_nullable
                  as UserGeo,
      ),
    );
  }

  /// Create a copy of UserAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserGeoCopyWith<$Res> get geolocation {
    return $UserGeoCopyWith<$Res>(_self.geolocation, (value) {
      return _then(_self.copyWith(geolocation: value));
    });
  }
}

/// @nodoc
mixin _$UserGeo {
  String? get lat;
  String? get long;

  /// Create a copy of UserGeo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserGeoCopyWith<UserGeo> get copyWith =>
      _$UserGeoCopyWithImpl<UserGeo>(this as UserGeo, _$identity);

  /// Serializes this UserGeo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserGeo &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lat, long);

  @override
  String toString() {
    return 'UserGeo(lat: $lat, long: $long)';
  }
}

/// @nodoc
abstract mixin class $UserGeoCopyWith<$Res> {
  factory $UserGeoCopyWith(UserGeo value, $Res Function(UserGeo) _then) =
      _$UserGeoCopyWithImpl;
  @useResult
  $Res call({String? lat, String? long});
}

/// @nodoc
class _$UserGeoCopyWithImpl<$Res> implements $UserGeoCopyWith<$Res> {
  _$UserGeoCopyWithImpl(this._self, this._then);

  final UserGeo _self;
  final $Res Function(UserGeo) _then;

  /// Create a copy of UserGeo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? lat = freezed, Object? long = freezed}) {
    return _then(
      _self.copyWith(
        lat: freezed == lat
            ? _self.lat
            : lat // ignore: cast_nullable_to_non_nullable
                  as String?,
        long: freezed == long
            ? _self.long
            : long // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _UserGeo implements UserGeo {
  const _UserGeo({this.lat, this.long});
  factory _UserGeo.fromJson(Map<String, dynamic> json) =>
      _$UserGeoFromJson(json);

  @override
  final String? lat;
  @override
  final String? long;

  /// Create a copy of UserGeo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserGeoCopyWith<_UserGeo> get copyWith =>
      __$UserGeoCopyWithImpl<_UserGeo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserGeoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserGeo &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lat, long);

  @override
  String toString() {
    return 'UserGeo(lat: $lat, long: $long)';
  }
}

/// @nodoc
abstract mixin class _$UserGeoCopyWith<$Res> implements $UserGeoCopyWith<$Res> {
  factory _$UserGeoCopyWith(_UserGeo value, $Res Function(_UserGeo) _then) =
      __$UserGeoCopyWithImpl;
  @override
  @useResult
  $Res call({String? lat, String? long});
}

/// @nodoc
class __$UserGeoCopyWithImpl<$Res> implements _$UserGeoCopyWith<$Res> {
  __$UserGeoCopyWithImpl(this._self, this._then);

  final _UserGeo _self;
  final $Res Function(_UserGeo) _then;

  /// Create a copy of UserGeo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? lat = freezed, Object? long = freezed}) {
    return _then(
      _UserGeo(
        lat: freezed == lat
            ? _self.lat
            : lat // ignore: cast_nullable_to_non_nullable
                  as String?,
        long: freezed == long
            ? _self.long
            : long // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
mixin _$UserFullname {
  String? get firstname;
  String? get lastname;

  /// Create a copy of UserFullname
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserFullnameCopyWith<UserFullname> get copyWith =>
      _$UserFullnameCopyWithImpl<UserFullname>(
        this as UserFullname,
        _$identity,
      );

  /// Serializes this UserFullname to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserFullname &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstname, lastname);

  @override
  String toString() {
    return 'UserFullname(firstname: $firstname, lastname: $lastname)';
  }
}

/// @nodoc
abstract mixin class $UserFullnameCopyWith<$Res> {
  factory $UserFullnameCopyWith(
    UserFullname value,
    $Res Function(UserFullname) _then,
  ) = _$UserFullnameCopyWithImpl;
  @useResult
  $Res call({String? firstname, String? lastname});
}

/// @nodoc
class _$UserFullnameCopyWithImpl<$Res> implements $UserFullnameCopyWith<$Res> {
  _$UserFullnameCopyWithImpl(this._self, this._then);

  final UserFullname _self;
  final $Res Function(UserFullname) _then;

  /// Create a copy of UserFullname
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? firstname = freezed, Object? lastname = freezed}) {
    return _then(
      _self.copyWith(
        firstname: freezed == firstname
            ? _self.firstname
            : firstname // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastname: freezed == lastname
            ? _self.lastname
            : lastname // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _UserFullname implements UserFullname {
  const _UserFullname({this.firstname, this.lastname});
  factory _UserFullname.fromJson(Map<String, dynamic> json) =>
      _$UserFullnameFromJson(json);

  @override
  final String? firstname;
  @override
  final String? lastname;

  /// Create a copy of UserFullname
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserFullnameCopyWith<_UserFullname> get copyWith =>
      __$UserFullnameCopyWithImpl<_UserFullname>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserFullnameToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserFullname &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstname, lastname);

  @override
  String toString() {
    return 'UserFullname(firstname: $firstname, lastname: $lastname)';
  }
}

/// @nodoc
abstract mixin class _$UserFullnameCopyWith<$Res>
    implements $UserFullnameCopyWith<$Res> {
  factory _$UserFullnameCopyWith(
    _UserFullname value,
    $Res Function(_UserFullname) _then,
  ) = __$UserFullnameCopyWithImpl;
  @override
  @useResult
  $Res call({String? firstname, String? lastname});
}

/// @nodoc
class __$UserFullnameCopyWithImpl<$Res>
    implements _$UserFullnameCopyWith<$Res> {
  __$UserFullnameCopyWithImpl(this._self, this._then);

  final _UserFullname _self;
  final $Res Function(_UserFullname) _then;

  /// Create a copy of UserFullname
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? firstname = freezed, Object? lastname = freezed}) {
    return _then(
      _UserFullname(
        firstname: freezed == firstname
            ? _self.firstname
            : firstname // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastname: freezed == lastname
            ? _self.lastname
            : lastname // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}
