import 'package:flutter_ui/infrastructure/api/result/api_result.dart';
import 'package:flutter_ui/infrastructure/api/result/network_exceptions.dart';
import 'package:flutter_ui/infrastructure/api/retro_rest_service.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

abstract class EchartsDataSource {
  Future getPie();

  Future getDuration(int duration, int portion);

  Future getFastreport(
      int mineDuration, int minePortion, String mineId, int leaderweek);
}

@LazySingleton(as: EchartsDataSource)
class EchartsDataSourceImpl implements EchartsDataSource {
  SharedPreferences _sharedPreferences;
  final RetroRestService _restService;
  EchartsDataSourceImpl(this._sharedPreferences, this._restService);
  @override
  Future getPie() async {
    var user = await _sharedPreferences.get("CACHED_SIGN_IN_USER");
    String tenantId = jsonDecode(user)['tenantId'];
    String houseId = _sharedPreferences.get('HOUSEID');
    if (houseId == null) {
      String affiliateds = _sharedPreferences.get('AFFILIATEDS');
      if (affiliateds != null) {
        houseId = jsonDecode(affiliateds)[0]["id"];
      }
    }
    try {
      var res = await _restService.getPie(houseId, tenantId);
      print(res);
      return Future.value(res);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future getDuration(durations, portions) async {
    var user = await _sharedPreferences.get("CACHED_SIGN_IN_USER");
    String tenantId = jsonDecode(user)['tenantId'];
    String houseId = _sharedPreferences.get('HOUSEID');
    if (houseId == null) {
      String affiliateds = _sharedPreferences.get('AFFILIATEDS');
      if (affiliateds != null) {
        houseId = jsonDecode(affiliateds)[0]["id"];
      }
    }
    String duration = durations.toString(); // 1zhou 2yue 1查周， 2查月
    String portion = portions.toString(); // 第几月
    var res =
        await _restService.getDuration(houseId, tenantId, duration, portion);
    return Future.value(res);
  }

  @override
  Future getFastreport(
      int mineDuration, int minePortion, String mineId, int leaderweek) async {
    var user = await _sharedPreferences.get("CACHED_SIGN_IN_USER");
    String tenantId = jsonDecode(user)['tenantId'];
    String houseId = _sharedPreferences.get('HOUSEID');
    if (houseId == null) {
      String affiliateds = _sharedPreferences.get('AFFILIATEDS');
      if (affiliateds != null) {
        houseId = jsonDecode(affiliateds)[0]["id"];
      }
    }
    var res = await _restService.getFastreport(mineId, mineDuration.toString(),
        minePortion.toString(), tenantId, houseId, leaderweek);
    return Future.value(res);
  }
}
