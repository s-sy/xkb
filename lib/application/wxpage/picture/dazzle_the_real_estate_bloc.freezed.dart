// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'dazzle_the_real_estate_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$DazzleTheRealEstateEventTearOff {
  const _$DazzleTheRealEstateEventTearOff();

// ignore: unused_element
  _Started started(Map<String, dynamic> affData) {
    return _Started(
      affData,
    );
  }

// ignore: unused_element
  _Chagecurrent chagecurrent() {
    return const _Chagecurrent();
  }

// ignore: unused_element
  _Releasedazzle releasedazzle(String description, List<dynamic> imgData) {
    return _Releasedazzle(
      description,
      imgData,
    );
  }

// ignore: unused_element
  _Commentdazzle commentdazzle(String value, Map<String, dynamic> maps) {
    return _Commentdazzle(
      value,
      maps,
    );
  }

// ignore: unused_element
  _QiNiuLoad qiNiuLoad(String imgPath) {
    return _QiNiuLoad(
      imgPath,
    );
  }

// ignore: unused_element
  _RemoveImg removeImg(int index) {
    return _RemoveImg(
      index,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $DazzleTheRealEstateEvent = _$DazzleTheRealEstateEventTearOff();

/// @nodoc
mixin _$DazzleTheRealEstateEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(Map<String, dynamic> affData),
    @required Result chagecurrent(),
    @required Result releasedazzle(String description, List<dynamic> imgData),
    @required Result commentdazzle(String value, Map<String, dynamic> maps),
    @required Result qiNiuLoad(String imgPath),
    @required Result removeImg(int index),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(Map<String, dynamic> affData),
    Result chagecurrent(),
    Result releasedazzle(String description, List<dynamic> imgData),
    Result commentdazzle(String value, Map<String, dynamic> maps),
    Result qiNiuLoad(String imgPath),
    Result removeImg(int index),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result chagecurrent(_Chagecurrent value),
    @required Result releasedazzle(_Releasedazzle value),
    @required Result commentdazzle(_Commentdazzle value),
    @required Result qiNiuLoad(_QiNiuLoad value),
    @required Result removeImg(_RemoveImg value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result chagecurrent(_Chagecurrent value),
    Result releasedazzle(_Releasedazzle value),
    Result commentdazzle(_Commentdazzle value),
    Result qiNiuLoad(_QiNiuLoad value),
    Result removeImg(_RemoveImg value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $DazzleTheRealEstateEventCopyWith<$Res> {
  factory $DazzleTheRealEstateEventCopyWith(DazzleTheRealEstateEvent value,
          $Res Function(DazzleTheRealEstateEvent) then) =
      _$DazzleTheRealEstateEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$DazzleTheRealEstateEventCopyWithImpl<$Res>
    implements $DazzleTheRealEstateEventCopyWith<$Res> {
  _$DazzleTheRealEstateEventCopyWithImpl(this._value, this._then);

  final DazzleTheRealEstateEvent _value;
  // ignore: unused_field
  final $Res Function(DazzleTheRealEstateEvent) _then;
}

/// @nodoc
abstract class _$StartedCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) then) =
      __$StartedCopyWithImpl<$Res>;
  $Res call({Map<String, dynamic> affData});
}

/// @nodoc
class __$StartedCopyWithImpl<$Res>
    extends _$DazzleTheRealEstateEventCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(_Started _value, $Res Function(_Started) _then)
      : super(_value, (v) => _then(v as _Started));

  @override
  _Started get _value => super._value as _Started;

  @override
  $Res call({
    Object affData = freezed,
  }) {
    return _then(_Started(
      affData == freezed ? _value.affData : affData as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
class _$_Started implements _Started {
  const _$_Started(this.affData) : assert(affData != null);

  @override
  final Map<String, dynamic> affData;

  @override
  String toString() {
    return 'DazzleTheRealEstateEvent.started(affData: $affData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Started &&
            (identical(other.affData, affData) ||
                const DeepCollectionEquality().equals(other.affData, affData)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(affData);

  @override
  _$StartedCopyWith<_Started> get copyWith =>
      __$StartedCopyWithImpl<_Started>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(Map<String, dynamic> affData),
    @required Result chagecurrent(),
    @required Result releasedazzle(String description, List<dynamic> imgData),
    @required Result commentdazzle(String value, Map<String, dynamic> maps),
    @required Result qiNiuLoad(String imgPath),
    @required Result removeImg(int index),
  }) {
    assert(started != null);
    assert(chagecurrent != null);
    assert(releasedazzle != null);
    assert(commentdazzle != null);
    assert(qiNiuLoad != null);
    assert(removeImg != null);
    return started(affData);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(Map<String, dynamic> affData),
    Result chagecurrent(),
    Result releasedazzle(String description, List<dynamic> imgData),
    Result commentdazzle(String value, Map<String, dynamic> maps),
    Result qiNiuLoad(String imgPath),
    Result removeImg(int index),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started(affData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result chagecurrent(_Chagecurrent value),
    @required Result releasedazzle(_Releasedazzle value),
    @required Result commentdazzle(_Commentdazzle value),
    @required Result qiNiuLoad(_QiNiuLoad value),
    @required Result removeImg(_RemoveImg value),
  }) {
    assert(started != null);
    assert(chagecurrent != null);
    assert(releasedazzle != null);
    assert(commentdazzle != null);
    assert(qiNiuLoad != null);
    assert(removeImg != null);
    return started(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result chagecurrent(_Chagecurrent value),
    Result releasedazzle(_Releasedazzle value),
    Result commentdazzle(_Commentdazzle value),
    Result qiNiuLoad(_QiNiuLoad value),
    Result removeImg(_RemoveImg value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements DazzleTheRealEstateEvent {
  const factory _Started(Map<String, dynamic> affData) = _$_Started;

  Map<String, dynamic> get affData;
  _$StartedCopyWith<_Started> get copyWith;
}

/// @nodoc
abstract class _$ChagecurrentCopyWith<$Res> {
  factory _$ChagecurrentCopyWith(
          _Chagecurrent value, $Res Function(_Chagecurrent) then) =
      __$ChagecurrentCopyWithImpl<$Res>;
}

/// @nodoc
class __$ChagecurrentCopyWithImpl<$Res>
    extends _$DazzleTheRealEstateEventCopyWithImpl<$Res>
    implements _$ChagecurrentCopyWith<$Res> {
  __$ChagecurrentCopyWithImpl(
      _Chagecurrent _value, $Res Function(_Chagecurrent) _then)
      : super(_value, (v) => _then(v as _Chagecurrent));

  @override
  _Chagecurrent get _value => super._value as _Chagecurrent;
}

/// @nodoc
class _$_Chagecurrent implements _Chagecurrent {
  const _$_Chagecurrent();

  @override
  String toString() {
    return 'DazzleTheRealEstateEvent.chagecurrent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Chagecurrent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(Map<String, dynamic> affData),
    @required Result chagecurrent(),
    @required Result releasedazzle(String description, List<dynamic> imgData),
    @required Result commentdazzle(String value, Map<String, dynamic> maps),
    @required Result qiNiuLoad(String imgPath),
    @required Result removeImg(int index),
  }) {
    assert(started != null);
    assert(chagecurrent != null);
    assert(releasedazzle != null);
    assert(commentdazzle != null);
    assert(qiNiuLoad != null);
    assert(removeImg != null);
    return chagecurrent();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(Map<String, dynamic> affData),
    Result chagecurrent(),
    Result releasedazzle(String description, List<dynamic> imgData),
    Result commentdazzle(String value, Map<String, dynamic> maps),
    Result qiNiuLoad(String imgPath),
    Result removeImg(int index),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (chagecurrent != null) {
      return chagecurrent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result chagecurrent(_Chagecurrent value),
    @required Result releasedazzle(_Releasedazzle value),
    @required Result commentdazzle(_Commentdazzle value),
    @required Result qiNiuLoad(_QiNiuLoad value),
    @required Result removeImg(_RemoveImg value),
  }) {
    assert(started != null);
    assert(chagecurrent != null);
    assert(releasedazzle != null);
    assert(commentdazzle != null);
    assert(qiNiuLoad != null);
    assert(removeImg != null);
    return chagecurrent(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result chagecurrent(_Chagecurrent value),
    Result releasedazzle(_Releasedazzle value),
    Result commentdazzle(_Commentdazzle value),
    Result qiNiuLoad(_QiNiuLoad value),
    Result removeImg(_RemoveImg value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (chagecurrent != null) {
      return chagecurrent(this);
    }
    return orElse();
  }
}

abstract class _Chagecurrent implements DazzleTheRealEstateEvent {
  const factory _Chagecurrent() = _$_Chagecurrent;
}

/// @nodoc
abstract class _$ReleasedazzleCopyWith<$Res> {
  factory _$ReleasedazzleCopyWith(
          _Releasedazzle value, $Res Function(_Releasedazzle) then) =
      __$ReleasedazzleCopyWithImpl<$Res>;
  $Res call({String description, List<dynamic> imgData});
}

/// @nodoc
class __$ReleasedazzleCopyWithImpl<$Res>
    extends _$DazzleTheRealEstateEventCopyWithImpl<$Res>
    implements _$ReleasedazzleCopyWith<$Res> {
  __$ReleasedazzleCopyWithImpl(
      _Releasedazzle _value, $Res Function(_Releasedazzle) _then)
      : super(_value, (v) => _then(v as _Releasedazzle));

  @override
  _Releasedazzle get _value => super._value as _Releasedazzle;

  @override
  $Res call({
    Object description = freezed,
    Object imgData = freezed,
  }) {
    return _then(_Releasedazzle(
      description == freezed ? _value.description : description as String,
      imgData == freezed ? _value.imgData : imgData as List<dynamic>,
    ));
  }
}

/// @nodoc
class _$_Releasedazzle implements _Releasedazzle {
  const _$_Releasedazzle(this.description, this.imgData)
      : assert(description != null),
        assert(imgData != null);

  @override
  final String description;
  @override
  final List<dynamic> imgData;

  @override
  String toString() {
    return 'DazzleTheRealEstateEvent.releasedazzle(description: $description, imgData: $imgData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Releasedazzle &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.imgData, imgData) ||
                const DeepCollectionEquality().equals(other.imgData, imgData)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(imgData);

  @override
  _$ReleasedazzleCopyWith<_Releasedazzle> get copyWith =>
      __$ReleasedazzleCopyWithImpl<_Releasedazzle>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(Map<String, dynamic> affData),
    @required Result chagecurrent(),
    @required Result releasedazzle(String description, List<dynamic> imgData),
    @required Result commentdazzle(String value, Map<String, dynamic> maps),
    @required Result qiNiuLoad(String imgPath),
    @required Result removeImg(int index),
  }) {
    assert(started != null);
    assert(chagecurrent != null);
    assert(releasedazzle != null);
    assert(commentdazzle != null);
    assert(qiNiuLoad != null);
    assert(removeImg != null);
    return releasedazzle(description, imgData);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(Map<String, dynamic> affData),
    Result chagecurrent(),
    Result releasedazzle(String description, List<dynamic> imgData),
    Result commentdazzle(String value, Map<String, dynamic> maps),
    Result qiNiuLoad(String imgPath),
    Result removeImg(int index),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (releasedazzle != null) {
      return releasedazzle(description, imgData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result chagecurrent(_Chagecurrent value),
    @required Result releasedazzle(_Releasedazzle value),
    @required Result commentdazzle(_Commentdazzle value),
    @required Result qiNiuLoad(_QiNiuLoad value),
    @required Result removeImg(_RemoveImg value),
  }) {
    assert(started != null);
    assert(chagecurrent != null);
    assert(releasedazzle != null);
    assert(commentdazzle != null);
    assert(qiNiuLoad != null);
    assert(removeImg != null);
    return releasedazzle(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result chagecurrent(_Chagecurrent value),
    Result releasedazzle(_Releasedazzle value),
    Result commentdazzle(_Commentdazzle value),
    Result qiNiuLoad(_QiNiuLoad value),
    Result removeImg(_RemoveImg value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (releasedazzle != null) {
      return releasedazzle(this);
    }
    return orElse();
  }
}

abstract class _Releasedazzle implements DazzleTheRealEstateEvent {
  const factory _Releasedazzle(String description, List<dynamic> imgData) =
      _$_Releasedazzle;

  String get description;
  List<dynamic> get imgData;
  _$ReleasedazzleCopyWith<_Releasedazzle> get copyWith;
}

/// @nodoc
abstract class _$CommentdazzleCopyWith<$Res> {
  factory _$CommentdazzleCopyWith(
          _Commentdazzle value, $Res Function(_Commentdazzle) then) =
      __$CommentdazzleCopyWithImpl<$Res>;
  $Res call({String value, Map<String, dynamic> maps});
}

/// @nodoc
class __$CommentdazzleCopyWithImpl<$Res>
    extends _$DazzleTheRealEstateEventCopyWithImpl<$Res>
    implements _$CommentdazzleCopyWith<$Res> {
  __$CommentdazzleCopyWithImpl(
      _Commentdazzle _value, $Res Function(_Commentdazzle) _then)
      : super(_value, (v) => _then(v as _Commentdazzle));

  @override
  _Commentdazzle get _value => super._value as _Commentdazzle;

  @override
  $Res call({
    Object value = freezed,
    Object maps = freezed,
  }) {
    return _then(_Commentdazzle(
      value == freezed ? _value.value : value as String,
      maps == freezed ? _value.maps : maps as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
class _$_Commentdazzle implements _Commentdazzle {
  const _$_Commentdazzle(this.value, this.maps)
      : assert(value != null),
        assert(maps != null);

  @override
  final String value;
  @override
  final Map<String, dynamic> maps;

  @override
  String toString() {
    return 'DazzleTheRealEstateEvent.commentdazzle(value: $value, maps: $maps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Commentdazzle &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.maps, maps) ||
                const DeepCollectionEquality().equals(other.maps, maps)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(maps);

  @override
  _$CommentdazzleCopyWith<_Commentdazzle> get copyWith =>
      __$CommentdazzleCopyWithImpl<_Commentdazzle>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(Map<String, dynamic> affData),
    @required Result chagecurrent(),
    @required Result releasedazzle(String description, List<dynamic> imgData),
    @required Result commentdazzle(String value, Map<String, dynamic> maps),
    @required Result qiNiuLoad(String imgPath),
    @required Result removeImg(int index),
  }) {
    assert(started != null);
    assert(chagecurrent != null);
    assert(releasedazzle != null);
    assert(commentdazzle != null);
    assert(qiNiuLoad != null);
    assert(removeImg != null);
    return commentdazzle(value, maps);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(Map<String, dynamic> affData),
    Result chagecurrent(),
    Result releasedazzle(String description, List<dynamic> imgData),
    Result commentdazzle(String value, Map<String, dynamic> maps),
    Result qiNiuLoad(String imgPath),
    Result removeImg(int index),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (commentdazzle != null) {
      return commentdazzle(value, maps);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result chagecurrent(_Chagecurrent value),
    @required Result releasedazzle(_Releasedazzle value),
    @required Result commentdazzle(_Commentdazzle value),
    @required Result qiNiuLoad(_QiNiuLoad value),
    @required Result removeImg(_RemoveImg value),
  }) {
    assert(started != null);
    assert(chagecurrent != null);
    assert(releasedazzle != null);
    assert(commentdazzle != null);
    assert(qiNiuLoad != null);
    assert(removeImg != null);
    return commentdazzle(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result chagecurrent(_Chagecurrent value),
    Result releasedazzle(_Releasedazzle value),
    Result commentdazzle(_Commentdazzle value),
    Result qiNiuLoad(_QiNiuLoad value),
    Result removeImg(_RemoveImg value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (commentdazzle != null) {
      return commentdazzle(this);
    }
    return orElse();
  }
}

abstract class _Commentdazzle implements DazzleTheRealEstateEvent {
  const factory _Commentdazzle(String value, Map<String, dynamic> maps) =
      _$_Commentdazzle;

  String get value;
  Map<String, dynamic> get maps;
  _$CommentdazzleCopyWith<_Commentdazzle> get copyWith;
}

/// @nodoc
abstract class _$QiNiuLoadCopyWith<$Res> {
  factory _$QiNiuLoadCopyWith(
          _QiNiuLoad value, $Res Function(_QiNiuLoad) then) =
      __$QiNiuLoadCopyWithImpl<$Res>;
  $Res call({String imgPath});
}

/// @nodoc
class __$QiNiuLoadCopyWithImpl<$Res>
    extends _$DazzleTheRealEstateEventCopyWithImpl<$Res>
    implements _$QiNiuLoadCopyWith<$Res> {
  __$QiNiuLoadCopyWithImpl(_QiNiuLoad _value, $Res Function(_QiNiuLoad) _then)
      : super(_value, (v) => _then(v as _QiNiuLoad));

  @override
  _QiNiuLoad get _value => super._value as _QiNiuLoad;

  @override
  $Res call({
    Object imgPath = freezed,
  }) {
    return _then(_QiNiuLoad(
      imgPath == freezed ? _value.imgPath : imgPath as String,
    ));
  }
}

/// @nodoc
class _$_QiNiuLoad implements _QiNiuLoad {
  const _$_QiNiuLoad(this.imgPath) : assert(imgPath != null);

  @override
  final String imgPath;

  @override
  String toString() {
    return 'DazzleTheRealEstateEvent.qiNiuLoad(imgPath: $imgPath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QiNiuLoad &&
            (identical(other.imgPath, imgPath) ||
                const DeepCollectionEquality().equals(other.imgPath, imgPath)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(imgPath);

  @override
  _$QiNiuLoadCopyWith<_QiNiuLoad> get copyWith =>
      __$QiNiuLoadCopyWithImpl<_QiNiuLoad>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(Map<String, dynamic> affData),
    @required Result chagecurrent(),
    @required Result releasedazzle(String description, List<dynamic> imgData),
    @required Result commentdazzle(String value, Map<String, dynamic> maps),
    @required Result qiNiuLoad(String imgPath),
    @required Result removeImg(int index),
  }) {
    assert(started != null);
    assert(chagecurrent != null);
    assert(releasedazzle != null);
    assert(commentdazzle != null);
    assert(qiNiuLoad != null);
    assert(removeImg != null);
    return qiNiuLoad(imgPath);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(Map<String, dynamic> affData),
    Result chagecurrent(),
    Result releasedazzle(String description, List<dynamic> imgData),
    Result commentdazzle(String value, Map<String, dynamic> maps),
    Result qiNiuLoad(String imgPath),
    Result removeImg(int index),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (qiNiuLoad != null) {
      return qiNiuLoad(imgPath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result chagecurrent(_Chagecurrent value),
    @required Result releasedazzle(_Releasedazzle value),
    @required Result commentdazzle(_Commentdazzle value),
    @required Result qiNiuLoad(_QiNiuLoad value),
    @required Result removeImg(_RemoveImg value),
  }) {
    assert(started != null);
    assert(chagecurrent != null);
    assert(releasedazzle != null);
    assert(commentdazzle != null);
    assert(qiNiuLoad != null);
    assert(removeImg != null);
    return qiNiuLoad(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result chagecurrent(_Chagecurrent value),
    Result releasedazzle(_Releasedazzle value),
    Result commentdazzle(_Commentdazzle value),
    Result qiNiuLoad(_QiNiuLoad value),
    Result removeImg(_RemoveImg value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (qiNiuLoad != null) {
      return qiNiuLoad(this);
    }
    return orElse();
  }
}

abstract class _QiNiuLoad implements DazzleTheRealEstateEvent {
  const factory _QiNiuLoad(String imgPath) = _$_QiNiuLoad;

  String get imgPath;
  _$QiNiuLoadCopyWith<_QiNiuLoad> get copyWith;
}

/// @nodoc
abstract class _$RemoveImgCopyWith<$Res> {
  factory _$RemoveImgCopyWith(
          _RemoveImg value, $Res Function(_RemoveImg) then) =
      __$RemoveImgCopyWithImpl<$Res>;
  $Res call({int index});
}

/// @nodoc
class __$RemoveImgCopyWithImpl<$Res>
    extends _$DazzleTheRealEstateEventCopyWithImpl<$Res>
    implements _$RemoveImgCopyWith<$Res> {
  __$RemoveImgCopyWithImpl(_RemoveImg _value, $Res Function(_RemoveImg) _then)
      : super(_value, (v) => _then(v as _RemoveImg));

  @override
  _RemoveImg get _value => super._value as _RemoveImg;

  @override
  $Res call({
    Object index = freezed,
  }) {
    return _then(_RemoveImg(
      index == freezed ? _value.index : index as int,
    ));
  }
}

/// @nodoc
class _$_RemoveImg implements _RemoveImg {
  const _$_RemoveImg(this.index) : assert(index != null);

  @override
  final int index;

  @override
  String toString() {
    return 'DazzleTheRealEstateEvent.removeImg(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RemoveImg &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(index);

  @override
  _$RemoveImgCopyWith<_RemoveImg> get copyWith =>
      __$RemoveImgCopyWithImpl<_RemoveImg>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(Map<String, dynamic> affData),
    @required Result chagecurrent(),
    @required Result releasedazzle(String description, List<dynamic> imgData),
    @required Result commentdazzle(String value, Map<String, dynamic> maps),
    @required Result qiNiuLoad(String imgPath),
    @required Result removeImg(int index),
  }) {
    assert(started != null);
    assert(chagecurrent != null);
    assert(releasedazzle != null);
    assert(commentdazzle != null);
    assert(qiNiuLoad != null);
    assert(removeImg != null);
    return removeImg(index);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(Map<String, dynamic> affData),
    Result chagecurrent(),
    Result releasedazzle(String description, List<dynamic> imgData),
    Result commentdazzle(String value, Map<String, dynamic> maps),
    Result qiNiuLoad(String imgPath),
    Result removeImg(int index),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (removeImg != null) {
      return removeImg(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result chagecurrent(_Chagecurrent value),
    @required Result releasedazzle(_Releasedazzle value),
    @required Result commentdazzle(_Commentdazzle value),
    @required Result qiNiuLoad(_QiNiuLoad value),
    @required Result removeImg(_RemoveImg value),
  }) {
    assert(started != null);
    assert(chagecurrent != null);
    assert(releasedazzle != null);
    assert(commentdazzle != null);
    assert(qiNiuLoad != null);
    assert(removeImg != null);
    return removeImg(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result chagecurrent(_Chagecurrent value),
    Result releasedazzle(_Releasedazzle value),
    Result commentdazzle(_Commentdazzle value),
    Result qiNiuLoad(_QiNiuLoad value),
    Result removeImg(_RemoveImg value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (removeImg != null) {
      return removeImg(this);
    }
    return orElse();
  }
}

abstract class _RemoveImg implements DazzleTheRealEstateEvent {
  const factory _RemoveImg(int index) = _$_RemoveImg;

  int get index;
  _$RemoveImgCopyWith<_RemoveImg> get copyWith;
}

/// @nodoc
class _$DazzleTheRealEstateStateTearOff {
  const _$DazzleTheRealEstateStateTearOff();

// ignore: unused_element
  _DazzleTheRealEstateState call(
      {int current,
      int size,
      List<dynamic> pictureList,
      List<dynamic> imgData}) {
    return _DazzleTheRealEstateState(
      current: current,
      size: size,
      pictureList: pictureList,
      imgData: imgData,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $DazzleTheRealEstateState = _$DazzleTheRealEstateStateTearOff();

/// @nodoc
mixin _$DazzleTheRealEstateState {
  int get current;
  int get size;
  List<dynamic> get pictureList;
  List<dynamic> get imgData;

  $DazzleTheRealEstateStateCopyWith<DazzleTheRealEstateState> get copyWith;
}

/// @nodoc
abstract class $DazzleTheRealEstateStateCopyWith<$Res> {
  factory $DazzleTheRealEstateStateCopyWith(DazzleTheRealEstateState value,
          $Res Function(DazzleTheRealEstateState) then) =
      _$DazzleTheRealEstateStateCopyWithImpl<$Res>;
  $Res call(
      {int current,
      int size,
      List<dynamic> pictureList,
      List<dynamic> imgData});
}

/// @nodoc
class _$DazzleTheRealEstateStateCopyWithImpl<$Res>
    implements $DazzleTheRealEstateStateCopyWith<$Res> {
  _$DazzleTheRealEstateStateCopyWithImpl(this._value, this._then);

  final DazzleTheRealEstateState _value;
  // ignore: unused_field
  final $Res Function(DazzleTheRealEstateState) _then;

  @override
  $Res call({
    Object current = freezed,
    Object size = freezed,
    Object pictureList = freezed,
    Object imgData = freezed,
  }) {
    return _then(_value.copyWith(
      current: current == freezed ? _value.current : current as int,
      size: size == freezed ? _value.size : size as int,
      pictureList: pictureList == freezed
          ? _value.pictureList
          : pictureList as List<dynamic>,
      imgData: imgData == freezed ? _value.imgData : imgData as List<dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$DazzleTheRealEstateStateCopyWith<$Res>
    implements $DazzleTheRealEstateStateCopyWith<$Res> {
  factory _$DazzleTheRealEstateStateCopyWith(_DazzleTheRealEstateState value,
          $Res Function(_DazzleTheRealEstateState) then) =
      __$DazzleTheRealEstateStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int current,
      int size,
      List<dynamic> pictureList,
      List<dynamic> imgData});
}

/// @nodoc
class __$DazzleTheRealEstateStateCopyWithImpl<$Res>
    extends _$DazzleTheRealEstateStateCopyWithImpl<$Res>
    implements _$DazzleTheRealEstateStateCopyWith<$Res> {
  __$DazzleTheRealEstateStateCopyWithImpl(_DazzleTheRealEstateState _value,
      $Res Function(_DazzleTheRealEstateState) _then)
      : super(_value, (v) => _then(v as _DazzleTheRealEstateState));

  @override
  _DazzleTheRealEstateState get _value =>
      super._value as _DazzleTheRealEstateState;

  @override
  $Res call({
    Object current = freezed,
    Object size = freezed,
    Object pictureList = freezed,
    Object imgData = freezed,
  }) {
    return _then(_DazzleTheRealEstateState(
      current: current == freezed ? _value.current : current as int,
      size: size == freezed ? _value.size : size as int,
      pictureList: pictureList == freezed
          ? _value.pictureList
          : pictureList as List<dynamic>,
      imgData: imgData == freezed ? _value.imgData : imgData as List<dynamic>,
    ));
  }
}

/// @nodoc
class _$_DazzleTheRealEstateState implements _DazzleTheRealEstateState {
  const _$_DazzleTheRealEstateState(
      {this.current, this.size, this.pictureList, this.imgData});

  @override
  final int current;
  @override
  final int size;
  @override
  final List<dynamic> pictureList;
  @override
  final List<dynamic> imgData;

  @override
  String toString() {
    return 'DazzleTheRealEstateState(current: $current, size: $size, pictureList: $pictureList, imgData: $imgData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DazzleTheRealEstateState &&
            (identical(other.current, current) ||
                const DeepCollectionEquality()
                    .equals(other.current, current)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.pictureList, pictureList) ||
                const DeepCollectionEquality()
                    .equals(other.pictureList, pictureList)) &&
            (identical(other.imgData, imgData) ||
                const DeepCollectionEquality().equals(other.imgData, imgData)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(current) ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(pictureList) ^
      const DeepCollectionEquality().hash(imgData);

  @override
  _$DazzleTheRealEstateStateCopyWith<_DazzleTheRealEstateState> get copyWith =>
      __$DazzleTheRealEstateStateCopyWithImpl<_DazzleTheRealEstateState>(
          this, _$identity);
}

abstract class _DazzleTheRealEstateState implements DazzleTheRealEstateState {
  const factory _DazzleTheRealEstateState(
      {int current,
      int size,
      List<dynamic> pictureList,
      List<dynamic> imgData}) = _$_DazzleTheRealEstateState;

  @override
  int get current;
  @override
  int get size;
  @override
  List<dynamic> get pictureList;
  @override
  List<dynamic> get imgData;
  @override
  _$DazzleTheRealEstateStateCopyWith<_DazzleTheRealEstateState> get copyWith;
}
