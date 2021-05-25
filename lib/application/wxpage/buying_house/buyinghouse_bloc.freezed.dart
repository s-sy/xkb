// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'buyinghouse_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$BuyinghouseEventTearOff {
  const _$BuyinghouseEventTearOff();

// ignore: unused_element
  _Started started(Map<String, dynamic> affData) {
    return _Started(
      affData,
    );
  }

// ignore: unused_element
  _Checkphone checkphone(String phone) {
    return _Checkphone(
      phone,
    );
  }

// ignore: unused_element
  _Sendworkflow sendworkflow(
      String name, String phone, String remark, String sex) {
    return _Sendworkflow(
      name,
      phone,
      remark,
      sex,
    );
  }

// ignore: unused_element
  _GetTaills getTaills() {
    return const _GetTaills();
  }

// ignore: unused_element
  _RepeatTip repeatTip() {
    return const _RepeatTip();
  }
}

/// @nodoc
// ignore: unused_element
const $BuyinghouseEvent = _$BuyinghouseEventTearOff();

/// @nodoc
mixin _$BuyinghouseEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(Map<String, dynamic> affData),
    @required Result checkphone(String phone),
    @required
        Result sendworkflow(
            String name, String phone, String remark, String sex),
    @required Result getTaills(),
    @required Result repeatTip(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(Map<String, dynamic> affData),
    Result checkphone(String phone),
    Result sendworkflow(String name, String phone, String remark, String sex),
    Result getTaills(),
    Result repeatTip(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result checkphone(_Checkphone value),
    @required Result sendworkflow(_Sendworkflow value),
    @required Result getTaills(_GetTaills value),
    @required Result repeatTip(_RepeatTip value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result checkphone(_Checkphone value),
    Result sendworkflow(_Sendworkflow value),
    Result getTaills(_GetTaills value),
    Result repeatTip(_RepeatTip value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $BuyinghouseEventCopyWith<$Res> {
  factory $BuyinghouseEventCopyWith(
          BuyinghouseEvent value, $Res Function(BuyinghouseEvent) then) =
      _$BuyinghouseEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$BuyinghouseEventCopyWithImpl<$Res>
    implements $BuyinghouseEventCopyWith<$Res> {
  _$BuyinghouseEventCopyWithImpl(this._value, this._then);

  final BuyinghouseEvent _value;
  // ignore: unused_field
  final $Res Function(BuyinghouseEvent) _then;
}

/// @nodoc
abstract class _$StartedCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) then) =
      __$StartedCopyWithImpl<$Res>;
  $Res call({Map<String, dynamic> affData});
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> extends _$BuyinghouseEventCopyWithImpl<$Res>
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
    return 'BuyinghouseEvent.started(affData: $affData)';
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
    @required Result checkphone(String phone),
    @required
        Result sendworkflow(
            String name, String phone, String remark, String sex),
    @required Result getTaills(),
    @required Result repeatTip(),
  }) {
    assert(started != null);
    assert(checkphone != null);
    assert(sendworkflow != null);
    assert(getTaills != null);
    assert(repeatTip != null);
    return started(affData);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(Map<String, dynamic> affData),
    Result checkphone(String phone),
    Result sendworkflow(String name, String phone, String remark, String sex),
    Result getTaills(),
    Result repeatTip(),
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
    @required Result checkphone(_Checkphone value),
    @required Result sendworkflow(_Sendworkflow value),
    @required Result getTaills(_GetTaills value),
    @required Result repeatTip(_RepeatTip value),
  }) {
    assert(started != null);
    assert(checkphone != null);
    assert(sendworkflow != null);
    assert(getTaills != null);
    assert(repeatTip != null);
    return started(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result checkphone(_Checkphone value),
    Result sendworkflow(_Sendworkflow value),
    Result getTaills(_GetTaills value),
    Result repeatTip(_RepeatTip value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements BuyinghouseEvent {
  const factory _Started(Map<String, dynamic> affData) = _$_Started;

  Map<String, dynamic> get affData;
  _$StartedCopyWith<_Started> get copyWith;
}

/// @nodoc
abstract class _$CheckphoneCopyWith<$Res> {
  factory _$CheckphoneCopyWith(
          _Checkphone value, $Res Function(_Checkphone) then) =
      __$CheckphoneCopyWithImpl<$Res>;
  $Res call({String phone});
}

/// @nodoc
class __$CheckphoneCopyWithImpl<$Res>
    extends _$BuyinghouseEventCopyWithImpl<$Res>
    implements _$CheckphoneCopyWith<$Res> {
  __$CheckphoneCopyWithImpl(
      _Checkphone _value, $Res Function(_Checkphone) _then)
      : super(_value, (v) => _then(v as _Checkphone));

  @override
  _Checkphone get _value => super._value as _Checkphone;

  @override
  $Res call({
    Object phone = freezed,
  }) {
    return _then(_Checkphone(
      phone == freezed ? _value.phone : phone as String,
    ));
  }
}

/// @nodoc
class _$_Checkphone implements _Checkphone {
  const _$_Checkphone(this.phone) : assert(phone != null);

  @override
  final String phone;

  @override
  String toString() {
    return 'BuyinghouseEvent.checkphone(phone: $phone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Checkphone &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(phone);

  @override
  _$CheckphoneCopyWith<_Checkphone> get copyWith =>
      __$CheckphoneCopyWithImpl<_Checkphone>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(Map<String, dynamic> affData),
    @required Result checkphone(String phone),
    @required
        Result sendworkflow(
            String name, String phone, String remark, String sex),
    @required Result getTaills(),
    @required Result repeatTip(),
  }) {
    assert(started != null);
    assert(checkphone != null);
    assert(sendworkflow != null);
    assert(getTaills != null);
    assert(repeatTip != null);
    return checkphone(phone);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(Map<String, dynamic> affData),
    Result checkphone(String phone),
    Result sendworkflow(String name, String phone, String remark, String sex),
    Result getTaills(),
    Result repeatTip(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (checkphone != null) {
      return checkphone(phone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result checkphone(_Checkphone value),
    @required Result sendworkflow(_Sendworkflow value),
    @required Result getTaills(_GetTaills value),
    @required Result repeatTip(_RepeatTip value),
  }) {
    assert(started != null);
    assert(checkphone != null);
    assert(sendworkflow != null);
    assert(getTaills != null);
    assert(repeatTip != null);
    return checkphone(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result checkphone(_Checkphone value),
    Result sendworkflow(_Sendworkflow value),
    Result getTaills(_GetTaills value),
    Result repeatTip(_RepeatTip value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (checkphone != null) {
      return checkphone(this);
    }
    return orElse();
  }
}

abstract class _Checkphone implements BuyinghouseEvent {
  const factory _Checkphone(String phone) = _$_Checkphone;

  String get phone;
  _$CheckphoneCopyWith<_Checkphone> get copyWith;
}

/// @nodoc
abstract class _$SendworkflowCopyWith<$Res> {
  factory _$SendworkflowCopyWith(
          _Sendworkflow value, $Res Function(_Sendworkflow) then) =
      __$SendworkflowCopyWithImpl<$Res>;
  $Res call({String name, String phone, String remark, String sex});
}

/// @nodoc
class __$SendworkflowCopyWithImpl<$Res>
    extends _$BuyinghouseEventCopyWithImpl<$Res>
    implements _$SendworkflowCopyWith<$Res> {
  __$SendworkflowCopyWithImpl(
      _Sendworkflow _value, $Res Function(_Sendworkflow) _then)
      : super(_value, (v) => _then(v as _Sendworkflow));

  @override
  _Sendworkflow get _value => super._value as _Sendworkflow;

  @override
  $Res call({
    Object name = freezed,
    Object phone = freezed,
    Object remark = freezed,
    Object sex = freezed,
  }) {
    return _then(_Sendworkflow(
      name == freezed ? _value.name : name as String,
      phone == freezed ? _value.phone : phone as String,
      remark == freezed ? _value.remark : remark as String,
      sex == freezed ? _value.sex : sex as String,
    ));
  }
}

/// @nodoc
class _$_Sendworkflow implements _Sendworkflow {
  const _$_Sendworkflow(this.name, this.phone, this.remark, this.sex)
      : assert(name != null),
        assert(phone != null),
        assert(remark != null),
        assert(sex != null);

  @override
  final String name;
  @override
  final String phone;
  @override
  final String remark;
  @override
  final String sex;

  @override
  String toString() {
    return 'BuyinghouseEvent.sendworkflow(name: $name, phone: $phone, remark: $remark, sex: $sex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Sendworkflow &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.remark, remark) ||
                const DeepCollectionEquality().equals(other.remark, remark)) &&
            (identical(other.sex, sex) ||
                const DeepCollectionEquality().equals(other.sex, sex)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(remark) ^
      const DeepCollectionEquality().hash(sex);

  @override
  _$SendworkflowCopyWith<_Sendworkflow> get copyWith =>
      __$SendworkflowCopyWithImpl<_Sendworkflow>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(Map<String, dynamic> affData),
    @required Result checkphone(String phone),
    @required
        Result sendworkflow(
            String name, String phone, String remark, String sex),
    @required Result getTaills(),
    @required Result repeatTip(),
  }) {
    assert(started != null);
    assert(checkphone != null);
    assert(sendworkflow != null);
    assert(getTaills != null);
    assert(repeatTip != null);
    return sendworkflow(name, phone, remark, sex);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(Map<String, dynamic> affData),
    Result checkphone(String phone),
    Result sendworkflow(String name, String phone, String remark, String sex),
    Result getTaills(),
    Result repeatTip(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendworkflow != null) {
      return sendworkflow(name, phone, remark, sex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result checkphone(_Checkphone value),
    @required Result sendworkflow(_Sendworkflow value),
    @required Result getTaills(_GetTaills value),
    @required Result repeatTip(_RepeatTip value),
  }) {
    assert(started != null);
    assert(checkphone != null);
    assert(sendworkflow != null);
    assert(getTaills != null);
    assert(repeatTip != null);
    return sendworkflow(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result checkphone(_Checkphone value),
    Result sendworkflow(_Sendworkflow value),
    Result getTaills(_GetTaills value),
    Result repeatTip(_RepeatTip value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendworkflow != null) {
      return sendworkflow(this);
    }
    return orElse();
  }
}

abstract class _Sendworkflow implements BuyinghouseEvent {
  const factory _Sendworkflow(
      String name, String phone, String remark, String sex) = _$_Sendworkflow;

  String get name;
  String get phone;
  String get remark;
  String get sex;
  _$SendworkflowCopyWith<_Sendworkflow> get copyWith;
}

/// @nodoc
abstract class _$GetTaillsCopyWith<$Res> {
  factory _$GetTaillsCopyWith(
          _GetTaills value, $Res Function(_GetTaills) then) =
      __$GetTaillsCopyWithImpl<$Res>;
}

/// @nodoc
class __$GetTaillsCopyWithImpl<$Res>
    extends _$BuyinghouseEventCopyWithImpl<$Res>
    implements _$GetTaillsCopyWith<$Res> {
  __$GetTaillsCopyWithImpl(_GetTaills _value, $Res Function(_GetTaills) _then)
      : super(_value, (v) => _then(v as _GetTaills));

  @override
  _GetTaills get _value => super._value as _GetTaills;
}

/// @nodoc
class _$_GetTaills implements _GetTaills {
  const _$_GetTaills();

  @override
  String toString() {
    return 'BuyinghouseEvent.getTaills()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GetTaills);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(Map<String, dynamic> affData),
    @required Result checkphone(String phone),
    @required
        Result sendworkflow(
            String name, String phone, String remark, String sex),
    @required Result getTaills(),
    @required Result repeatTip(),
  }) {
    assert(started != null);
    assert(checkphone != null);
    assert(sendworkflow != null);
    assert(getTaills != null);
    assert(repeatTip != null);
    return getTaills();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(Map<String, dynamic> affData),
    Result checkphone(String phone),
    Result sendworkflow(String name, String phone, String remark, String sex),
    Result getTaills(),
    Result repeatTip(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getTaills != null) {
      return getTaills();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result checkphone(_Checkphone value),
    @required Result sendworkflow(_Sendworkflow value),
    @required Result getTaills(_GetTaills value),
    @required Result repeatTip(_RepeatTip value),
  }) {
    assert(started != null);
    assert(checkphone != null);
    assert(sendworkflow != null);
    assert(getTaills != null);
    assert(repeatTip != null);
    return getTaills(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result checkphone(_Checkphone value),
    Result sendworkflow(_Sendworkflow value),
    Result getTaills(_GetTaills value),
    Result repeatTip(_RepeatTip value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getTaills != null) {
      return getTaills(this);
    }
    return orElse();
  }
}

abstract class _GetTaills implements BuyinghouseEvent {
  const factory _GetTaills() = _$_GetTaills;
}

/// @nodoc
abstract class _$RepeatTipCopyWith<$Res> {
  factory _$RepeatTipCopyWith(
          _RepeatTip value, $Res Function(_RepeatTip) then) =
      __$RepeatTipCopyWithImpl<$Res>;
}

/// @nodoc
class __$RepeatTipCopyWithImpl<$Res>
    extends _$BuyinghouseEventCopyWithImpl<$Res>
    implements _$RepeatTipCopyWith<$Res> {
  __$RepeatTipCopyWithImpl(_RepeatTip _value, $Res Function(_RepeatTip) _then)
      : super(_value, (v) => _then(v as _RepeatTip));

  @override
  _RepeatTip get _value => super._value as _RepeatTip;
}

/// @nodoc
class _$_RepeatTip implements _RepeatTip {
  const _$_RepeatTip();

  @override
  String toString() {
    return 'BuyinghouseEvent.repeatTip()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _RepeatTip);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(Map<String, dynamic> affData),
    @required Result checkphone(String phone),
    @required
        Result sendworkflow(
            String name, String phone, String remark, String sex),
    @required Result getTaills(),
    @required Result repeatTip(),
  }) {
    assert(started != null);
    assert(checkphone != null);
    assert(sendworkflow != null);
    assert(getTaills != null);
    assert(repeatTip != null);
    return repeatTip();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(Map<String, dynamic> affData),
    Result checkphone(String phone),
    Result sendworkflow(String name, String phone, String remark, String sex),
    Result getTaills(),
    Result repeatTip(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (repeatTip != null) {
      return repeatTip();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result checkphone(_Checkphone value),
    @required Result sendworkflow(_Sendworkflow value),
    @required Result getTaills(_GetTaills value),
    @required Result repeatTip(_RepeatTip value),
  }) {
    assert(started != null);
    assert(checkphone != null);
    assert(sendworkflow != null);
    assert(getTaills != null);
    assert(repeatTip != null);
    return repeatTip(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result checkphone(_Checkphone value),
    Result sendworkflow(_Sendworkflow value),
    Result getTaills(_GetTaills value),
    Result repeatTip(_RepeatTip value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (repeatTip != null) {
      return repeatTip(this);
    }
    return orElse();
  }
}

abstract class _RepeatTip implements BuyinghouseEvent {
  const factory _RepeatTip() = _$_RepeatTip;
}

/// @nodoc
class _$BuyinghouseStateTearOff {
  const _$BuyinghouseStateTearOff();

// ignore: unused_element
  _BuyinghouseState call(
      {int index,
      Map<dynamic, dynamic> project,
      List<dynamic> salesman,
      Map<dynamic, dynamic> salesmanItem,
      bool isGoodPhone,
      bool isRepeat}) {
    return _BuyinghouseState(
      index: index,
      project: project,
      salesman: salesman,
      salesmanItem: salesmanItem,
      isGoodPhone: isGoodPhone,
      isRepeat: isRepeat,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $BuyinghouseState = _$BuyinghouseStateTearOff();

/// @nodoc
mixin _$BuyinghouseState {
  int get index;
  Map<dynamic, dynamic> get project;
  List<dynamic> get salesman;
  Map<dynamic, dynamic> get salesmanItem;
  bool get isGoodPhone;
  bool get isRepeat;

  $BuyinghouseStateCopyWith<BuyinghouseState> get copyWith;
}

/// @nodoc
abstract class $BuyinghouseStateCopyWith<$Res> {
  factory $BuyinghouseStateCopyWith(
          BuyinghouseState value, $Res Function(BuyinghouseState) then) =
      _$BuyinghouseStateCopyWithImpl<$Res>;
  $Res call(
      {int index,
      Map<dynamic, dynamic> project,
      List<dynamic> salesman,
      Map<dynamic, dynamic> salesmanItem,
      bool isGoodPhone,
      bool isRepeat});
}

/// @nodoc
class _$BuyinghouseStateCopyWithImpl<$Res>
    implements $BuyinghouseStateCopyWith<$Res> {
  _$BuyinghouseStateCopyWithImpl(this._value, this._then);

  final BuyinghouseState _value;
  // ignore: unused_field
  final $Res Function(BuyinghouseState) _then;

  @override
  $Res call({
    Object index = freezed,
    Object project = freezed,
    Object salesman = freezed,
    Object salesmanItem = freezed,
    Object isGoodPhone = freezed,
    Object isRepeat = freezed,
  }) {
    return _then(_value.copyWith(
      index: index == freezed ? _value.index : index as int,
      project: project == freezed
          ? _value.project
          : project as Map<dynamic, dynamic>,
      salesman:
          salesman == freezed ? _value.salesman : salesman as List<dynamic>,
      salesmanItem: salesmanItem == freezed
          ? _value.salesmanItem
          : salesmanItem as Map<dynamic, dynamic>,
      isGoodPhone:
          isGoodPhone == freezed ? _value.isGoodPhone : isGoodPhone as bool,
      isRepeat: isRepeat == freezed ? _value.isRepeat : isRepeat as bool,
    ));
  }
}

/// @nodoc
abstract class _$BuyinghouseStateCopyWith<$Res>
    implements $BuyinghouseStateCopyWith<$Res> {
  factory _$BuyinghouseStateCopyWith(
          _BuyinghouseState value, $Res Function(_BuyinghouseState) then) =
      __$BuyinghouseStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int index,
      Map<dynamic, dynamic> project,
      List<dynamic> salesman,
      Map<dynamic, dynamic> salesmanItem,
      bool isGoodPhone,
      bool isRepeat});
}

/// @nodoc
class __$BuyinghouseStateCopyWithImpl<$Res>
    extends _$BuyinghouseStateCopyWithImpl<$Res>
    implements _$BuyinghouseStateCopyWith<$Res> {
  __$BuyinghouseStateCopyWithImpl(
      _BuyinghouseState _value, $Res Function(_BuyinghouseState) _then)
      : super(_value, (v) => _then(v as _BuyinghouseState));

  @override
  _BuyinghouseState get _value => super._value as _BuyinghouseState;

  @override
  $Res call({
    Object index = freezed,
    Object project = freezed,
    Object salesman = freezed,
    Object salesmanItem = freezed,
    Object isGoodPhone = freezed,
    Object isRepeat = freezed,
  }) {
    return _then(_BuyinghouseState(
      index: index == freezed ? _value.index : index as int,
      project: project == freezed
          ? _value.project
          : project as Map<dynamic, dynamic>,
      salesman:
          salesman == freezed ? _value.salesman : salesman as List<dynamic>,
      salesmanItem: salesmanItem == freezed
          ? _value.salesmanItem
          : salesmanItem as Map<dynamic, dynamic>,
      isGoodPhone:
          isGoodPhone == freezed ? _value.isGoodPhone : isGoodPhone as bool,
      isRepeat: isRepeat == freezed ? _value.isRepeat : isRepeat as bool,
    ));
  }
}

/// @nodoc
class _$_BuyinghouseState implements _BuyinghouseState {
  const _$_BuyinghouseState(
      {this.index,
      this.project,
      this.salesman,
      this.salesmanItem,
      this.isGoodPhone,
      this.isRepeat});

  @override
  final int index;
  @override
  final Map<dynamic, dynamic> project;
  @override
  final List<dynamic> salesman;
  @override
  final Map<dynamic, dynamic> salesmanItem;
  @override
  final bool isGoodPhone;
  @override
  final bool isRepeat;

  @override
  String toString() {
    return 'BuyinghouseState(index: $index, project: $project, salesman: $salesman, salesmanItem: $salesmanItem, isGoodPhone: $isGoodPhone, isRepeat: $isRepeat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BuyinghouseState &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)) &&
            (identical(other.project, project) ||
                const DeepCollectionEquality()
                    .equals(other.project, project)) &&
            (identical(other.salesman, salesman) ||
                const DeepCollectionEquality()
                    .equals(other.salesman, salesman)) &&
            (identical(other.salesmanItem, salesmanItem) ||
                const DeepCollectionEquality()
                    .equals(other.salesmanItem, salesmanItem)) &&
            (identical(other.isGoodPhone, isGoodPhone) ||
                const DeepCollectionEquality()
                    .equals(other.isGoodPhone, isGoodPhone)) &&
            (identical(other.isRepeat, isRepeat) ||
                const DeepCollectionEquality()
                    .equals(other.isRepeat, isRepeat)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(index) ^
      const DeepCollectionEquality().hash(project) ^
      const DeepCollectionEquality().hash(salesman) ^
      const DeepCollectionEquality().hash(salesmanItem) ^
      const DeepCollectionEquality().hash(isGoodPhone) ^
      const DeepCollectionEquality().hash(isRepeat);

  @override
  _$BuyinghouseStateCopyWith<_BuyinghouseState> get copyWith =>
      __$BuyinghouseStateCopyWithImpl<_BuyinghouseState>(this, _$identity);
}

abstract class _BuyinghouseState implements BuyinghouseState {
  const factory _BuyinghouseState(
      {int index,
      Map<dynamic, dynamic> project,
      List<dynamic> salesman,
      Map<dynamic, dynamic> salesmanItem,
      bool isGoodPhone,
      bool isRepeat}) = _$_BuyinghouseState;

  @override
  int get index;
  @override
  Map<dynamic, dynamic> get project;
  @override
  List<dynamic> get salesman;
  @override
  Map<dynamic, dynamic> get salesmanItem;
  @override
  bool get isGoodPhone;
  @override
  bool get isRepeat;
  @override
  _$BuyinghouseStateCopyWith<_BuyinghouseState> get copyWith;
}
