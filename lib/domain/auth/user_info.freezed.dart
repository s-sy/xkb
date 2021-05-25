// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UserInfoTearOff {
  const _$UserInfoTearOff();

// ignore: unused_element
  _UserInfo call(
      {String id, String name, String photoUrl, @required String phoneNumber}) {
    return _UserInfo(
      id: id,
      name: name,
      photoUrl: photoUrl,
      phoneNumber: phoneNumber,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $UserInfo = _$UserInfoTearOff();

/// @nodoc
mixin _$UserInfo {
  String get id;
  String get name;
  String get photoUrl;
  String get phoneNumber;

  $UserInfoCopyWith<UserInfo> get copyWith;
}

/// @nodoc
abstract class $UserInfoCopyWith<$Res> {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) then) =
      _$UserInfoCopyWithImpl<$Res>;
  $Res call({String id, String name, String photoUrl, String phoneNumber});
}

/// @nodoc
class _$UserInfoCopyWithImpl<$Res> implements $UserInfoCopyWith<$Res> {
  _$UserInfoCopyWithImpl(this._value, this._then);

  final UserInfo _value;
  // ignore: unused_field
  final $Res Function(UserInfo) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object photoUrl = freezed,
    Object phoneNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
      phoneNumber:
          phoneNumber == freezed ? _value.phoneNumber : phoneNumber as String,
    ));
  }
}

/// @nodoc
abstract class _$UserInfoCopyWith<$Res> implements $UserInfoCopyWith<$Res> {
  factory _$UserInfoCopyWith(_UserInfo value, $Res Function(_UserInfo) then) =
      __$UserInfoCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, String photoUrl, String phoneNumber});
}

/// @nodoc
class __$UserInfoCopyWithImpl<$Res> extends _$UserInfoCopyWithImpl<$Res>
    implements _$UserInfoCopyWith<$Res> {
  __$UserInfoCopyWithImpl(_UserInfo _value, $Res Function(_UserInfo) _then)
      : super(_value, (v) => _then(v as _UserInfo));

  @override
  _UserInfo get _value => super._value as _UserInfo;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object photoUrl = freezed,
    Object phoneNumber = freezed,
  }) {
    return _then(_UserInfo(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
      phoneNumber:
          phoneNumber == freezed ? _value.phoneNumber : phoneNumber as String,
    ));
  }
}

/// @nodoc
class _$_UserInfo extends _UserInfo {
  const _$_UserInfo(
      {this.id, this.name, this.photoUrl, @required this.phoneNumber})
      : assert(phoneNumber != null),
        super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final String photoUrl;
  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'UserInfo(id: $id, name: $name, photoUrl: $photoUrl, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserInfo &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.photoUrl, photoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.photoUrl, photoUrl)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(photoUrl) ^
      const DeepCollectionEquality().hash(phoneNumber);

  @override
  _$UserInfoCopyWith<_UserInfo> get copyWith =>
      __$UserInfoCopyWithImpl<_UserInfo>(this, _$identity);
}

abstract class _UserInfo extends UserInfo {
  const _UserInfo._() : super._();
  const factory _UserInfo(
      {String id,
      String name,
      String photoUrl,
      @required String phoneNumber}) = _$_UserInfo;

  @override
  String get id;
  @override
  String get name;
  @override
  String get photoUrl;
  @override
  String get phoneNumber;
  @override
  _$UserInfoCopyWith<_UserInfo> get copyWith;
}
