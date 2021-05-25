// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'web_scoket_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$WebScoketFailureTearOff {
  const _$WebScoketFailureTearOff();

// ignore: unused_element
  ServerError serverError() {
    return const ServerError();
  }

// ignore: unused_element
  ConnectFail connectFail() {
    return const ConnectFail();
  }

// ignore: unused_element
  ReceiveMessageFail receiveMessageFail() {
    return const ReceiveMessageFail();
  }

// ignore: unused_element
  QuitChatFail quitChatFail() {
    return const QuitChatFail();
  }
}

/// @nodoc
// ignore: unused_element
const $WebScoketFailure = _$WebScoketFailureTearOff();

/// @nodoc
mixin _$WebScoketFailure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result connectFail(),
    @required Result receiveMessageFail(),
    @required Result quitChatFail(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result connectFail(),
    Result receiveMessageFail(),
    Result quitChatFail(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result connectFail(ConnectFail value),
    @required Result receiveMessageFail(ReceiveMessageFail value),
    @required Result quitChatFail(QuitChatFail value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result connectFail(ConnectFail value),
    Result receiveMessageFail(ReceiveMessageFail value),
    Result quitChatFail(QuitChatFail value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $WebScoketFailureCopyWith<$Res> {
  factory $WebScoketFailureCopyWith(
          WebScoketFailure value, $Res Function(WebScoketFailure) then) =
      _$WebScoketFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$WebScoketFailureCopyWithImpl<$Res>
    implements $WebScoketFailureCopyWith<$Res> {
  _$WebScoketFailureCopyWithImpl(this._value, this._then);

  final WebScoketFailure _value;
  // ignore: unused_field
  final $Res Function(WebScoketFailure) _then;
}

/// @nodoc
abstract class $ServerErrorCopyWith<$Res> {
  factory $ServerErrorCopyWith(
          ServerError value, $Res Function(ServerError) then) =
      _$ServerErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$ServerErrorCopyWithImpl<$Res>
    extends _$WebScoketFailureCopyWithImpl<$Res>
    implements $ServerErrorCopyWith<$Res> {
  _$ServerErrorCopyWithImpl(
      ServerError _value, $Res Function(ServerError) _then)
      : super(_value, (v) => _then(v as ServerError));

  @override
  ServerError get _value => super._value as ServerError;
}

/// @nodoc
class _$ServerError implements ServerError {
  const _$ServerError();

  @override
  String toString() {
    return 'WebScoketFailure.serverError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result connectFail(),
    @required Result receiveMessageFail(),
    @required Result quitChatFail(),
  }) {
    assert(serverError != null);
    assert(connectFail != null);
    assert(receiveMessageFail != null);
    assert(quitChatFail != null);
    return serverError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result connectFail(),
    Result receiveMessageFail(),
    Result quitChatFail(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result connectFail(ConnectFail value),
    @required Result receiveMessageFail(ReceiveMessageFail value),
    @required Result quitChatFail(QuitChatFail value),
  }) {
    assert(serverError != null);
    assert(connectFail != null);
    assert(receiveMessageFail != null);
    assert(quitChatFail != null);
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result connectFail(ConnectFail value),
    Result receiveMessageFail(ReceiveMessageFail value),
    Result quitChatFail(QuitChatFail value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError implements WebScoketFailure {
  const factory ServerError() = _$ServerError;
}

/// @nodoc
abstract class $ConnectFailCopyWith<$Res> {
  factory $ConnectFailCopyWith(
          ConnectFail value, $Res Function(ConnectFail) then) =
      _$ConnectFailCopyWithImpl<$Res>;
}

/// @nodoc
class _$ConnectFailCopyWithImpl<$Res>
    extends _$WebScoketFailureCopyWithImpl<$Res>
    implements $ConnectFailCopyWith<$Res> {
  _$ConnectFailCopyWithImpl(
      ConnectFail _value, $Res Function(ConnectFail) _then)
      : super(_value, (v) => _then(v as ConnectFail));

  @override
  ConnectFail get _value => super._value as ConnectFail;
}

/// @nodoc
class _$ConnectFail implements ConnectFail {
  const _$ConnectFail();

  @override
  String toString() {
    return 'WebScoketFailure.connectFail()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ConnectFail);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result connectFail(),
    @required Result receiveMessageFail(),
    @required Result quitChatFail(),
  }) {
    assert(serverError != null);
    assert(connectFail != null);
    assert(receiveMessageFail != null);
    assert(quitChatFail != null);
    return connectFail();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result connectFail(),
    Result receiveMessageFail(),
    Result quitChatFail(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (connectFail != null) {
      return connectFail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result connectFail(ConnectFail value),
    @required Result receiveMessageFail(ReceiveMessageFail value),
    @required Result quitChatFail(QuitChatFail value),
  }) {
    assert(serverError != null);
    assert(connectFail != null);
    assert(receiveMessageFail != null);
    assert(quitChatFail != null);
    return connectFail(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result connectFail(ConnectFail value),
    Result receiveMessageFail(ReceiveMessageFail value),
    Result quitChatFail(QuitChatFail value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (connectFail != null) {
      return connectFail(this);
    }
    return orElse();
  }
}

abstract class ConnectFail implements WebScoketFailure {
  const factory ConnectFail() = _$ConnectFail;
}

/// @nodoc
abstract class $ReceiveMessageFailCopyWith<$Res> {
  factory $ReceiveMessageFailCopyWith(
          ReceiveMessageFail value, $Res Function(ReceiveMessageFail) then) =
      _$ReceiveMessageFailCopyWithImpl<$Res>;
}

/// @nodoc
class _$ReceiveMessageFailCopyWithImpl<$Res>
    extends _$WebScoketFailureCopyWithImpl<$Res>
    implements $ReceiveMessageFailCopyWith<$Res> {
  _$ReceiveMessageFailCopyWithImpl(
      ReceiveMessageFail _value, $Res Function(ReceiveMessageFail) _then)
      : super(_value, (v) => _then(v as ReceiveMessageFail));

  @override
  ReceiveMessageFail get _value => super._value as ReceiveMessageFail;
}

/// @nodoc
class _$ReceiveMessageFail implements ReceiveMessageFail {
  const _$ReceiveMessageFail();

  @override
  String toString() {
    return 'WebScoketFailure.receiveMessageFail()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ReceiveMessageFail);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result connectFail(),
    @required Result receiveMessageFail(),
    @required Result quitChatFail(),
  }) {
    assert(serverError != null);
    assert(connectFail != null);
    assert(receiveMessageFail != null);
    assert(quitChatFail != null);
    return receiveMessageFail();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result connectFail(),
    Result receiveMessageFail(),
    Result quitChatFail(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (receiveMessageFail != null) {
      return receiveMessageFail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result connectFail(ConnectFail value),
    @required Result receiveMessageFail(ReceiveMessageFail value),
    @required Result quitChatFail(QuitChatFail value),
  }) {
    assert(serverError != null);
    assert(connectFail != null);
    assert(receiveMessageFail != null);
    assert(quitChatFail != null);
    return receiveMessageFail(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result connectFail(ConnectFail value),
    Result receiveMessageFail(ReceiveMessageFail value),
    Result quitChatFail(QuitChatFail value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (receiveMessageFail != null) {
      return receiveMessageFail(this);
    }
    return orElse();
  }
}

abstract class ReceiveMessageFail implements WebScoketFailure {
  const factory ReceiveMessageFail() = _$ReceiveMessageFail;
}

/// @nodoc
abstract class $QuitChatFailCopyWith<$Res> {
  factory $QuitChatFailCopyWith(
          QuitChatFail value, $Res Function(QuitChatFail) then) =
      _$QuitChatFailCopyWithImpl<$Res>;
}

/// @nodoc
class _$QuitChatFailCopyWithImpl<$Res>
    extends _$WebScoketFailureCopyWithImpl<$Res>
    implements $QuitChatFailCopyWith<$Res> {
  _$QuitChatFailCopyWithImpl(
      QuitChatFail _value, $Res Function(QuitChatFail) _then)
      : super(_value, (v) => _then(v as QuitChatFail));

  @override
  QuitChatFail get _value => super._value as QuitChatFail;
}

/// @nodoc
class _$QuitChatFail implements QuitChatFail {
  const _$QuitChatFail();

  @override
  String toString() {
    return 'WebScoketFailure.quitChatFail()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is QuitChatFail);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result connectFail(),
    @required Result receiveMessageFail(),
    @required Result quitChatFail(),
  }) {
    assert(serverError != null);
    assert(connectFail != null);
    assert(receiveMessageFail != null);
    assert(quitChatFail != null);
    return quitChatFail();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result connectFail(),
    Result receiveMessageFail(),
    Result quitChatFail(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (quitChatFail != null) {
      return quitChatFail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result connectFail(ConnectFail value),
    @required Result receiveMessageFail(ReceiveMessageFail value),
    @required Result quitChatFail(QuitChatFail value),
  }) {
    assert(serverError != null);
    assert(connectFail != null);
    assert(receiveMessageFail != null);
    assert(quitChatFail != null);
    return quitChatFail(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result connectFail(ConnectFail value),
    Result receiveMessageFail(ReceiveMessageFail value),
    Result quitChatFail(QuitChatFail value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (quitChatFail != null) {
      return quitChatFail(this);
    }
    return orElse();
  }
}

abstract class QuitChatFail implements WebScoketFailure {
  const factory QuitChatFail() = _$QuitChatFail;
}
