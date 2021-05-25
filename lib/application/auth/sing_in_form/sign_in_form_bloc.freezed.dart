// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'sign_in_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SignInFormEventTearOff {
  const _$SignInFormEventTearOff();

// ignore: unused_element
  PhoneChanged phoneChanged(String phoneStr) {
    return PhoneChanged(
      phoneStr,
    );
  }

// ignore: unused_element
  VerificationChanged verificationChanged(String verificationStr) {
    return VerificationChanged(
      verificationStr,
    );
  }

// ignore: unused_element
  SignInWithPhoneAndSMSCodePressed signInWithPhoneAndSMSCodePressed() {
    return const SignInWithPhoneAndSMSCodePressed();
  }

// ignore: unused_element
  GetSMSVerificationPressed getSMSVerificationPressed() {
    return const GetSMSVerificationPressed();
  }

// ignore: unused_element
  GetPhone getPhone(String phone) {
    return GetPhone(
      phone,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SignInFormEvent = _$SignInFormEventTearOff();

/// @nodoc
mixin _$SignInFormEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result phoneChanged(String phoneStr),
    @required Result verificationChanged(String verificationStr),
    @required Result signInWithPhoneAndSMSCodePressed(),
    @required Result getSMSVerificationPressed(),
    @required Result getPhone(String phone),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result phoneChanged(String phoneStr),
    Result verificationChanged(String verificationStr),
    Result signInWithPhoneAndSMSCodePressed(),
    Result getSMSVerificationPressed(),
    Result getPhone(String phone),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result phoneChanged(PhoneChanged value),
    @required Result verificationChanged(VerificationChanged value),
    @required
        Result signInWithPhoneAndSMSCodePressed(
            SignInWithPhoneAndSMSCodePressed value),
    @required Result getSMSVerificationPressed(GetSMSVerificationPressed value),
    @required Result getPhone(GetPhone value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result phoneChanged(PhoneChanged value),
    Result verificationChanged(VerificationChanged value),
    Result signInWithPhoneAndSMSCodePressed(
        SignInWithPhoneAndSMSCodePressed value),
    Result getSMSVerificationPressed(GetSMSVerificationPressed value),
    Result getPhone(GetPhone value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $SignInFormEventCopyWith<$Res> {
  factory $SignInFormEventCopyWith(
          SignInFormEvent value, $Res Function(SignInFormEvent) then) =
      _$SignInFormEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInFormEventCopyWithImpl<$Res>
    implements $SignInFormEventCopyWith<$Res> {
  _$SignInFormEventCopyWithImpl(this._value, this._then);

  final SignInFormEvent _value;
  // ignore: unused_field
  final $Res Function(SignInFormEvent) _then;
}

/// @nodoc
abstract class $PhoneChangedCopyWith<$Res> {
  factory $PhoneChangedCopyWith(
          PhoneChanged value, $Res Function(PhoneChanged) then) =
      _$PhoneChangedCopyWithImpl<$Res>;
  $Res call({String phoneStr});
}

/// @nodoc
class _$PhoneChangedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $PhoneChangedCopyWith<$Res> {
  _$PhoneChangedCopyWithImpl(
      PhoneChanged _value, $Res Function(PhoneChanged) _then)
      : super(_value, (v) => _then(v as PhoneChanged));

  @override
  PhoneChanged get _value => super._value as PhoneChanged;

  @override
  $Res call({
    Object phoneStr = freezed,
  }) {
    return _then(PhoneChanged(
      phoneStr == freezed ? _value.phoneStr : phoneStr as String,
    ));
  }
}

/// @nodoc
class _$PhoneChanged with DiagnosticableTreeMixin implements PhoneChanged {
  const _$PhoneChanged(this.phoneStr) : assert(phoneStr != null);

  @override
  final String phoneStr;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInFormEvent.phoneChanged(phoneStr: $phoneStr)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInFormEvent.phoneChanged'))
      ..add(DiagnosticsProperty('phoneStr', phoneStr));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PhoneChanged &&
            (identical(other.phoneStr, phoneStr) ||
                const DeepCollectionEquality()
                    .equals(other.phoneStr, phoneStr)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(phoneStr);

  @override
  $PhoneChangedCopyWith<PhoneChanged> get copyWith =>
      _$PhoneChangedCopyWithImpl<PhoneChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result phoneChanged(String phoneStr),
    @required Result verificationChanged(String verificationStr),
    @required Result signInWithPhoneAndSMSCodePressed(),
    @required Result getSMSVerificationPressed(),
    @required Result getPhone(String phone),
  }) {
    assert(phoneChanged != null);
    assert(verificationChanged != null);
    assert(signInWithPhoneAndSMSCodePressed != null);
    assert(getSMSVerificationPressed != null);
    assert(getPhone != null);
    return phoneChanged(phoneStr);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result phoneChanged(String phoneStr),
    Result verificationChanged(String verificationStr),
    Result signInWithPhoneAndSMSCodePressed(),
    Result getSMSVerificationPressed(),
    Result getPhone(String phone),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (phoneChanged != null) {
      return phoneChanged(phoneStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result phoneChanged(PhoneChanged value),
    @required Result verificationChanged(VerificationChanged value),
    @required
        Result signInWithPhoneAndSMSCodePressed(
            SignInWithPhoneAndSMSCodePressed value),
    @required Result getSMSVerificationPressed(GetSMSVerificationPressed value),
    @required Result getPhone(GetPhone value),
  }) {
    assert(phoneChanged != null);
    assert(verificationChanged != null);
    assert(signInWithPhoneAndSMSCodePressed != null);
    assert(getSMSVerificationPressed != null);
    assert(getPhone != null);
    return phoneChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result phoneChanged(PhoneChanged value),
    Result verificationChanged(VerificationChanged value),
    Result signInWithPhoneAndSMSCodePressed(
        SignInWithPhoneAndSMSCodePressed value),
    Result getSMSVerificationPressed(GetSMSVerificationPressed value),
    Result getPhone(GetPhone value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (phoneChanged != null) {
      return phoneChanged(this);
    }
    return orElse();
  }
}

abstract class PhoneChanged implements SignInFormEvent {
  const factory PhoneChanged(String phoneStr) = _$PhoneChanged;

  String get phoneStr;
  $PhoneChangedCopyWith<PhoneChanged> get copyWith;
}

/// @nodoc
abstract class $VerificationChangedCopyWith<$Res> {
  factory $VerificationChangedCopyWith(
          VerificationChanged value, $Res Function(VerificationChanged) then) =
      _$VerificationChangedCopyWithImpl<$Res>;
  $Res call({String verificationStr});
}

/// @nodoc
class _$VerificationChangedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $VerificationChangedCopyWith<$Res> {
  _$VerificationChangedCopyWithImpl(
      VerificationChanged _value, $Res Function(VerificationChanged) _then)
      : super(_value, (v) => _then(v as VerificationChanged));

  @override
  VerificationChanged get _value => super._value as VerificationChanged;

  @override
  $Res call({
    Object verificationStr = freezed,
  }) {
    return _then(VerificationChanged(
      verificationStr == freezed
          ? _value.verificationStr
          : verificationStr as String,
    ));
  }
}

/// @nodoc
class _$VerificationChanged
    with DiagnosticableTreeMixin
    implements VerificationChanged {
  const _$VerificationChanged(this.verificationStr)
      : assert(verificationStr != null);

  @override
  final String verificationStr;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInFormEvent.verificationChanged(verificationStr: $verificationStr)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInFormEvent.verificationChanged'))
      ..add(DiagnosticsProperty('verificationStr', verificationStr));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is VerificationChanged &&
            (identical(other.verificationStr, verificationStr) ||
                const DeepCollectionEquality()
                    .equals(other.verificationStr, verificationStr)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(verificationStr);

  @override
  $VerificationChangedCopyWith<VerificationChanged> get copyWith =>
      _$VerificationChangedCopyWithImpl<VerificationChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result phoneChanged(String phoneStr),
    @required Result verificationChanged(String verificationStr),
    @required Result signInWithPhoneAndSMSCodePressed(),
    @required Result getSMSVerificationPressed(),
    @required Result getPhone(String phone),
  }) {
    assert(phoneChanged != null);
    assert(verificationChanged != null);
    assert(signInWithPhoneAndSMSCodePressed != null);
    assert(getSMSVerificationPressed != null);
    assert(getPhone != null);
    return verificationChanged(verificationStr);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result phoneChanged(String phoneStr),
    Result verificationChanged(String verificationStr),
    Result signInWithPhoneAndSMSCodePressed(),
    Result getSMSVerificationPressed(),
    Result getPhone(String phone),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (verificationChanged != null) {
      return verificationChanged(verificationStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result phoneChanged(PhoneChanged value),
    @required Result verificationChanged(VerificationChanged value),
    @required
        Result signInWithPhoneAndSMSCodePressed(
            SignInWithPhoneAndSMSCodePressed value),
    @required Result getSMSVerificationPressed(GetSMSVerificationPressed value),
    @required Result getPhone(GetPhone value),
  }) {
    assert(phoneChanged != null);
    assert(verificationChanged != null);
    assert(signInWithPhoneAndSMSCodePressed != null);
    assert(getSMSVerificationPressed != null);
    assert(getPhone != null);
    return verificationChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result phoneChanged(PhoneChanged value),
    Result verificationChanged(VerificationChanged value),
    Result signInWithPhoneAndSMSCodePressed(
        SignInWithPhoneAndSMSCodePressed value),
    Result getSMSVerificationPressed(GetSMSVerificationPressed value),
    Result getPhone(GetPhone value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (verificationChanged != null) {
      return verificationChanged(this);
    }
    return orElse();
  }
}

abstract class VerificationChanged implements SignInFormEvent {
  const factory VerificationChanged(String verificationStr) =
      _$VerificationChanged;

  String get verificationStr;
  $VerificationChangedCopyWith<VerificationChanged> get copyWith;
}

/// @nodoc
abstract class $SignInWithPhoneAndSMSCodePressedCopyWith<$Res> {
  factory $SignInWithPhoneAndSMSCodePressedCopyWith(
          SignInWithPhoneAndSMSCodePressed value,
          $Res Function(SignInWithPhoneAndSMSCodePressed) then) =
      _$SignInWithPhoneAndSMSCodePressedCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInWithPhoneAndSMSCodePressedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $SignInWithPhoneAndSMSCodePressedCopyWith<$Res> {
  _$SignInWithPhoneAndSMSCodePressedCopyWithImpl(
      SignInWithPhoneAndSMSCodePressed _value,
      $Res Function(SignInWithPhoneAndSMSCodePressed) _then)
      : super(_value, (v) => _then(v as SignInWithPhoneAndSMSCodePressed));

  @override
  SignInWithPhoneAndSMSCodePressed get _value =>
      super._value as SignInWithPhoneAndSMSCodePressed;
}

/// @nodoc
class _$SignInWithPhoneAndSMSCodePressed
    with DiagnosticableTreeMixin
    implements SignInWithPhoneAndSMSCodePressed {
  const _$SignInWithPhoneAndSMSCodePressed();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInFormEvent.signInWithPhoneAndSMSCodePressed()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'SignInFormEvent.signInWithPhoneAndSMSCodePressed'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SignInWithPhoneAndSMSCodePressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result phoneChanged(String phoneStr),
    @required Result verificationChanged(String verificationStr),
    @required Result signInWithPhoneAndSMSCodePressed(),
    @required Result getSMSVerificationPressed(),
    @required Result getPhone(String phone),
  }) {
    assert(phoneChanged != null);
    assert(verificationChanged != null);
    assert(signInWithPhoneAndSMSCodePressed != null);
    assert(getSMSVerificationPressed != null);
    assert(getPhone != null);
    return signInWithPhoneAndSMSCodePressed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result phoneChanged(String phoneStr),
    Result verificationChanged(String verificationStr),
    Result signInWithPhoneAndSMSCodePressed(),
    Result getSMSVerificationPressed(),
    Result getPhone(String phone),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (signInWithPhoneAndSMSCodePressed != null) {
      return signInWithPhoneAndSMSCodePressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result phoneChanged(PhoneChanged value),
    @required Result verificationChanged(VerificationChanged value),
    @required
        Result signInWithPhoneAndSMSCodePressed(
            SignInWithPhoneAndSMSCodePressed value),
    @required Result getSMSVerificationPressed(GetSMSVerificationPressed value),
    @required Result getPhone(GetPhone value),
  }) {
    assert(phoneChanged != null);
    assert(verificationChanged != null);
    assert(signInWithPhoneAndSMSCodePressed != null);
    assert(getSMSVerificationPressed != null);
    assert(getPhone != null);
    return signInWithPhoneAndSMSCodePressed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result phoneChanged(PhoneChanged value),
    Result verificationChanged(VerificationChanged value),
    Result signInWithPhoneAndSMSCodePressed(
        SignInWithPhoneAndSMSCodePressed value),
    Result getSMSVerificationPressed(GetSMSVerificationPressed value),
    Result getPhone(GetPhone value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (signInWithPhoneAndSMSCodePressed != null) {
      return signInWithPhoneAndSMSCodePressed(this);
    }
    return orElse();
  }
}

abstract class SignInWithPhoneAndSMSCodePressed implements SignInFormEvent {
  const factory SignInWithPhoneAndSMSCodePressed() =
      _$SignInWithPhoneAndSMSCodePressed;
}

/// @nodoc
abstract class $GetSMSVerificationPressedCopyWith<$Res> {
  factory $GetSMSVerificationPressedCopyWith(GetSMSVerificationPressed value,
          $Res Function(GetSMSVerificationPressed) then) =
      _$GetSMSVerificationPressedCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetSMSVerificationPressedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $GetSMSVerificationPressedCopyWith<$Res> {
  _$GetSMSVerificationPressedCopyWithImpl(GetSMSVerificationPressed _value,
      $Res Function(GetSMSVerificationPressed) _then)
      : super(_value, (v) => _then(v as GetSMSVerificationPressed));

  @override
  GetSMSVerificationPressed get _value =>
      super._value as GetSMSVerificationPressed;
}

/// @nodoc
class _$GetSMSVerificationPressed
    with DiagnosticableTreeMixin
    implements GetSMSVerificationPressed {
  const _$GetSMSVerificationPressed();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInFormEvent.getSMSVerificationPressed()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'SignInFormEvent.getSMSVerificationPressed'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GetSMSVerificationPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result phoneChanged(String phoneStr),
    @required Result verificationChanged(String verificationStr),
    @required Result signInWithPhoneAndSMSCodePressed(),
    @required Result getSMSVerificationPressed(),
    @required Result getPhone(String phone),
  }) {
    assert(phoneChanged != null);
    assert(verificationChanged != null);
    assert(signInWithPhoneAndSMSCodePressed != null);
    assert(getSMSVerificationPressed != null);
    assert(getPhone != null);
    return getSMSVerificationPressed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result phoneChanged(String phoneStr),
    Result verificationChanged(String verificationStr),
    Result signInWithPhoneAndSMSCodePressed(),
    Result getSMSVerificationPressed(),
    Result getPhone(String phone),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getSMSVerificationPressed != null) {
      return getSMSVerificationPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result phoneChanged(PhoneChanged value),
    @required Result verificationChanged(VerificationChanged value),
    @required
        Result signInWithPhoneAndSMSCodePressed(
            SignInWithPhoneAndSMSCodePressed value),
    @required Result getSMSVerificationPressed(GetSMSVerificationPressed value),
    @required Result getPhone(GetPhone value),
  }) {
    assert(phoneChanged != null);
    assert(verificationChanged != null);
    assert(signInWithPhoneAndSMSCodePressed != null);
    assert(getSMSVerificationPressed != null);
    assert(getPhone != null);
    return getSMSVerificationPressed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result phoneChanged(PhoneChanged value),
    Result verificationChanged(VerificationChanged value),
    Result signInWithPhoneAndSMSCodePressed(
        SignInWithPhoneAndSMSCodePressed value),
    Result getSMSVerificationPressed(GetSMSVerificationPressed value),
    Result getPhone(GetPhone value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getSMSVerificationPressed != null) {
      return getSMSVerificationPressed(this);
    }
    return orElse();
  }
}

abstract class GetSMSVerificationPressed implements SignInFormEvent {
  const factory GetSMSVerificationPressed() = _$GetSMSVerificationPressed;
}

/// @nodoc
abstract class $GetPhoneCopyWith<$Res> {
  factory $GetPhoneCopyWith(GetPhone value, $Res Function(GetPhone) then) =
      _$GetPhoneCopyWithImpl<$Res>;
  $Res call({String phone});
}

/// @nodoc
class _$GetPhoneCopyWithImpl<$Res> extends _$SignInFormEventCopyWithImpl<$Res>
    implements $GetPhoneCopyWith<$Res> {
  _$GetPhoneCopyWithImpl(GetPhone _value, $Res Function(GetPhone) _then)
      : super(_value, (v) => _then(v as GetPhone));

  @override
  GetPhone get _value => super._value as GetPhone;

  @override
  $Res call({
    Object phone = freezed,
  }) {
    return _then(GetPhone(
      phone == freezed ? _value.phone : phone as String,
    ));
  }
}

/// @nodoc
class _$GetPhone with DiagnosticableTreeMixin implements GetPhone {
  const _$GetPhone(this.phone) : assert(phone != null);

  @override
  final String phone;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInFormEvent.getPhone(phone: $phone)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInFormEvent.getPhone'))
      ..add(DiagnosticsProperty('phone', phone));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetPhone &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(phone);

  @override
  $GetPhoneCopyWith<GetPhone> get copyWith =>
      _$GetPhoneCopyWithImpl<GetPhone>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result phoneChanged(String phoneStr),
    @required Result verificationChanged(String verificationStr),
    @required Result signInWithPhoneAndSMSCodePressed(),
    @required Result getSMSVerificationPressed(),
    @required Result getPhone(String phone),
  }) {
    assert(phoneChanged != null);
    assert(verificationChanged != null);
    assert(signInWithPhoneAndSMSCodePressed != null);
    assert(getSMSVerificationPressed != null);
    assert(getPhone != null);
    return getPhone(phone);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result phoneChanged(String phoneStr),
    Result verificationChanged(String verificationStr),
    Result signInWithPhoneAndSMSCodePressed(),
    Result getSMSVerificationPressed(),
    Result getPhone(String phone),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPhone != null) {
      return getPhone(phone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result phoneChanged(PhoneChanged value),
    @required Result verificationChanged(VerificationChanged value),
    @required
        Result signInWithPhoneAndSMSCodePressed(
            SignInWithPhoneAndSMSCodePressed value),
    @required Result getSMSVerificationPressed(GetSMSVerificationPressed value),
    @required Result getPhone(GetPhone value),
  }) {
    assert(phoneChanged != null);
    assert(verificationChanged != null);
    assert(signInWithPhoneAndSMSCodePressed != null);
    assert(getSMSVerificationPressed != null);
    assert(getPhone != null);
    return getPhone(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result phoneChanged(PhoneChanged value),
    Result verificationChanged(VerificationChanged value),
    Result signInWithPhoneAndSMSCodePressed(
        SignInWithPhoneAndSMSCodePressed value),
    Result getSMSVerificationPressed(GetSMSVerificationPressed value),
    Result getPhone(GetPhone value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPhone != null) {
      return getPhone(this);
    }
    return orElse();
  }
}

abstract class GetPhone implements SignInFormEvent {
  const factory GetPhone(String phone) = _$GetPhone;

  String get phone;
  $GetPhoneCopyWith<GetPhone> get copyWith;
}

/// @nodoc
class _$SignInFormStateTearOff {
  const _$SignInFormStateTearOff();

// ignore: unused_element
  _SignInFormState call(
      {@required PhoneNumber phoneNumber,
      @required VerificationCode verificationCode,
      @required bool showErrorMessages,
      @required bool isSubmitting,
      @required bool isObtaining,
      @required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption}) {
    return _SignInFormState(
      phoneNumber: phoneNumber,
      verificationCode: verificationCode,
      showErrorMessages: showErrorMessages,
      isSubmitting: isSubmitting,
      isObtaining: isObtaining,
      authFailureOrSuccessOption: authFailureOrSuccessOption,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SignInFormState = _$SignInFormStateTearOff();

/// @nodoc
mixin _$SignInFormState {
// @required EmailAddress emailAddress,
  PhoneNumber get phoneNumber;
  VerificationCode get verificationCode;
  bool get showErrorMessages;
  bool get isSubmitting;
  bool get isObtaining;
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption;

  $SignInFormStateCopyWith<SignInFormState> get copyWith;
}

/// @nodoc
abstract class $SignInFormStateCopyWith<$Res> {
  factory $SignInFormStateCopyWith(
          SignInFormState value, $Res Function(SignInFormState) then) =
      _$SignInFormStateCopyWithImpl<$Res>;
  $Res call(
      {PhoneNumber phoneNumber,
      VerificationCode verificationCode,
      bool showErrorMessages,
      bool isSubmitting,
      bool isObtaining,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class _$SignInFormStateCopyWithImpl<$Res>
    implements $SignInFormStateCopyWith<$Res> {
  _$SignInFormStateCopyWithImpl(this._value, this._then);

  final SignInFormState _value;
  // ignore: unused_field
  final $Res Function(SignInFormState) _then;

  @override
  $Res call({
    Object phoneNumber = freezed,
    Object verificationCode = freezed,
    Object showErrorMessages = freezed,
    Object isSubmitting = freezed,
    Object isObtaining = freezed,
    Object authFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber as PhoneNumber,
      verificationCode: verificationCode == freezed
          ? _value.verificationCode
          : verificationCode as VerificationCode,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      isObtaining:
          isObtaining == freezed ? _value.isObtaining : isObtaining as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc
abstract class _$SignInFormStateCopyWith<$Res>
    implements $SignInFormStateCopyWith<$Res> {
  factory _$SignInFormStateCopyWith(
          _SignInFormState value, $Res Function(_SignInFormState) then) =
      __$SignInFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {PhoneNumber phoneNumber,
      VerificationCode verificationCode,
      bool showErrorMessages,
      bool isSubmitting,
      bool isObtaining,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class __$SignInFormStateCopyWithImpl<$Res>
    extends _$SignInFormStateCopyWithImpl<$Res>
    implements _$SignInFormStateCopyWith<$Res> {
  __$SignInFormStateCopyWithImpl(
      _SignInFormState _value, $Res Function(_SignInFormState) _then)
      : super(_value, (v) => _then(v as _SignInFormState));

  @override
  _SignInFormState get _value => super._value as _SignInFormState;

  @override
  $Res call({
    Object phoneNumber = freezed,
    Object verificationCode = freezed,
    Object showErrorMessages = freezed,
    Object isSubmitting = freezed,
    Object isObtaining = freezed,
    Object authFailureOrSuccessOption = freezed,
  }) {
    return _then(_SignInFormState(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber as PhoneNumber,
      verificationCode: verificationCode == freezed
          ? _value.verificationCode
          : verificationCode as VerificationCode,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      isObtaining:
          isObtaining == freezed ? _value.isObtaining : isObtaining as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc
class _$_SignInFormState
    with DiagnosticableTreeMixin
    implements _SignInFormState {
  const _$_SignInFormState(
      {@required this.phoneNumber,
      @required this.verificationCode,
      @required this.showErrorMessages,
      @required this.isSubmitting,
      @required this.isObtaining,
      @required this.authFailureOrSuccessOption})
      : assert(phoneNumber != null),
        assert(verificationCode != null),
        assert(showErrorMessages != null),
        assert(isSubmitting != null),
        assert(isObtaining != null),
        assert(authFailureOrSuccessOption != null);

  @override // @required EmailAddress emailAddress,
  final PhoneNumber phoneNumber;
  @override
  final VerificationCode verificationCode;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final bool isObtaining;
  @override
  final Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInFormState(phoneNumber: $phoneNumber, verificationCode: $verificationCode, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, isObtaining: $isObtaining, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInFormState'))
      ..add(DiagnosticsProperty('phoneNumber', phoneNumber))
      ..add(DiagnosticsProperty('verificationCode', verificationCode))
      ..add(DiagnosticsProperty('showErrorMessages', showErrorMessages))
      ..add(DiagnosticsProperty('isSubmitting', isSubmitting))
      ..add(DiagnosticsProperty('isObtaining', isObtaining))
      ..add(DiagnosticsProperty(
          'authFailureOrSuccessOption', authFailureOrSuccessOption));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignInFormState &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.verificationCode, verificationCode) ||
                const DeepCollectionEquality()
                    .equals(other.verificationCode, verificationCode)) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.isObtaining, isObtaining) ||
                const DeepCollectionEquality()
                    .equals(other.isObtaining, isObtaining)) &&
            (identical(other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(verificationCode) ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(isObtaining) ^
      const DeepCollectionEquality().hash(authFailureOrSuccessOption);

  @override
  _$SignInFormStateCopyWith<_SignInFormState> get copyWith =>
      __$SignInFormStateCopyWithImpl<_SignInFormState>(this, _$identity);
}

abstract class _SignInFormState implements SignInFormState {
  const factory _SignInFormState(
          {@required
              PhoneNumber phoneNumber,
          @required
              VerificationCode verificationCode,
          @required
              bool showErrorMessages,
          @required
              bool isSubmitting,
          @required
              bool isObtaining,
          @required
              Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption}) =
      _$_SignInFormState;

  @override // @required EmailAddress emailAddress,
  PhoneNumber get phoneNumber;
  @override
  VerificationCode get verificationCode;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  bool get isObtaining;
  @override
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption;
  @override
  _$SignInFormStateCopyWith<_SignInFormState> get copyWith;
}
