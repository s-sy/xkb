import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_ui/infrastructure/api/auth_rest_service.dart';
import 'package:flutter_ui/infrastructure/api/result/api_result.dart';
import 'package:flutter_ui/infrastructure/api/result/network_exceptions.dart';
import 'package:flutter_ui/infrastructure/api/retro_rest_service.dart';
import 'package:flutter_ui/infrastructure/auth/user_info_dtos.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthRemoteDataSource {
  /// Throws a [ServerException] for all error codes.
  Future<ApiResult<Unit>> signInWithMobileAndSMSCode({
    @required String mobile,
    @required String captcha,
  });

  /// Throws a [ServerException] for all error codes.
  Future<ApiResult> getSMSVerification({@required String mobile});

  Future<void> signOut();

  Future<UserInfoDto> getLastUserInfo();
  Future<void> cacheUserInfo(UserInfoDto userInfoDto);
}

const CACHED_SIGN_IN_USER = 'CACHED_SIGN_IN_USER';
const CACHED_SESSION_KEY = 'CACHED_SESSION_KEY';
const AFFILIATEDS = "AFFILIATEDS";

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthRestService authRestService;
  final RetroRestService retroRestService;
  final SharedPreferences sharedPreferences;

  AuthRemoteDataSourceImpl(
      {@required this.authRestService,
      @required this.retroRestService,
      @required this.sharedPreferences});

  @override
  Future<ApiResult<Unit>> signInWithMobileAndSMSCode({
    @required String mobile,
    @required String captcha,
  }) =>
      _getTriviaFromUrl(mobile, captcha);

  Future<ApiResult<Unit>> _getTriviaFromUrl(
      String phone, String captcha) async {
    var reslut = await sharedPreferences.get("UserType");
    if (reslut == "estate") {
      try {
        final esresponse = await authRestService.eslogin(phone, captcha);
        print(esresponse);

        if (esresponse['ok'] == true) {
          await sharedPreferences.setString(
              "UserInfo", json.encode(esresponse['data']));
          await sharedPreferences.setString(
              "vistor-session", esresponse['data']['sessionKey']);
          return ApiResult.success(data: unit);
        }
        return ApiResult.failure(
            error: NetworkExceptions.getDioException('login failed'));
      } catch (e) {
        // throw NetworkExceptions.getDioException(e);
        return ApiResult.failure(error: NetworkExceptions.getDioException(e));
      }
    } else if (reslut == "broker") {
      try {
        final response = await authRestService.login(phone, captcha);
        if (response['ok'] == true) {
          await sharedPreferences.setString(
              CACHED_SIGN_IN_USER, json.encode(response['data']));
          await sharedPreferences.setString(
              CACHED_SESSION_KEY, response['data']['sessionKey']);
          //就在这里把楼盘信息存了算了
          List<String> list = [];
          List listAffid = response["data"]["affiliated"];
          for (int i = 0; i < listAffid.length; i++) {
            list.add(listAffid[i].toString());
          }
          final responseAffIds = await authRestService.getAffCode(
              list, "application/json", response['data']['sessionKey']);
          await sharedPreferences.setString(
              AFFILIATEDS, json.encode(responseAffIds['data']));
          return ApiResult.success(data: unit);
        }
        return ApiResult.failure(
            error: NetworkExceptions.getDioException('login failed'));
      } catch (e) {
        // throw NetworkExceptions.getDioException(e);
        return ApiResult.failure(error: NetworkExceptions.getDioException(e));
      }
    }
  }

  @override
  Future<void> signOut() {
    sharedPreferences.remove("AFFILIATEDS");
    sharedPreferences.remove("HOUSESNAME");
    sharedPreferences.remove("HOUSEID");
    sharedPreferences.remove("HOUSESHORTCODE");
    return sharedPreferences.remove(CACHED_SIGN_IN_USER);
  }

  @override
  Future<UserInfoDto> getLastUserInfo() {
    final jsonString = sharedPreferences.getString(CACHED_SIGN_IN_USER);
    if (jsonString != null && jsonDecode(jsonString)['userRole'] != "") {
      return Future.value(UserInfoDto.fromJson(json.decode(jsonString)));
    } else {
      // throw CacheException();
      return Future.value(null);
    }
  }

  @override
  Future<void> cacheUserInfo(UserInfoDto userInfoDto) {
    return sharedPreferences.setString(
      CACHED_SIGN_IN_USER,
      json.encode(userInfoDto.toJson()),
    );
  }

  @override
  Future<ApiResult> getSMSVerification({String mobile}) async {
    try {
      final response = await authRestService.getSMSVerification(mobile);
      if (response['ok'] == true) {
        await sharedPreferences.setString("UserType", response["msg"]);
        return ApiResult.success(data: "done");
      }
      return ApiResult.failure(
          error: NetworkExceptions.getDioException('login failed'));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
