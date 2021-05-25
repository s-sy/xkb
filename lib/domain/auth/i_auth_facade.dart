import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ui/domain/auth/user_info.dart';
import 'package:flutter_ui/domain/auth/value_objects.dart';

import 'auth_failure.dart';

abstract class IAuthFacade {
  Future<Option<UserInfo>> getSignedInUser();
  Future<Either<AuthFailure, Unit>> signInWithMobileAndSMSCode({
    // @required EmailAddress emailAddress,
    @required PhoneNumber phoneNumber,
    @required VerificationCode verificationCode,
  });
  Future<Either<AuthFailure, Unit>> getSMSVerification({
    // @required EmailAddress emailAddress,
    @required PhoneNumber phoneNumber,
  });
  Future<void> signOut();
}
