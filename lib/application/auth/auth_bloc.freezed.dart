// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AuthBlocEventTearOff {
  const _$AuthBlocEventTearOff();

// ignore: unused_element
  AuthCheckRequested authCheckRequested() {
    return const AuthCheckRequested();
  }

// ignore: unused_element
  SignedOut signedOut() {
    return const SignedOut();
  }

// ignore: unused_element
  GetRefresh getRefresh() {
    return const GetRefresh();
  }

// ignore: unused_element
  Relogin relogin() {
    return const Relogin();
  }
}

/// @nodoc
// ignore: unused_element
const $AuthBlocEvent = _$AuthBlocEventTearOff();

/// @nodoc
mixin _$AuthBlocEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result authCheckRequested(),
    @required Result signedOut(),
    @required Result getRefresh(),
    @required Result relogin(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result authCheckRequested(),
    Result signedOut(),
    Result getRefresh(),
    Result relogin(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result authCheckRequested(AuthCheckRequested value),
    @required Result signedOut(SignedOut value),
    @required Result getRefresh(GetRefresh value),
    @required Result relogin(Relogin value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result authCheckRequested(AuthCheckRequested value),
    Result signedOut(SignedOut value),
    Result getRefresh(GetRefresh value),
    Result relogin(Relogin value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $AuthBlocEventCopyWith<$Res> {
  factory $AuthBlocEventCopyWith(
          AuthBlocEvent value, $Res Function(AuthBlocEvent) then) =
      _$AuthBlocEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthBlocEventCopyWithImpl<$Res>
    implements $AuthBlocEventCopyWith<$Res> {
  _$AuthBlocEventCopyWithImpl(this._value, this._then);

  final AuthBlocEvent _value;
  // ignore: unused_field
  final $Res Function(AuthBlocEvent) _then;
}

/// @nodoc
abstract class $AuthCheckRequestedCopyWith<$Res> {
  factory $AuthCheckRequestedCopyWith(
          AuthCheckRequested value, $Res Function(AuthCheckRequested) then) =
      _$AuthCheckRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthCheckRequestedCopyWithImpl<$Res>
    extends _$AuthBlocEventCopyWithImpl<$Res>
    implements $AuthCheckRequestedCopyWith<$Res> {
  _$AuthCheckRequestedCopyWithImpl(
      AuthCheckRequested _value, $Res Function(AuthCheckRequested) _then)
      : super(_value, (v) => _then(v as AuthCheckRequested));

  @override
  AuthCheckRequested get _value => super._value as AuthCheckRequested;
}

/// @nodoc
class _$AuthCheckRequested implements AuthCheckRequested {
  const _$AuthCheckRequested();

  @override
  String toString() {
    return 'AuthBlocEvent.authCheckRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthCheckRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result authCheckRequested(),
    @required Result signedOut(),
    @required Result getRefresh(),
    @required Result relogin(),
  }) {
    assert(authCheckRequested != null);
    assert(signedOut != null);
    assert(getRefresh != null);
    assert(relogin != null);
    return authCheckRequested();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result authCheckRequested(),
    Result signedOut(),
    Result getRefresh(),
    Result relogin(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authCheckRequested != null) {
      return authCheckRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result authCheckRequested(AuthCheckRequested value),
    @required Result signedOut(SignedOut value),
    @required Result getRefresh(GetRefresh value),
    @required Result relogin(Relogin value),
  }) {
    assert(authCheckRequested != null);
    assert(signedOut != null);
    assert(getRefresh != null);
    assert(relogin != null);
    return authCheckRequested(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result authCheckRequested(AuthCheckRequested value),
    Result signedOut(SignedOut value),
    Result getRefresh(GetRefresh value),
    Result relogin(Relogin value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authCheckRequested != null) {
      return authCheckRequested(this);
    }
    return orElse();
  }
}

abstract class AuthCheckRequested implements AuthBlocEvent {
  const factory AuthCheckRequested() = _$AuthCheckRequested;
}

/// @nodoc
abstract class $SignedOutCopyWith<$Res> {
  factory $SignedOutCopyWith(SignedOut value, $Res Function(SignedOut) then) =
      _$SignedOutCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignedOutCopyWithImpl<$Res> extends _$AuthBlocEventCopyWithImpl<$Res>
    implements $SignedOutCopyWith<$Res> {
  _$SignedOutCopyWithImpl(SignedOut _value, $Res Function(SignedOut) _then)
      : super(_value, (v) => _then(v as SignedOut));

  @override
  SignedOut get _value => super._value as SignedOut;
}

/// @nodoc
class _$SignedOut implements SignedOut {
  const _$SignedOut();

  @override
  String toString() {
    return 'AuthBlocEvent.signedOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SignedOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result authCheckRequested(),
    @required Result signedOut(),
    @required Result getRefresh(),
    @required Result relogin(),
  }) {
    assert(authCheckRequested != null);
    assert(signedOut != null);
    assert(getRefresh != null);
    assert(relogin != null);
    return signedOut();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result authCheckRequested(),
    Result signedOut(),
    Result getRefresh(),
    Result relogin(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (signedOut != null) {
      return signedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result authCheckRequested(AuthCheckRequested value),
    @required Result signedOut(SignedOut value),
    @required Result getRefresh(GetRefresh value),
    @required Result relogin(Relogin value),
  }) {
    assert(authCheckRequested != null);
    assert(signedOut != null);
    assert(getRefresh != null);
    assert(relogin != null);
    return signedOut(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result authCheckRequested(AuthCheckRequested value),
    Result signedOut(SignedOut value),
    Result getRefresh(GetRefresh value),
    Result relogin(Relogin value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (signedOut != null) {
      return signedOut(this);
    }
    return orElse();
  }
}

abstract class SignedOut implements AuthBlocEvent {
  const factory SignedOut() = _$SignedOut;
}

/// @nodoc
abstract class $GetRefreshCopyWith<$Res> {
  factory $GetRefreshCopyWith(
          GetRefresh value, $Res Function(GetRefresh) then) =
      _$GetRefreshCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetRefreshCopyWithImpl<$Res> extends _$AuthBlocEventCopyWithImpl<$Res>
    implements $GetRefreshCopyWith<$Res> {
  _$GetRefreshCopyWithImpl(GetRefresh _value, $Res Function(GetRefresh) _then)
      : super(_value, (v) => _then(v as GetRefresh));

  @override
  GetRefresh get _value => super._value as GetRefresh;
}

/// @nodoc
class _$GetRefresh implements GetRefresh {
  const _$GetRefresh();

  @override
  String toString() {
    return 'AuthBlocEvent.getRefresh()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GetRefresh);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result authCheckRequested(),
    @required Result signedOut(),
    @required Result getRefresh(),
    @required Result relogin(),
  }) {
    assert(authCheckRequested != null);
    assert(signedOut != null);
    assert(getRefresh != null);
    assert(relogin != null);
    return getRefresh();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result authCheckRequested(),
    Result signedOut(),
    Result getRefresh(),
    Result relogin(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getRefresh != null) {
      return getRefresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result authCheckRequested(AuthCheckRequested value),
    @required Result signedOut(SignedOut value),
    @required Result getRefresh(GetRefresh value),
    @required Result relogin(Relogin value),
  }) {
    assert(authCheckRequested != null);
    assert(signedOut != null);
    assert(getRefresh != null);
    assert(relogin != null);
    return getRefresh(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result authCheckRequested(AuthCheckRequested value),
    Result signedOut(SignedOut value),
    Result getRefresh(GetRefresh value),
    Result relogin(Relogin value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getRefresh != null) {
      return getRefresh(this);
    }
    return orElse();
  }
}

abstract class GetRefresh implements AuthBlocEvent {
  const factory GetRefresh() = _$GetRefresh;
}

/// @nodoc
abstract class $ReloginCopyWith<$Res> {
  factory $ReloginCopyWith(Relogin value, $Res Function(Relogin) then) =
      _$ReloginCopyWithImpl<$Res>;
}

/// @nodoc
class _$ReloginCopyWithImpl<$Res> extends _$AuthBlocEventCopyWithImpl<$Res>
    implements $ReloginCopyWith<$Res> {
  _$ReloginCopyWithImpl(Relogin _value, $Res Function(Relogin) _then)
      : super(_value, (v) => _then(v as Relogin));

  @override
  Relogin get _value => super._value as Relogin;
}

/// @nodoc
class _$Relogin implements Relogin {
  const _$Relogin();

  @override
  String toString() {
    return 'AuthBlocEvent.relogin()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Relogin);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result authCheckRequested(),
    @required Result signedOut(),
    @required Result getRefresh(),
    @required Result relogin(),
  }) {
    assert(authCheckRequested != null);
    assert(signedOut != null);
    assert(getRefresh != null);
    assert(relogin != null);
    return relogin();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result authCheckRequested(),
    Result signedOut(),
    Result getRefresh(),
    Result relogin(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (relogin != null) {
      return relogin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result authCheckRequested(AuthCheckRequested value),
    @required Result signedOut(SignedOut value),
    @required Result getRefresh(GetRefresh value),
    @required Result relogin(Relogin value),
  }) {
    assert(authCheckRequested != null);
    assert(signedOut != null);
    assert(getRefresh != null);
    assert(relogin != null);
    return relogin(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result authCheckRequested(AuthCheckRequested value),
    Result signedOut(SignedOut value),
    Result getRefresh(GetRefresh value),
    Result relogin(Relogin value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (relogin != null) {
      return relogin(this);
    }
    return orElse();
  }
}

abstract class Relogin implements AuthBlocEvent {
  const factory Relogin() = _$Relogin;
}

/// @nodoc
class _$AuthBlocStateTearOff {
  const _$AuthBlocStateTearOff();

// ignore: unused_element
  Initial initial() {
    return const Initial();
  }

// ignore: unused_element
  Authenticated authenticated() {
    return const Authenticated();
  }

// ignore: unused_element
  Unauthenticated unauthenticated() {
    return const Unauthenticated();
  }

// ignore: unused_element
  LoginOut loginOut() {
    return const LoginOut();
  }
}

/// @nodoc
// ignore: unused_element
const $AuthBlocState = _$AuthBlocStateTearOff();

/// @nodoc
mixin _$AuthBlocState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result authenticated(),
    @required Result unauthenticated(),
    @required Result loginOut(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result authenticated(),
    Result unauthenticated(),
    Result loginOut(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(Unauthenticated value),
    @required Result loginOut(LoginOut value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result authenticated(Authenticated value),
    Result unauthenticated(Unauthenticated value),
    Result loginOut(LoginOut value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $AuthBlocStateCopyWith<$Res> {
  factory $AuthBlocStateCopyWith(
          AuthBlocState value, $Res Function(AuthBlocState) then) =
      _$AuthBlocStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthBlocStateCopyWithImpl<$Res>
    implements $AuthBlocStateCopyWith<$Res> {
  _$AuthBlocStateCopyWithImpl(this._value, this._then);

  final AuthBlocState _value;
  // ignore: unused_field
  final $Res Function(AuthBlocState) _then;
}

/// @nodoc
abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialCopyWithImpl<$Res> extends _$AuthBlocStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

/// @nodoc
class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'AuthBlocState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result authenticated(),
    @required Result unauthenticated(),
    @required Result loginOut(),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(loginOut != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result authenticated(),
    Result unauthenticated(),
    Result loginOut(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(Unauthenticated value),
    @required Result loginOut(LoginOut value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(loginOut != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result authenticated(Authenticated value),
    Result unauthenticated(Unauthenticated value),
    Result loginOut(LoginOut value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements AuthBlocState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class $AuthenticatedCopyWith<$Res> {
  factory $AuthenticatedCopyWith(
          Authenticated value, $Res Function(Authenticated) then) =
      _$AuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticatedCopyWithImpl<$Res>
    extends _$AuthBlocStateCopyWithImpl<$Res>
    implements $AuthenticatedCopyWith<$Res> {
  _$AuthenticatedCopyWithImpl(
      Authenticated _value, $Res Function(Authenticated) _then)
      : super(_value, (v) => _then(v as Authenticated));

  @override
  Authenticated get _value => super._value as Authenticated;
}

/// @nodoc
class _$Authenticated implements Authenticated {
  const _$Authenticated();

  @override
  String toString() {
    return 'AuthBlocState.authenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Authenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result authenticated(),
    @required Result unauthenticated(),
    @required Result loginOut(),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(loginOut != null);
    return authenticated();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result authenticated(),
    Result unauthenticated(),
    Result loginOut(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authenticated != null) {
      return authenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(Unauthenticated value),
    @required Result loginOut(LoginOut value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(loginOut != null);
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result authenticated(Authenticated value),
    Result unauthenticated(Unauthenticated value),
    Result loginOut(LoginOut value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class Authenticated implements AuthBlocState {
  const factory Authenticated() = _$Authenticated;
}

/// @nodoc
abstract class $UnauthenticatedCopyWith<$Res> {
  factory $UnauthenticatedCopyWith(
          Unauthenticated value, $Res Function(Unauthenticated) then) =
      _$UnauthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnauthenticatedCopyWithImpl<$Res>
    extends _$AuthBlocStateCopyWithImpl<$Res>
    implements $UnauthenticatedCopyWith<$Res> {
  _$UnauthenticatedCopyWithImpl(
      Unauthenticated _value, $Res Function(Unauthenticated) _then)
      : super(_value, (v) => _then(v as Unauthenticated));

  @override
  Unauthenticated get _value => super._value as Unauthenticated;
}

/// @nodoc
class _$Unauthenticated implements Unauthenticated {
  const _$Unauthenticated();

  @override
  String toString() {
    return 'AuthBlocState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Unauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result authenticated(),
    @required Result unauthenticated(),
    @required Result loginOut(),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(loginOut != null);
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result authenticated(),
    Result unauthenticated(),
    Result loginOut(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(Unauthenticated value),
    @required Result loginOut(LoginOut value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(loginOut != null);
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result authenticated(Authenticated value),
    Result unauthenticated(Unauthenticated value),
    Result loginOut(LoginOut value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class Unauthenticated implements AuthBlocState {
  const factory Unauthenticated() = _$Unauthenticated;
}

/// @nodoc
abstract class $LoginOutCopyWith<$Res> {
  factory $LoginOutCopyWith(LoginOut value, $Res Function(LoginOut) then) =
      _$LoginOutCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginOutCopyWithImpl<$Res> extends _$AuthBlocStateCopyWithImpl<$Res>
    implements $LoginOutCopyWith<$Res> {
  _$LoginOutCopyWithImpl(LoginOut _value, $Res Function(LoginOut) _then)
      : super(_value, (v) => _then(v as LoginOut));

  @override
  LoginOut get _value => super._value as LoginOut;
}

/// @nodoc
class _$LoginOut implements LoginOut {
  const _$LoginOut();

  @override
  String toString() {
    return 'AuthBlocState.loginOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoginOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result authenticated(),
    @required Result unauthenticated(),
    @required Result loginOut(),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(loginOut != null);
    return loginOut();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result authenticated(),
    Result unauthenticated(),
    Result loginOut(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginOut != null) {
      return loginOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(Unauthenticated value),
    @required Result loginOut(LoginOut value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(loginOut != null);
    return loginOut(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result authenticated(Authenticated value),
    Result unauthenticated(Unauthenticated value),
    Result loginOut(LoginOut value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginOut != null) {
      return loginOut(this);
    }
    return orElse();
  }
}

abstract class LoginOut implements AuthBlocState {
  const factory LoginOut() = _$LoginOut;
}
