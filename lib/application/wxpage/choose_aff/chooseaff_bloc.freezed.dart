// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'chooseaff_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ChooseaffEventTearOff {
  const _$ChooseaffEventTearOff();

// ignore: unused_element
  _Started started(Map<String, dynamic> data) {
    return _Started(
      data,
    );
  }

// ignore: unused_element
  _Savetendent savetendent(Map<String, Object> data) {
    return _Savetendent(
      data,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ChooseaffEvent = _$ChooseaffEventTearOff();

/// @nodoc
mixin _$ChooseaffEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(Map<String, dynamic> data),
    @required Result savetendent(Map<String, Object> data),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(Map<String, dynamic> data),
    Result savetendent(Map<String, Object> data),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result savetendent(_Savetendent value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result savetendent(_Savetendent value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $ChooseaffEventCopyWith<$Res> {
  factory $ChooseaffEventCopyWith(
          ChooseaffEvent value, $Res Function(ChooseaffEvent) then) =
      _$ChooseaffEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChooseaffEventCopyWithImpl<$Res>
    implements $ChooseaffEventCopyWith<$Res> {
  _$ChooseaffEventCopyWithImpl(this._value, this._then);

  final ChooseaffEvent _value;
  // ignore: unused_field
  final $Res Function(ChooseaffEvent) _then;
}

/// @nodoc
abstract class _$StartedCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) then) =
      __$StartedCopyWithImpl<$Res>;
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> extends _$ChooseaffEventCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(_Started _value, $Res Function(_Started) _then)
      : super(_value, (v) => _then(v as _Started));

  @override
  _Started get _value => super._value as _Started;

  @override
  $Res call({
    Object data = freezed,
  }) {
    return _then(_Started(
      data == freezed ? _value.data : data as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
class _$_Started implements _Started {
  const _$_Started(this.data) : assert(data != null);

  @override
  final Map<String, dynamic> data;

  @override
  String toString() {
    return 'ChooseaffEvent.started(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Started &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @override
  _$StartedCopyWith<_Started> get copyWith =>
      __$StartedCopyWithImpl<_Started>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(Map<String, dynamic> data),
    @required Result savetendent(Map<String, Object> data),
  }) {
    assert(started != null);
    assert(savetendent != null);
    return started(data);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(Map<String, dynamic> data),
    Result savetendent(Map<String, Object> data),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result savetendent(_Savetendent value),
  }) {
    assert(started != null);
    assert(savetendent != null);
    return started(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result savetendent(_Savetendent value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ChooseaffEvent {
  const factory _Started(Map<String, dynamic> data) = _$_Started;

  Map<String, dynamic> get data;
  _$StartedCopyWith<_Started> get copyWith;
}

/// @nodoc
abstract class _$SavetendentCopyWith<$Res> {
  factory _$SavetendentCopyWith(
          _Savetendent value, $Res Function(_Savetendent) then) =
      __$SavetendentCopyWithImpl<$Res>;
  $Res call({Map<String, Object> data});
}

/// @nodoc
class __$SavetendentCopyWithImpl<$Res>
    extends _$ChooseaffEventCopyWithImpl<$Res>
    implements _$SavetendentCopyWith<$Res> {
  __$SavetendentCopyWithImpl(
      _Savetendent _value, $Res Function(_Savetendent) _then)
      : super(_value, (v) => _then(v as _Savetendent));

  @override
  _Savetendent get _value => super._value as _Savetendent;

  @override
  $Res call({
    Object data = freezed,
  }) {
    return _then(_Savetendent(
      data == freezed ? _value.data : data as Map<String, Object>,
    ));
  }
}

/// @nodoc
class _$_Savetendent implements _Savetendent {
  const _$_Savetendent(this.data) : assert(data != null);

  @override
  final Map<String, Object> data;

  @override
  String toString() {
    return 'ChooseaffEvent.savetendent(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Savetendent &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @override
  _$SavetendentCopyWith<_Savetendent> get copyWith =>
      __$SavetendentCopyWithImpl<_Savetendent>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(Map<String, dynamic> data),
    @required Result savetendent(Map<String, Object> data),
  }) {
    assert(started != null);
    assert(savetendent != null);
    return savetendent(data);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(Map<String, dynamic> data),
    Result savetendent(Map<String, Object> data),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (savetendent != null) {
      return savetendent(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result savetendent(_Savetendent value),
  }) {
    assert(started != null);
    assert(savetendent != null);
    return savetendent(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result savetendent(_Savetendent value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (savetendent != null) {
      return savetendent(this);
    }
    return orElse();
  }
}

abstract class _Savetendent implements ChooseaffEvent {
  const factory _Savetendent(Map<String, Object> data) = _$_Savetendent;

  Map<String, Object> get data;
  _$SavetendentCopyWith<_Savetendent> get copyWith;
}

/// @nodoc
class _$ChooseaffStateTearOff {
  const _$ChooseaffStateTearOff();

// ignore: unused_element
  _ChooseaffState call({List<dynamic> affList}) {
    return _ChooseaffState(
      affList: affList,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ChooseaffState = _$ChooseaffStateTearOff();

/// @nodoc
mixin _$ChooseaffState {
  List<dynamic> get affList;

  $ChooseaffStateCopyWith<ChooseaffState> get copyWith;
}

/// @nodoc
abstract class $ChooseaffStateCopyWith<$Res> {
  factory $ChooseaffStateCopyWith(
          ChooseaffState value, $Res Function(ChooseaffState) then) =
      _$ChooseaffStateCopyWithImpl<$Res>;
  $Res call({List<dynamic> affList});
}

/// @nodoc
class _$ChooseaffStateCopyWithImpl<$Res>
    implements $ChooseaffStateCopyWith<$Res> {
  _$ChooseaffStateCopyWithImpl(this._value, this._then);

  final ChooseaffState _value;
  // ignore: unused_field
  final $Res Function(ChooseaffState) _then;

  @override
  $Res call({
    Object affList = freezed,
  }) {
    return _then(_value.copyWith(
      affList: affList == freezed ? _value.affList : affList as List<dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$ChooseaffStateCopyWith<$Res>
    implements $ChooseaffStateCopyWith<$Res> {
  factory _$ChooseaffStateCopyWith(
          _ChooseaffState value, $Res Function(_ChooseaffState) then) =
      __$ChooseaffStateCopyWithImpl<$Res>;
  @override
  $Res call({List<dynamic> affList});
}

/// @nodoc
class __$ChooseaffStateCopyWithImpl<$Res>
    extends _$ChooseaffStateCopyWithImpl<$Res>
    implements _$ChooseaffStateCopyWith<$Res> {
  __$ChooseaffStateCopyWithImpl(
      _ChooseaffState _value, $Res Function(_ChooseaffState) _then)
      : super(_value, (v) => _then(v as _ChooseaffState));

  @override
  _ChooseaffState get _value => super._value as _ChooseaffState;

  @override
  $Res call({
    Object affList = freezed,
  }) {
    return _then(_ChooseaffState(
      affList: affList == freezed ? _value.affList : affList as List<dynamic>,
    ));
  }
}

/// @nodoc
class _$_ChooseaffState implements _ChooseaffState {
  const _$_ChooseaffState({this.affList});

  @override
  final List<dynamic> affList;

  @override
  String toString() {
    return 'ChooseaffState(affList: $affList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChooseaffState &&
            (identical(other.affList, affList) ||
                const DeepCollectionEquality().equals(other.affList, affList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(affList);

  @override
  _$ChooseaffStateCopyWith<_ChooseaffState> get copyWith =>
      __$ChooseaffStateCopyWithImpl<_ChooseaffState>(this, _$identity);
}

abstract class _ChooseaffState implements ChooseaffState {
  const factory _ChooseaffState({List<dynamic> affList}) = _$_ChooseaffState;

  @override
  List<dynamic> get affList;
  @override
  _$ChooseaffStateCopyWith<_ChooseaffState> get copyWith;
}
