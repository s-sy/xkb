// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'process_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ProcessEventTearOff {
  const _$ProcessEventTearOff();

// ignore: unused_element
  _HandleProcess handleProcess() {
    return const _HandleProcess();
  }

// ignore: unused_element
  _DealWithProcess dealWithProcess(String id, String taskDefinitionKey) {
    return _DealWithProcess(
      id,
      taskDefinitionKey,
    );
  }

// ignore: unused_element
  _NextRemind nextRemind(String processInstanceId) {
    return _NextRemind(
      processInstanceId,
    );
  }

// ignore: unused_element
  _HandleByConsultant handleByConsultant(ConsultantBean consultantBean) {
    return _HandleByConsultant(
      consultantBean,
    );
  }

// ignore: unused_element
  _ShareCode shareCode() {
    return const _ShareCode();
  }
}

/// @nodoc
// ignore: unused_element
const $ProcessEvent = _$ProcessEventTearOff();

/// @nodoc
mixin _$ProcessEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result handleProcess(),
    @required Result dealWithProcess(String id, String taskDefinitionKey),
    @required Result nextRemind(String processInstanceId),
    @required Result handleByConsultant(ConsultantBean consultantBean),
    @required Result shareCode(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result handleProcess(),
    Result dealWithProcess(String id, String taskDefinitionKey),
    Result nextRemind(String processInstanceId),
    Result handleByConsultant(ConsultantBean consultantBean),
    Result shareCode(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result handleProcess(_HandleProcess value),
    @required Result dealWithProcess(_DealWithProcess value),
    @required Result nextRemind(_NextRemind value),
    @required Result handleByConsultant(_HandleByConsultant value),
    @required Result shareCode(_ShareCode value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result handleProcess(_HandleProcess value),
    Result dealWithProcess(_DealWithProcess value),
    Result nextRemind(_NextRemind value),
    Result handleByConsultant(_HandleByConsultant value),
    Result shareCode(_ShareCode value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $ProcessEventCopyWith<$Res> {
  factory $ProcessEventCopyWith(
          ProcessEvent value, $Res Function(ProcessEvent) then) =
      _$ProcessEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProcessEventCopyWithImpl<$Res> implements $ProcessEventCopyWith<$Res> {
  _$ProcessEventCopyWithImpl(this._value, this._then);

  final ProcessEvent _value;
  // ignore: unused_field
  final $Res Function(ProcessEvent) _then;
}

/// @nodoc
abstract class _$HandleProcessCopyWith<$Res> {
  factory _$HandleProcessCopyWith(
          _HandleProcess value, $Res Function(_HandleProcess) then) =
      __$HandleProcessCopyWithImpl<$Res>;
}

/// @nodoc
class __$HandleProcessCopyWithImpl<$Res>
    extends _$ProcessEventCopyWithImpl<$Res>
    implements _$HandleProcessCopyWith<$Res> {
  __$HandleProcessCopyWithImpl(
      _HandleProcess _value, $Res Function(_HandleProcess) _then)
      : super(_value, (v) => _then(v as _HandleProcess));

  @override
  _HandleProcess get _value => super._value as _HandleProcess;
}

/// @nodoc
class _$_HandleProcess implements _HandleProcess {
  const _$_HandleProcess();

  @override
  String toString() {
    return 'ProcessEvent.handleProcess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _HandleProcess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result handleProcess(),
    @required Result dealWithProcess(String id, String taskDefinitionKey),
    @required Result nextRemind(String processInstanceId),
    @required Result handleByConsultant(ConsultantBean consultantBean),
    @required Result shareCode(),
  }) {
    assert(handleProcess != null);
    assert(dealWithProcess != null);
    assert(nextRemind != null);
    assert(handleByConsultant != null);
    assert(shareCode != null);
    return handleProcess();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result handleProcess(),
    Result dealWithProcess(String id, String taskDefinitionKey),
    Result nextRemind(String processInstanceId),
    Result handleByConsultant(ConsultantBean consultantBean),
    Result shareCode(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (handleProcess != null) {
      return handleProcess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result handleProcess(_HandleProcess value),
    @required Result dealWithProcess(_DealWithProcess value),
    @required Result nextRemind(_NextRemind value),
    @required Result handleByConsultant(_HandleByConsultant value),
    @required Result shareCode(_ShareCode value),
  }) {
    assert(handleProcess != null);
    assert(dealWithProcess != null);
    assert(nextRemind != null);
    assert(handleByConsultant != null);
    assert(shareCode != null);
    return handleProcess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result handleProcess(_HandleProcess value),
    Result dealWithProcess(_DealWithProcess value),
    Result nextRemind(_NextRemind value),
    Result handleByConsultant(_HandleByConsultant value),
    Result shareCode(_ShareCode value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (handleProcess != null) {
      return handleProcess(this);
    }
    return orElse();
  }
}

abstract class _HandleProcess implements ProcessEvent {
  const factory _HandleProcess() = _$_HandleProcess;
}

/// @nodoc
abstract class _$DealWithProcessCopyWith<$Res> {
  factory _$DealWithProcessCopyWith(
          _DealWithProcess value, $Res Function(_DealWithProcess) then) =
      __$DealWithProcessCopyWithImpl<$Res>;
  $Res call({String id, String taskDefinitionKey});
}

/// @nodoc
class __$DealWithProcessCopyWithImpl<$Res>
    extends _$ProcessEventCopyWithImpl<$Res>
    implements _$DealWithProcessCopyWith<$Res> {
  __$DealWithProcessCopyWithImpl(
      _DealWithProcess _value, $Res Function(_DealWithProcess) _then)
      : super(_value, (v) => _then(v as _DealWithProcess));

  @override
  _DealWithProcess get _value => super._value as _DealWithProcess;

  @override
  $Res call({
    Object id = freezed,
    Object taskDefinitionKey = freezed,
  }) {
    return _then(_DealWithProcess(
      id == freezed ? _value.id : id as String,
      taskDefinitionKey == freezed
          ? _value.taskDefinitionKey
          : taskDefinitionKey as String,
    ));
  }
}

/// @nodoc
class _$_DealWithProcess implements _DealWithProcess {
  const _$_DealWithProcess(this.id, this.taskDefinitionKey)
      : assert(id != null),
        assert(taskDefinitionKey != null);

  @override
  final String id;
  @override
  final String taskDefinitionKey;

  @override
  String toString() {
    return 'ProcessEvent.dealWithProcess(id: $id, taskDefinitionKey: $taskDefinitionKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DealWithProcess &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.taskDefinitionKey, taskDefinitionKey) ||
                const DeepCollectionEquality()
                    .equals(other.taskDefinitionKey, taskDefinitionKey)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(taskDefinitionKey);

  @override
  _$DealWithProcessCopyWith<_DealWithProcess> get copyWith =>
      __$DealWithProcessCopyWithImpl<_DealWithProcess>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result handleProcess(),
    @required Result dealWithProcess(String id, String taskDefinitionKey),
    @required Result nextRemind(String processInstanceId),
    @required Result handleByConsultant(ConsultantBean consultantBean),
    @required Result shareCode(),
  }) {
    assert(handleProcess != null);
    assert(dealWithProcess != null);
    assert(nextRemind != null);
    assert(handleByConsultant != null);
    assert(shareCode != null);
    return dealWithProcess(id, taskDefinitionKey);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result handleProcess(),
    Result dealWithProcess(String id, String taskDefinitionKey),
    Result nextRemind(String processInstanceId),
    Result handleByConsultant(ConsultantBean consultantBean),
    Result shareCode(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (dealWithProcess != null) {
      return dealWithProcess(id, taskDefinitionKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result handleProcess(_HandleProcess value),
    @required Result dealWithProcess(_DealWithProcess value),
    @required Result nextRemind(_NextRemind value),
    @required Result handleByConsultant(_HandleByConsultant value),
    @required Result shareCode(_ShareCode value),
  }) {
    assert(handleProcess != null);
    assert(dealWithProcess != null);
    assert(nextRemind != null);
    assert(handleByConsultant != null);
    assert(shareCode != null);
    return dealWithProcess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result handleProcess(_HandleProcess value),
    Result dealWithProcess(_DealWithProcess value),
    Result nextRemind(_NextRemind value),
    Result handleByConsultant(_HandleByConsultant value),
    Result shareCode(_ShareCode value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (dealWithProcess != null) {
      return dealWithProcess(this);
    }
    return orElse();
  }
}

abstract class _DealWithProcess implements ProcessEvent {
  const factory _DealWithProcess(String id, String taskDefinitionKey) =
      _$_DealWithProcess;

  String get id;
  String get taskDefinitionKey;
  _$DealWithProcessCopyWith<_DealWithProcess> get copyWith;
}

/// @nodoc
abstract class _$NextRemindCopyWith<$Res> {
  factory _$NextRemindCopyWith(
          _NextRemind value, $Res Function(_NextRemind) then) =
      __$NextRemindCopyWithImpl<$Res>;
  $Res call({String processInstanceId});
}

/// @nodoc
class __$NextRemindCopyWithImpl<$Res> extends _$ProcessEventCopyWithImpl<$Res>
    implements _$NextRemindCopyWith<$Res> {
  __$NextRemindCopyWithImpl(
      _NextRemind _value, $Res Function(_NextRemind) _then)
      : super(_value, (v) => _then(v as _NextRemind));

  @override
  _NextRemind get _value => super._value as _NextRemind;

  @override
  $Res call({
    Object processInstanceId = freezed,
  }) {
    return _then(_NextRemind(
      processInstanceId == freezed
          ? _value.processInstanceId
          : processInstanceId as String,
    ));
  }
}

/// @nodoc
class _$_NextRemind implements _NextRemind {
  const _$_NextRemind(this.processInstanceId)
      : assert(processInstanceId != null);

  @override
  final String processInstanceId;

  @override
  String toString() {
    return 'ProcessEvent.nextRemind(processInstanceId: $processInstanceId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NextRemind &&
            (identical(other.processInstanceId, processInstanceId) ||
                const DeepCollectionEquality()
                    .equals(other.processInstanceId, processInstanceId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(processInstanceId);

  @override
  _$NextRemindCopyWith<_NextRemind> get copyWith =>
      __$NextRemindCopyWithImpl<_NextRemind>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result handleProcess(),
    @required Result dealWithProcess(String id, String taskDefinitionKey),
    @required Result nextRemind(String processInstanceId),
    @required Result handleByConsultant(ConsultantBean consultantBean),
    @required Result shareCode(),
  }) {
    assert(handleProcess != null);
    assert(dealWithProcess != null);
    assert(nextRemind != null);
    assert(handleByConsultant != null);
    assert(shareCode != null);
    return nextRemind(processInstanceId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result handleProcess(),
    Result dealWithProcess(String id, String taskDefinitionKey),
    Result nextRemind(String processInstanceId),
    Result handleByConsultant(ConsultantBean consultantBean),
    Result shareCode(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (nextRemind != null) {
      return nextRemind(processInstanceId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result handleProcess(_HandleProcess value),
    @required Result dealWithProcess(_DealWithProcess value),
    @required Result nextRemind(_NextRemind value),
    @required Result handleByConsultant(_HandleByConsultant value),
    @required Result shareCode(_ShareCode value),
  }) {
    assert(handleProcess != null);
    assert(dealWithProcess != null);
    assert(nextRemind != null);
    assert(handleByConsultant != null);
    assert(shareCode != null);
    return nextRemind(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result handleProcess(_HandleProcess value),
    Result dealWithProcess(_DealWithProcess value),
    Result nextRemind(_NextRemind value),
    Result handleByConsultant(_HandleByConsultant value),
    Result shareCode(_ShareCode value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (nextRemind != null) {
      return nextRemind(this);
    }
    return orElse();
  }
}

abstract class _NextRemind implements ProcessEvent {
  const factory _NextRemind(String processInstanceId) = _$_NextRemind;

  String get processInstanceId;
  _$NextRemindCopyWith<_NextRemind> get copyWith;
}

/// @nodoc
abstract class _$HandleByConsultantCopyWith<$Res> {
  factory _$HandleByConsultantCopyWith(
          _HandleByConsultant value, $Res Function(_HandleByConsultant) then) =
      __$HandleByConsultantCopyWithImpl<$Res>;
  $Res call({ConsultantBean consultantBean});
}

/// @nodoc
class __$HandleByConsultantCopyWithImpl<$Res>
    extends _$ProcessEventCopyWithImpl<$Res>
    implements _$HandleByConsultantCopyWith<$Res> {
  __$HandleByConsultantCopyWithImpl(
      _HandleByConsultant _value, $Res Function(_HandleByConsultant) _then)
      : super(_value, (v) => _then(v as _HandleByConsultant));

  @override
  _HandleByConsultant get _value => super._value as _HandleByConsultant;

  @override
  $Res call({
    Object consultantBean = freezed,
  }) {
    return _then(_HandleByConsultant(
      consultantBean == freezed
          ? _value.consultantBean
          : consultantBean as ConsultantBean,
    ));
  }
}

/// @nodoc
class _$_HandleByConsultant implements _HandleByConsultant {
  const _$_HandleByConsultant(this.consultantBean)
      : assert(consultantBean != null);

  @override
  final ConsultantBean consultantBean;

  @override
  String toString() {
    return 'ProcessEvent.handleByConsultant(consultantBean: $consultantBean)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HandleByConsultant &&
            (identical(other.consultantBean, consultantBean) ||
                const DeepCollectionEquality()
                    .equals(other.consultantBean, consultantBean)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(consultantBean);

  @override
  _$HandleByConsultantCopyWith<_HandleByConsultant> get copyWith =>
      __$HandleByConsultantCopyWithImpl<_HandleByConsultant>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result handleProcess(),
    @required Result dealWithProcess(String id, String taskDefinitionKey),
    @required Result nextRemind(String processInstanceId),
    @required Result handleByConsultant(ConsultantBean consultantBean),
    @required Result shareCode(),
  }) {
    assert(handleProcess != null);
    assert(dealWithProcess != null);
    assert(nextRemind != null);
    assert(handleByConsultant != null);
    assert(shareCode != null);
    return handleByConsultant(consultantBean);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result handleProcess(),
    Result dealWithProcess(String id, String taskDefinitionKey),
    Result nextRemind(String processInstanceId),
    Result handleByConsultant(ConsultantBean consultantBean),
    Result shareCode(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (handleByConsultant != null) {
      return handleByConsultant(consultantBean);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result handleProcess(_HandleProcess value),
    @required Result dealWithProcess(_DealWithProcess value),
    @required Result nextRemind(_NextRemind value),
    @required Result handleByConsultant(_HandleByConsultant value),
    @required Result shareCode(_ShareCode value),
  }) {
    assert(handleProcess != null);
    assert(dealWithProcess != null);
    assert(nextRemind != null);
    assert(handleByConsultant != null);
    assert(shareCode != null);
    return handleByConsultant(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result handleProcess(_HandleProcess value),
    Result dealWithProcess(_DealWithProcess value),
    Result nextRemind(_NextRemind value),
    Result handleByConsultant(_HandleByConsultant value),
    Result shareCode(_ShareCode value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (handleByConsultant != null) {
      return handleByConsultant(this);
    }
    return orElse();
  }
}

abstract class _HandleByConsultant implements ProcessEvent {
  const factory _HandleByConsultant(ConsultantBean consultantBean) =
      _$_HandleByConsultant;

  ConsultantBean get consultantBean;
  _$HandleByConsultantCopyWith<_HandleByConsultant> get copyWith;
}

/// @nodoc
abstract class _$ShareCodeCopyWith<$Res> {
  factory _$ShareCodeCopyWith(
          _ShareCode value, $Res Function(_ShareCode) then) =
      __$ShareCodeCopyWithImpl<$Res>;
}

/// @nodoc
class __$ShareCodeCopyWithImpl<$Res> extends _$ProcessEventCopyWithImpl<$Res>
    implements _$ShareCodeCopyWith<$Res> {
  __$ShareCodeCopyWithImpl(_ShareCode _value, $Res Function(_ShareCode) _then)
      : super(_value, (v) => _then(v as _ShareCode));

  @override
  _ShareCode get _value => super._value as _ShareCode;
}

/// @nodoc
class _$_ShareCode implements _ShareCode {
  const _$_ShareCode();

  @override
  String toString() {
    return 'ProcessEvent.shareCode()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ShareCode);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result handleProcess(),
    @required Result dealWithProcess(String id, String taskDefinitionKey),
    @required Result nextRemind(String processInstanceId),
    @required Result handleByConsultant(ConsultantBean consultantBean),
    @required Result shareCode(),
  }) {
    assert(handleProcess != null);
    assert(dealWithProcess != null);
    assert(nextRemind != null);
    assert(handleByConsultant != null);
    assert(shareCode != null);
    return shareCode();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result handleProcess(),
    Result dealWithProcess(String id, String taskDefinitionKey),
    Result nextRemind(String processInstanceId),
    Result handleByConsultant(ConsultantBean consultantBean),
    Result shareCode(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (shareCode != null) {
      return shareCode();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result handleProcess(_HandleProcess value),
    @required Result dealWithProcess(_DealWithProcess value),
    @required Result nextRemind(_NextRemind value),
    @required Result handleByConsultant(_HandleByConsultant value),
    @required Result shareCode(_ShareCode value),
  }) {
    assert(handleProcess != null);
    assert(dealWithProcess != null);
    assert(nextRemind != null);
    assert(handleByConsultant != null);
    assert(shareCode != null);
    return shareCode(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result handleProcess(_HandleProcess value),
    Result dealWithProcess(_DealWithProcess value),
    Result nextRemind(_NextRemind value),
    Result handleByConsultant(_HandleByConsultant value),
    Result shareCode(_ShareCode value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (shareCode != null) {
      return shareCode(this);
    }
    return orElse();
  }
}

abstract class _ShareCode implements ProcessEvent {
  const factory _ShareCode() = _$_ShareCode;
}

/// @nodoc
class _$ProcessStateTearOff {
  const _$ProcessStateTearOff();

// ignore: unused_element
  _ProcessState call(
      {@required
          List<dynamic> processList,
      @required
          Map<String, dynamic> dealWithProcess,
      @required
          List<dynamic> nextRemind,
      @required
          List<dynamic> handleByConsultant,
      @required
          List<dynamic> shareCode,
      @required
          Option<Either<ValueFailure, Unit>> processFailureOrSuccessOption}) {
    return _ProcessState(
      processList: processList,
      dealWithProcess: dealWithProcess,
      nextRemind: nextRemind,
      handleByConsultant: handleByConsultant,
      shareCode: shareCode,
      processFailureOrSuccessOption: processFailureOrSuccessOption,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ProcessState = _$ProcessStateTearOff();

/// @nodoc
mixin _$ProcessState {
  List<dynamic> get processList;
  Map<String, dynamic> get dealWithProcess;
  List<dynamic> get nextRemind;
  List<dynamic> get handleByConsultant;
  List<dynamic> get shareCode;
  Option<Either<ValueFailure, Unit>> get processFailureOrSuccessOption;

  $ProcessStateCopyWith<ProcessState> get copyWith;
}

/// @nodoc
abstract class $ProcessStateCopyWith<$Res> {
  factory $ProcessStateCopyWith(
          ProcessState value, $Res Function(ProcessState) then) =
      _$ProcessStateCopyWithImpl<$Res>;
  $Res call(
      {List<dynamic> processList,
      Map<String, dynamic> dealWithProcess,
      List<dynamic> nextRemind,
      List<dynamic> handleByConsultant,
      List<dynamic> shareCode,
      Option<Either<ValueFailure, Unit>> processFailureOrSuccessOption});
}

/// @nodoc
class _$ProcessStateCopyWithImpl<$Res> implements $ProcessStateCopyWith<$Res> {
  _$ProcessStateCopyWithImpl(this._value, this._then);

  final ProcessState _value;
  // ignore: unused_field
  final $Res Function(ProcessState) _then;

  @override
  $Res call({
    Object processList = freezed,
    Object dealWithProcess = freezed,
    Object nextRemind = freezed,
    Object handleByConsultant = freezed,
    Object shareCode = freezed,
    Object processFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      processList: processList == freezed
          ? _value.processList
          : processList as List<dynamic>,
      dealWithProcess: dealWithProcess == freezed
          ? _value.dealWithProcess
          : dealWithProcess as Map<String, dynamic>,
      nextRemind: nextRemind == freezed
          ? _value.nextRemind
          : nextRemind as List<dynamic>,
      handleByConsultant: handleByConsultant == freezed
          ? _value.handleByConsultant
          : handleByConsultant as List<dynamic>,
      shareCode:
          shareCode == freezed ? _value.shareCode : shareCode as List<dynamic>,
      processFailureOrSuccessOption: processFailureOrSuccessOption == freezed
          ? _value.processFailureOrSuccessOption
          : processFailureOrSuccessOption as Option<Either<ValueFailure, Unit>>,
    ));
  }
}

/// @nodoc
abstract class _$ProcessStateCopyWith<$Res>
    implements $ProcessStateCopyWith<$Res> {
  factory _$ProcessStateCopyWith(
          _ProcessState value, $Res Function(_ProcessState) then) =
      __$ProcessStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<dynamic> processList,
      Map<String, dynamic> dealWithProcess,
      List<dynamic> nextRemind,
      List<dynamic> handleByConsultant,
      List<dynamic> shareCode,
      Option<Either<ValueFailure, Unit>> processFailureOrSuccessOption});
}

/// @nodoc
class __$ProcessStateCopyWithImpl<$Res> extends _$ProcessStateCopyWithImpl<$Res>
    implements _$ProcessStateCopyWith<$Res> {
  __$ProcessStateCopyWithImpl(
      _ProcessState _value, $Res Function(_ProcessState) _then)
      : super(_value, (v) => _then(v as _ProcessState));

  @override
  _ProcessState get _value => super._value as _ProcessState;

  @override
  $Res call({
    Object processList = freezed,
    Object dealWithProcess = freezed,
    Object nextRemind = freezed,
    Object handleByConsultant = freezed,
    Object shareCode = freezed,
    Object processFailureOrSuccessOption = freezed,
  }) {
    return _then(_ProcessState(
      processList: processList == freezed
          ? _value.processList
          : processList as List<dynamic>,
      dealWithProcess: dealWithProcess == freezed
          ? _value.dealWithProcess
          : dealWithProcess as Map<String, dynamic>,
      nextRemind: nextRemind == freezed
          ? _value.nextRemind
          : nextRemind as List<dynamic>,
      handleByConsultant: handleByConsultant == freezed
          ? _value.handleByConsultant
          : handleByConsultant as List<dynamic>,
      shareCode:
          shareCode == freezed ? _value.shareCode : shareCode as List<dynamic>,
      processFailureOrSuccessOption: processFailureOrSuccessOption == freezed
          ? _value.processFailureOrSuccessOption
          : processFailureOrSuccessOption as Option<Either<ValueFailure, Unit>>,
    ));
  }
}

/// @nodoc
class _$_ProcessState implements _ProcessState {
  const _$_ProcessState(
      {@required this.processList,
      @required this.dealWithProcess,
      @required this.nextRemind,
      @required this.handleByConsultant,
      @required this.shareCode,
      @required this.processFailureOrSuccessOption})
      : assert(processList != null),
        assert(dealWithProcess != null),
        assert(nextRemind != null),
        assert(handleByConsultant != null),
        assert(shareCode != null),
        assert(processFailureOrSuccessOption != null);

  @override
  final List<dynamic> processList;
  @override
  final Map<String, dynamic> dealWithProcess;
  @override
  final List<dynamic> nextRemind;
  @override
  final List<dynamic> handleByConsultant;
  @override
  final List<dynamic> shareCode;
  @override
  final Option<Either<ValueFailure, Unit>> processFailureOrSuccessOption;

  @override
  String toString() {
    return 'ProcessState(processList: $processList, dealWithProcess: $dealWithProcess, nextRemind: $nextRemind, handleByConsultant: $handleByConsultant, shareCode: $shareCode, processFailureOrSuccessOption: $processFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProcessState &&
            (identical(other.processList, processList) ||
                const DeepCollectionEquality()
                    .equals(other.processList, processList)) &&
            (identical(other.dealWithProcess, dealWithProcess) ||
                const DeepCollectionEquality()
                    .equals(other.dealWithProcess, dealWithProcess)) &&
            (identical(other.nextRemind, nextRemind) ||
                const DeepCollectionEquality()
                    .equals(other.nextRemind, nextRemind)) &&
            (identical(other.handleByConsultant, handleByConsultant) ||
                const DeepCollectionEquality()
                    .equals(other.handleByConsultant, handleByConsultant)) &&
            (identical(other.shareCode, shareCode) ||
                const DeepCollectionEquality()
                    .equals(other.shareCode, shareCode)) &&
            (identical(other.processFailureOrSuccessOption,
                    processFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.processFailureOrSuccessOption,
                    processFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(processList) ^
      const DeepCollectionEquality().hash(dealWithProcess) ^
      const DeepCollectionEquality().hash(nextRemind) ^
      const DeepCollectionEquality().hash(handleByConsultant) ^
      const DeepCollectionEquality().hash(shareCode) ^
      const DeepCollectionEquality().hash(processFailureOrSuccessOption);

  @override
  _$ProcessStateCopyWith<_ProcessState> get copyWith =>
      __$ProcessStateCopyWithImpl<_ProcessState>(this, _$identity);
}

abstract class _ProcessState implements ProcessState {
  const factory _ProcessState(
      {@required
          List<dynamic> processList,
      @required
          Map<String, dynamic> dealWithProcess,
      @required
          List<dynamic> nextRemind,
      @required
          List<dynamic> handleByConsultant,
      @required
          List<dynamic> shareCode,
      @required
          Option<Either<ValueFailure, Unit>>
              processFailureOrSuccessOption}) = _$_ProcessState;

  @override
  List<dynamic> get processList;
  @override
  Map<String, dynamic> get dealWithProcess;
  @override
  List<dynamic> get nextRemind;
  @override
  List<dynamic> get handleByConsultant;
  @override
  List<dynamic> get shareCode;
  @override
  Option<Either<ValueFailure, Unit>> get processFailureOrSuccessOption;
  @override
  _$ProcessStateCopyWith<_ProcessState> get copyWith;
}
