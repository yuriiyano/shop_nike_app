import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_nike_app/core/index.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
sealed class UserProfile with _$UserProfile {
  const factory UserProfile({
    @Default(0) int id,
    @Default('') String email,
    @Default('') String username,
    @Default('') String password,
    @Default('') String phone,
    @Default(UserAddress()) UserAddress address,
    @Default(UserFullname()) UserFullname name,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

@freezed
sealed class UserAddress with _$UserAddress {
  const factory UserAddress({
    @Default('') String city,
    @Default('') String street,
    @Default(0) int number,
    @Default('') String zipcode,
    @Default(UserGeo()) UserGeo geolocation,
  }) = _UserAddress;

  factory UserAddress.fromJson(Map<String, dynamic> json) =>
      _$UserAddressFromJson(json);
}

@freezed
sealed class UserGeo with _$UserGeo {
  const factory UserGeo({
    String? lat,
    String? long,
  }) = _UserGeo;

  factory UserGeo.fromJson(Map<String, dynamic> json) =>
      _$UserGeoFromJson(json);
}

@freezed
sealed class UserFullname with _$UserFullname {
  const factory UserFullname({
    String? firstname,
    String? lastname,
  }) = _UserFullname;

  factory UserFullname.fromJson(Map<String, dynamic> json) =>
      _$UserFullnameFromJson(json);
}

extension UserProfileX on UserProfile {
  String get fullName {
    final first = name.firstname?.trim() ?? '';
    final last = name.lastname?.trim() ?? '';
    final combined = '${first.capitalizeFirst} ${last.capitalizeFirst}'.trim();
    return combined.isNotEmpty ? combined : username;
  }
}
