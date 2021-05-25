import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ui/domain/auth/auth_failure.dart';
import 'package:flutter_ui/domain/auth/i_auth_facade.dart';
import 'package:flutter_ui/domain/auth/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

part 'sign_in_form_bloc.freezed.dart';

// @LazySingleton()
@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade) : super(SignInFormState.initial());

  // https://bloclibrary.dev/#/migration
  // Starting with v5.0.0 of bloc library the initialState was removed in favor of passing it to the super contructor.
  // @override
  // SignInFormState get initialState => SignInFormState.initial();

  @override
  Stream<SignInFormState> mapEventToState(
    SignInFormEvent event,
  ) async* {
    yield* event.map(
      /*  emailChanged: (e) async* {
        yield state.copyWith(
          emailAddress: EmailAddress(e.emailStr),
          authFailureOrSuccessOption: none(),
        );
      }, */
      phoneChanged: (e) async* {
        yield state.copyWith(
          phoneNumber: PhoneNumber(e.phoneStr),
          authFailureOrSuccessOption: none(),
        );
      },
      verificationChanged: (e) async* {
        yield state.copyWith(
          verificationCode: VerificationCode(e.verificationStr),
          authFailureOrSuccessOption: none(),
        );
      },
      getPhone: (e) async* {
        yield state.copyWith(
          phoneNumber: PhoneNumber(e.phone),
          // authFailureOrSuccessOption: none(),
        );
      },
      signInWithPhoneAndSMSCodePressed: (e) async* {
        yield* _performActionOnAuthFacadeWithMobileAndSMSCode(
            _authFacade.signInWithMobileAndSMSCode);
      },
      getSMSVerificationPressed: (e) async* {
        yield* _performActionOnGetSMScodeWithMobile(
          _authFacade.getSMSVerification,
        );
      },
    );
  }

  Stream<SignInFormState> _performActionOnAuthFacadeWithMobileAndSMSCode(
    Future<Either<AuthFailure, Unit>> Function({
      // @required EmailAddress emailAddress,
      @required PhoneNumber phoneNumber,
      @required VerificationCode verificationCode,
    })
        forwardedCall,
  ) async* {
    Either<AuthFailure, Unit> failureOrSuccess;

    final isEmailValid = state.phoneNumber.isValid();
    final isPasswordValid = state.verificationCode.isValid();

    if (isEmailValid && isPasswordValid) {
      yield state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      );

      failureOrSuccess = await forwardedCall(
        phoneNumber: state.phoneNumber,
        verificationCode: state.verificationCode,
      );
    }
    yield state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    );
  }

  Stream<SignInFormState> _performActionOnGetSMScodeWithMobile(
    Future<Either<AuthFailure, Unit>> Function({
      // @required EmailAddress emailAddress,
      @required PhoneNumber phoneNumber,
    })
        forwardedCall,
  ) async* {
    Either<AuthFailure, Unit> failureOrSuccess;

    final isEmailValid = state.phoneNumber.isValid();

    if (isEmailValid) {
      yield state.copyWith(
        isObtaining: true,
        authFailureOrSuccessOption: none(),
      );

      failureOrSuccess = await forwardedCall(
        phoneNumber: state.phoneNumber,
      );
    }
    yield state.copyWith(
      isObtaining: false,
      showErrorMessages: true,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    );
  }
}
