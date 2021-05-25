// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_info_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
UserInfoDto _$UserInfoDtoFromJson(Map<String, dynamic> json) {
  return _UserInfoDto.fromJson(json);
}

/// @nodoc
class _$UserInfoDtoTearOff {
  const _$UserInfoDtoTearOff();

// ignore: unused_element
  _UserInfoDto call(
      {String id, String realName, String headimgUrl, @required String phone}) {
    return _UserInfoDto(
      id: id,
      realName: realName,
      headimgUrl: headimgUrl,
      phone: phone,
    );
  }

// ignore: unused_element
  UserInfoDto fromJson(Map<String, Object> json) {
    return UserInfoDto.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $UserInfoDto = _$UserInfoDtoTearOff();

/// @nodoc
mixin _$UserInfoDto {
// @JsonKey(ignore: true) String id,
  String get id;
  String get realName;
  String get headimgUrl;
  String get phone;

  Map<String, dynamic> toJson();
  $UserInfoDtoCopyWith<UserInfoDto> get copyWith;
}

/// @nodoc
abstract class $UserInfoDtoCopyWith<$Res> {
  factory $UserInfoDtoCopyWith(
          UserInfoDto value, $Res Function(UserInfoDto) then) =
      _$UserInfoDtoCopyWithImpl<$Res>;
  $Res call({String id, String realName, String headimgUrl, String phone});
}

/// @nodoc
class _$UserInfoDtoCopyWithImpl<$Res> implements $UserInfoDtoCopyWith<$Res> {
  _$UserInfoDtoCopyWithImpl(this._value, this._then);

  final UserInfoDto _value;
  // ignore: unused_field
  final $Res Function(UserInfoDto) _then;

  @override
  $Res call({
    Object id = freezed,
    Object realName = freezed,
    Object headimgUrl = freezed,
    Object phone = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      realName: realName == freezed ? _value.realName : realName as String,
      headimgUrl:
          headimgUrl == freezed ? _value.headimgUrl : headimgUrl as String,
      phone: phone == freezed ? _value.phone : phone as String,
    ));
  }
}

/// @nodoc
abstract class _$UserInfoDtoCopyWith<$Res>
    implements $UserInfoDtoCopyWith<$Res> {
  factory _$UserInfoDtoCopyWith(
          _UserInfoDto value, $Res Function(_UserInfoDto) then) =
      __$UserInfoDtoCopyWithImpl<$Res>;
  @override
  $Res call({String id, String realName, String headimgUrl, String phone});
}

/// @nodoc
class __$UserInfoDtoCopyWithImpl<$Res> extends _$UserInfoDtoCopyWithImpl<$Res>
    implements _$UserInfoDtoCopyWith<$Res> {
  __$UserInfoDtoCopyWithImpl(
      _UserInfoDto _value, $Res Function(_UserInfoDto) _then)
      : super(_value, (v) => _then(v as _UserInfoDto));

  @override
  _UserInfoDto get _value => super._value as _UserInfoDto;

  @override
  $Res call({
    Object id = freezed,
    Object realName = freezed,
    Object headimgUrl = freezed,
    Object phone = freezed,
  }) {
    return _then(_UserInfoDto(
      id: id == freezed ? _value.id : id as String,
      realName: realName == freezed ? _value.realName : realName as String,
      headimgUrl:
          headimgUrl == freezed ? _value.headimgUrl : headimgUrl as String,
      phone: phone == freezed ? _value.phone : phone as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_UserInfoDto extends _UserInfoDto {
  const _$_UserInfoDto(
      {this.id, this.realName, this.headimgUrl, @required this.phone})
      : assert(phone != null),
        super._();

  factory _$_UserInfoDto.fromJson(Map<String, dynamic> json) =>
      _$_$_UserInfoDtoFromJson(json);

  @override // @JsonKey(ignore: true) String id,
  final String id;
  @override
  final String realName;
  @override
  final String headimgUrl;
  @override
  final String phone;

  @override
  String toString() {
    return 'UserInfoDto(id: $id, realName: $realName, headimgUrl: $headimgUrl, phone: $phone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserInfoDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.realName, realName) ||
                const DeepCollectionEquality()
                    .equals(other.realName, realName)) &&
            (identical(other.headimgUrl, headimgUrl) ||
                const DeepCollectionEquality()
                    .equals(other.headimgUrl, headimgUrl)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(realName) ^
      const DeepCollectionEquality().hash(headimgUrl) ^
      const DeepCollectionEquality().hash(phone);

  @override
  _$UserInfoDtoCopyWith<_UserInfoDto> get copyWith =>
      __$UserInfoDtoCopyWithImpl<_UserInfoDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserInfoDtoToJson(this);
  }
}

abstract class _UserInfoDto extends UserInfoDto {
  const _UserInfoDto._() : super._();
  const factory _UserInfoDto(
      {String id,
      String realName,
      String headimgUrl,
      @required String phone}) = _$_UserInfoDto;

  factory _UserInfoDto.fromJson(Map<String, dynamic> json) =
      _$_UserInfoDto.fromJson;

  @override // @JsonKey(ignore: true) String id,
  String get id;
  @override
  String get realName;
  @override
  String get headimgUrl;
  @override
  String get phone;
  @override
  _$UserInfoDtoCopyWith<_UserInfoDto> get copyWith;
}
