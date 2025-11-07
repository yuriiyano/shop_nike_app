// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
  id: (json['id'] as num?)?.toInt() ?? 0,
  email: json['email'] as String? ?? '',
  username: json['username'] as String? ?? '',
  password: json['password'] as String? ?? '',
  phone: json['phone'] as String? ?? '',
  address: json['address'] == null
      ? const UserAddress()
      : UserAddress.fromJson(json['address'] as Map<String, dynamic>),
  name: json['name'] == null
      ? const UserFullname()
      : UserFullname.fromJson(json['name'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
      'phone': instance.phone,
      'address': instance.address,
      'name': instance.name,
    };

_UserAddress _$UserAddressFromJson(Map<String, dynamic> json) => _UserAddress(
  city: json['city'] as String? ?? '',
  street: json['street'] as String? ?? '',
  number: (json['number'] as num?)?.toInt() ?? 0,
  zipcode: json['zipcode'] as String? ?? '',
  geolocation: json['geolocation'] == null
      ? const UserGeo()
      : UserGeo.fromJson(json['geolocation'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserAddressToJson(_UserAddress instance) =>
    <String, dynamic>{
      'city': instance.city,
      'street': instance.street,
      'number': instance.number,
      'zipcode': instance.zipcode,
      'geolocation': instance.geolocation,
    };

_UserGeo _$UserGeoFromJson(Map<String, dynamic> json) =>
    _UserGeo(lat: json['lat'] as String?, long: json['long'] as String?);

Map<String, dynamic> _$UserGeoToJson(_UserGeo instance) => <String, dynamic>{
  'lat': instance.lat,
  'long': instance.long,
};

_UserFullname _$UserFullnameFromJson(Map<String, dynamic> json) =>
    _UserFullname(
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
    );

Map<String, dynamic> _$UserFullnameToJson(_UserFullname instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
    };
