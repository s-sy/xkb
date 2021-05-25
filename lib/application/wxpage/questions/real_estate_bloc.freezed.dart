// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'real_estate_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RealEstateEventTearOff {
  const _$RealEstateEventTearOff();

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
  _Releaseprealestate releaseprealestate(String value) {
    return _Releaseprealestate(
      value,
    );
  }

// ignore: unused_element
  _Commentrealestate commentrealestate(
      String value, Map<String, dynamic> maps) {
    return _Commentrealestate(
      value,
      maps,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $RealEstateEvent = _$RealEstateEventTearOff();

/// @nodoc
mixin _$RealEstateEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(Map<String, dynamic> affData),
    @required Result chagecurrent(),
    @required Result releaseprealestate(String value),
    @required Result commentrealestate(String value, Map<String, dynamic> maps),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(Map<String, dynamic> affData),
    Result chagecurrent(),
    Result releaseprealestate(String value),
    Result commentrealestate(String value, Map<String, dynamic> maps),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result chagecurrent(_Chagecurrent value),
    @required Result releaseprealestate(_Releaseprealestate value),
    @required Result commentrealestate(_Commentrealestate value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result chagecurrent(_Chagecurrent value),
    Result releaseprealestate(_Releaseprealestate value),
    Result commentrealestate(_Commentrealestate value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $RealEstateEventCopyWith<$Res> {
  factory $RealEstateEventCopyWith(
          RealEstateEvent value, $Res Function(RealEstateEvent) then) =
      _$RealEstateEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$RealEstateEventCopyWithImpl<$Res>
    implements $RealEstateEventCopyWith<$Res> {
  _$RealEstateEventCopyWithImpl(this._value, this._then);

  final RealEstateEvent _value;
  // ignore: unused_field
  final $Res Function(RealEstateEvent) _then;
}

/// @nodoc
abstract class _$StartedCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) then) =
      __$StartedCopyWithImpl<$Res>;
  $Res call({Map<String, dynamic> affData});
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> extends _$RealEstateEventCopyWithImpl<$Res>
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
    return 'RealEstateEvent.started(affData: $affData)';
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
    @required Result releaseprealestate(String value),
    @required Result commentrealestate(String value, Map<String, dynamic> maps),
  }) {
    assert(started != null);
    assert(chagecurrent != null);
    assert(releaseprealestate != null);
    assert(commentrealestate != null);
    return started(affData);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(Map<String, dynamic> affData),
    Result chagecurrent(),
    Result releaseprealestate(String value),
    Result commentrealestate(String value, Map<String, dynamic> maps),
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
    @required Result releaseprealestate(_Releaseprealestate value),
    @required Result commentrealestate(_Commentrealestate value),
  }) {
    assert(started != null);
    assert(chagecurrent != null);
    assert(releaseprealestate != null);
    assert(commentrealestate != null);
    return started(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result chagecurrent(_Chagecurrent value),
    Result releaseprealestate(_Releaseprealestate value),
    Result commentrealestate(_Commentrealestate value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements RealEstateEvent {
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
    extends _$RealEstateEventCopyWithImpl<$Res>
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
    return 'RealEstateEvent.chagecurrent()';
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
    @required Result releaseprealestate(String value),
    @required Result commentrealestate(String value, Map<String, dynamic> maps),
  }) {
    assert(started != null);
    assert(chagecurrent != null);
    assert(releaseprealestate != null);
    assert(commentrealestate != null);
    return chagecurrent();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(Map<String, dynamic> affData),
    Result chagecurrent(),
    Result releaseprealestate(String value),
    Result commentrealestate(String value, Map<String, dynamic> maps),
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
    @required Result releaseprealestate(_Releaseprealestate value),
    @required Result commentrealestate(_Commentrealestate value),
  }) {
    assert(started != null);
    assert(chagecurrent != null);
    assert(releaseprealestate != null);
    assert(commentrealestate != null);
    return chagecurrent(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result chagecurrent(_Chagecurrent value),
    Result releaseprealestate(_Releaseprealestate value),
    Result commentrealestate(_Commentrealestate value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (chagecurrent != null) {
      return chagecurrent(this);
    }
    return orElse();
  }
}

abstract class _Chagecurrent implements RealEstateEvent {
  const factory _Chagecurrent() = _$_Chagecurrent;
}

/// @nodoc
abstract class _$ReleaseprealestateCopyWith<$Res> {
  factory _$ReleaseprealestateCopyWith(
          _Releaseprealestate value, $Res Function(_Releaseprealestate) then) =
      __$ReleaseprealestateCopyWithImpl<$Res>;
  $Res call({String value});
}

/// @nodoc
class __$ReleaseprealestateCopyWithImpl<$Res>
    extends _$RealEstateEventCopyWithImpl<$Res>
    implements _$ReleaseprealestateCopyWith<$Res> {
  __$ReleaseprealestateCopyWithImpl(
      _Releaseprealestate _value, $Res Function(_Releaseprealestate) _then)
      : super(_value, (v) => _then(v as _Releaseprealestate));

  @override
  _Releaseprealestate get _value => super._value as _Releaseprealestate;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(_Releaseprealestate(
      value == freezed ? _value.value : value as String,
    ));
  }
}

/// @nodoc
class _$_Releaseprealestate implements _Releaseprealestate {
  const _$_Releaseprealestate(this.value) : assert(value != null);

  @override
  final String value;

  @override
  String toString() {
    return 'RealEstateEvent.releaseprealestate(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Releaseprealestate &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  _$ReleaseprealestateCopyWith<_Releaseprealestate> get copyWith =>
      __$ReleaseprealestateCopyWithImpl<_Releaseprealestate>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(Map<String, dynamic> affData),
    @required Result chagecurrent(),
    @required Result releaseprealestate(String value),
    @required Result commentrealestate(String value, Map<String, dynamic> maps),
  }) {
    assert(started != null);
    assert(chagecurrent != null);
    assert(releaseprealestate != null);
    assert(commentrealestate != null);
    return releaseprealestate(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(Map<String, dynamic> affData),
    Result chagecurrent(),
    Result releaseprealestate(String value),
    Result commentrealestate(String value, Map<String, dynamic> maps),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (releaseprealestate != null) {
      return releaseprealestate(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result chagecurrent(_Chagecurrent value),
    @required Result releaseprealestate(_Releaseprealestate value),
    @required Result commentrealestate(_Commentrealestate value),
  }) {
    assert(started != null);
    assert(chagecurrent != null);
    assert(releaseprealestate != null);
    assert(commentrealestate != null);
    return releaseprealestate(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result chagecurrent(_Chagecurrent value),
    Result releaseprealestate(_Releaseprealestate value),
    Result commentrealestate(_Commentrealestate value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (releaseprealestate != null) {
      return releaseprealestate(this);
    }
    return orElse();
  }
}

abstract class _Releaseprealestate implements RealEstateEvent {
  const factory _Releaseprealestate(String value) = _$_Releaseprealestate;

  String get value;
  _$ReleaseprealestateCopyWith<_Releaseprealestate> get copyWith;
}

/// @nodoc
abstract class _$CommentrealestateCopyWith<$Res> {
  factory _$CommentrealestateCopyWith(
          _Commentrealestate value, $Res Function(_Commentrealestate) then) =
      __$CommentrealestateCopyWithImpl<$Res>;
  $Res call({String value, Map<String, dynamic> maps});
}

/// @nodoc
class __$CommentrealestateCopyWithImpl<$Res>
    extends _$RealEstateEventCopyWithImpl<$Res>
    implements _$CommentrealestateCopyWith<$Res> {
  __$CommentrealestateCopyWithImpl(
      _Commentrealestate _value, $Res Function(_Commentrealestate) _then)
      : super(_value, (v) => _then(v as _Commentrealestate));

  @override
  _Commentrealestate get _value => super._value as _Commentrealestate;

  @override
  $Res call({
    Object value = freezed,
    Object maps = freezed,
  }) {
    return _then(_Commentrealestate(
      value == freezed ? _value.value : value as String,
      maps == freezed ? _value.maps : maps as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
class _$_Commentrealestate implements _Commentrealestate {
  const _$_Commentrealestate(this.value, this.maps)
      : assert(value != null),
        assert(maps != null);

  @override
  final String value;
  @override
  final Map<String, dynamic> maps;

  @override
  String toString() {
    return 'RealEstateEvent.commentrealestate(value: $value, maps: $maps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Commentrealestate &&
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
  _$CommentrealestateCopyWith<_Commentrealestate> get copyWith =>
      __$CommentrealestateCopyWithImpl<_Commentrealestate>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(Map<String, dynamic> affData),
    @required Result chagecurrent(),
    @required Result releaseprealestate(String value),
    @required Result commentrealestate(String value, Map<String, dynamic> maps),
  }) {
    assert(started != null);
    assert(chagecurrent != null);
    assert(releaseprealestate != null);
    assert(commentrealestate != null);
    return commentrealestate(value, maps);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(Map<String, dynamic> affData),
    Result chagecurrent(),
    Result releaseprealestate(String value),
    Result commentrealestate(String value, Map<String, dynamic> maps),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (commentrealestate != null) {
      return commentrealestate(value, maps);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result chagecurrent(_Chagecurrent value),
    @required Result releaseprealestate(_Releaseprealestate value),
    @required Result commentrealestate(_Commentrealestate value),
  }) {
    assert(started != null);
    assert(chagecurrent != null);
    assert(releaseprealestate != null);
    assert(commentrealestate != null);
    return commentrealestate(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result chagecurrent(_Chagecurrent value),
    Result releaseprealestate(_Releaseprealestate value),
    Result commentrealestate(_Commentrealestate value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (commentrealestate != null) {
      return commentrealestate(this);
    }
    return orElse();
  }
}

abstract class _Commentrealestate implements RealEstateEvent {
  const factory _Commentrealestate(String value, Map<String, dynamic> maps) =
      _$_Commentrealestate;

  String get value;
  Map<String, dynamic> get maps;
  _$CommentrealestateCopyWith<_Commentrealestate> get copyWith;
}

/// @nodoc
class _$RealEstateStateTearOff {
  const _$RealEstateStateTearOff();

// ignore: unused_element
  _RealEstateState call(
      {int current, int size, List<dynamic> questionsPageAll, bool isComment}) {
    return _RealEstateState(
      current: current,
      size: size,
      questionsPageAll: questionsPageAll,
      isComment: isComment,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $RealEstateState = _$RealEstateStateTearOff();

/// @nodoc
mixin _$RealEstateState {
  int get current;
  int get size;
  List<dynamic> get questionsPageAll;
  bool get isComment;

  $RealEstateStateCopyWith<RealEstateState> get copyWith;
}

/// @nodoc
abstract class $RealEstateStateCopyWith<$Res> {
  factory $RealEstateStateCopyWith(
          RealEstateState value, $Res Function(RealEstateState) then) =
      _$RealEstateStateCopyWithImpl<$Res>;
  $Res call(
      {int current, int size, List<dynamic> questionsPageAll, bool isComment});
}

/// @nodoc
class _$RealEstateStateCopyWithImpl<$Res>
    implements $RealEstateStateCopyWith<$Res> {
  _$RealEstateStateCopyWithImpl(this._value, this._then);

  final RealEstateState _value;
  // ignore: unused_field
  final $Res Function(RealEstateState) _then;

  @override
  $Res call({
    Object current = freezed,
    Object size = freezed,
    Object questionsPageAll = freezed,
    Object isComment = freezed,
  }) {
    return _then(_value.copyWith(
      current: current == freezed ? _value.current : current as int,
      size: size == freezed ? _value.size : size as int,
      questionsPageAll: questionsPageAll == freezed
          ? _value.questionsPageAll
          : questionsPageAll as List<dynamic>,
      isComment: isComment == freezed ? _value.isComment : isComment as bool,
    ));
  }
}

/// @nodoc
abstract class _$RealEstateStateCopyWith<$Res>
    implements $RealEstateStateCopyWith<$Res> {
  factory _$RealEstateStateCopyWith(
          _RealEstateState value, $Res Function(_RealEstateState) then) =
      __$RealEstateStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int current, int size, List<dynamic> questionsPageAll, bool isComment});
}

/// @nodoc
class __$RealEstateStateCopyWithImpl<$Res>
    extends _$RealEstateStateCopyWithImpl<$Res>
    implements _$RealEstateStateCopyWith<$Res> {
  __$RealEstateStateCopyWithImpl(
      _RealEstateState _value, $Res Function(_RealEstateState) _then)
      : super(_value, (v) => _then(v as _RealEstateState));

  @override
  _RealEstateState get _value => super._value as _RealEstateState;

  @override
  $Res call({
    Object current = freezed,
    Object size = freezed,
    Object questionsPageAll = freezed,
    Object isComment = freezed,
  }) {
    return _then(_RealEstateState(
      current: current == freezed ? _value.current : current as int,
      size: size == freezed ? _value.size : size as int,
      questionsPageAll: questionsPageAll == freezed
          ? _value.questionsPageAll
          : questionsPageAll as List<dynamic>,
      isComment: isComment == freezed ? _value.isComment : isComment as bool,
    ));
  }
}

/// @nodoc
class _$_RealEstateState implements _RealEstateState {
  const _$_RealEstateState(
      {this.current, this.size, this.questionsPageAll, this.isComment});

  @override
  final int current;
  @override
  final int size;
  @override
  final List<dynamic> questionsPageAll;
  @override
  final bool isComment;

  @override
  String toString() {
    return 'RealEstateState(current: $current, size: $size, questionsPageAll: $questionsPageAll, isComment: $isComment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RealEstateState &&
            (identical(other.current, current) ||
                const DeepCollectionEquality()
                    .equals(other.current, current)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.questionsPageAll, questionsPageAll) ||
                const DeepCollectionEquality()
                    .equals(other.questionsPageAll, questionsPageAll)) &&
            (identical(other.isComment, isComment) ||
                const DeepCollectionEquality()
                    .equals(other.isComment, isComment)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(current) ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(questionsPageAll) ^
      const DeepCollectionEquality().hash(isComment);

  @override
  _$RealEstateStateCopyWith<_RealEstateState> get copyWith =>
      __$RealEstateStateCopyWithImpl<_RealEstateState>(this, _$identity);
}

abstract class _RealEstateState implements RealEstateState {
  const factory _RealEstateState(
      {int current,
      int size,
      List<dynamic> questionsPageAll,
      bool isComment}) = _$_RealEstateState;

  @override
  int get current;
  @override
  int get size;
  @override
  List<dynamic> get questionsPageAll;
  @override
  bool get isComment;
  @override
  _$RealEstateStateCopyWith<_RealEstateState> get copyWith;
}
