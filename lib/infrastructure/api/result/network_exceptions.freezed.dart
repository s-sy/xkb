// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'network_exceptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
NetworkExceptions _$NetworkExceptionsFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'requestCancelled':
      return RequestCancelled.fromJson(json);
    case 'unauthorisedRequest':
      return UnauthorisedRequest.fromJson(json);
    case 'badRequest':
      return BadRequest.fromJson(json);
    case 'notFound':
      return NotFound.fromJson(json);
    case 'methodNotAllowed':
      return MethodNotAllowed.fromJson(json);
    case 'notAcceptable':
      return NotAcceptable.fromJson(json);
    case 'requestTimeout':
      return RequestTimeout.fromJson(json);
    case 'sendTimeout':
      return SendTimeout.fromJson(json);
    case 'conflict':
      return Conflict.fromJson(json);
    case 'internalServerError':
      return InternalServerError.fromJson(json);
    case 'notImplemented':
      return NotImplemented.fromJson(json);
    case 'serviceUnavailable':
      return ServiceUnavailable.fromJson(json);
    case 'noInternetConnection':
      return NoInternetConnection.fromJson(json);
    case 'formatException':
      return FormatException.fromJson(json);
    case 'unableToProcess':
      return UnableToProcess.fromJson(json);
    case 'defaultError':
      return DefaultError.fromJson(json);
    case 'unexpectedError':
      return UnexpectedError.fromJson(json);
    case 'loginError':
      return LoginError.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$NetworkExceptionsTearOff {
  const _$NetworkExceptionsTearOff();

// ignore: unused_element
  RequestCancelled requestCancelled() {
    return const RequestCancelled();
  }

// ignore: unused_element
  UnauthorisedRequest unauthorisedRequest() {
    return const UnauthorisedRequest();
  }

// ignore: unused_element
  BadRequest badRequest() {
    return const BadRequest();
  }

// ignore: unused_element
  NotFound notFound(String reason) {
    return NotFound(
      reason,
    );
  }

// ignore: unused_element
  MethodNotAllowed methodNotAllowed() {
    return const MethodNotAllowed();
  }

// ignore: unused_element
  NotAcceptable notAcceptable() {
    return const NotAcceptable();
  }

// ignore: unused_element
  RequestTimeout requestTimeout() {
    return const RequestTimeout();
  }

// ignore: unused_element
  SendTimeout sendTimeout() {
    return const SendTimeout();
  }

// ignore: unused_element
  Conflict conflict() {
    return const Conflict();
  }

// ignore: unused_element
  InternalServerError internalServerError() {
    return const InternalServerError();
  }

// ignore: unused_element
  NotImplemented notImplemented() {
    return const NotImplemented();
  }

// ignore: unused_element
  ServiceUnavailable serviceUnavailable() {
    return const ServiceUnavailable();
  }

// ignore: unused_element
  NoInternetConnection noInternetConnection() {
    return const NoInternetConnection();
  }

// ignore: unused_element
  FormatException formatException() {
    return const FormatException();
  }

// ignore: unused_element
  UnableToProcess unableToProcess() {
    return const UnableToProcess();
  }

// ignore: unused_element
  DefaultError defaultError(String error) {
    return DefaultError(
      error,
    );
  }

// ignore: unused_element
  UnexpectedError unexpectedError() {
    return const UnexpectedError();
  }

// ignore: unused_element
  LoginError loginError() {
    return const LoginError();
  }

// ignore: unused_element
  NetworkExceptions fromJson(Map<String, Object> json) {
    return NetworkExceptions.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $NetworkExceptions = _$NetworkExceptionsTearOff();

/// @nodoc
mixin _$NetworkExceptions {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestCancelled(),
    @required Result unauthorisedRequest(),
    @required Result badRequest(),
    @required Result notFound(String reason),
    @required Result methodNotAllowed(),
    @required Result notAcceptable(),
    @required Result requestTimeout(),
    @required Result sendTimeout(),
    @required Result conflict(),
    @required Result internalServerError(),
    @required Result notImplemented(),
    @required Result serviceUnavailable(),
    @required Result noInternetConnection(),
    @required Result formatException(),
    @required Result unableToProcess(),
    @required Result defaultError(String error),
    @required Result unexpectedError(),
    @required Result loginError(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestCancelled(),
    Result unauthorisedRequest(),
    Result badRequest(),
    Result notFound(String reason),
    Result methodNotAllowed(),
    Result notAcceptable(),
    Result requestTimeout(),
    Result sendTimeout(),
    Result conflict(),
    Result internalServerError(),
    Result notImplemented(),
    Result serviceUnavailable(),
    Result noInternetConnection(),
    Result formatException(),
    Result unableToProcess(),
    Result defaultError(String error),
    Result unexpectedError(),
    Result loginError(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestCancelled(RequestCancelled value),
    @required Result unauthorisedRequest(UnauthorisedRequest value),
    @required Result badRequest(BadRequest value),
    @required Result notFound(NotFound value),
    @required Result methodNotAllowed(MethodNotAllowed value),
    @required Result notAcceptable(NotAcceptable value),
    @required Result requestTimeout(RequestTimeout value),
    @required Result sendTimeout(SendTimeout value),
    @required Result conflict(Conflict value),
    @required Result internalServerError(InternalServerError value),
    @required Result notImplemented(NotImplemented value),
    @required Result serviceUnavailable(ServiceUnavailable value),
    @required Result noInternetConnection(NoInternetConnection value),
    @required Result formatException(FormatException value),
    @required Result unableToProcess(UnableToProcess value),
    @required Result defaultError(DefaultError value),
    @required Result unexpectedError(UnexpectedError value),
    @required Result loginError(LoginError value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestCancelled(RequestCancelled value),
    Result unauthorisedRequest(UnauthorisedRequest value),
    Result badRequest(BadRequest value),
    Result notFound(NotFound value),
    Result methodNotAllowed(MethodNotAllowed value),
    Result notAcceptable(NotAcceptable value),
    Result requestTimeout(RequestTimeout value),
    Result sendTimeout(SendTimeout value),
    Result conflict(Conflict value),
    Result internalServerError(InternalServerError value),
    Result notImplemented(NotImplemented value),
    Result serviceUnavailable(ServiceUnavailable value),
    Result noInternetConnection(NoInternetConnection value),
    Result formatException(FormatException value),
    Result unableToProcess(UnableToProcess value),
    Result defaultError(DefaultError value),
    Result unexpectedError(UnexpectedError value),
    Result loginError(LoginError value),
    @required Result orElse(),
  });
  Map<String, dynamic> toJson();
}

/// @nodoc
abstract class $NetworkExceptionsCopyWith<$Res> {
  factory $NetworkExceptionsCopyWith(
          NetworkExceptions value, $Res Function(NetworkExceptions) then) =
      _$NetworkExceptionsCopyWithImpl<$Res>;
}

/// @nodoc
class _$NetworkExceptionsCopyWithImpl<$Res>
    implements $NetworkExceptionsCopyWith<$Res> {
  _$NetworkExceptionsCopyWithImpl(this._value, this._then);

  final NetworkExceptions _value;
  // ignore: unused_field
  final $Res Function(NetworkExceptions) _then;
}

/// @nodoc
abstract class $RequestCancelledCopyWith<$Res> {
  factory $RequestCancelledCopyWith(
          RequestCancelled value, $Res Function(RequestCancelled) then) =
      _$RequestCancelledCopyWithImpl<$Res>;
}

/// @nodoc
class _$RequestCancelledCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $RequestCancelledCopyWith<$Res> {
  _$RequestCancelledCopyWithImpl(
      RequestCancelled _value, $Res Function(RequestCancelled) _then)
      : super(_value, (v) => _then(v as RequestCancelled));

  @override
  RequestCancelled get _value => super._value as RequestCancelled;
}

@JsonSerializable()

/// @nodoc
class _$RequestCancelled implements RequestCancelled {
  const _$RequestCancelled();

  factory _$RequestCancelled.fromJson(Map<String, dynamic> json) =>
      _$_$RequestCancelledFromJson(json);

  @override
  String toString() {
    return 'NetworkExceptions.requestCancelled()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RequestCancelled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestCancelled(),
    @required Result unauthorisedRequest(),
    @required Result badRequest(),
    @required Result notFound(String reason),
    @required Result methodNotAllowed(),
    @required Result notAcceptable(),
    @required Result requestTimeout(),
    @required Result sendTimeout(),
    @required Result conflict(),
    @required Result internalServerError(),
    @required Result notImplemented(),
    @required Result serviceUnavailable(),
    @required Result noInternetConnection(),
    @required Result formatException(),
    @required Result unableToProcess(),
    @required Result defaultError(String error),
    @required Result unexpectedError(),
    @required Result loginError(),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return requestCancelled();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestCancelled(),
    Result unauthorisedRequest(),
    Result badRequest(),
    Result notFound(String reason),
    Result methodNotAllowed(),
    Result notAcceptable(),
    Result requestTimeout(),
    Result sendTimeout(),
    Result conflict(),
    Result internalServerError(),
    Result notImplemented(),
    Result serviceUnavailable(),
    Result noInternetConnection(),
    Result formatException(),
    Result unableToProcess(),
    Result defaultError(String error),
    Result unexpectedError(),
    Result loginError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (requestCancelled != null) {
      return requestCancelled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestCancelled(RequestCancelled value),
    @required Result unauthorisedRequest(UnauthorisedRequest value),
    @required Result badRequest(BadRequest value),
    @required Result notFound(NotFound value),
    @required Result methodNotAllowed(MethodNotAllowed value),
    @required Result notAcceptable(NotAcceptable value),
    @required Result requestTimeout(RequestTimeout value),
    @required Result sendTimeout(SendTimeout value),
    @required Result conflict(Conflict value),
    @required Result internalServerError(InternalServerError value),
    @required Result notImplemented(NotImplemented value),
    @required Result serviceUnavailable(ServiceUnavailable value),
    @required Result noInternetConnection(NoInternetConnection value),
    @required Result formatException(FormatException value),
    @required Result unableToProcess(UnableToProcess value),
    @required Result defaultError(DefaultError value),
    @required Result unexpectedError(UnexpectedError value),
    @required Result loginError(LoginError value),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return requestCancelled(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestCancelled(RequestCancelled value),
    Result unauthorisedRequest(UnauthorisedRequest value),
    Result badRequest(BadRequest value),
    Result notFound(NotFound value),
    Result methodNotAllowed(MethodNotAllowed value),
    Result notAcceptable(NotAcceptable value),
    Result requestTimeout(RequestTimeout value),
    Result sendTimeout(SendTimeout value),
    Result conflict(Conflict value),
    Result internalServerError(InternalServerError value),
    Result notImplemented(NotImplemented value),
    Result serviceUnavailable(ServiceUnavailable value),
    Result noInternetConnection(NoInternetConnection value),
    Result formatException(FormatException value),
    Result unableToProcess(UnableToProcess value),
    Result defaultError(DefaultError value),
    Result unexpectedError(UnexpectedError value),
    Result loginError(LoginError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (requestCancelled != null) {
      return requestCancelled(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$RequestCancelledToJson(this)
      ..['runtimeType'] = 'requestCancelled';
  }
}

abstract class RequestCancelled implements NetworkExceptions {
  const factory RequestCancelled() = _$RequestCancelled;

  factory RequestCancelled.fromJson(Map<String, dynamic> json) =
      _$RequestCancelled.fromJson;
}

/// @nodoc
abstract class $UnauthorisedRequestCopyWith<$Res> {
  factory $UnauthorisedRequestCopyWith(
          UnauthorisedRequest value, $Res Function(UnauthorisedRequest) then) =
      _$UnauthorisedRequestCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnauthorisedRequestCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $UnauthorisedRequestCopyWith<$Res> {
  _$UnauthorisedRequestCopyWithImpl(
      UnauthorisedRequest _value, $Res Function(UnauthorisedRequest) _then)
      : super(_value, (v) => _then(v as UnauthorisedRequest));

  @override
  UnauthorisedRequest get _value => super._value as UnauthorisedRequest;
}

@JsonSerializable()

/// @nodoc
class _$UnauthorisedRequest implements UnauthorisedRequest {
  const _$UnauthorisedRequest();

  factory _$UnauthorisedRequest.fromJson(Map<String, dynamic> json) =>
      _$_$UnauthorisedRequestFromJson(json);

  @override
  String toString() {
    return 'NetworkExceptions.unauthorisedRequest()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UnauthorisedRequest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestCancelled(),
    @required Result unauthorisedRequest(),
    @required Result badRequest(),
    @required Result notFound(String reason),
    @required Result methodNotAllowed(),
    @required Result notAcceptable(),
    @required Result requestTimeout(),
    @required Result sendTimeout(),
    @required Result conflict(),
    @required Result internalServerError(),
    @required Result notImplemented(),
    @required Result serviceUnavailable(),
    @required Result noInternetConnection(),
    @required Result formatException(),
    @required Result unableToProcess(),
    @required Result defaultError(String error),
    @required Result unexpectedError(),
    @required Result loginError(),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return unauthorisedRequest();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestCancelled(),
    Result unauthorisedRequest(),
    Result badRequest(),
    Result notFound(String reason),
    Result methodNotAllowed(),
    Result notAcceptable(),
    Result requestTimeout(),
    Result sendTimeout(),
    Result conflict(),
    Result internalServerError(),
    Result notImplemented(),
    Result serviceUnavailable(),
    Result noInternetConnection(),
    Result formatException(),
    Result unableToProcess(),
    Result defaultError(String error),
    Result unexpectedError(),
    Result loginError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unauthorisedRequest != null) {
      return unauthorisedRequest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestCancelled(RequestCancelled value),
    @required Result unauthorisedRequest(UnauthorisedRequest value),
    @required Result badRequest(BadRequest value),
    @required Result notFound(NotFound value),
    @required Result methodNotAllowed(MethodNotAllowed value),
    @required Result notAcceptable(NotAcceptable value),
    @required Result requestTimeout(RequestTimeout value),
    @required Result sendTimeout(SendTimeout value),
    @required Result conflict(Conflict value),
    @required Result internalServerError(InternalServerError value),
    @required Result notImplemented(NotImplemented value),
    @required Result serviceUnavailable(ServiceUnavailable value),
    @required Result noInternetConnection(NoInternetConnection value),
    @required Result formatException(FormatException value),
    @required Result unableToProcess(UnableToProcess value),
    @required Result defaultError(DefaultError value),
    @required Result unexpectedError(UnexpectedError value),
    @required Result loginError(LoginError value),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return unauthorisedRequest(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestCancelled(RequestCancelled value),
    Result unauthorisedRequest(UnauthorisedRequest value),
    Result badRequest(BadRequest value),
    Result notFound(NotFound value),
    Result methodNotAllowed(MethodNotAllowed value),
    Result notAcceptable(NotAcceptable value),
    Result requestTimeout(RequestTimeout value),
    Result sendTimeout(SendTimeout value),
    Result conflict(Conflict value),
    Result internalServerError(InternalServerError value),
    Result notImplemented(NotImplemented value),
    Result serviceUnavailable(ServiceUnavailable value),
    Result noInternetConnection(NoInternetConnection value),
    Result formatException(FormatException value),
    Result unableToProcess(UnableToProcess value),
    Result defaultError(DefaultError value),
    Result unexpectedError(UnexpectedError value),
    Result loginError(LoginError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unauthorisedRequest != null) {
      return unauthorisedRequest(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$UnauthorisedRequestToJson(this)
      ..['runtimeType'] = 'unauthorisedRequest';
  }
}

abstract class UnauthorisedRequest implements NetworkExceptions {
  const factory UnauthorisedRequest() = _$UnauthorisedRequest;

  factory UnauthorisedRequest.fromJson(Map<String, dynamic> json) =
      _$UnauthorisedRequest.fromJson;
}

/// @nodoc
abstract class $BadRequestCopyWith<$Res> {
  factory $BadRequestCopyWith(
          BadRequest value, $Res Function(BadRequest) then) =
      _$BadRequestCopyWithImpl<$Res>;
}

/// @nodoc
class _$BadRequestCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $BadRequestCopyWith<$Res> {
  _$BadRequestCopyWithImpl(BadRequest _value, $Res Function(BadRequest) _then)
      : super(_value, (v) => _then(v as BadRequest));

  @override
  BadRequest get _value => super._value as BadRequest;
}

@JsonSerializable()

/// @nodoc
class _$BadRequest implements BadRequest {
  const _$BadRequest();

  factory _$BadRequest.fromJson(Map<String, dynamic> json) =>
      _$_$BadRequestFromJson(json);

  @override
  String toString() {
    return 'NetworkExceptions.badRequest()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BadRequest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestCancelled(),
    @required Result unauthorisedRequest(),
    @required Result badRequest(),
    @required Result notFound(String reason),
    @required Result methodNotAllowed(),
    @required Result notAcceptable(),
    @required Result requestTimeout(),
    @required Result sendTimeout(),
    @required Result conflict(),
    @required Result internalServerError(),
    @required Result notImplemented(),
    @required Result serviceUnavailable(),
    @required Result noInternetConnection(),
    @required Result formatException(),
    @required Result unableToProcess(),
    @required Result defaultError(String error),
    @required Result unexpectedError(),
    @required Result loginError(),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return badRequest();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestCancelled(),
    Result unauthorisedRequest(),
    Result badRequest(),
    Result notFound(String reason),
    Result methodNotAllowed(),
    Result notAcceptable(),
    Result requestTimeout(),
    Result sendTimeout(),
    Result conflict(),
    Result internalServerError(),
    Result notImplemented(),
    Result serviceUnavailable(),
    Result noInternetConnection(),
    Result formatException(),
    Result unableToProcess(),
    Result defaultError(String error),
    Result unexpectedError(),
    Result loginError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (badRequest != null) {
      return badRequest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestCancelled(RequestCancelled value),
    @required Result unauthorisedRequest(UnauthorisedRequest value),
    @required Result badRequest(BadRequest value),
    @required Result notFound(NotFound value),
    @required Result methodNotAllowed(MethodNotAllowed value),
    @required Result notAcceptable(NotAcceptable value),
    @required Result requestTimeout(RequestTimeout value),
    @required Result sendTimeout(SendTimeout value),
    @required Result conflict(Conflict value),
    @required Result internalServerError(InternalServerError value),
    @required Result notImplemented(NotImplemented value),
    @required Result serviceUnavailable(ServiceUnavailable value),
    @required Result noInternetConnection(NoInternetConnection value),
    @required Result formatException(FormatException value),
    @required Result unableToProcess(UnableToProcess value),
    @required Result defaultError(DefaultError value),
    @required Result unexpectedError(UnexpectedError value),
    @required Result loginError(LoginError value),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return badRequest(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestCancelled(RequestCancelled value),
    Result unauthorisedRequest(UnauthorisedRequest value),
    Result badRequest(BadRequest value),
    Result notFound(NotFound value),
    Result methodNotAllowed(MethodNotAllowed value),
    Result notAcceptable(NotAcceptable value),
    Result requestTimeout(RequestTimeout value),
    Result sendTimeout(SendTimeout value),
    Result conflict(Conflict value),
    Result internalServerError(InternalServerError value),
    Result notImplemented(NotImplemented value),
    Result serviceUnavailable(ServiceUnavailable value),
    Result noInternetConnection(NoInternetConnection value),
    Result formatException(FormatException value),
    Result unableToProcess(UnableToProcess value),
    Result defaultError(DefaultError value),
    Result unexpectedError(UnexpectedError value),
    Result loginError(LoginError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (badRequest != null) {
      return badRequest(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$BadRequestToJson(this)..['runtimeType'] = 'badRequest';
  }
}

abstract class BadRequest implements NetworkExceptions {
  const factory BadRequest() = _$BadRequest;

  factory BadRequest.fromJson(Map<String, dynamic> json) =
      _$BadRequest.fromJson;
}

/// @nodoc
abstract class $NotFoundCopyWith<$Res> {
  factory $NotFoundCopyWith(NotFound value, $Res Function(NotFound) then) =
      _$NotFoundCopyWithImpl<$Res>;
  $Res call({String reason});
}

/// @nodoc
class _$NotFoundCopyWithImpl<$Res> extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $NotFoundCopyWith<$Res> {
  _$NotFoundCopyWithImpl(NotFound _value, $Res Function(NotFound) _then)
      : super(_value, (v) => _then(v as NotFound));

  @override
  NotFound get _value => super._value as NotFound;

  @override
  $Res call({
    Object reason = freezed,
  }) {
    return _then(NotFound(
      reason == freezed ? _value.reason : reason as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$NotFound implements NotFound {
  const _$NotFound(this.reason) : assert(reason != null);

  factory _$NotFound.fromJson(Map<String, dynamic> json) =>
      _$_$NotFoundFromJson(json);

  @override
  final String reason;

  @override
  String toString() {
    return 'NetworkExceptions.notFound(reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NotFound &&
            (identical(other.reason, reason) ||
                const DeepCollectionEquality().equals(other.reason, reason)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(reason);

  @override
  $NotFoundCopyWith<NotFound> get copyWith =>
      _$NotFoundCopyWithImpl<NotFound>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestCancelled(),
    @required Result unauthorisedRequest(),
    @required Result badRequest(),
    @required Result notFound(String reason),
    @required Result methodNotAllowed(),
    @required Result notAcceptable(),
    @required Result requestTimeout(),
    @required Result sendTimeout(),
    @required Result conflict(),
    @required Result internalServerError(),
    @required Result notImplemented(),
    @required Result serviceUnavailable(),
    @required Result noInternetConnection(),
    @required Result formatException(),
    @required Result unableToProcess(),
    @required Result defaultError(String error),
    @required Result unexpectedError(),
    @required Result loginError(),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return notFound(reason);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestCancelled(),
    Result unauthorisedRequest(),
    Result badRequest(),
    Result notFound(String reason),
    Result methodNotAllowed(),
    Result notAcceptable(),
    Result requestTimeout(),
    Result sendTimeout(),
    Result conflict(),
    Result internalServerError(),
    Result notImplemented(),
    Result serviceUnavailable(),
    Result noInternetConnection(),
    Result formatException(),
    Result unableToProcess(),
    Result defaultError(String error),
    Result unexpectedError(),
    Result loginError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (notFound != null) {
      return notFound(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestCancelled(RequestCancelled value),
    @required Result unauthorisedRequest(UnauthorisedRequest value),
    @required Result badRequest(BadRequest value),
    @required Result notFound(NotFound value),
    @required Result methodNotAllowed(MethodNotAllowed value),
    @required Result notAcceptable(NotAcceptable value),
    @required Result requestTimeout(RequestTimeout value),
    @required Result sendTimeout(SendTimeout value),
    @required Result conflict(Conflict value),
    @required Result internalServerError(InternalServerError value),
    @required Result notImplemented(NotImplemented value),
    @required Result serviceUnavailable(ServiceUnavailable value),
    @required Result noInternetConnection(NoInternetConnection value),
    @required Result formatException(FormatException value),
    @required Result unableToProcess(UnableToProcess value),
    @required Result defaultError(DefaultError value),
    @required Result unexpectedError(UnexpectedError value),
    @required Result loginError(LoginError value),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestCancelled(RequestCancelled value),
    Result unauthorisedRequest(UnauthorisedRequest value),
    Result badRequest(BadRequest value),
    Result notFound(NotFound value),
    Result methodNotAllowed(MethodNotAllowed value),
    Result notAcceptable(NotAcceptable value),
    Result requestTimeout(RequestTimeout value),
    Result sendTimeout(SendTimeout value),
    Result conflict(Conflict value),
    Result internalServerError(InternalServerError value),
    Result notImplemented(NotImplemented value),
    Result serviceUnavailable(ServiceUnavailable value),
    Result noInternetConnection(NoInternetConnection value),
    Result formatException(FormatException value),
    Result unableToProcess(UnableToProcess value),
    Result defaultError(DefaultError value),
    Result unexpectedError(UnexpectedError value),
    Result loginError(LoginError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$NotFoundToJson(this)..['runtimeType'] = 'notFound';
  }
}

abstract class NotFound implements NetworkExceptions {
  const factory NotFound(String reason) = _$NotFound;

  factory NotFound.fromJson(Map<String, dynamic> json) = _$NotFound.fromJson;

  String get reason;
  $NotFoundCopyWith<NotFound> get copyWith;
}

/// @nodoc
abstract class $MethodNotAllowedCopyWith<$Res> {
  factory $MethodNotAllowedCopyWith(
          MethodNotAllowed value, $Res Function(MethodNotAllowed) then) =
      _$MethodNotAllowedCopyWithImpl<$Res>;
}

/// @nodoc
class _$MethodNotAllowedCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $MethodNotAllowedCopyWith<$Res> {
  _$MethodNotAllowedCopyWithImpl(
      MethodNotAllowed _value, $Res Function(MethodNotAllowed) _then)
      : super(_value, (v) => _then(v as MethodNotAllowed));

  @override
  MethodNotAllowed get _value => super._value as MethodNotAllowed;
}

@JsonSerializable()

/// @nodoc
class _$MethodNotAllowed implements MethodNotAllowed {
  const _$MethodNotAllowed();

  factory _$MethodNotAllowed.fromJson(Map<String, dynamic> json) =>
      _$_$MethodNotAllowedFromJson(json);

  @override
  String toString() {
    return 'NetworkExceptions.methodNotAllowed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is MethodNotAllowed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestCancelled(),
    @required Result unauthorisedRequest(),
    @required Result badRequest(),
    @required Result notFound(String reason),
    @required Result methodNotAllowed(),
    @required Result notAcceptable(),
    @required Result requestTimeout(),
    @required Result sendTimeout(),
    @required Result conflict(),
    @required Result internalServerError(),
    @required Result notImplemented(),
    @required Result serviceUnavailable(),
    @required Result noInternetConnection(),
    @required Result formatException(),
    @required Result unableToProcess(),
    @required Result defaultError(String error),
    @required Result unexpectedError(),
    @required Result loginError(),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return methodNotAllowed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestCancelled(),
    Result unauthorisedRequest(),
    Result badRequest(),
    Result notFound(String reason),
    Result methodNotAllowed(),
    Result notAcceptable(),
    Result requestTimeout(),
    Result sendTimeout(),
    Result conflict(),
    Result internalServerError(),
    Result notImplemented(),
    Result serviceUnavailable(),
    Result noInternetConnection(),
    Result formatException(),
    Result unableToProcess(),
    Result defaultError(String error),
    Result unexpectedError(),
    Result loginError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (methodNotAllowed != null) {
      return methodNotAllowed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestCancelled(RequestCancelled value),
    @required Result unauthorisedRequest(UnauthorisedRequest value),
    @required Result badRequest(BadRequest value),
    @required Result notFound(NotFound value),
    @required Result methodNotAllowed(MethodNotAllowed value),
    @required Result notAcceptable(NotAcceptable value),
    @required Result requestTimeout(RequestTimeout value),
    @required Result sendTimeout(SendTimeout value),
    @required Result conflict(Conflict value),
    @required Result internalServerError(InternalServerError value),
    @required Result notImplemented(NotImplemented value),
    @required Result serviceUnavailable(ServiceUnavailable value),
    @required Result noInternetConnection(NoInternetConnection value),
    @required Result formatException(FormatException value),
    @required Result unableToProcess(UnableToProcess value),
    @required Result defaultError(DefaultError value),
    @required Result unexpectedError(UnexpectedError value),
    @required Result loginError(LoginError value),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return methodNotAllowed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestCancelled(RequestCancelled value),
    Result unauthorisedRequest(UnauthorisedRequest value),
    Result badRequest(BadRequest value),
    Result notFound(NotFound value),
    Result methodNotAllowed(MethodNotAllowed value),
    Result notAcceptable(NotAcceptable value),
    Result requestTimeout(RequestTimeout value),
    Result sendTimeout(SendTimeout value),
    Result conflict(Conflict value),
    Result internalServerError(InternalServerError value),
    Result notImplemented(NotImplemented value),
    Result serviceUnavailable(ServiceUnavailable value),
    Result noInternetConnection(NoInternetConnection value),
    Result formatException(FormatException value),
    Result unableToProcess(UnableToProcess value),
    Result defaultError(DefaultError value),
    Result unexpectedError(UnexpectedError value),
    Result loginError(LoginError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (methodNotAllowed != null) {
      return methodNotAllowed(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$MethodNotAllowedToJson(this)
      ..['runtimeType'] = 'methodNotAllowed';
  }
}

abstract class MethodNotAllowed implements NetworkExceptions {
  const factory MethodNotAllowed() = _$MethodNotAllowed;

  factory MethodNotAllowed.fromJson(Map<String, dynamic> json) =
      _$MethodNotAllowed.fromJson;
}

/// @nodoc
abstract class $NotAcceptableCopyWith<$Res> {
  factory $NotAcceptableCopyWith(
          NotAcceptable value, $Res Function(NotAcceptable) then) =
      _$NotAcceptableCopyWithImpl<$Res>;
}

/// @nodoc
class _$NotAcceptableCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $NotAcceptableCopyWith<$Res> {
  _$NotAcceptableCopyWithImpl(
      NotAcceptable _value, $Res Function(NotAcceptable) _then)
      : super(_value, (v) => _then(v as NotAcceptable));

  @override
  NotAcceptable get _value => super._value as NotAcceptable;
}

@JsonSerializable()

/// @nodoc
class _$NotAcceptable implements NotAcceptable {
  const _$NotAcceptable();

  factory _$NotAcceptable.fromJson(Map<String, dynamic> json) =>
      _$_$NotAcceptableFromJson(json);

  @override
  String toString() {
    return 'NetworkExceptions.notAcceptable()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NotAcceptable);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestCancelled(),
    @required Result unauthorisedRequest(),
    @required Result badRequest(),
    @required Result notFound(String reason),
    @required Result methodNotAllowed(),
    @required Result notAcceptable(),
    @required Result requestTimeout(),
    @required Result sendTimeout(),
    @required Result conflict(),
    @required Result internalServerError(),
    @required Result notImplemented(),
    @required Result serviceUnavailable(),
    @required Result noInternetConnection(),
    @required Result formatException(),
    @required Result unableToProcess(),
    @required Result defaultError(String error),
    @required Result unexpectedError(),
    @required Result loginError(),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return notAcceptable();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestCancelled(),
    Result unauthorisedRequest(),
    Result badRequest(),
    Result notFound(String reason),
    Result methodNotAllowed(),
    Result notAcceptable(),
    Result requestTimeout(),
    Result sendTimeout(),
    Result conflict(),
    Result internalServerError(),
    Result notImplemented(),
    Result serviceUnavailable(),
    Result noInternetConnection(),
    Result formatException(),
    Result unableToProcess(),
    Result defaultError(String error),
    Result unexpectedError(),
    Result loginError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (notAcceptable != null) {
      return notAcceptable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestCancelled(RequestCancelled value),
    @required Result unauthorisedRequest(UnauthorisedRequest value),
    @required Result badRequest(BadRequest value),
    @required Result notFound(NotFound value),
    @required Result methodNotAllowed(MethodNotAllowed value),
    @required Result notAcceptable(NotAcceptable value),
    @required Result requestTimeout(RequestTimeout value),
    @required Result sendTimeout(SendTimeout value),
    @required Result conflict(Conflict value),
    @required Result internalServerError(InternalServerError value),
    @required Result notImplemented(NotImplemented value),
    @required Result serviceUnavailable(ServiceUnavailable value),
    @required Result noInternetConnection(NoInternetConnection value),
    @required Result formatException(FormatException value),
    @required Result unableToProcess(UnableToProcess value),
    @required Result defaultError(DefaultError value),
    @required Result unexpectedError(UnexpectedError value),
    @required Result loginError(LoginError value),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return notAcceptable(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestCancelled(RequestCancelled value),
    Result unauthorisedRequest(UnauthorisedRequest value),
    Result badRequest(BadRequest value),
    Result notFound(NotFound value),
    Result methodNotAllowed(MethodNotAllowed value),
    Result notAcceptable(NotAcceptable value),
    Result requestTimeout(RequestTimeout value),
    Result sendTimeout(SendTimeout value),
    Result conflict(Conflict value),
    Result internalServerError(InternalServerError value),
    Result notImplemented(NotImplemented value),
    Result serviceUnavailable(ServiceUnavailable value),
    Result noInternetConnection(NoInternetConnection value),
    Result formatException(FormatException value),
    Result unableToProcess(UnableToProcess value),
    Result defaultError(DefaultError value),
    Result unexpectedError(UnexpectedError value),
    Result loginError(LoginError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (notAcceptable != null) {
      return notAcceptable(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$NotAcceptableToJson(this)..['runtimeType'] = 'notAcceptable';
  }
}

abstract class NotAcceptable implements NetworkExceptions {
  const factory NotAcceptable() = _$NotAcceptable;

  factory NotAcceptable.fromJson(Map<String, dynamic> json) =
      _$NotAcceptable.fromJson;
}

/// @nodoc
abstract class $RequestTimeoutCopyWith<$Res> {
  factory $RequestTimeoutCopyWith(
          RequestTimeout value, $Res Function(RequestTimeout) then) =
      _$RequestTimeoutCopyWithImpl<$Res>;
}

/// @nodoc
class _$RequestTimeoutCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $RequestTimeoutCopyWith<$Res> {
  _$RequestTimeoutCopyWithImpl(
      RequestTimeout _value, $Res Function(RequestTimeout) _then)
      : super(_value, (v) => _then(v as RequestTimeout));

  @override
  RequestTimeout get _value => super._value as RequestTimeout;
}

@JsonSerializable()

/// @nodoc
class _$RequestTimeout implements RequestTimeout {
  const _$RequestTimeout();

  factory _$RequestTimeout.fromJson(Map<String, dynamic> json) =>
      _$_$RequestTimeoutFromJson(json);

  @override
  String toString() {
    return 'NetworkExceptions.requestTimeout()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RequestTimeout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestCancelled(),
    @required Result unauthorisedRequest(),
    @required Result badRequest(),
    @required Result notFound(String reason),
    @required Result methodNotAllowed(),
    @required Result notAcceptable(),
    @required Result requestTimeout(),
    @required Result sendTimeout(),
    @required Result conflict(),
    @required Result internalServerError(),
    @required Result notImplemented(),
    @required Result serviceUnavailable(),
    @required Result noInternetConnection(),
    @required Result formatException(),
    @required Result unableToProcess(),
    @required Result defaultError(String error),
    @required Result unexpectedError(),
    @required Result loginError(),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return requestTimeout();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestCancelled(),
    Result unauthorisedRequest(),
    Result badRequest(),
    Result notFound(String reason),
    Result methodNotAllowed(),
    Result notAcceptable(),
    Result requestTimeout(),
    Result sendTimeout(),
    Result conflict(),
    Result internalServerError(),
    Result notImplemented(),
    Result serviceUnavailable(),
    Result noInternetConnection(),
    Result formatException(),
    Result unableToProcess(),
    Result defaultError(String error),
    Result unexpectedError(),
    Result loginError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (requestTimeout != null) {
      return requestTimeout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestCancelled(RequestCancelled value),
    @required Result unauthorisedRequest(UnauthorisedRequest value),
    @required Result badRequest(BadRequest value),
    @required Result notFound(NotFound value),
    @required Result methodNotAllowed(MethodNotAllowed value),
    @required Result notAcceptable(NotAcceptable value),
    @required Result requestTimeout(RequestTimeout value),
    @required Result sendTimeout(SendTimeout value),
    @required Result conflict(Conflict value),
    @required Result internalServerError(InternalServerError value),
    @required Result notImplemented(NotImplemented value),
    @required Result serviceUnavailable(ServiceUnavailable value),
    @required Result noInternetConnection(NoInternetConnection value),
    @required Result formatException(FormatException value),
    @required Result unableToProcess(UnableToProcess value),
    @required Result defaultError(DefaultError value),
    @required Result unexpectedError(UnexpectedError value),
    @required Result loginError(LoginError value),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return requestTimeout(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestCancelled(RequestCancelled value),
    Result unauthorisedRequest(UnauthorisedRequest value),
    Result badRequest(BadRequest value),
    Result notFound(NotFound value),
    Result methodNotAllowed(MethodNotAllowed value),
    Result notAcceptable(NotAcceptable value),
    Result requestTimeout(RequestTimeout value),
    Result sendTimeout(SendTimeout value),
    Result conflict(Conflict value),
    Result internalServerError(InternalServerError value),
    Result notImplemented(NotImplemented value),
    Result serviceUnavailable(ServiceUnavailable value),
    Result noInternetConnection(NoInternetConnection value),
    Result formatException(FormatException value),
    Result unableToProcess(UnableToProcess value),
    Result defaultError(DefaultError value),
    Result unexpectedError(UnexpectedError value),
    Result loginError(LoginError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (requestTimeout != null) {
      return requestTimeout(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$RequestTimeoutToJson(this)..['runtimeType'] = 'requestTimeout';
  }
}

abstract class RequestTimeout implements NetworkExceptions {
  const factory RequestTimeout() = _$RequestTimeout;

  factory RequestTimeout.fromJson(Map<String, dynamic> json) =
      _$RequestTimeout.fromJson;
}

/// @nodoc
abstract class $SendTimeoutCopyWith<$Res> {
  factory $SendTimeoutCopyWith(
          SendTimeout value, $Res Function(SendTimeout) then) =
      _$SendTimeoutCopyWithImpl<$Res>;
}

/// @nodoc
class _$SendTimeoutCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $SendTimeoutCopyWith<$Res> {
  _$SendTimeoutCopyWithImpl(
      SendTimeout _value, $Res Function(SendTimeout) _then)
      : super(_value, (v) => _then(v as SendTimeout));

  @override
  SendTimeout get _value => super._value as SendTimeout;
}

@JsonSerializable()

/// @nodoc
class _$SendTimeout implements SendTimeout {
  const _$SendTimeout();

  factory _$SendTimeout.fromJson(Map<String, dynamic> json) =>
      _$_$SendTimeoutFromJson(json);

  @override
  String toString() {
    return 'NetworkExceptions.sendTimeout()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SendTimeout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestCancelled(),
    @required Result unauthorisedRequest(),
    @required Result badRequest(),
    @required Result notFound(String reason),
    @required Result methodNotAllowed(),
    @required Result notAcceptable(),
    @required Result requestTimeout(),
    @required Result sendTimeout(),
    @required Result conflict(),
    @required Result internalServerError(),
    @required Result notImplemented(),
    @required Result serviceUnavailable(),
    @required Result noInternetConnection(),
    @required Result formatException(),
    @required Result unableToProcess(),
    @required Result defaultError(String error),
    @required Result unexpectedError(),
    @required Result loginError(),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return sendTimeout();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestCancelled(),
    Result unauthorisedRequest(),
    Result badRequest(),
    Result notFound(String reason),
    Result methodNotAllowed(),
    Result notAcceptable(),
    Result requestTimeout(),
    Result sendTimeout(),
    Result conflict(),
    Result internalServerError(),
    Result notImplemented(),
    Result serviceUnavailable(),
    Result noInternetConnection(),
    Result formatException(),
    Result unableToProcess(),
    Result defaultError(String error),
    Result unexpectedError(),
    Result loginError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendTimeout != null) {
      return sendTimeout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestCancelled(RequestCancelled value),
    @required Result unauthorisedRequest(UnauthorisedRequest value),
    @required Result badRequest(BadRequest value),
    @required Result notFound(NotFound value),
    @required Result methodNotAllowed(MethodNotAllowed value),
    @required Result notAcceptable(NotAcceptable value),
    @required Result requestTimeout(RequestTimeout value),
    @required Result sendTimeout(SendTimeout value),
    @required Result conflict(Conflict value),
    @required Result internalServerError(InternalServerError value),
    @required Result notImplemented(NotImplemented value),
    @required Result serviceUnavailable(ServiceUnavailable value),
    @required Result noInternetConnection(NoInternetConnection value),
    @required Result formatException(FormatException value),
    @required Result unableToProcess(UnableToProcess value),
    @required Result defaultError(DefaultError value),
    @required Result unexpectedError(UnexpectedError value),
    @required Result loginError(LoginError value),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return sendTimeout(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestCancelled(RequestCancelled value),
    Result unauthorisedRequest(UnauthorisedRequest value),
    Result badRequest(BadRequest value),
    Result notFound(NotFound value),
    Result methodNotAllowed(MethodNotAllowed value),
    Result notAcceptable(NotAcceptable value),
    Result requestTimeout(RequestTimeout value),
    Result sendTimeout(SendTimeout value),
    Result conflict(Conflict value),
    Result internalServerError(InternalServerError value),
    Result notImplemented(NotImplemented value),
    Result serviceUnavailable(ServiceUnavailable value),
    Result noInternetConnection(NoInternetConnection value),
    Result formatException(FormatException value),
    Result unableToProcess(UnableToProcess value),
    Result defaultError(DefaultError value),
    Result unexpectedError(UnexpectedError value),
    Result loginError(LoginError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendTimeout != null) {
      return sendTimeout(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$SendTimeoutToJson(this)..['runtimeType'] = 'sendTimeout';
  }
}

abstract class SendTimeout implements NetworkExceptions {
  const factory SendTimeout() = _$SendTimeout;

  factory SendTimeout.fromJson(Map<String, dynamic> json) =
      _$SendTimeout.fromJson;
}

/// @nodoc
abstract class $ConflictCopyWith<$Res> {
  factory $ConflictCopyWith(Conflict value, $Res Function(Conflict) then) =
      _$ConflictCopyWithImpl<$Res>;
}

/// @nodoc
class _$ConflictCopyWithImpl<$Res> extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $ConflictCopyWith<$Res> {
  _$ConflictCopyWithImpl(Conflict _value, $Res Function(Conflict) _then)
      : super(_value, (v) => _then(v as Conflict));

  @override
  Conflict get _value => super._value as Conflict;
}

@JsonSerializable()

/// @nodoc
class _$Conflict implements Conflict {
  const _$Conflict();

  factory _$Conflict.fromJson(Map<String, dynamic> json) =>
      _$_$ConflictFromJson(json);

  @override
  String toString() {
    return 'NetworkExceptions.conflict()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Conflict);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestCancelled(),
    @required Result unauthorisedRequest(),
    @required Result badRequest(),
    @required Result notFound(String reason),
    @required Result methodNotAllowed(),
    @required Result notAcceptable(),
    @required Result requestTimeout(),
    @required Result sendTimeout(),
    @required Result conflict(),
    @required Result internalServerError(),
    @required Result notImplemented(),
    @required Result serviceUnavailable(),
    @required Result noInternetConnection(),
    @required Result formatException(),
    @required Result unableToProcess(),
    @required Result defaultError(String error),
    @required Result unexpectedError(),
    @required Result loginError(),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return conflict();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestCancelled(),
    Result unauthorisedRequest(),
    Result badRequest(),
    Result notFound(String reason),
    Result methodNotAllowed(),
    Result notAcceptable(),
    Result requestTimeout(),
    Result sendTimeout(),
    Result conflict(),
    Result internalServerError(),
    Result notImplemented(),
    Result serviceUnavailable(),
    Result noInternetConnection(),
    Result formatException(),
    Result unableToProcess(),
    Result defaultError(String error),
    Result unexpectedError(),
    Result loginError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (conflict != null) {
      return conflict();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestCancelled(RequestCancelled value),
    @required Result unauthorisedRequest(UnauthorisedRequest value),
    @required Result badRequest(BadRequest value),
    @required Result notFound(NotFound value),
    @required Result methodNotAllowed(MethodNotAllowed value),
    @required Result notAcceptable(NotAcceptable value),
    @required Result requestTimeout(RequestTimeout value),
    @required Result sendTimeout(SendTimeout value),
    @required Result conflict(Conflict value),
    @required Result internalServerError(InternalServerError value),
    @required Result notImplemented(NotImplemented value),
    @required Result serviceUnavailable(ServiceUnavailable value),
    @required Result noInternetConnection(NoInternetConnection value),
    @required Result formatException(FormatException value),
    @required Result unableToProcess(UnableToProcess value),
    @required Result defaultError(DefaultError value),
    @required Result unexpectedError(UnexpectedError value),
    @required Result loginError(LoginError value),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return conflict(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestCancelled(RequestCancelled value),
    Result unauthorisedRequest(UnauthorisedRequest value),
    Result badRequest(BadRequest value),
    Result notFound(NotFound value),
    Result methodNotAllowed(MethodNotAllowed value),
    Result notAcceptable(NotAcceptable value),
    Result requestTimeout(RequestTimeout value),
    Result sendTimeout(SendTimeout value),
    Result conflict(Conflict value),
    Result internalServerError(InternalServerError value),
    Result notImplemented(NotImplemented value),
    Result serviceUnavailable(ServiceUnavailable value),
    Result noInternetConnection(NoInternetConnection value),
    Result formatException(FormatException value),
    Result unableToProcess(UnableToProcess value),
    Result defaultError(DefaultError value),
    Result unexpectedError(UnexpectedError value),
    Result loginError(LoginError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (conflict != null) {
      return conflict(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$ConflictToJson(this)..['runtimeType'] = 'conflict';
  }
}

abstract class Conflict implements NetworkExceptions {
  const factory Conflict() = _$Conflict;

  factory Conflict.fromJson(Map<String, dynamic> json) = _$Conflict.fromJson;
}

/// @nodoc
abstract class $InternalServerErrorCopyWith<$Res> {
  factory $InternalServerErrorCopyWith(
          InternalServerError value, $Res Function(InternalServerError) then) =
      _$InternalServerErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$InternalServerErrorCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $InternalServerErrorCopyWith<$Res> {
  _$InternalServerErrorCopyWithImpl(
      InternalServerError _value, $Res Function(InternalServerError) _then)
      : super(_value, (v) => _then(v as InternalServerError));

  @override
  InternalServerError get _value => super._value as InternalServerError;
}

@JsonSerializable()

/// @nodoc
class _$InternalServerError implements InternalServerError {
  const _$InternalServerError();

  factory _$InternalServerError.fromJson(Map<String, dynamic> json) =>
      _$_$InternalServerErrorFromJson(json);

  @override
  String toString() {
    return 'NetworkExceptions.internalServerError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InternalServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestCancelled(),
    @required Result unauthorisedRequest(),
    @required Result badRequest(),
    @required Result notFound(String reason),
    @required Result methodNotAllowed(),
    @required Result notAcceptable(),
    @required Result requestTimeout(),
    @required Result sendTimeout(),
    @required Result conflict(),
    @required Result internalServerError(),
    @required Result notImplemented(),
    @required Result serviceUnavailable(),
    @required Result noInternetConnection(),
    @required Result formatException(),
    @required Result unableToProcess(),
    @required Result defaultError(String error),
    @required Result unexpectedError(),
    @required Result loginError(),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return internalServerError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestCancelled(),
    Result unauthorisedRequest(),
    Result badRequest(),
    Result notFound(String reason),
    Result methodNotAllowed(),
    Result notAcceptable(),
    Result requestTimeout(),
    Result sendTimeout(),
    Result conflict(),
    Result internalServerError(),
    Result notImplemented(),
    Result serviceUnavailable(),
    Result noInternetConnection(),
    Result formatException(),
    Result unableToProcess(),
    Result defaultError(String error),
    Result unexpectedError(),
    Result loginError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (internalServerError != null) {
      return internalServerError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestCancelled(RequestCancelled value),
    @required Result unauthorisedRequest(UnauthorisedRequest value),
    @required Result badRequest(BadRequest value),
    @required Result notFound(NotFound value),
    @required Result methodNotAllowed(MethodNotAllowed value),
    @required Result notAcceptable(NotAcceptable value),
    @required Result requestTimeout(RequestTimeout value),
    @required Result sendTimeout(SendTimeout value),
    @required Result conflict(Conflict value),
    @required Result internalServerError(InternalServerError value),
    @required Result notImplemented(NotImplemented value),
    @required Result serviceUnavailable(ServiceUnavailable value),
    @required Result noInternetConnection(NoInternetConnection value),
    @required Result formatException(FormatException value),
    @required Result unableToProcess(UnableToProcess value),
    @required Result defaultError(DefaultError value),
    @required Result unexpectedError(UnexpectedError value),
    @required Result loginError(LoginError value),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return internalServerError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestCancelled(RequestCancelled value),
    Result unauthorisedRequest(UnauthorisedRequest value),
    Result badRequest(BadRequest value),
    Result notFound(NotFound value),
    Result methodNotAllowed(MethodNotAllowed value),
    Result notAcceptable(NotAcceptable value),
    Result requestTimeout(RequestTimeout value),
    Result sendTimeout(SendTimeout value),
    Result conflict(Conflict value),
    Result internalServerError(InternalServerError value),
    Result notImplemented(NotImplemented value),
    Result serviceUnavailable(ServiceUnavailable value),
    Result noInternetConnection(NoInternetConnection value),
    Result formatException(FormatException value),
    Result unableToProcess(UnableToProcess value),
    Result defaultError(DefaultError value),
    Result unexpectedError(UnexpectedError value),
    Result loginError(LoginError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (internalServerError != null) {
      return internalServerError(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$InternalServerErrorToJson(this)
      ..['runtimeType'] = 'internalServerError';
  }
}

abstract class InternalServerError implements NetworkExceptions {
  const factory InternalServerError() = _$InternalServerError;

  factory InternalServerError.fromJson(Map<String, dynamic> json) =
      _$InternalServerError.fromJson;
}

/// @nodoc
abstract class $NotImplementedCopyWith<$Res> {
  factory $NotImplementedCopyWith(
          NotImplemented value, $Res Function(NotImplemented) then) =
      _$NotImplementedCopyWithImpl<$Res>;
}

/// @nodoc
class _$NotImplementedCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $NotImplementedCopyWith<$Res> {
  _$NotImplementedCopyWithImpl(
      NotImplemented _value, $Res Function(NotImplemented) _then)
      : super(_value, (v) => _then(v as NotImplemented));

  @override
  NotImplemented get _value => super._value as NotImplemented;
}

@JsonSerializable()

/// @nodoc
class _$NotImplemented implements NotImplemented {
  const _$NotImplemented();

  factory _$NotImplemented.fromJson(Map<String, dynamic> json) =>
      _$_$NotImplementedFromJson(json);

  @override
  String toString() {
    return 'NetworkExceptions.notImplemented()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NotImplemented);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestCancelled(),
    @required Result unauthorisedRequest(),
    @required Result badRequest(),
    @required Result notFound(String reason),
    @required Result methodNotAllowed(),
    @required Result notAcceptable(),
    @required Result requestTimeout(),
    @required Result sendTimeout(),
    @required Result conflict(),
    @required Result internalServerError(),
    @required Result notImplemented(),
    @required Result serviceUnavailable(),
    @required Result noInternetConnection(),
    @required Result formatException(),
    @required Result unableToProcess(),
    @required Result defaultError(String error),
    @required Result unexpectedError(),
    @required Result loginError(),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return notImplemented();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestCancelled(),
    Result unauthorisedRequest(),
    Result badRequest(),
    Result notFound(String reason),
    Result methodNotAllowed(),
    Result notAcceptable(),
    Result requestTimeout(),
    Result sendTimeout(),
    Result conflict(),
    Result internalServerError(),
    Result notImplemented(),
    Result serviceUnavailable(),
    Result noInternetConnection(),
    Result formatException(),
    Result unableToProcess(),
    Result defaultError(String error),
    Result unexpectedError(),
    Result loginError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (notImplemented != null) {
      return notImplemented();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestCancelled(RequestCancelled value),
    @required Result unauthorisedRequest(UnauthorisedRequest value),
    @required Result badRequest(BadRequest value),
    @required Result notFound(NotFound value),
    @required Result methodNotAllowed(MethodNotAllowed value),
    @required Result notAcceptable(NotAcceptable value),
    @required Result requestTimeout(RequestTimeout value),
    @required Result sendTimeout(SendTimeout value),
    @required Result conflict(Conflict value),
    @required Result internalServerError(InternalServerError value),
    @required Result notImplemented(NotImplemented value),
    @required Result serviceUnavailable(ServiceUnavailable value),
    @required Result noInternetConnection(NoInternetConnection value),
    @required Result formatException(FormatException value),
    @required Result unableToProcess(UnableToProcess value),
    @required Result defaultError(DefaultError value),
    @required Result unexpectedError(UnexpectedError value),
    @required Result loginError(LoginError value),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return notImplemented(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestCancelled(RequestCancelled value),
    Result unauthorisedRequest(UnauthorisedRequest value),
    Result badRequest(BadRequest value),
    Result notFound(NotFound value),
    Result methodNotAllowed(MethodNotAllowed value),
    Result notAcceptable(NotAcceptable value),
    Result requestTimeout(RequestTimeout value),
    Result sendTimeout(SendTimeout value),
    Result conflict(Conflict value),
    Result internalServerError(InternalServerError value),
    Result notImplemented(NotImplemented value),
    Result serviceUnavailable(ServiceUnavailable value),
    Result noInternetConnection(NoInternetConnection value),
    Result formatException(FormatException value),
    Result unableToProcess(UnableToProcess value),
    Result defaultError(DefaultError value),
    Result unexpectedError(UnexpectedError value),
    Result loginError(LoginError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (notImplemented != null) {
      return notImplemented(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$NotImplementedToJson(this)..['runtimeType'] = 'notImplemented';
  }
}

abstract class NotImplemented implements NetworkExceptions {
  const factory NotImplemented() = _$NotImplemented;

  factory NotImplemented.fromJson(Map<String, dynamic> json) =
      _$NotImplemented.fromJson;
}

/// @nodoc
abstract class $ServiceUnavailableCopyWith<$Res> {
  factory $ServiceUnavailableCopyWith(
          ServiceUnavailable value, $Res Function(ServiceUnavailable) then) =
      _$ServiceUnavailableCopyWithImpl<$Res>;
}

/// @nodoc
class _$ServiceUnavailableCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $ServiceUnavailableCopyWith<$Res> {
  _$ServiceUnavailableCopyWithImpl(
      ServiceUnavailable _value, $Res Function(ServiceUnavailable) _then)
      : super(_value, (v) => _then(v as ServiceUnavailable));

  @override
  ServiceUnavailable get _value => super._value as ServiceUnavailable;
}

@JsonSerializable()

/// @nodoc
class _$ServiceUnavailable implements ServiceUnavailable {
  const _$ServiceUnavailable();

  factory _$ServiceUnavailable.fromJson(Map<String, dynamic> json) =>
      _$_$ServiceUnavailableFromJson(json);

  @override
  String toString() {
    return 'NetworkExceptions.serviceUnavailable()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ServiceUnavailable);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestCancelled(),
    @required Result unauthorisedRequest(),
    @required Result badRequest(),
    @required Result notFound(String reason),
    @required Result methodNotAllowed(),
    @required Result notAcceptable(),
    @required Result requestTimeout(),
    @required Result sendTimeout(),
    @required Result conflict(),
    @required Result internalServerError(),
    @required Result notImplemented(),
    @required Result serviceUnavailable(),
    @required Result noInternetConnection(),
    @required Result formatException(),
    @required Result unableToProcess(),
    @required Result defaultError(String error),
    @required Result unexpectedError(),
    @required Result loginError(),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return serviceUnavailable();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestCancelled(),
    Result unauthorisedRequest(),
    Result badRequest(),
    Result notFound(String reason),
    Result methodNotAllowed(),
    Result notAcceptable(),
    Result requestTimeout(),
    Result sendTimeout(),
    Result conflict(),
    Result internalServerError(),
    Result notImplemented(),
    Result serviceUnavailable(),
    Result noInternetConnection(),
    Result formatException(),
    Result unableToProcess(),
    Result defaultError(String error),
    Result unexpectedError(),
    Result loginError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (serviceUnavailable != null) {
      return serviceUnavailable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestCancelled(RequestCancelled value),
    @required Result unauthorisedRequest(UnauthorisedRequest value),
    @required Result badRequest(BadRequest value),
    @required Result notFound(NotFound value),
    @required Result methodNotAllowed(MethodNotAllowed value),
    @required Result notAcceptable(NotAcceptable value),
    @required Result requestTimeout(RequestTimeout value),
    @required Result sendTimeout(SendTimeout value),
    @required Result conflict(Conflict value),
    @required Result internalServerError(InternalServerError value),
    @required Result notImplemented(NotImplemented value),
    @required Result serviceUnavailable(ServiceUnavailable value),
    @required Result noInternetConnection(NoInternetConnection value),
    @required Result formatException(FormatException value),
    @required Result unableToProcess(UnableToProcess value),
    @required Result defaultError(DefaultError value),
    @required Result unexpectedError(UnexpectedError value),
    @required Result loginError(LoginError value),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return serviceUnavailable(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestCancelled(RequestCancelled value),
    Result unauthorisedRequest(UnauthorisedRequest value),
    Result badRequest(BadRequest value),
    Result notFound(NotFound value),
    Result methodNotAllowed(MethodNotAllowed value),
    Result notAcceptable(NotAcceptable value),
    Result requestTimeout(RequestTimeout value),
    Result sendTimeout(SendTimeout value),
    Result conflict(Conflict value),
    Result internalServerError(InternalServerError value),
    Result notImplemented(NotImplemented value),
    Result serviceUnavailable(ServiceUnavailable value),
    Result noInternetConnection(NoInternetConnection value),
    Result formatException(FormatException value),
    Result unableToProcess(UnableToProcess value),
    Result defaultError(DefaultError value),
    Result unexpectedError(UnexpectedError value),
    Result loginError(LoginError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (serviceUnavailable != null) {
      return serviceUnavailable(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$ServiceUnavailableToJson(this)
      ..['runtimeType'] = 'serviceUnavailable';
  }
}

abstract class ServiceUnavailable implements NetworkExceptions {
  const factory ServiceUnavailable() = _$ServiceUnavailable;

  factory ServiceUnavailable.fromJson(Map<String, dynamic> json) =
      _$ServiceUnavailable.fromJson;
}

/// @nodoc
abstract class $NoInternetConnectionCopyWith<$Res> {
  factory $NoInternetConnectionCopyWith(NoInternetConnection value,
          $Res Function(NoInternetConnection) then) =
      _$NoInternetConnectionCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoInternetConnectionCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $NoInternetConnectionCopyWith<$Res> {
  _$NoInternetConnectionCopyWithImpl(
      NoInternetConnection _value, $Res Function(NoInternetConnection) _then)
      : super(_value, (v) => _then(v as NoInternetConnection));

  @override
  NoInternetConnection get _value => super._value as NoInternetConnection;
}

@JsonSerializable()

/// @nodoc
class _$NoInternetConnection implements NoInternetConnection {
  const _$NoInternetConnection();

  factory _$NoInternetConnection.fromJson(Map<String, dynamic> json) =>
      _$_$NoInternetConnectionFromJson(json);

  @override
  String toString() {
    return 'NetworkExceptions.noInternetConnection()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NoInternetConnection);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestCancelled(),
    @required Result unauthorisedRequest(),
    @required Result badRequest(),
    @required Result notFound(String reason),
    @required Result methodNotAllowed(),
    @required Result notAcceptable(),
    @required Result requestTimeout(),
    @required Result sendTimeout(),
    @required Result conflict(),
    @required Result internalServerError(),
    @required Result notImplemented(),
    @required Result serviceUnavailable(),
    @required Result noInternetConnection(),
    @required Result formatException(),
    @required Result unableToProcess(),
    @required Result defaultError(String error),
    @required Result unexpectedError(),
    @required Result loginError(),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return noInternetConnection();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestCancelled(),
    Result unauthorisedRequest(),
    Result badRequest(),
    Result notFound(String reason),
    Result methodNotAllowed(),
    Result notAcceptable(),
    Result requestTimeout(),
    Result sendTimeout(),
    Result conflict(),
    Result internalServerError(),
    Result notImplemented(),
    Result serviceUnavailable(),
    Result noInternetConnection(),
    Result formatException(),
    Result unableToProcess(),
    Result defaultError(String error),
    Result unexpectedError(),
    Result loginError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (noInternetConnection != null) {
      return noInternetConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestCancelled(RequestCancelled value),
    @required Result unauthorisedRequest(UnauthorisedRequest value),
    @required Result badRequest(BadRequest value),
    @required Result notFound(NotFound value),
    @required Result methodNotAllowed(MethodNotAllowed value),
    @required Result notAcceptable(NotAcceptable value),
    @required Result requestTimeout(RequestTimeout value),
    @required Result sendTimeout(SendTimeout value),
    @required Result conflict(Conflict value),
    @required Result internalServerError(InternalServerError value),
    @required Result notImplemented(NotImplemented value),
    @required Result serviceUnavailable(ServiceUnavailable value),
    @required Result noInternetConnection(NoInternetConnection value),
    @required Result formatException(FormatException value),
    @required Result unableToProcess(UnableToProcess value),
    @required Result defaultError(DefaultError value),
    @required Result unexpectedError(UnexpectedError value),
    @required Result loginError(LoginError value),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return noInternetConnection(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestCancelled(RequestCancelled value),
    Result unauthorisedRequest(UnauthorisedRequest value),
    Result badRequest(BadRequest value),
    Result notFound(NotFound value),
    Result methodNotAllowed(MethodNotAllowed value),
    Result notAcceptable(NotAcceptable value),
    Result requestTimeout(RequestTimeout value),
    Result sendTimeout(SendTimeout value),
    Result conflict(Conflict value),
    Result internalServerError(InternalServerError value),
    Result notImplemented(NotImplemented value),
    Result serviceUnavailable(ServiceUnavailable value),
    Result noInternetConnection(NoInternetConnection value),
    Result formatException(FormatException value),
    Result unableToProcess(UnableToProcess value),
    Result defaultError(DefaultError value),
    Result unexpectedError(UnexpectedError value),
    Result loginError(LoginError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (noInternetConnection != null) {
      return noInternetConnection(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$NoInternetConnectionToJson(this)
      ..['runtimeType'] = 'noInternetConnection';
  }
}

abstract class NoInternetConnection implements NetworkExceptions {
  const factory NoInternetConnection() = _$NoInternetConnection;

  factory NoInternetConnection.fromJson(Map<String, dynamic> json) =
      _$NoInternetConnection.fromJson;
}

/// @nodoc
abstract class $FormatExceptionCopyWith<$Res> {
  factory $FormatExceptionCopyWith(
          FormatException value, $Res Function(FormatException) then) =
      _$FormatExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class _$FormatExceptionCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $FormatExceptionCopyWith<$Res> {
  _$FormatExceptionCopyWithImpl(
      FormatException _value, $Res Function(FormatException) _then)
      : super(_value, (v) => _then(v as FormatException));

  @override
  FormatException get _value => super._value as FormatException;
}

@JsonSerializable()

/// @nodoc
class _$FormatException implements FormatException {
  const _$FormatException();

  factory _$FormatException.fromJson(Map<String, dynamic> json) =>
      _$_$FormatExceptionFromJson(json);

  @override
  String toString() {
    return 'NetworkExceptions.formatException()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FormatException);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestCancelled(),
    @required Result unauthorisedRequest(),
    @required Result badRequest(),
    @required Result notFound(String reason),
    @required Result methodNotAllowed(),
    @required Result notAcceptable(),
    @required Result requestTimeout(),
    @required Result sendTimeout(),
    @required Result conflict(),
    @required Result internalServerError(),
    @required Result notImplemented(),
    @required Result serviceUnavailable(),
    @required Result noInternetConnection(),
    @required Result formatException(),
    @required Result unableToProcess(),
    @required Result defaultError(String error),
    @required Result unexpectedError(),
    @required Result loginError(),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return formatException();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestCancelled(),
    Result unauthorisedRequest(),
    Result badRequest(),
    Result notFound(String reason),
    Result methodNotAllowed(),
    Result notAcceptable(),
    Result requestTimeout(),
    Result sendTimeout(),
    Result conflict(),
    Result internalServerError(),
    Result notImplemented(),
    Result serviceUnavailable(),
    Result noInternetConnection(),
    Result formatException(),
    Result unableToProcess(),
    Result defaultError(String error),
    Result unexpectedError(),
    Result loginError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (formatException != null) {
      return formatException();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestCancelled(RequestCancelled value),
    @required Result unauthorisedRequest(UnauthorisedRequest value),
    @required Result badRequest(BadRequest value),
    @required Result notFound(NotFound value),
    @required Result methodNotAllowed(MethodNotAllowed value),
    @required Result notAcceptable(NotAcceptable value),
    @required Result requestTimeout(RequestTimeout value),
    @required Result sendTimeout(SendTimeout value),
    @required Result conflict(Conflict value),
    @required Result internalServerError(InternalServerError value),
    @required Result notImplemented(NotImplemented value),
    @required Result serviceUnavailable(ServiceUnavailable value),
    @required Result noInternetConnection(NoInternetConnection value),
    @required Result formatException(FormatException value),
    @required Result unableToProcess(UnableToProcess value),
    @required Result defaultError(DefaultError value),
    @required Result unexpectedError(UnexpectedError value),
    @required Result loginError(LoginError value),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return formatException(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestCancelled(RequestCancelled value),
    Result unauthorisedRequest(UnauthorisedRequest value),
    Result badRequest(BadRequest value),
    Result notFound(NotFound value),
    Result methodNotAllowed(MethodNotAllowed value),
    Result notAcceptable(NotAcceptable value),
    Result requestTimeout(RequestTimeout value),
    Result sendTimeout(SendTimeout value),
    Result conflict(Conflict value),
    Result internalServerError(InternalServerError value),
    Result notImplemented(NotImplemented value),
    Result serviceUnavailable(ServiceUnavailable value),
    Result noInternetConnection(NoInternetConnection value),
    Result formatException(FormatException value),
    Result unableToProcess(UnableToProcess value),
    Result defaultError(DefaultError value),
    Result unexpectedError(UnexpectedError value),
    Result loginError(LoginError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (formatException != null) {
      return formatException(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$FormatExceptionToJson(this)..['runtimeType'] = 'formatException';
  }
}

abstract class FormatException implements NetworkExceptions {
  const factory FormatException() = _$FormatException;

  factory FormatException.fromJson(Map<String, dynamic> json) =
      _$FormatException.fromJson;
}

/// @nodoc
abstract class $UnableToProcessCopyWith<$Res> {
  factory $UnableToProcessCopyWith(
          UnableToProcess value, $Res Function(UnableToProcess) then) =
      _$UnableToProcessCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnableToProcessCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $UnableToProcessCopyWith<$Res> {
  _$UnableToProcessCopyWithImpl(
      UnableToProcess _value, $Res Function(UnableToProcess) _then)
      : super(_value, (v) => _then(v as UnableToProcess));

  @override
  UnableToProcess get _value => super._value as UnableToProcess;
}

@JsonSerializable()

/// @nodoc
class _$UnableToProcess implements UnableToProcess {
  const _$UnableToProcess();

  factory _$UnableToProcess.fromJson(Map<String, dynamic> json) =>
      _$_$UnableToProcessFromJson(json);

  @override
  String toString() {
    return 'NetworkExceptions.unableToProcess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UnableToProcess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestCancelled(),
    @required Result unauthorisedRequest(),
    @required Result badRequest(),
    @required Result notFound(String reason),
    @required Result methodNotAllowed(),
    @required Result notAcceptable(),
    @required Result requestTimeout(),
    @required Result sendTimeout(),
    @required Result conflict(),
    @required Result internalServerError(),
    @required Result notImplemented(),
    @required Result serviceUnavailable(),
    @required Result noInternetConnection(),
    @required Result formatException(),
    @required Result unableToProcess(),
    @required Result defaultError(String error),
    @required Result unexpectedError(),
    @required Result loginError(),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return unableToProcess();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestCancelled(),
    Result unauthorisedRequest(),
    Result badRequest(),
    Result notFound(String reason),
    Result methodNotAllowed(),
    Result notAcceptable(),
    Result requestTimeout(),
    Result sendTimeout(),
    Result conflict(),
    Result internalServerError(),
    Result notImplemented(),
    Result serviceUnavailable(),
    Result noInternetConnection(),
    Result formatException(),
    Result unableToProcess(),
    Result defaultError(String error),
    Result unexpectedError(),
    Result loginError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unableToProcess != null) {
      return unableToProcess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestCancelled(RequestCancelled value),
    @required Result unauthorisedRequest(UnauthorisedRequest value),
    @required Result badRequest(BadRequest value),
    @required Result notFound(NotFound value),
    @required Result methodNotAllowed(MethodNotAllowed value),
    @required Result notAcceptable(NotAcceptable value),
    @required Result requestTimeout(RequestTimeout value),
    @required Result sendTimeout(SendTimeout value),
    @required Result conflict(Conflict value),
    @required Result internalServerError(InternalServerError value),
    @required Result notImplemented(NotImplemented value),
    @required Result serviceUnavailable(ServiceUnavailable value),
    @required Result noInternetConnection(NoInternetConnection value),
    @required Result formatException(FormatException value),
    @required Result unableToProcess(UnableToProcess value),
    @required Result defaultError(DefaultError value),
    @required Result unexpectedError(UnexpectedError value),
    @required Result loginError(LoginError value),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return unableToProcess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestCancelled(RequestCancelled value),
    Result unauthorisedRequest(UnauthorisedRequest value),
    Result badRequest(BadRequest value),
    Result notFound(NotFound value),
    Result methodNotAllowed(MethodNotAllowed value),
    Result notAcceptable(NotAcceptable value),
    Result requestTimeout(RequestTimeout value),
    Result sendTimeout(SendTimeout value),
    Result conflict(Conflict value),
    Result internalServerError(InternalServerError value),
    Result notImplemented(NotImplemented value),
    Result serviceUnavailable(ServiceUnavailable value),
    Result noInternetConnection(NoInternetConnection value),
    Result formatException(FormatException value),
    Result unableToProcess(UnableToProcess value),
    Result defaultError(DefaultError value),
    Result unexpectedError(UnexpectedError value),
    Result loginError(LoginError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unableToProcess != null) {
      return unableToProcess(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$UnableToProcessToJson(this)..['runtimeType'] = 'unableToProcess';
  }
}

abstract class UnableToProcess implements NetworkExceptions {
  const factory UnableToProcess() = _$UnableToProcess;

  factory UnableToProcess.fromJson(Map<String, dynamic> json) =
      _$UnableToProcess.fromJson;
}

/// @nodoc
abstract class $DefaultErrorCopyWith<$Res> {
  factory $DefaultErrorCopyWith(
          DefaultError value, $Res Function(DefaultError) then) =
      _$DefaultErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class _$DefaultErrorCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $DefaultErrorCopyWith<$Res> {
  _$DefaultErrorCopyWithImpl(
      DefaultError _value, $Res Function(DefaultError) _then)
      : super(_value, (v) => _then(v as DefaultError));

  @override
  DefaultError get _value => super._value as DefaultError;

  @override
  $Res call({
    Object error = freezed,
  }) {
    return _then(DefaultError(
      error == freezed ? _value.error : error as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$DefaultError implements DefaultError {
  const _$DefaultError(this.error) : assert(error != null);

  factory _$DefaultError.fromJson(Map<String, dynamic> json) =>
      _$_$DefaultErrorFromJson(json);

  @override
  final String error;

  @override
  String toString() {
    return 'NetworkExceptions.defaultError(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DefaultError &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @override
  $DefaultErrorCopyWith<DefaultError> get copyWith =>
      _$DefaultErrorCopyWithImpl<DefaultError>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestCancelled(),
    @required Result unauthorisedRequest(),
    @required Result badRequest(),
    @required Result notFound(String reason),
    @required Result methodNotAllowed(),
    @required Result notAcceptable(),
    @required Result requestTimeout(),
    @required Result sendTimeout(),
    @required Result conflict(),
    @required Result internalServerError(),
    @required Result notImplemented(),
    @required Result serviceUnavailable(),
    @required Result noInternetConnection(),
    @required Result formatException(),
    @required Result unableToProcess(),
    @required Result defaultError(String error),
    @required Result unexpectedError(),
    @required Result loginError(),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return defaultError(error);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestCancelled(),
    Result unauthorisedRequest(),
    Result badRequest(),
    Result notFound(String reason),
    Result methodNotAllowed(),
    Result notAcceptable(),
    Result requestTimeout(),
    Result sendTimeout(),
    Result conflict(),
    Result internalServerError(),
    Result notImplemented(),
    Result serviceUnavailable(),
    Result noInternetConnection(),
    Result formatException(),
    Result unableToProcess(),
    Result defaultError(String error),
    Result unexpectedError(),
    Result loginError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (defaultError != null) {
      return defaultError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestCancelled(RequestCancelled value),
    @required Result unauthorisedRequest(UnauthorisedRequest value),
    @required Result badRequest(BadRequest value),
    @required Result notFound(NotFound value),
    @required Result methodNotAllowed(MethodNotAllowed value),
    @required Result notAcceptable(NotAcceptable value),
    @required Result requestTimeout(RequestTimeout value),
    @required Result sendTimeout(SendTimeout value),
    @required Result conflict(Conflict value),
    @required Result internalServerError(InternalServerError value),
    @required Result notImplemented(NotImplemented value),
    @required Result serviceUnavailable(ServiceUnavailable value),
    @required Result noInternetConnection(NoInternetConnection value),
    @required Result formatException(FormatException value),
    @required Result unableToProcess(UnableToProcess value),
    @required Result defaultError(DefaultError value),
    @required Result unexpectedError(UnexpectedError value),
    @required Result loginError(LoginError value),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return defaultError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestCancelled(RequestCancelled value),
    Result unauthorisedRequest(UnauthorisedRequest value),
    Result badRequest(BadRequest value),
    Result notFound(NotFound value),
    Result methodNotAllowed(MethodNotAllowed value),
    Result notAcceptable(NotAcceptable value),
    Result requestTimeout(RequestTimeout value),
    Result sendTimeout(SendTimeout value),
    Result conflict(Conflict value),
    Result internalServerError(InternalServerError value),
    Result notImplemented(NotImplemented value),
    Result serviceUnavailable(ServiceUnavailable value),
    Result noInternetConnection(NoInternetConnection value),
    Result formatException(FormatException value),
    Result unableToProcess(UnableToProcess value),
    Result defaultError(DefaultError value),
    Result unexpectedError(UnexpectedError value),
    Result loginError(LoginError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (defaultError != null) {
      return defaultError(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$DefaultErrorToJson(this)..['runtimeType'] = 'defaultError';
  }
}

abstract class DefaultError implements NetworkExceptions {
  const factory DefaultError(String error) = _$DefaultError;

  factory DefaultError.fromJson(Map<String, dynamic> json) =
      _$DefaultError.fromJson;

  String get error;
  $DefaultErrorCopyWith<DefaultError> get copyWith;
}

/// @nodoc
abstract class $UnexpectedErrorCopyWith<$Res> {
  factory $UnexpectedErrorCopyWith(
          UnexpectedError value, $Res Function(UnexpectedError) then) =
      _$UnexpectedErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnexpectedErrorCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $UnexpectedErrorCopyWith<$Res> {
  _$UnexpectedErrorCopyWithImpl(
      UnexpectedError _value, $Res Function(UnexpectedError) _then)
      : super(_value, (v) => _then(v as UnexpectedError));

  @override
  UnexpectedError get _value => super._value as UnexpectedError;
}

@JsonSerializable()

/// @nodoc
class _$UnexpectedError implements UnexpectedError {
  const _$UnexpectedError();

  factory _$UnexpectedError.fromJson(Map<String, dynamic> json) =>
      _$_$UnexpectedErrorFromJson(json);

  @override
  String toString() {
    return 'NetworkExceptions.unexpectedError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UnexpectedError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestCancelled(),
    @required Result unauthorisedRequest(),
    @required Result badRequest(),
    @required Result notFound(String reason),
    @required Result methodNotAllowed(),
    @required Result notAcceptable(),
    @required Result requestTimeout(),
    @required Result sendTimeout(),
    @required Result conflict(),
    @required Result internalServerError(),
    @required Result notImplemented(),
    @required Result serviceUnavailable(),
    @required Result noInternetConnection(),
    @required Result formatException(),
    @required Result unableToProcess(),
    @required Result defaultError(String error),
    @required Result unexpectedError(),
    @required Result loginError(),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return unexpectedError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestCancelled(),
    Result unauthorisedRequest(),
    Result badRequest(),
    Result notFound(String reason),
    Result methodNotAllowed(),
    Result notAcceptable(),
    Result requestTimeout(),
    Result sendTimeout(),
    Result conflict(),
    Result internalServerError(),
    Result notImplemented(),
    Result serviceUnavailable(),
    Result noInternetConnection(),
    Result formatException(),
    Result unableToProcess(),
    Result defaultError(String error),
    Result unexpectedError(),
    Result loginError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unexpectedError != null) {
      return unexpectedError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestCancelled(RequestCancelled value),
    @required Result unauthorisedRequest(UnauthorisedRequest value),
    @required Result badRequest(BadRequest value),
    @required Result notFound(NotFound value),
    @required Result methodNotAllowed(MethodNotAllowed value),
    @required Result notAcceptable(NotAcceptable value),
    @required Result requestTimeout(RequestTimeout value),
    @required Result sendTimeout(SendTimeout value),
    @required Result conflict(Conflict value),
    @required Result internalServerError(InternalServerError value),
    @required Result notImplemented(NotImplemented value),
    @required Result serviceUnavailable(ServiceUnavailable value),
    @required Result noInternetConnection(NoInternetConnection value),
    @required Result formatException(FormatException value),
    @required Result unableToProcess(UnableToProcess value),
    @required Result defaultError(DefaultError value),
    @required Result unexpectedError(UnexpectedError value),
    @required Result loginError(LoginError value),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return unexpectedError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestCancelled(RequestCancelled value),
    Result unauthorisedRequest(UnauthorisedRequest value),
    Result badRequest(BadRequest value),
    Result notFound(NotFound value),
    Result methodNotAllowed(MethodNotAllowed value),
    Result notAcceptable(NotAcceptable value),
    Result requestTimeout(RequestTimeout value),
    Result sendTimeout(SendTimeout value),
    Result conflict(Conflict value),
    Result internalServerError(InternalServerError value),
    Result notImplemented(NotImplemented value),
    Result serviceUnavailable(ServiceUnavailable value),
    Result noInternetConnection(NoInternetConnection value),
    Result formatException(FormatException value),
    Result unableToProcess(UnableToProcess value),
    Result defaultError(DefaultError value),
    Result unexpectedError(UnexpectedError value),
    Result loginError(LoginError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unexpectedError != null) {
      return unexpectedError(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$UnexpectedErrorToJson(this)..['runtimeType'] = 'unexpectedError';
  }
}

abstract class UnexpectedError implements NetworkExceptions {
  const factory UnexpectedError() = _$UnexpectedError;

  factory UnexpectedError.fromJson(Map<String, dynamic> json) =
      _$UnexpectedError.fromJson;
}

/// @nodoc
abstract class $LoginErrorCopyWith<$Res> {
  factory $LoginErrorCopyWith(
          LoginError value, $Res Function(LoginError) then) =
      _$LoginErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginErrorCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $LoginErrorCopyWith<$Res> {
  _$LoginErrorCopyWithImpl(LoginError _value, $Res Function(LoginError) _then)
      : super(_value, (v) => _then(v as LoginError));

  @override
  LoginError get _value => super._value as LoginError;
}

@JsonSerializable()

/// @nodoc
class _$LoginError implements LoginError {
  const _$LoginError();

  factory _$LoginError.fromJson(Map<String, dynamic> json) =>
      _$_$LoginErrorFromJson(json);

  @override
  String toString() {
    return 'NetworkExceptions.loginError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoginError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestCancelled(),
    @required Result unauthorisedRequest(),
    @required Result badRequest(),
    @required Result notFound(String reason),
    @required Result methodNotAllowed(),
    @required Result notAcceptable(),
    @required Result requestTimeout(),
    @required Result sendTimeout(),
    @required Result conflict(),
    @required Result internalServerError(),
    @required Result notImplemented(),
    @required Result serviceUnavailable(),
    @required Result noInternetConnection(),
    @required Result formatException(),
    @required Result unableToProcess(),
    @required Result defaultError(String error),
    @required Result unexpectedError(),
    @required Result loginError(),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return loginError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestCancelled(),
    Result unauthorisedRequest(),
    Result badRequest(),
    Result notFound(String reason),
    Result methodNotAllowed(),
    Result notAcceptable(),
    Result requestTimeout(),
    Result sendTimeout(),
    Result conflict(),
    Result internalServerError(),
    Result notImplemented(),
    Result serviceUnavailable(),
    Result noInternetConnection(),
    Result formatException(),
    Result unableToProcess(),
    Result defaultError(String error),
    Result unexpectedError(),
    Result loginError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginError != null) {
      return loginError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestCancelled(RequestCancelled value),
    @required Result unauthorisedRequest(UnauthorisedRequest value),
    @required Result badRequest(BadRequest value),
    @required Result notFound(NotFound value),
    @required Result methodNotAllowed(MethodNotAllowed value),
    @required Result notAcceptable(NotAcceptable value),
    @required Result requestTimeout(RequestTimeout value),
    @required Result sendTimeout(SendTimeout value),
    @required Result conflict(Conflict value),
    @required Result internalServerError(InternalServerError value),
    @required Result notImplemented(NotImplemented value),
    @required Result serviceUnavailable(ServiceUnavailable value),
    @required Result noInternetConnection(NoInternetConnection value),
    @required Result formatException(FormatException value),
    @required Result unableToProcess(UnableToProcess value),
    @required Result defaultError(DefaultError value),
    @required Result unexpectedError(UnexpectedError value),
    @required Result loginError(LoginError value),
  }) {
    assert(requestCancelled != null);
    assert(unauthorisedRequest != null);
    assert(badRequest != null);
    assert(notFound != null);
    assert(methodNotAllowed != null);
    assert(notAcceptable != null);
    assert(requestTimeout != null);
    assert(sendTimeout != null);
    assert(conflict != null);
    assert(internalServerError != null);
    assert(notImplemented != null);
    assert(serviceUnavailable != null);
    assert(noInternetConnection != null);
    assert(formatException != null);
    assert(unableToProcess != null);
    assert(defaultError != null);
    assert(unexpectedError != null);
    assert(loginError != null);
    return loginError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestCancelled(RequestCancelled value),
    Result unauthorisedRequest(UnauthorisedRequest value),
    Result badRequest(BadRequest value),
    Result notFound(NotFound value),
    Result methodNotAllowed(MethodNotAllowed value),
    Result notAcceptable(NotAcceptable value),
    Result requestTimeout(RequestTimeout value),
    Result sendTimeout(SendTimeout value),
    Result conflict(Conflict value),
    Result internalServerError(InternalServerError value),
    Result notImplemented(NotImplemented value),
    Result serviceUnavailable(ServiceUnavailable value),
    Result noInternetConnection(NoInternetConnection value),
    Result formatException(FormatException value),
    Result unableToProcess(UnableToProcess value),
    Result defaultError(DefaultError value),
    Result unexpectedError(UnexpectedError value),
    Result loginError(LoginError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginError != null) {
      return loginError(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$LoginErrorToJson(this)..['runtimeType'] = 'loginError';
  }
}

abstract class LoginError implements NetworkExceptions {
  const factory LoginError() = _$LoginError;

  factory LoginError.fromJson(Map<String, dynamic> json) =
      _$LoginError.fromJson;
}
