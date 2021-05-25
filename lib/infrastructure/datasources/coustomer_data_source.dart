import 'package:flutter_ui/infrastructure/api/retro_rest_service.dart';
import 'package:injectable/injectable.dart';

abstract class CoustomerDataSource {
  Future getCoustomerList(Map<String, dynamic> query);

  Future executionWithoutdelay(Map<String, dynamic> query);

  Future gethistory(Map<String, dynamic> query);

  Future gethistorydata(Map<String, dynamic> query);

  Future getMultipleCustomer(String phone, Map<String, dynamic> query);

  Future getPersonnelList(String affId);
}

@LazySingleton(as: CoustomerDataSource)
class CoustomerDataSourceImpl implements CoustomerDataSource {
  final RetroRestService _restService;

  CoustomerDataSourceImpl(this._restService);

  @override
  Future getCoustomerList(Map<String, dynamic> query) async {
    var res = await _restService.getCoustomList(query);
    return Future.value(res);
  }

  @override
  Future executionWithoutdelay(Map<String, dynamic> query) async {
    var res = await _restService.executionWithoutdelay(query);
    return Future.value(res);
  }

  @override
  Future gethistory(Map<String, dynamic> query) async {
    var res = await _restService.getHistory(query);
    return Future.value(res);
  }

  @override
  Future gethistorydata(Map<String, dynamic> query) async {
    var res = await _restService.getHistoryVariable(query);
    return Future.value(res);
  }

  @override
  Future getMultipleCustomer(String phone, Map<String, dynamic> query) async {
    var res = await _restService.getMultipleCustomer(phone, query);
    return Future.value(res);
  }

  @override
  Future getPersonnelList(String affId) async {
    var res = await _restService.getPersonnelList(affId);
    return Future.value(res);
  }
}
