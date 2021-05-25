import 'package:dio/dio.dart';
import 'package:flutter_ui/infrastructure/api/retro_rest_service.dart';
import 'package:injectable/injectable.dart';

abstract class MessagesDataSource {
  Future getTask(Map<String, dynamic> query);

  Future getProcessedData(String processInstanceId);

  Future processFlow(int groupValue, String processInstanceId);

  Future processSalesman(String processedItem, dynamic query);

  Future getSalesmanList(String affId);

  Future getNextTimeData(String processInstanceId);

  Future qiNiuLoad(FormData query);

  Future frezzeprcessed(String processId, Map<String, dynamic> query);

  Future unFrezzeprcessed(String processId, Map<String, dynamic> query);

  Future getDelay(Map<String, dynamic> query);

  Future getprocessCount(Map<String, dynamic> unfinainshQuery);

  Future getDefinitionlist(Map<String, dynamic> definQuery);

  Future getCoustomerName(Map<String, String> getNameQuery);

  Future getHouseList(Map<String, dynamic> query);

  Future getHouseListData(Map<String, dynamic> queryList);
}

@LazySingleton(as: MessagesDataSource)
class MessagesDataSourceImpl implements MessagesDataSource {
  final RetroRestService _restService;
  MessagesDataSourceImpl(this._restService);

  @override
  Future getTask(Map<String, dynamic> query) async {
    var res = await _restService.getTask(query);
    return Future.value(res);
  }

  @override
  Future getProcessedData(String processInstanceId) async {
    var res = await _restService.getProcessedData(processInstanceId);
    return Future.value(res);
  }

  @override
  Future processFlow(int groupValue, String processInstanceId) async {
    // print(groupValue);
    // print("_________________________________________________________");
    Map<String, dynamic> query;

    if (groupValue == 1) {
      query = {
        "variables": {
          "isValid": {"value": false}
        },
        "withVariablesInReturn": true
      };
    } else {
      query = {
        "variables": {
          "isValid": {"value": true},
        },
        "withVariablesInReturn": true
      };
    }

    var res = await _restService.processFlow(processInstanceId, query);
    return Future.value(res);
  }

  @override
  Future processSalesman(String processedItem, dynamic query) async {
    var res = await _restService.processFlow(processedItem, query);
    return Future.value(res);
  }

  @override
  Future getSalesmanList(String affId) async {
    var res = await _restService.getSalesmanList(affId);
    return Future.value(res);
  }

  @override
  Future getNextTimeData(String processInstanceId) async {
    var res = await _restService.getNextTimeData(processInstanceId);
    return Future.value(res);
  }

  @override
  Future qiNiuLoad(FormData query) async {
    // TODO: implement qiNiuLoad
    //throw UnimplementedError();
    var res = await _restService.qiNiuLoad(query);
    return Future.value(res);
  }

  @override
  Future frezzeprcessed(String processId, Map<String, dynamic> query) async {
    var res = await _restService.frezzeprcessed(processId, query);
    return Future.value(res);
  }

  @override
  Future unFrezzeprcessed(String processId, Map<String, dynamic> query) async {
    var res = await _restService.unFrezzeprcessed(processId, query);
    return Future.value(res);
  }

  @override
  Future getDelay(Map<String, dynamic> query) async {
    var res = await _restService.referrals(query);
    return Future.value(res);
  }

  @override
  Future getDefinitionlist(Map<String, dynamic> definQuery) async {
    var res = await _restService.getDefinitionlist(definQuery);
    return Future.value(res);
  }

  @override
  Future getprocessCount(Map<String, dynamic> unfinainshQuery) async {
    var res = await _restService.getprocessCount(unfinainshQuery);
    return Future.value(res);
  }

  @override
  Future getCoustomerName(Map<String, String> getNameQuery) async {
    var res = await _restService.getCoustomerName(getNameQuery);
    return Future.value(res);
  }

  @override
  Future getHouseList(Map<String, dynamic> query) async {
    // TODO: implement getHouseList
    var res = await _restService.getHouseIng(query);
    return Future.value(res);
  }

  @override
  Future getHouseListData(Map<String, dynamic> queryList) async {
    // TODO: implement getHouseListData
    var res = await _restService.getHouseListData(queryList);
    return Future.value(res);
  }
}
