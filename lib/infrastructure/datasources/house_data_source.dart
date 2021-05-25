import 'dart:convert';

import 'package:flutter_ui/infrastructure/api/auth_rest_service.dart';
import 'package:flutter_ui/infrastructure/api/retro_rest_service.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class HoseDataSource {
  Future<List<dynamic>> gethouseq();
  Future<Map<String, dynamic>> getListData(dynamic a, dynamic b, dynamic c);

  Future getProcessDefinition(Map<String, dynamic> query);

  Future getReferrals(Map<String, dynamic> activeData);

  Future controlPrecess(String processId, Map<String, dynamic> data);

  Future updateRemarks(Map<String, dynamic> data);

  Future updataHousing(Map<String, dynamic> data);

  Future changeHouse(Map<String, dynamic> formdata);
}

@LazySingleton(as: HoseDataSource)
class HoseDataSourceImpl implements HoseDataSource {
  SharedPreferences _sharedPreferences;
  final RetroRestService _restService;
  HoseDataSourceImpl(this._sharedPreferences, this._restService);
  @override
  Future<List> gethouseq() async {
    var user = await _sharedPreferences.get("CACHED_SIGN_IN_USER");
    String houseId = _sharedPreferences.get('HOUSEID');
    if (houseId == null) {
      String affiliateds = _sharedPreferences.get('AFFILIATEDS');
      if (affiliateds != null) {
        houseId = jsonDecode(affiliateds)[0]["id"];
      }
    }
    print(user);
    Map<String, dynamic> query = {
      "affiliationId": houseId,
      // "1332151293816377345", // affiliated:["1300969411349721089","1300970321241059329"]
      //["1300969411349721089","1300970321241059329"]
      "tenantId": jsonDecode(user)['tenantId']
    };
    var jsonData = await _restService.getHouseIng(query);

    print(jsonData);
    // var respose = await HttpUtil().dio.get(Api.HOUSING, queryParameters: query);
    print("111");
    // var house = jsonDecode(respose.toString());
    return Future.value(jsonData["data"]);
  }

  @override
  Future<Map<String, dynamic>> getListData(a, b, c) async {
    var user = await _sharedPreferences.get("CACHED_SIGN_IN_USER");
    String houseId = _sharedPreferences.get('HOUSEID');
    if (houseId == null) {
      String affiliateds = _sharedPreferences.get('AFFILIATEDS');
      if (affiliateds != null) {
        houseId = jsonDecode(affiliateds)[0]["id"];
      }
    }
    Map<String, dynamic> query = {
      "staging": a,
      "building": b,
      "entrance": c,
      "affiliationId": houseId,
      "tenantId": jsonDecode(user)['tenantId'],
    };
    var jsonData = await _restService.getHouseListData(query);
    //   var response =
    //  await HttpUtil().dio.post(Api.HOUSINGList, queryParameters: query);
    print("根据期数选楼栋");
    print(jsonData);
    if (jsonData["ok"] == true) {
      Map<String, dynamic> hoseData = jsonData["data"];

      return Future.value(hoseData);
    }
  }

  @override
  Future getReferrals(Map<String, dynamic> activeData) async {
    var jsonData = await _restService.referrals(activeData);
    return Future.value(jsonData);
  }

  @override
  Future getProcessDefinition(Map<String, dynamic> query) async {
    var jsonData = await _restService.getProcessDefinition(query);
    return Future.value(jsonData);
  }

  @override
  Future controlPrecess(String processId, Map<String, dynamic> data) async {
    var jsonData = await _restService.controlPrecess(processId, data);
    return Future.value(jsonData);
  }

  @override
  Future updateRemarks(Map<String, dynamic> data) async {
    var jsonData = await _restService.updateRemarks(data);
    return Future.value(jsonData);
  }

  @override
  Future updataHousing(Map<String, dynamic> data) async {
    var jsonData = await _restService.updataHousing(data);
    return Future.value(jsonData);
  }

  @override
  Future changeHouse(Map<String, dynamic> formdata) async {
    var jsonData = await _restService.changeHouse(formdata);
    return Future.value(jsonData);
  }
}
