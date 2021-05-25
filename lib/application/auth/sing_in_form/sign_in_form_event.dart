part of 'sign_in_form_bloc.dart';

@freezed
abstract class SignInFormEvent with _$SignInFormEvent {
  // Notice that these events take in "raw" unvalidated Strings
  const factory SignInFormEvent.phoneChanged(String phoneStr) = PhoneChanged;
  const factory SignInFormEvent.verificationChanged(String verificationStr) =
      VerificationChanged;
  const factory SignInFormEvent.signInWithPhoneAndSMSCodePressed() =
      SignInWithPhoneAndSMSCodePressed;
  const factory SignInFormEvent.getSMSVerificationPressed() =
      GetSMSVerificationPressed;
  const factory SignInFormEvent.getPhone(String phone) = GetPhone;
}
