import 'package:dio/dio.dart';
import 'package:flutter_ui/domain/messages/i_message_facade.dart';
import 'package:flutter_ui/infrastructure/datasources/messages_data_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IMessagesFacade)
class MessagesFacade implements IMessagesFacade {
  MessagesDataSource _messagesDataSource;
  MessagesFacade(this._messagesDataSource);

  @override
  Future getTask(Map<String, dynamic> query) async {
    var res = await _messagesDataSource.getTask(query);
    return Future.value(res);
  }

  @override
  Future getProcessedData(String processInstanceId) async {
    var res = await _messagesDataSource.getProcessedData(processInstanceId);
    return Future.value(res);
  }

  @override
  Future processFlow(int groupValue, String processId) async {
    var res = await _messagesDataSource.processFlow(groupValue, processId);
    return Future.value(res);
  }

  @override
  Future processSalesman(String processId, dynamic query) async {
    var res = await _messagesDataSource.processSalesman(processId, query);
    return Future.value(res);
  }

  @override
  Future getSalesmanList(String affId) async {
    var res = await _messagesDataSource.getSalesmanList(affId);
    return Future.value(res);
  }

  @override
  Future getNextTimeData(String processInstanceId) async {
    var res = await _messagesDataSource.getNextTimeData(processInstanceId);
    return Future.value(res);
  }

  @override
  Future qiNiuLoad(FormData query) async {
    var res = await _messagesDataSource.qiNiuLoad(query);
    return Future.value(res);
  }

  @override
  Future frezzeprcessed(String processId, Map<String, dynamic> query) async {
    var res = await _messagesDataSource.frezzeprcessed(processId, query);
    return Future.value(res);
  }

  @override
  Future unFrezzeprcessed(String processId, Map<String, dynamic> query) async {
    var res = await _messagesDataSource.unFrezzeprcessed(processId, query);
    return Future.value(res);
  }

  @override
  Future getDelay(Map<String, dynamic> query) async {
    // TODO: implement getDelay
    // throw UnimplementedError();
    var res = await _messagesDataSource.getDelay(query);
    return Future.value(res);
  }

  @override
  Future getDefinitionlist(Map<String, dynamic> definQuery) async {
    // TODO: implement getDefinitionlist
    var res = await _messagesDataSource.getDefinitionlist(definQuery);
    return Future.value(res);
  }

  @override
  Future getprocessCount(Map<String, dynamic> unfinainshQuery) async {
    // TODO: implement getprocessCount
    var res = await _messagesDataSource.getprocessCount(unfinainshQuery);
    return Future.value(res);
  }

  @override
  Future getCoustomerName(Map<String, String> getNameQuery) async {
    // TODO: implement getCoustomerName
    var res = await _messagesDataSource.getCoustomerName(getNameQuery);
    return Future.value(res);
  }

  @override
  Future getHouseList(Map<String, dynamic> query) async {
    // TODO: implement getHouseList
    var res = await _messagesDataSource.getHouseList(query);
    return Future.value(res);
  }

  @override
  Future getHouseListData(Map<String, dynamic> queryList) async {
    // TODO: implement getHouseListData
    var res = await _messagesDataSource.getHouseListData(queryList);
    return Future.value(res);
  }
}
