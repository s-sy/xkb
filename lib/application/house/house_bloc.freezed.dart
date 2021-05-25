// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'house_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$HouseEventTearOff {
  const _$HouseEventTearOff();

// ignore: unused_element
  _Started started() {
    return const _Started();
  }

// ignore: unused_element
  _GetListData getListData() {
    return const _GetListData();
  }

// ignore: unused_element
  _ChangeBuilding changebuilding(int index, String name) {
    return _ChangeBuilding(
      index,
      name,
    );
  }

// ignore: unused_element
  _ChangeHouse changehouse(int index, String name) {
    return _ChangeHouse(
      index,
      name,
    );
  }

// ignore: unused_element
  _ChangeEntrance changeentrance(int index, String name) {
    return _ChangeEntrance(
      index,
      name,
    );
  }

// ignore: unused_element
  _GetSalesmanLists getSalesmanLists(String createId) {
    return _GetSalesmanLists(
      createId,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $HouseEvent = _$HouseEventTearOff();

/// @nodoc
mixin _$HouseEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result getListData(),
    @required Result changebuilding(int index, String name),
    @required Result changehouse(int index, String name),
    @required Result changeentrance(int index, String name),
    @required Result getSalesmanLists(String createId),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result getListData(),
    Result changebuilding(int index, String name),
    Result changehouse(int index, String name),
    Result changeentrance(int index, String name),
    Result getSalesmanLists(String createId),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result getListData(_GetListData value),
    @required Result changebuilding(_ChangeBuilding value),
    @required Result changehouse(_ChangeHouse value),
    @required Result changeentrance(_ChangeEntrance value),
    @required Result getSalesmanLists(_GetSalesmanLists value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result getListData(_GetListData value),
    Result changebuilding(_ChangeBuilding value),
    Result changehouse(_ChangeHouse value),
    Result changeentrance(_ChangeEntrance value),
    Result getSalesmanLists(_GetSalesmanLists value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $HouseEventCopyWith<$Res> {
  factory $HouseEventCopyWith(
          HouseEvent value, $Res Function(HouseEvent) then) =
      _$HouseEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HouseEventCopyWithImpl<$Res> implements $HouseEventCopyWith<$Res> {
  _$HouseEventCopyWithImpl(this._value, this._then);

  final HouseEvent _value;
  // ignore: unused_field
  final $Res Function(HouseEvent) _then;
}

/// @nodoc
abstract class _$StartedCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) then) =
      __$StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> extends _$HouseEventCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(_Started _value, $Res Function(_Started) _then)
      : super(_value, (v) => _then(v as _Started));

  @override
  _Started get _value => super._value as _Started;
}

/// @nodoc
class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'HouseEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result getListData(),
    @required Result changebuilding(int index, String name),
    @required Result changehouse(int index, String name),
    @required Result changeentrance(int index, String name),
    @required Result getSalesmanLists(String createId),
  }) {
    assert(started != null);
    assert(getListData != null);
    assert(changebuilding != null);
    assert(changehouse != null);
    assert(changeentrance != null);
    assert(getSalesmanLists != null);
    return started();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result getListData(),
    Result changebuilding(int index, String name),
    Result changehouse(int index, String name),
    Result changeentrance(int index, String name),
    Result getSalesmanLists(String createId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result getListData(_GetListData value),
    @required Result changebuilding(_ChangeBuilding value),
    @required Result changehouse(_ChangeHouse value),
    @required Result changeentrance(_ChangeEntrance value),
    @required Result getSalesmanLists(_GetSalesmanLists value),
  }) {
    assert(started != null);
    assert(getListData != null);
    assert(changebuilding != null);
    assert(changehouse != null);
    assert(changeentrance != null);
    assert(getSalesmanLists != null);
    return started(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result getListData(_GetListData value),
    Result changebuilding(_ChangeBuilding value),
    Result changehouse(_ChangeHouse value),
    Result changeentrance(_ChangeEntrance value),
    Result getSalesmanLists(_GetSalesmanLists value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements HouseEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$GetListDataCopyWith<$Res> {
  factory _$GetListDataCopyWith(
          _GetListData value, $Res Function(_GetListData) then) =
      __$GetListDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$GetListDataCopyWithImpl<$Res> extends _$HouseEventCopyWithImpl<$Res>
    implements _$GetListDataCopyWith<$Res> {
  __$GetListDataCopyWithImpl(
      _GetListData _value, $Res Function(_GetListData) _then)
      : super(_value, (v) => _then(v as _GetListData));

  @override
  _GetListData get _value => super._value as _GetListData;
}

/// @nodoc
class _$_GetListData implements _GetListData {
  const _$_GetListData();

  @override
  String toString() {
    return 'HouseEvent.getListData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GetListData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result getListData(),
    @required Result changebuilding(int index, String name),
    @required Result changehouse(int index, String name),
    @required Result changeentrance(int index, String name),
    @required Result getSalesmanLists(String createId),
  }) {
    assert(started != null);
    assert(getListData != null);
    assert(changebuilding != null);
    assert(changehouse != null);
    assert(changeentrance != null);
    assert(getSalesmanLists != null);
    return getListData();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result getListData(),
    Result changebuilding(int index, String name),
    Result changehouse(int index, String name),
    Result changeentrance(int index, String name),
    Result getSalesmanLists(String createId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getListData != null) {
      return getListData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result getListData(_GetListData value),
    @required Result changebuilding(_ChangeBuilding value),
    @required Result changehouse(_ChangeHouse value),
    @required Result changeentrance(_ChangeEntrance value),
    @required Result getSalesmanLists(_GetSalesmanLists value),
  }) {
    assert(started != null);
    assert(getListData != null);
    assert(changebuilding != null);
    assert(changehouse != null);
    assert(changeentrance != null);
    assert(getSalesmanLists != null);
    return getListData(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result getListData(_GetListData value),
    Result changebuilding(_ChangeBuilding value),
    Result changehouse(_ChangeHouse value),
    Result changeentrance(_ChangeEntrance value),
    Result getSalesmanLists(_GetSalesmanLists value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getListData != null) {
      return getListData(this);
    }
    return orElse();
  }
}

abstract class _GetListData implements HouseEvent {
  const factory _GetListData() = _$_GetListData;
}

/// @nodoc
abstract class _$ChangeBuildingCopyWith<$Res> {
  factory _$ChangeBuildingCopyWith(
          _ChangeBuilding value, $Res Function(_ChangeBuilding) then) =
      __$ChangeBuildingCopyWithImpl<$Res>;
  $Res call({int index, String name});
}

/// @nodoc
class __$ChangeBuildingCopyWithImpl<$Res> extends _$HouseEventCopyWithImpl<$Res>
    implements _$ChangeBuildingCopyWith<$Res> {
  __$ChangeBuildingCopyWithImpl(
      _ChangeBuilding _value, $Res Function(_ChangeBuilding) _then)
      : super(_value, (v) => _then(v as _ChangeBuilding));

  @override
  _ChangeBuilding get _value => super._value as _ChangeBuilding;

  @override
  $Res call({
    Object index = freezed,
    Object name = freezed,
  }) {
    return _then(_ChangeBuilding(
      index == freezed ? _value.index : index as int,
      name == freezed ? _value.name : name as String,
    ));
  }
}

/// @nodoc
class _$_ChangeBuilding implements _ChangeBuilding {
  const _$_ChangeBuilding(this.index, this.name)
      : assert(index != null),
        assert(name != null);

  @override
  final int index;
  @override
  final String name;

  @override
  String toString() {
    return 'HouseEvent.changebuilding(index: $index, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChangeBuilding &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(index) ^
      const DeepCollectionEquality().hash(name);

  @override
  _$ChangeBuildingCopyWith<_ChangeBuilding> get copyWith =>
      __$ChangeBuildingCopyWithImpl<_ChangeBuilding>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result getListData(),
    @required Result changebuilding(int index, String name),
    @required Result changehouse(int index, String name),
    @required Result changeentrance(int index, String name),
    @required Result getSalesmanLists(String createId),
  }) {
    assert(started != null);
    assert(getListData != null);
    assert(changebuilding != null);
    assert(changehouse != null);
    assert(changeentrance != null);
    assert(getSalesmanLists != null);
    return changebuilding(index, name);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result getListData(),
    Result changebuilding(int index, String name),
    Result changehouse(int index, String name),
    Result changeentrance(int index, String name),
    Result getSalesmanLists(String createId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changebuilding != null) {
      return changebuilding(index, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result getListData(_GetListData value),
    @required Result changebuilding(_ChangeBuilding value),
    @required Result changehouse(_ChangeHouse value),
    @required Result changeentrance(_ChangeEntrance value),
    @required Result getSalesmanLists(_GetSalesmanLists value),
  }) {
    assert(started != null);
    assert(getListData != null);
    assert(changebuilding != null);
    assert(changehouse != null);
    assert(changeentrance != null);
    assert(getSalesmanLists != null);
    return changebuilding(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result getListData(_GetListData value),
    Result changebuilding(_ChangeBuilding value),
    Result changehouse(_ChangeHouse value),
    Result changeentrance(_ChangeEntrance value),
    Result getSalesmanLists(_GetSalesmanLists value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changebuilding != null) {
      return changebuilding(this);
    }
    return orElse();
  }
}

abstract class _ChangeBuilding implements HouseEvent {
  const factory _ChangeBuilding(int index, String name) = _$_ChangeBuilding;

  int get index;
  String get name;
  _$ChangeBuildingCopyWith<_ChangeBuilding> get copyWith;
}

/// @nodoc
abstract class _$ChangeHouseCopyWith<$Res> {
  factory _$ChangeHouseCopyWith(
          _ChangeHouse value, $Res Function(_ChangeHouse) then) =
      __$ChangeHouseCopyWithImpl<$Res>;
  $Res call({int index, String name});
}

/// @nodoc
class __$ChangeHouseCopyWithImpl<$Res> extends _$HouseEventCopyWithImpl<$Res>
    implements _$ChangeHouseCopyWith<$Res> {
  __$ChangeHouseCopyWithImpl(
      _ChangeHouse _value, $Res Function(_ChangeHouse) _then)
      : super(_value, (v) => _then(v as _ChangeHouse));

  @override
  _ChangeHouse get _value => super._value as _ChangeHouse;

  @override
  $Res call({
    Object index = freezed,
    Object name = freezed,
  }) {
    return _then(_ChangeHouse(
      index == freezed ? _value.index : index as int,
      name == freezed ? _value.name : name as String,
    ));
  }
}

/// @nodoc
class _$_ChangeHouse implements _ChangeHouse {
  const _$_ChangeHouse(this.index, this.name)
      : assert(index != null),
        assert(name != null);

  @override
  final int index;
  @override
  final String name;

  @override
  String toString() {
    return 'HouseEvent.changehouse(index: $index, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChangeHouse &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(index) ^
      const DeepCollectionEquality().hash(name);

  @override
  _$ChangeHouseCopyWith<_ChangeHouse> get copyWith =>
      __$ChangeHouseCopyWithImpl<_ChangeHouse>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result getListData(),
    @required Result changebuilding(int index, String name),
    @required Result changehouse(int index, String name),
    @required Result changeentrance(int index, String name),
    @required Result getSalesmanLists(String createId),
  }) {
    assert(started != null);
    assert(getListData != null);
    assert(changebuilding != null);
    assert(changehouse != null);
    assert(changeentrance != null);
    assert(getSalesmanLists != null);
    return changehouse(index, name);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result getListData(),
    Result changebuilding(int index, String name),
    Result changehouse(int index, String name),
    Result changeentrance(int index, String name),
    Result getSalesmanLists(String createId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changehouse != null) {
      return changehouse(index, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result getListData(_GetListData value),
    @required Result changebuilding(_ChangeBuilding value),
    @required Result changehouse(_ChangeHouse value),
    @required Result changeentrance(_ChangeEntrance value),
    @required Result getSalesmanLists(_GetSalesmanLists value),
  }) {
    assert(started != null);
    assert(getListData != null);
    assert(changebuilding != null);
    assert(changehouse != null);
    assert(changeentrance != null);
    assert(getSalesmanLists != null);
    return changehouse(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result getListData(_GetListData value),
    Result changebuilding(_ChangeBuilding value),
    Result changehouse(_ChangeHouse value),
    Result changeentrance(_ChangeEntrance value),
    Result getSalesmanLists(_GetSalesmanLists value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changehouse != null) {
      return changehouse(this);
    }
    return orElse();
  }
}

abstract class _ChangeHouse implements HouseEvent {
  const factory _ChangeHouse(int index, String name) = _$_ChangeHouse;

  int get index;
  String get name;
  _$ChangeHouseCopyWith<_ChangeHouse> get copyWith;
}

/// @nodoc
abstract class _$ChangeEntranceCopyWith<$Res> {
  factory _$ChangeEntranceCopyWith(
          _ChangeEntrance value, $Res Function(_ChangeEntrance) then) =
      __$ChangeEntranceCopyWithImpl<$Res>;
  $Res call({int index, String name});
}

/// @nodoc
class __$ChangeEntranceCopyWithImpl<$Res> extends _$HouseEventCopyWithImpl<$Res>
    implements _$ChangeEntranceCopyWith<$Res> {
  __$ChangeEntranceCopyWithImpl(
      _ChangeEntrance _value, $Res Function(_ChangeEntrance) _then)
      : super(_value, (v) => _then(v as _ChangeEntrance));

  @override
  _ChangeEntrance get _value => super._value as _ChangeEntrance;

  @override
  $Res call({
    Object index = freezed,
    Object name = freezed,
  }) {
    return _then(_ChangeEntrance(
      index == freezed ? _value.index : index as int,
      name == freezed ? _value.name : name as String,
    ));
  }
}

/// @nodoc
class _$_ChangeEntrance implements _ChangeEntrance {
  const _$_ChangeEntrance(this.index, this.name)
      : assert(index != null),
        assert(name != null);

  @override
  final int index;
  @override
  final String name;

  @override
  String toString() {
    return 'HouseEvent.changeentrance(index: $index, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChangeEntrance &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(index) ^
      const DeepCollectionEquality().hash(name);

  @override
  _$ChangeEntranceCopyWith<_ChangeEntrance> get copyWith =>
      __$ChangeEntranceCopyWithImpl<_ChangeEntrance>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result getListData(),
    @required Result changebuilding(int index, String name),
    @required Result changehouse(int index, String name),
    @required Result changeentrance(int index, String name),
    @required Result getSalesmanLists(String createId),
  }) {
    assert(started != null);
    assert(getListData != null);
    assert(changebuilding != null);
    assert(changehouse != null);
    assert(changeentrance != null);
    assert(getSalesmanLists != null);
    return changeentrance(index, name);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result getListData(),
    Result changebuilding(int index, String name),
    Result changehouse(int index, String name),
    Result changeentrance(int index, String name),
    Result getSalesmanLists(String createId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changeentrance != null) {
      return changeentrance(index, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result getListData(_GetListData value),
    @required Result changebuilding(_ChangeBuilding value),
    @required Result changehouse(_ChangeHouse value),
    @required Result changeentrance(_ChangeEntrance value),
    @required Result getSalesmanLists(_GetSalesmanLists value),
  }) {
    assert(started != null);
    assert(getListData != null);
    assert(changebuilding != null);
    assert(changehouse != null);
    assert(changeentrance != null);
    assert(getSalesmanLists != null);
    return changeentrance(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result getListData(_GetListData value),
    Result changebuilding(_ChangeBuilding value),
    Result changehouse(_ChangeHouse value),
    Result changeentrance(_ChangeEntrance value),
    Result getSalesmanLists(_GetSalesmanLists value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changeentrance != null) {
      return changeentrance(this);
    }
    return orElse();
  }
}

abstract class _ChangeEntrance implements HouseEvent {
  const factory _ChangeEntrance(int index, String name) = _$_ChangeEntrance;

  int get index;
  String get name;
  _$ChangeEntranceCopyWith<_ChangeEntrance> get copyWith;
}

/// @nodoc
abstract class _$GetSalesmanListsCopyWith<$Res> {
  factory _$GetSalesmanListsCopyWith(
          _GetSalesmanLists value, $Res Function(_GetSalesmanLists) then) =
      __$GetSalesmanListsCopyWithImpl<$Res>;
  $Res call({String createId});
}

/// @nodoc
class __$GetSalesmanListsCopyWithImpl<$Res>
    extends _$HouseEventCopyWithImpl<$Res>
    implements _$GetSalesmanListsCopyWith<$Res> {
  __$GetSalesmanListsCopyWithImpl(
      _GetSalesmanLists _value, $Res Function(_GetSalesmanLists) _then)
      : super(_value, (v) => _then(v as _GetSalesmanLists));

  @override
  _GetSalesmanLists get _value => super._value as _GetSalesmanLists;

  @override
  $Res call({
    Object createId = freezed,
  }) {
    return _then(_GetSalesmanLists(
      createId == freezed ? _value.createId : createId as String,
    ));
  }
}

/// @nodoc
class _$_GetSalesmanLists implements _GetSalesmanLists {
  const _$_GetSalesmanLists(this.createId) : assert(createId != null);

  @override
  final String createId;

  @override
  String toString() {
    return 'HouseEvent.getSalesmanLists(createId: $createId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GetSalesmanLists &&
            (identical(other.createId, createId) ||
                const DeepCollectionEquality()
                    .equals(other.createId, createId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(createId);

  @override
  _$GetSalesmanListsCopyWith<_GetSalesmanLists> get copyWith =>
      __$GetSalesmanListsCopyWithImpl<_GetSalesmanLists>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result getListData(),
    @required Result changebuilding(int index, String name),
    @required Result changehouse(int index, String name),
    @required Result changeentrance(int index, String name),
    @required Result getSalesmanLists(String createId),
  }) {
    assert(started != null);
    assert(getListData != null);
    assert(changebuilding != null);
    assert(changehouse != null);
    assert(changeentrance != null);
    assert(getSalesmanLists != null);
    return getSalesmanLists(createId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result getListData(),
    Result changebuilding(int index, String name),
    Result changehouse(int index, String name),
    Result changeentrance(int index, String name),
    Result getSalesmanLists(String createId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getSalesmanLists != null) {
      return getSalesmanLists(createId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result getListData(_GetListData value),
    @required Result changebuilding(_ChangeBuilding value),
    @required Result changehouse(_ChangeHouse value),
    @required Result changeentrance(_ChangeEntrance value),
    @required Result getSalesmanLists(_GetSalesmanLists value),
  }) {
    assert(started != null);
    assert(getListData != null);
    assert(changebuilding != null);
    assert(changehouse != null);
    assert(changeentrance != null);
    assert(getSalesmanLists != null);
    return getSalesmanLists(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result getListData(_GetListData value),
    Result changebuilding(_ChangeBuilding value),
    Result changehouse(_ChangeHouse value),
    Result changeentrance(_ChangeEntrance value),
    Result getSalesmanLists(_GetSalesmanLists value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getSalesmanLists != null) {
      return getSalesmanLists(this);
    }
    return orElse();
  }
}

abstract class _GetSalesmanLists implements HouseEvent {
  const factory _GetSalesmanLists(String createId) = _$_GetSalesmanLists;

  String get createId;
  _$GetSalesmanListsCopyWith<_GetSalesmanLists> get copyWith;
}

/// @nodoc
class _$HouseStateTearOff {
  const _$HouseStateTearOff();

// ignore: unused_element
  _HouseState call(
      {Map<String, dynamic> nowMap,
      List<dynamic> housList,
      List<dynamic> buildingList,
      List<dynamic> entranceList,
      List<dynamic> buildEntranceList,
      int houseIndex,
      int buildIndex,
      int entranceIndex,
      double cors,
      String houseText,
      String buildText,
      String entranceText,
      List<dynamic> salesman}) {
    return _HouseState(
      nowMap: nowMap,
      housList: housList,
      buildingList: buildingList,
      entranceList: entranceList,
      buildEntranceList: buildEntranceList,
      houseIndex: houseIndex,
      buildIndex: buildIndex,
      entranceIndex: entranceIndex,
      cors: cors,
      houseText: houseText,
      buildText: buildText,
      entranceText: entranceText,
      salesman: salesman,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $HouseState = _$HouseStateTearOff();

/// @nodoc
mixin _$HouseState {
  Map<String, dynamic> get nowMap;
  List<dynamic> get housList;
  List<dynamic> get buildingList;
  List<dynamic> get entranceList;
  List<dynamic> get buildEntranceList;
  int get houseIndex;
  int get buildIndex;
  int get entranceIndex;
  double get cors;
  String get houseText;
  String get buildText;
  String get entranceText;
  List<dynamic> get salesman;

  $HouseStateCopyWith<HouseState> get copyWith;
}

/// @nodoc
abstract class $HouseStateCopyWith<$Res> {
  factory $HouseStateCopyWith(
          HouseState value, $Res Function(HouseState) then) =
      _$HouseStateCopyWithImpl<$Res>;
  $Res call(
      {Map<String, dynamic> nowMap,
      List<dynamic> housList,
      List<dynamic> buildingList,
      List<dynamic> entranceList,
      List<dynamic> buildEntranceList,
      int houseIndex,
      int buildIndex,
      int entranceIndex,
      double cors,
      String houseText,
      String buildText,
      String entranceText,
      List<dynamic> salesman});
}

/// @nodoc
class _$HouseStateCopyWithImpl<$Res> implements $HouseStateCopyWith<$Res> {
  _$HouseStateCopyWithImpl(this._value, this._then);

  final HouseState _value;
  // ignore: unused_field
  final $Res Function(HouseState) _then;

  @override
  $Res call({
    Object nowMap = freezed,
    Object housList = freezed,
    Object buildingList = freezed,
    Object entranceList = freezed,
    Object buildEntranceList = freezed,
    Object houseIndex = freezed,
    Object buildIndex = freezed,
    Object entranceIndex = freezed,
    Object cors = freezed,
    Object houseText = freezed,
    Object buildText = freezed,
    Object entranceText = freezed,
    Object salesman = freezed,
  }) {
    return _then(_value.copyWith(
      nowMap:
          nowMap == freezed ? _value.nowMap : nowMap as Map<String, dynamic>,
      housList:
          housList == freezed ? _value.housList : housList as List<dynamic>,
      buildingList: buildingList == freezed
          ? _value.buildingList
          : buildingList as List<dynamic>,
      entranceList: entranceList == freezed
          ? _value.entranceList
          : entranceList as List<dynamic>,
      buildEntranceList: buildEntranceList == freezed
          ? _value.buildEntranceList
          : buildEntranceList as List<dynamic>,
      houseIndex: houseIndex == freezed ? _value.houseIndex : houseIndex as int,
      buildIndex: buildIndex == freezed ? _value.buildIndex : buildIndex as int,
      entranceIndex: entranceIndex == freezed
          ? _value.entranceIndex
          : entranceIndex as int,
      cors: cors == freezed ? _value.cors : cors as double,
      houseText: houseText == freezed ? _value.houseText : houseText as String,
      buildText: buildText == freezed ? _value.buildText : buildText as String,
      entranceText: entranceText == freezed
          ? _value.entranceText
          : entranceText as String,
      salesman:
          salesman == freezed ? _value.salesman : salesman as List<dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$HouseStateCopyWith<$Res> implements $HouseStateCopyWith<$Res> {
  factory _$HouseStateCopyWith(
          _HouseState value, $Res Function(_HouseState) then) =
      __$HouseStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Map<String, dynamic> nowMap,
      List<dynamic> housList,
      List<dynamic> buildingList,
      List<dynamic> entranceList,
      List<dynamic> buildEntranceList,
      int houseIndex,
      int buildIndex,
      int entranceIndex,
      double cors,
      String houseText,
      String buildText,
      String entranceText,
      List<dynamic> salesman});
}

/// @nodoc
class __$HouseStateCopyWithImpl<$Res> extends _$HouseStateCopyWithImpl<$Res>
    implements _$HouseStateCopyWith<$Res> {
  __$HouseStateCopyWithImpl(
      _HouseState _value, $Res Function(_HouseState) _then)
      : super(_value, (v) => _then(v as _HouseState));

  @override
  _HouseState get _value => super._value as _HouseState;

  @override
  $Res call({
    Object nowMap = freezed,
    Object housList = freezed,
    Object buildingList = freezed,
    Object entranceList = freezed,
    Object buildEntranceList = freezed,
    Object houseIndex = freezed,
    Object buildIndex = freezed,
    Object entranceIndex = freezed,
    Object cors = freezed,
    Object houseText = freezed,
    Object buildText = freezed,
    Object entranceText = freezed,
    Object salesman = freezed,
  }) {
    return _then(_HouseState(
      nowMap:
          nowMap == freezed ? _value.nowMap : nowMap as Map<String, dynamic>,
      housList:
          housList == freezed ? _value.housList : housList as List<dynamic>,
      buildingList: buildingList == freezed
          ? _value.buildingList
          : buildingList as List<dynamic>,
      entranceList: entranceList == freezed
          ? _value.entranceList
          : entranceList as List<dynamic>,
      buildEntranceList: buildEntranceList == freezed
          ? _value.buildEntranceList
          : buildEntranceList as List<dynamic>,
      houseIndex: houseIndex == freezed ? _value.houseIndex : houseIndex as int,
      buildIndex: buildIndex == freezed ? _value.buildIndex : buildIndex as int,
      entranceIndex: entranceIndex == freezed
          ? _value.entranceIndex
          : entranceIndex as int,
      cors: cors == freezed ? _value.cors : cors as double,
      houseText: houseText == freezed ? _value.houseText : houseText as String,
      buildText: buildText == freezed ? _value.buildText : buildText as String,
      entranceText: entranceText == freezed
          ? _value.entranceText
          : entranceText as String,
      salesman:
          salesman == freezed ? _value.salesman : salesman as List<dynamic>,
    ));
  }
}

/// @nodoc
class _$_HouseState implements _HouseState {
  const _$_HouseState(
      {this.nowMap,
      this.housList,
      this.buildingList,
      this.entranceList,
      this.buildEntranceList,
      this.houseIndex,
      this.buildIndex,
      this.entranceIndex,
      this.cors,
      this.houseText,
      this.buildText,
      this.entranceText,
      this.salesman});

  @override
  final Map<String, dynamic> nowMap;
  @override
  final List<dynamic> housList;
  @override
  final List<dynamic> buildingList;
  @override
  final List<dynamic> entranceList;
  @override
  final List<dynamic> buildEntranceList;
  @override
  final int houseIndex;
  @override
  final int buildIndex;
  @override
  final int entranceIndex;
  @override
  final double cors;
  @override
  final String houseText;
  @override
  final String buildText;
  @override
  final String entranceText;
  @override
  final List<dynamic> salesman;

  @override
  String toString() {
    return 'HouseState(nowMap: $nowMap, housList: $housList, buildingList: $buildingList, entranceList: $entranceList, buildEntranceList: $buildEntranceList, houseIndex: $houseIndex, buildIndex: $buildIndex, entranceIndex: $entranceIndex, cors: $cors, houseText: $houseText, buildText: $buildText, entranceText: $entranceText, salesman: $salesman)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HouseState &&
            (identical(other.nowMap, nowMap) ||
                const DeepCollectionEquality().equals(other.nowMap, nowMap)) &&
            (identical(other.housList, housList) ||
                const DeepCollectionEquality()
                    .equals(other.housList, housList)) &&
            (identical(other.buildingList, buildingList) ||
                const DeepCollectionEquality()
                    .equals(other.buildingList, buildingList)) &&
            (identical(other.entranceList, entranceList) ||
                const DeepCollectionEquality()
                    .equals(other.entranceList, entranceList)) &&
            (identical(other.buildEntranceList, buildEntranceList) ||
                const DeepCollectionEquality()
                    .equals(other.buildEntranceList, buildEntranceList)) &&
            (identical(other.houseIndex, houseIndex) ||
                const DeepCollectionEquality()
                    .equals(other.houseIndex, houseIndex)) &&
            (identical(other.buildIndex, buildIndex) ||
                const DeepCollectionEquality()
                    .equals(other.buildIndex, buildIndex)) &&
            (identical(other.entranceIndex, entranceIndex) ||
                const DeepCollectionEquality()
                    .equals(other.entranceIndex, entranceIndex)) &&
            (identical(other.cors, cors) ||
                const DeepCollectionEquality().equals(other.cors, cors)) &&
            (identical(other.houseText, houseText) ||
                const DeepCollectionEquality()
                    .equals(other.houseText, houseText)) &&
            (identical(other.buildText, buildText) ||
                const DeepCollectionEquality()
                    .equals(other.buildText, buildText)) &&
            (identical(other.entranceText, entranceText) ||
                const DeepCollectionEquality()
                    .equals(other.entranceText, entranceText)) &&
            (identical(other.salesman, salesman) ||
                const DeepCollectionEquality()
                    .equals(other.salesman, salesman)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(nowMap) ^
      const DeepCollectionEquality().hash(housList) ^
      const DeepCollectionEquality().hash(buildingList) ^
      const DeepCollectionEquality().hash(entranceList) ^
      const DeepCollectionEquality().hash(buildEntranceList) ^
      const DeepCollectionEquality().hash(houseIndex) ^
      const DeepCollectionEquality().hash(buildIndex) ^
      const DeepCollectionEquality().hash(entranceIndex) ^
      const DeepCollectionEquality().hash(cors) ^
      const DeepCollectionEquality().hash(houseText) ^
      const DeepCollectionEquality().hash(buildText) ^
      const DeepCollectionEquality().hash(entranceText) ^
      const DeepCollectionEquality().hash(salesman);

  @override
  _$HouseStateCopyWith<_HouseState> get copyWith =>
      __$HouseStateCopyWithImpl<_HouseState>(this, _$identity);
}

abstract class _HouseState implements HouseState {
  const factory _HouseState(
      {Map<String, dynamic> nowMap,
      List<dynamic> housList,
      List<dynamic> buildingList,
      List<dynamic> entranceList,
      List<dynamic> buildEntranceList,
      int houseIndex,
      int buildIndex,
      int entranceIndex,
      double cors,
      String houseText,
      String buildText,
      String entranceText,
      List<dynamic> salesman}) = _$_HouseState;

  @override
  Map<String, dynamic> get nowMap;
  @override
  List<dynamic> get housList;
  @override
  List<dynamic> get buildingList;
  @override
  List<dynamic> get entranceList;
  @override
  List<dynamic> get buildEntranceList;
  @override
  int get houseIndex;
  @override
  int get buildIndex;
  @override
  int get entranceIndex;
  @override
  double get cors;
  @override
  String get houseText;
  @override
  String get buildText;
  @override
  String get entranceText;
  @override
  List<dynamic> get salesman;
  @override
  _$HouseStateCopyWith<_HouseState> get copyWith;
}
