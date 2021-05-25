import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ui/domain/auth/auth_failure.dart';
import 'package:flutter_ui/domain/auth/i_auth_facade.dart';
import 'package:flutter_ui/domain/auth/user_info.dart';
import 'package:flutter_ui/domain/auth/value_objects.dart';
import 'package:flutter_ui/infrastructure/datasources/auth_remote_data_source.dart';
import 'package:injectable/injectable.dart';

//https://github.com/Milad-Akarie/injectable/issues/102

@LazySingleton(as: IAuthFacade, env: [Environment.prod])
class AuthFacade implements IAuthFacade {
  final AuthRemoteDataSource remoteDataSource;

  AuthFacade(
    this.remoteDataSource,
  );

  @override
  Future<Option<UserInfo>> getSignedInUser() => remoteDataSource
      .getLastUserInfo()
      .then((userInfo) => optionOf(userInfo?.toDomain()));

  @override
  Future<Either<AuthFailure, Unit>> signInWithMobileAndSMSCode({
    @required PhoneNumber phoneNumber,
    @required VerificationCode verificationCode,
  }) async {
    final phone = phoneNumber.getOrCrash();
    final captcha = verificationCode.getOrCrash();
    try {
      var apiResult = await remoteDataSource.signInWithMobileAndSMSCode(
        mobile: phone,
        captcha: captcha,
      );

      print('got response from signIn : $apiResult');

      // apiResult.when(
      //     success: (unit) => right(unit),
      //     failure: (error) => left(const AuthFailure.phoneAlreadyInUse()));
      bool successAndFailure = false;
      apiResult.map(
          success: (unit) => successAndFailure = true,
          failure: (error) => successAndFailure = false);
      return successAndFailure
          ? right(unit)
          : left(const AuthFailure.invalidVerificationCode());
    } on Exception catch (error) {
      print("error is :: " + error.toString());
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<void> signOut() => remoteDataSource.signOut();

  @override
  Future<Either<AuthFailure, Unit>> getSMSVerification(
      {@required PhoneNumber phoneNumber}) async {
    final phone = phoneNumber.getOrCrash();
    var apiResult = await remoteDataSource.getSMSVerification(
      mobile: phone,
    );
    try {
      // apiResult.when(success: (unit) {
      //   return right(unit);
      // }, failure: (error) {
      //   return left(const AuthFailure.invalidMobileAndSMSCodeCombination());
      // });
      bool successAndFailure = false;
      apiResult.when(
          success: (unit) => successAndFailure = true,
          failure: (error) => successAndFailure = false);
      return successAndFailure
          ? right(unit)
          : left(const AuthFailure.invalidCellPhoneNumber());
    } on Exception catch (error) {
      //revert back.
      print("error is :: " + error.toString());
      return left(const AuthFailure.serverError());
    }
  }
}
