part of 'sign_in_form_bloc.dart';

@freezed
abstract class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    // @required EmailAddress emailAddress,
    @required PhoneNumber phoneNumber,
    @required VerificationCode verificationCode,
    @required bool showErrorMessages,
    @required bool isSubmitting,
    @required bool isObtaining,
    @required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
        // emailAddress: EmailAddress(''),
        phoneNumber: PhoneNumber(''),
        verificationCode: VerificationCode(''),
        showErrorMessages: false,
        isSubmitting: false,
        isObtaining: false,
        authFailureOrSuccessOption: none(),
      );
}
