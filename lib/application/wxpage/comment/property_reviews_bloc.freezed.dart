// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'property_reviews_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$PropertyReviewsEventTearOff {
  const _$PropertyReviewsEventTearOff();

// ignore: unused_element
  _Started started(Map<String, dynamic> affData) {
    return _Started(
      affData,
    );
  }

// ignore: unused_element
  _Addcurrent addcurrent() {
    return const _Addcurrent();
  }

// ignore: unused_element
  _Releasepreviews releasepreviews(
      String arrived,
      String ratePrice,
      String ratePlace,
      String rateTraffic,
      String rateMatching,
      String rateEnvironment,
      String remark,
      String check,
      String id) {
    return _Releasepreviews(
      arrived,
      ratePrice,
      ratePlace,
      rateTraffic,
      rateMatching,
      rateEnvironment,
      remark,
      check,
      id,
    );
  }

// ignore: unused_element
  _Commentpreviews commentpreviews(
      String replyValue, String affid, String id, int type, String createid) {
    return _Commentpreviews(
      replyValue,
      affid,
      id,
      type,
      createid,
    );
  }

// ignore: unused_element
  _Replace replace() {
    return const _Replace();
  }

// ignore: unused_element
  _CommentOne commentOne(Map<String, dynamic> maps) {
    return _CommentOne(
      maps,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $PropertyReviewsEvent = _$PropertyReviewsEventTearOff();

/// @nodoc
mixin _$PropertyReviewsEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(Map<String, dynamic> affData),
    @required Result addcurrent(),
    @required
        Result releasepreviews(
            String arrived,
            String ratePrice,
            String ratePlace,
            String rateTraffic,
            String rateMatching,
            String rateEnvironment,
            String remark,
            String check,
            String id),
    @required
        Result commentpreviews(String replyValue, String affid, String id,
            int type, String createid),
    @required Result replace(),
    @required Result commentOne(Map<String, dynamic> maps),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(Map<String, dynamic> affData),
    Result addcurrent(),
    Result releasepreviews(
        String arrived,
        String ratePrice,
        String ratePlace,
        String rateTraffic,
        String rateMatching,
        String rateEnvironment,
        String remark,
        String check,
        String id),
    Result commentpreviews(
        String replyValue, String affid, String id, int type, String createid),
    Result replace(),
    Result commentOne(Map<String, dynamic> maps),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result addcurrent(_Addcurrent value),
    @required Result releasepreviews(_Releasepreviews value),
    @required Result commentpreviews(_Commentpreviews value),
    @required Result replace(_Replace value),
    @required Result commentOne(_CommentOne value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result addcurrent(_Addcurrent value),
    Result releasepreviews(_Releasepreviews value),
    Result commentpreviews(_Commentpreviews value),
    Result replace(_Replace value),
    Result commentOne(_CommentOne value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $PropertyReviewsEventCopyWith<$Res> {
  factory $PropertyReviewsEventCopyWith(PropertyReviewsEvent value,
          $Res Function(PropertyReviewsEvent) then) =
      _$PropertyReviewsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PropertyReviewsEventCopyWithImpl<$Res>
    implements $PropertyReviewsEventCopyWith<$Res> {
  _$PropertyReviewsEventCopyWithImpl(this._value, this._then);

  final PropertyReviewsEvent _value;
  // ignore: unused_field
  final $Res Function(PropertyReviewsEvent) _then;
}

/// @nodoc
abstract class _$StartedCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) then) =
      __$StartedCopyWithImpl<$Res>;
  $Res call({Map<String, dynamic> affData});
}

/// @nodoc
class __$StartedCopyWithImpl<$Res>
    extends _$PropertyReviewsEventCopyWithImpl<$Res>
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
    return 'PropertyReviewsEvent.started(affData: $affData)';
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
    @required Result addcurrent(),
    @required
        Result releasepreviews(
            String arrived,
            String ratePrice,
            String ratePlace,
            String rateTraffic,
            String rateMatching,
            String rateEnvironment,
            String remark,
            String check,
            String id),
    @required
        Result commentpreviews(String replyValue, String affid, String id,
            int type, String createid),
    @required Result replace(),
    @required Result commentOne(Map<String, dynamic> maps),
  }) {
    assert(started != null);
    assert(addcurrent != null);
    assert(releasepreviews != null);
    assert(commentpreviews != null);
    assert(replace != null);
    assert(commentOne != null);
    return started(affData);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(Map<String, dynamic> affData),
    Result addcurrent(),
    Result releasepreviews(
        String arrived,
        String ratePrice,
        String ratePlace,
        String rateTraffic,
        String rateMatching,
        String rateEnvironment,
        String remark,
        String check,
        String id),
    Result commentpreviews(
        String replyValue, String affid, String id, int type, String createid),
    Result replace(),
    Result commentOne(Map<String, dynamic> maps),
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
    @required Result addcurrent(_Addcurrent value),
    @required Result releasepreviews(_Releasepreviews value),
    @required Result commentpreviews(_Commentpreviews value),
    @required Result replace(_Replace value),
    @required Result commentOne(_CommentOne value),
  }) {
    assert(started != null);
    assert(addcurrent != null);
    assert(releasepreviews != null);
    assert(commentpreviews != null);
    assert(replace != null);
    assert(commentOne != null);
    return started(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result addcurrent(_Addcurrent value),
    Result releasepreviews(_Releasepreviews value),
    Result commentpreviews(_Commentpreviews value),
    Result replace(_Replace value),
    Result commentOne(_CommentOne value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements PropertyReviewsEvent {
  const factory _Started(Map<String, dynamic> affData) = _$_Started;

  Map<String, dynamic> get affData;
  _$StartedCopyWith<_Started> get copyWith;
}

/// @nodoc
abstract class _$AddcurrentCopyWith<$Res> {
  factory _$AddcurrentCopyWith(
          _Addcurrent value, $Res Function(_Addcurrent) then) =
      __$AddcurrentCopyWithImpl<$Res>;
}

/// @nodoc
class __$AddcurrentCopyWithImpl<$Res>
    extends _$PropertyReviewsEventCopyWithImpl<$Res>
    implements _$AddcurrentCopyWith<$Res> {
  __$AddcurrentCopyWithImpl(
      _Addcurrent _value, $Res Function(_Addcurrent) _then)
      : super(_value, (v) => _then(v as _Addcurrent));

  @override
  _Addcurrent get _value => super._value as _Addcurrent;
}

/// @nodoc
class _$_Addcurrent implements _Addcurrent {
  const _$_Addcurrent();

  @override
  String toString() {
    return 'PropertyReviewsEvent.addcurrent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Addcurrent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(Map<String, dynamic> affData),
    @required Result addcurrent(),
    @required
        Result releasepreviews(
            String arrived,
            String ratePrice,
            String ratePlace,
            String rateTraffic,
            String rateMatching,
            String rateEnvironment,
            String remark,
            String check,
            String id),
    @required
        Result commentpreviews(String replyValue, String affid, String id,
            int type, String createid),
    @required Result replace(),
    @required Result commentOne(Map<String, dynamic> maps),
  }) {
    assert(started != null);
    assert(addcurrent != null);
    assert(releasepreviews != null);
    assert(commentpreviews != null);
    assert(replace != null);
    assert(commentOne != null);
    return addcurrent();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(Map<String, dynamic> affData),
    Result addcurrent(),
    Result releasepreviews(
        String arrived,
        String ratePrice,
        String ratePlace,
        String rateTraffic,
        String rateMatching,
        String rateEnvironment,
        String remark,
        String check,
        String id),
    Result commentpreviews(
        String replyValue, String affid, String id, int type, String createid),
    Result replace(),
    Result commentOne(Map<String, dynamic> maps),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (addcurrent != null) {
      return addcurrent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result addcurrent(_Addcurrent value),
    @required Result releasepreviews(_Releasepreviews value),
    @required Result commentpreviews(_Commentpreviews value),
    @required Result replace(_Replace value),
    @required Result commentOne(_CommentOne value),
  }) {
    assert(started != null);
    assert(addcurrent != null);
    assert(releasepreviews != null);
    assert(commentpreviews != null);
    assert(replace != null);
    assert(commentOne != null);
    return addcurrent(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result addcurrent(_Addcurrent value),
    Result releasepreviews(_Releasepreviews value),
    Result commentpreviews(_Commentpreviews value),
    Result replace(_Replace value),
    Result commentOne(_CommentOne value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (addcurrent != null) {
      return addcurrent(this);
    }
    return orElse();
  }
}

abstract class _Addcurrent implements PropertyReviewsEvent {
  const factory _Addcurrent() = _$_Addcurrent;
}

/// @nodoc
abstract class _$ReleasepreviewsCopyWith<$Res> {
  factory _$ReleasepreviewsCopyWith(
          _Releasepreviews value, $Res Function(_Releasepreviews) then) =
      __$ReleasepreviewsCopyWithImpl<$Res>;
  $Res call(
      {String arrived,
      String ratePrice,
      String ratePlace,
      String rateTraffic,
      String rateMatching,
      String rateEnvironment,
      String remark,
      String check,
      String id});
}

/// @nodoc
class __$ReleasepreviewsCopyWithImpl<$Res>
    extends _$PropertyReviewsEventCopyWithImpl<$Res>
    implements _$ReleasepreviewsCopyWith<$Res> {
  __$ReleasepreviewsCopyWithImpl(
      _Releasepreviews _value, $Res Function(_Releasepreviews) _then)
      : super(_value, (v) => _then(v as _Releasepreviews));

  @override
  _Releasepreviews get _value => super._value as _Releasepreviews;

  @override
  $Res call({
    Object arrived = freezed,
    Object ratePrice = freezed,
    Object ratePlace = freezed,
    Object rateTraffic = freezed,
    Object rateMatching = freezed,
    Object rateEnvironment = freezed,
    Object remark = freezed,
    Object check = freezed,
    Object id = freezed,
  }) {
    return _then(_Releasepreviews(
      arrived == freezed ? _value.arrived : arrived as String,
      ratePrice == freezed ? _value.ratePrice : ratePrice as String,
      ratePlace == freezed ? _value.ratePlace : ratePlace as String,
      rateTraffic == freezed ? _value.rateTraffic : rateTraffic as String,
      rateMatching == freezed ? _value.rateMatching : rateMatching as String,
      rateEnvironment == freezed
          ? _value.rateEnvironment
          : rateEnvironment as String,
      remark == freezed ? _value.remark : remark as String,
      check == freezed ? _value.check : check as String,
      id == freezed ? _value.id : id as String,
    ));
  }
}

/// @nodoc
class _$_Releasepreviews implements _Releasepreviews {
  const _$_Releasepreviews(
      this.arrived,
      this.ratePrice,
      this.ratePlace,
      this.rateTraffic,
      this.rateMatching,
      this.rateEnvironment,
      this.remark,
      this.check,
      this.id)
      : assert(arrived != null),
        assert(ratePrice != null),
        assert(ratePlace != null),
        assert(rateTraffic != null),
        assert(rateMatching != null),
        assert(rateEnvironment != null),
        assert(remark != null),
        assert(check != null),
        assert(id != null);

  @override
  final String arrived;
  @override
  final String ratePrice;
  @override
  final String ratePlace;
  @override
  final String rateTraffic;
  @override
  final String rateMatching;
  @override
  final String rateEnvironment;
  @override
  final String remark;
  @override
  final String check;
  @override
  final String id;

  @override
  String toString() {
    return 'PropertyReviewsEvent.releasepreviews(arrived: $arrived, ratePrice: $ratePrice, ratePlace: $ratePlace, rateTraffic: $rateTraffic, rateMatching: $rateMatching, rateEnvironment: $rateEnvironment, remark: $remark, check: $check, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Releasepreviews &&
            (identical(other.arrived, arrived) ||
                const DeepCollectionEquality()
                    .equals(other.arrived, arrived)) &&
            (identical(other.ratePrice, ratePrice) ||
                const DeepCollectionEquality()
                    .equals(other.ratePrice, ratePrice)) &&
            (identical(other.ratePlace, ratePlace) ||
                const DeepCollectionEquality()
                    .equals(other.ratePlace, ratePlace)) &&
            (identical(other.rateTraffic, rateTraffic) ||
                const DeepCollectionEquality()
                    .equals(other.rateTraffic, rateTraffic)) &&
            (identical(other.rateMatching, rateMatching) ||
                const DeepCollectionEquality()
                    .equals(other.rateMatching, rateMatching)) &&
            (identical(other.rateEnvironment, rateEnvironment) ||
                const DeepCollectionEquality()
                    .equals(other.rateEnvironment, rateEnvironment)) &&
            (identical(other.remark, remark) ||
                const DeepCollectionEquality().equals(other.remark, remark)) &&
            (identical(other.check, check) ||
                const DeepCollectionEquality().equals(other.check, check)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(arrived) ^
      const DeepCollectionEquality().hash(ratePrice) ^
      const DeepCollectionEquality().hash(ratePlace) ^
      const DeepCollectionEquality().hash(rateTraffic) ^
      const DeepCollectionEquality().hash(rateMatching) ^
      const DeepCollectionEquality().hash(rateEnvironment) ^
      const DeepCollectionEquality().hash(remark) ^
      const DeepCollectionEquality().hash(check) ^
      const DeepCollectionEquality().hash(id);

  @override
  _$ReleasepreviewsCopyWith<_Releasepreviews> get copyWith =>
      __$ReleasepreviewsCopyWithImpl<_Releasepreviews>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(Map<String, dynamic> affData),
    @required Result addcurrent(),
    @required
        Result releasepreviews(
            String arrived,
            String ratePrice,
            String ratePlace,
            String rateTraffic,
            String rateMatching,
            String rateEnvironment,
            String remark,
            String check,
            String id),
    @required
        Result commentpreviews(String replyValue, String affid, String id,
            int type, String createid),
    @required Result replace(),
    @required Result commentOne(Map<String, dynamic> maps),
  }) {
    assert(started != null);
    assert(addcurrent != null);
    assert(releasepreviews != null);
    assert(commentpreviews != null);
    assert(replace != null);
    assert(commentOne != null);
    return releasepreviews(arrived, ratePrice, ratePlace, rateTraffic,
        rateMatching, rateEnvironment, remark, check, id);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(Map<String, dynamic> affData),
    Result addcurrent(),
    Result releasepreviews(
        String arrived,
        String ratePrice,
        String ratePlace,
        String rateTraffic,
        String rateMatching,
        String rateEnvironment,
        String remark,
        String check,
        String id),
    Result commentpreviews(
        String replyValue, String affid, String id, int type, String createid),
    Result replace(),
    Result commentOne(Map<String, dynamic> maps),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (releasepreviews != null) {
      return releasepreviews(arrived, ratePrice, ratePlace, rateTraffic,
          rateMatching, rateEnvironment, remark, check, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result addcurrent(_Addcurrent value),
    @required Result releasepreviews(_Releasepreviews value),
    @required Result commentpreviews(_Commentpreviews value),
    @required Result replace(_Replace value),
    @required Result commentOne(_CommentOne value),
  }) {
    assert(started != null);
    assert(addcurrent != null);
    assert(releasepreviews != null);
    assert(commentpreviews != null);
    assert(replace != null);
    assert(commentOne != null);
    return releasepreviews(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result addcurrent(_Addcurrent value),
    Result releasepreviews(_Releasepreviews value),
    Result commentpreviews(_Commentpreviews value),
    Result replace(_Replace value),
    Result commentOne(_CommentOne value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (releasepreviews != null) {
      return releasepreviews(this);
    }
    return orElse();
  }
}

abstract class _Releasepreviews implements PropertyReviewsEvent {
  const factory _Releasepreviews(
      String arrived,
      String ratePrice,
      String ratePlace,
      String rateTraffic,
      String rateMatching,
      String rateEnvironment,
      String remark,
      String check,
      String id) = _$_Releasepreviews;

  String get arrived;
  String get ratePrice;
  String get ratePlace;
  String get rateTraffic;
  String get rateMatching;
  String get rateEnvironment;
  String get remark;
  String get check;
  String get id;
  _$ReleasepreviewsCopyWith<_Releasepreviews> get copyWith;
}

/// @nodoc
abstract class _$CommentpreviewsCopyWith<$Res> {
  factory _$CommentpreviewsCopyWith(
          _Commentpreviews value, $Res Function(_Commentpreviews) then) =
      __$CommentpreviewsCopyWithImpl<$Res>;
  $Res call(
      {String replyValue, String affid, String id, int type, String createid});
}

/// @nodoc
class __$CommentpreviewsCopyWithImpl<$Res>
    extends _$PropertyReviewsEventCopyWithImpl<$Res>
    implements _$CommentpreviewsCopyWith<$Res> {
  __$CommentpreviewsCopyWithImpl(
      _Commentpreviews _value, $Res Function(_Commentpreviews) _then)
      : super(_value, (v) => _then(v as _Commentpreviews));

  @override
  _Commentpreviews get _value => super._value as _Commentpreviews;

  @override
  $Res call({
    Object replyValue = freezed,
    Object affid = freezed,
    Object id = freezed,
    Object type = freezed,
    Object createid = freezed,
  }) {
    return _then(_Commentpreviews(
      replyValue == freezed ? _value.replyValue : replyValue as String,
      affid == freezed ? _value.affid : affid as String,
      id == freezed ? _value.id : id as String,
      type == freezed ? _value.type : type as int,
      createid == freezed ? _value.createid : createid as String,
    ));
  }
}

/// @nodoc
class _$_Commentpreviews implements _Commentpreviews {
  const _$_Commentpreviews(
      this.replyValue, this.affid, this.id, this.type, this.createid)
      : assert(replyValue != null),
        assert(affid != null),
        assert(id != null),
        assert(type != null),
        assert(createid != null);

  @override
  final String replyValue;
  @override
  final String affid;
  @override
  final String id;
  @override
  final int type;
  @override
  final String createid;

  @override
  String toString() {
    return 'PropertyReviewsEvent.commentpreviews(replyValue: $replyValue, affid: $affid, id: $id, type: $type, createid: $createid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Commentpreviews &&
            (identical(other.replyValue, replyValue) ||
                const DeepCollectionEquality()
                    .equals(other.replyValue, replyValue)) &&
            (identical(other.affid, affid) ||
                const DeepCollectionEquality().equals(other.affid, affid)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.createid, createid) ||
                const DeepCollectionEquality()
                    .equals(other.createid, createid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(replyValue) ^
      const DeepCollectionEquality().hash(affid) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(createid);

  @override
  _$CommentpreviewsCopyWith<_Commentpreviews> get copyWith =>
      __$CommentpreviewsCopyWithImpl<_Commentpreviews>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(Map<String, dynamic> affData),
    @required Result addcurrent(),
    @required
        Result releasepreviews(
            String arrived,
            String ratePrice,
            String ratePlace,
            String rateTraffic,
            String rateMatching,
            String rateEnvironment,
            String remark,
            String check,
            String id),
    @required
        Result commentpreviews(String replyValue, String affid, String id,
            int type, String createid),
    @required Result replace(),
    @required Result commentOne(Map<String, dynamic> maps),
  }) {
    assert(started != null);
    assert(addcurrent != null);
    assert(releasepreviews != null);
    assert(commentpreviews != null);
    assert(replace != null);
    assert(commentOne != null);
    return commentpreviews(replyValue, affid, id, type, createid);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(Map<String, dynamic> affData),
    Result addcurrent(),
    Result releasepreviews(
        String arrived,
        String ratePrice,
        String ratePlace,
        String rateTraffic,
        String rateMatching,
        String rateEnvironment,
        String remark,
        String check,
        String id),
    Result commentpreviews(
        String replyValue, String affid, String id, int type, String createid),
    Result replace(),
    Result commentOne(Map<String, dynamic> maps),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (commentpreviews != null) {
      return commentpreviews(replyValue, affid, id, type, createid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result addcurrent(_Addcurrent value),
    @required Result releasepreviews(_Releasepreviews value),
    @required Result commentpreviews(_Commentpreviews value),
    @required Result replace(_Replace value),
    @required Result commentOne(_CommentOne value),
  }) {
    assert(started != null);
    assert(addcurrent != null);
    assert(releasepreviews != null);
    assert(commentpreviews != null);
    assert(replace != null);
    assert(commentOne != null);
    return commentpreviews(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result addcurrent(_Addcurrent value),
    Result releasepreviews(_Releasepreviews value),
    Result commentpreviews(_Commentpreviews value),
    Result replace(_Replace value),
    Result commentOne(_CommentOne value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (commentpreviews != null) {
      return commentpreviews(this);
    }
    return orElse();
  }
}

abstract class _Commentpreviews implements PropertyReviewsEvent {
  const factory _Commentpreviews(String replyValue, String affid, String id,
      int type, String createid) = _$_Commentpreviews;

  String get replyValue;
  String get affid;
  String get id;
  int get type;
  String get createid;
  _$CommentpreviewsCopyWith<_Commentpreviews> get copyWith;
}

/// @nodoc
abstract class _$ReplaceCopyWith<$Res> {
  factory _$ReplaceCopyWith(_Replace value, $Res Function(_Replace) then) =
      __$ReplaceCopyWithImpl<$Res>;
}

/// @nodoc
class __$ReplaceCopyWithImpl<$Res>
    extends _$PropertyReviewsEventCopyWithImpl<$Res>
    implements _$ReplaceCopyWith<$Res> {
  __$ReplaceCopyWithImpl(_Replace _value, $Res Function(_Replace) _then)
      : super(_value, (v) => _then(v as _Replace));

  @override
  _Replace get _value => super._value as _Replace;
}

/// @nodoc
class _$_Replace implements _Replace {
  const _$_Replace();

  @override
  String toString() {
    return 'PropertyReviewsEvent.replace()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Replace);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(Map<String, dynamic> affData),
    @required Result addcurrent(),
    @required
        Result releasepreviews(
            String arrived,
            String ratePrice,
            String ratePlace,
            String rateTraffic,
            String rateMatching,
            String rateEnvironment,
            String remark,
            String check,
            String id),
    @required
        Result commentpreviews(String replyValue, String affid, String id,
            int type, String createid),
    @required Result replace(),
    @required Result commentOne(Map<String, dynamic> maps),
  }) {
    assert(started != null);
    assert(addcurrent != null);
    assert(releasepreviews != null);
    assert(commentpreviews != null);
    assert(replace != null);
    assert(commentOne != null);
    return replace();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(Map<String, dynamic> affData),
    Result addcurrent(),
    Result releasepreviews(
        String arrived,
        String ratePrice,
        String ratePlace,
        String rateTraffic,
        String rateMatching,
        String rateEnvironment,
        String remark,
        String check,
        String id),
    Result commentpreviews(
        String replyValue, String affid, String id, int type, String createid),
    Result replace(),
    Result commentOne(Map<String, dynamic> maps),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (replace != null) {
      return replace();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result addcurrent(_Addcurrent value),
    @required Result releasepreviews(_Releasepreviews value),
    @required Result commentpreviews(_Commentpreviews value),
    @required Result replace(_Replace value),
    @required Result commentOne(_CommentOne value),
  }) {
    assert(started != null);
    assert(addcurrent != null);
    assert(releasepreviews != null);
    assert(commentpreviews != null);
    assert(replace != null);
    assert(commentOne != null);
    return replace(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result addcurrent(_Addcurrent value),
    Result releasepreviews(_Releasepreviews value),
    Result commentpreviews(_Commentpreviews value),
    Result replace(_Replace value),
    Result commentOne(_CommentOne value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (replace != null) {
      return replace(this);
    }
    return orElse();
  }
}

abstract class _Replace implements PropertyReviewsEvent {
  const factory _Replace() = _$_Replace;
}

/// @nodoc
abstract class _$CommentOneCopyWith<$Res> {
  factory _$CommentOneCopyWith(
          _CommentOne value, $Res Function(_CommentOne) then) =
      __$CommentOneCopyWithImpl<$Res>;
  $Res call({Map<String, dynamic> maps});
}

/// @nodoc
class __$CommentOneCopyWithImpl<$Res>
    extends _$PropertyReviewsEventCopyWithImpl<$Res>
    implements _$CommentOneCopyWith<$Res> {
  __$CommentOneCopyWithImpl(
      _CommentOne _value, $Res Function(_CommentOne) _then)
      : super(_value, (v) => _then(v as _CommentOne));

  @override
  _CommentOne get _value => super._value as _CommentOne;

  @override
  $Res call({
    Object maps = freezed,
  }) {
    return _then(_CommentOne(
      maps == freezed ? _value.maps : maps as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
class _$_CommentOne implements _CommentOne {
  const _$_CommentOne(this.maps) : assert(maps != null);

  @override
  final Map<String, dynamic> maps;

  @override
  String toString() {
    return 'PropertyReviewsEvent.commentOne(maps: $maps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CommentOne &&
            (identical(other.maps, maps) ||
                const DeepCollectionEquality().equals(other.maps, maps)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(maps);

  @override
  _$CommentOneCopyWith<_CommentOne> get copyWith =>
      __$CommentOneCopyWithImpl<_CommentOne>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(Map<String, dynamic> affData),
    @required Result addcurrent(),
    @required
        Result releasepreviews(
            String arrived,
            String ratePrice,
            String ratePlace,
            String rateTraffic,
            String rateMatching,
            String rateEnvironment,
            String remark,
            String check,
            String id),
    @required
        Result commentpreviews(String replyValue, String affid, String id,
            int type, String createid),
    @required Result replace(),
    @required Result commentOne(Map<String, dynamic> maps),
  }) {
    assert(started != null);
    assert(addcurrent != null);
    assert(releasepreviews != null);
    assert(commentpreviews != null);
    assert(replace != null);
    assert(commentOne != null);
    return commentOne(maps);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(Map<String, dynamic> affData),
    Result addcurrent(),
    Result releasepreviews(
        String arrived,
        String ratePrice,
        String ratePlace,
        String rateTraffic,
        String rateMatching,
        String rateEnvironment,
        String remark,
        String check,
        String id),
    Result commentpreviews(
        String replyValue, String affid, String id, int type, String createid),
    Result replace(),
    Result commentOne(Map<String, dynamic> maps),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (commentOne != null) {
      return commentOne(maps);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result addcurrent(_Addcurrent value),
    @required Result releasepreviews(_Releasepreviews value),
    @required Result commentpreviews(_Commentpreviews value),
    @required Result replace(_Replace value),
    @required Result commentOne(_CommentOne value),
  }) {
    assert(started != null);
    assert(addcurrent != null);
    assert(releasepreviews != null);
    assert(commentpreviews != null);
    assert(replace != null);
    assert(commentOne != null);
    return commentOne(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result addcurrent(_Addcurrent value),
    Result releasepreviews(_Releasepreviews value),
    Result commentpreviews(_Commentpreviews value),
    Result replace(_Replace value),
    Result commentOne(_CommentOne value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (commentOne != null) {
      return commentOne(this);
    }
    return orElse();
  }
}

abstract class _CommentOne implements PropertyReviewsEvent {
  const factory _CommentOne(Map<String, dynamic> maps) = _$_CommentOne;

  Map<String, dynamic> get maps;
  _$CommentOneCopyWith<_CommentOne> get copyWith;
}

/// @nodoc
class _$PropertyReviewsStateTearOff {
  const _$PropertyReviewsStateTearOff();

// ignore: unused_element
  _PropertyReviewsState call(
      {int current,
      int size,
      List<dynamic> propertyreviewsList,
      bool isComment,
      List<dynamic> commentOne}) {
    return _PropertyReviewsState(
      current: current,
      size: size,
      propertyreviewsList: propertyreviewsList,
      isComment: isComment,
      commentOne: commentOne,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $PropertyReviewsState = _$PropertyReviewsStateTearOff();

/// @nodoc
mixin _$PropertyReviewsState {
  int get current;
  int get size;
  List<dynamic> get propertyreviewsList;
  bool get isComment;
  List<dynamic> get commentOne;

  $PropertyReviewsStateCopyWith<PropertyReviewsState> get copyWith;
}

/// @nodoc
abstract class $PropertyReviewsStateCopyWith<$Res> {
  factory $PropertyReviewsStateCopyWith(PropertyReviewsState value,
          $Res Function(PropertyReviewsState) then) =
      _$PropertyReviewsStateCopyWithImpl<$Res>;
  $Res call(
      {int current,
      int size,
      List<dynamic> propertyreviewsList,
      bool isComment,
      List<dynamic> commentOne});
}

/// @nodoc
class _$PropertyReviewsStateCopyWithImpl<$Res>
    implements $PropertyReviewsStateCopyWith<$Res> {
  _$PropertyReviewsStateCopyWithImpl(this._value, this._then);

  final PropertyReviewsState _value;
  // ignore: unused_field
  final $Res Function(PropertyReviewsState) _then;

  @override
  $Res call({
    Object current = freezed,
    Object size = freezed,
    Object propertyreviewsList = freezed,
    Object isComment = freezed,
    Object commentOne = freezed,
  }) {
    return _then(_value.copyWith(
      current: current == freezed ? _value.current : current as int,
      size: size == freezed ? _value.size : size as int,
      propertyreviewsList: propertyreviewsList == freezed
          ? _value.propertyreviewsList
          : propertyreviewsList as List<dynamic>,
      isComment: isComment == freezed ? _value.isComment : isComment as bool,
      commentOne: commentOne == freezed
          ? _value.commentOne
          : commentOne as List<dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$PropertyReviewsStateCopyWith<$Res>
    implements $PropertyReviewsStateCopyWith<$Res> {
  factory _$PropertyReviewsStateCopyWith(_PropertyReviewsState value,
          $Res Function(_PropertyReviewsState) then) =
      __$PropertyReviewsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int current,
      int size,
      List<dynamic> propertyreviewsList,
      bool isComment,
      List<dynamic> commentOne});
}

/// @nodoc
class __$PropertyReviewsStateCopyWithImpl<$Res>
    extends _$PropertyReviewsStateCopyWithImpl<$Res>
    implements _$PropertyReviewsStateCopyWith<$Res> {
  __$PropertyReviewsStateCopyWithImpl(
      _PropertyReviewsState _value, $Res Function(_PropertyReviewsState) _then)
      : super(_value, (v) => _then(v as _PropertyReviewsState));

  @override
  _PropertyReviewsState get _value => super._value as _PropertyReviewsState;

  @override
  $Res call({
    Object current = freezed,
    Object size = freezed,
    Object propertyreviewsList = freezed,
    Object isComment = freezed,
    Object commentOne = freezed,
  }) {
    return _then(_PropertyReviewsState(
      current: current == freezed ? _value.current : current as int,
      size: size == freezed ? _value.size : size as int,
      propertyreviewsList: propertyreviewsList == freezed
          ? _value.propertyreviewsList
          : propertyreviewsList as List<dynamic>,
      isComment: isComment == freezed ? _value.isComment : isComment as bool,
      commentOne: commentOne == freezed
          ? _value.commentOne
          : commentOne as List<dynamic>,
    ));
  }
}

/// @nodoc
class _$_PropertyReviewsState implements _PropertyReviewsState {
  const _$_PropertyReviewsState(
      {this.current,
      this.size,
      this.propertyreviewsList,
      this.isComment,
      this.commentOne});

  @override
  final int current;
  @override
  final int size;
  @override
  final List<dynamic> propertyreviewsList;
  @override
  final bool isComment;
  @override
  final List<dynamic> commentOne;

  @override
  String toString() {
    return 'PropertyReviewsState(current: $current, size: $size, propertyreviewsList: $propertyreviewsList, isComment: $isComment, commentOne: $commentOne)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PropertyReviewsState &&
            (identical(other.current, current) ||
                const DeepCollectionEquality()
                    .equals(other.current, current)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.propertyreviewsList, propertyreviewsList) ||
                const DeepCollectionEquality()
                    .equals(other.propertyreviewsList, propertyreviewsList)) &&
            (identical(other.isComment, isComment) ||
                const DeepCollectionEquality()
                    .equals(other.isComment, isComment)) &&
            (identical(other.commentOne, commentOne) ||
                const DeepCollectionEquality()
                    .equals(other.commentOne, commentOne)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(current) ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(propertyreviewsList) ^
      const DeepCollectionEquality().hash(isComment) ^
      const DeepCollectionEquality().hash(commentOne);

  @override
  _$PropertyReviewsStateCopyWith<_PropertyReviewsState> get copyWith =>
      __$PropertyReviewsStateCopyWithImpl<_PropertyReviewsState>(
          this, _$identity);
}

abstract class _PropertyReviewsState implements PropertyReviewsState {
  const factory _PropertyReviewsState(
      {int current,
      int size,
      List<dynamic> propertyreviewsList,
      bool isComment,
      List<dynamic> commentOne}) = _$_PropertyReviewsState;

  @override
  int get current;
  @override
  int get size;
  @override
  List<dynamic> get propertyreviewsList;
  @override
  bool get isComment;
  @override
  List<dynamic> get commentOne;
  @override
  _$PropertyReviewsStateCopyWith<_PropertyReviewsState> get copyWith;
}
