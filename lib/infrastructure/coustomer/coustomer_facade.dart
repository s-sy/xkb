import 'package:flutter_ui/domain/coustomer/i_coustomer_facade.dart';
import 'package:flutter_ui/infrastructure/datasources/coustomer_data_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ICoustomerFacade)
class CoustomerFacade implements ICoustomerFacade {
  CoustomerDataSource _coustomerDataSource;
  CoustomerFacade(this._coustomerDataSource);

  @override
  Future getCoustomerList(Map<String, dynamic> query) async {
    var res = await _coustomerDataSource.getCoustomerList(query);
    return Future.value(res);
  }

  @override
  Future executionWithoutdelay(Map<String, dynamic> query) async {
    var res = await _coustomerDataSource.executionWithoutdelay(query);
    return Future.value(res);
  }

  @override
  Future gethistory(Map<String, dynamic> query) async {
    var res = await _coustomerDataSource.gethistory(query);
    return Future.value(res);
  }

  @override
  Future gethistorydata(Map<String, dynamic> query) async {
    var res = await _coustomerDataSource.gethistorydata(query);
    return Future.value(res);
  }

  @override
  Future getMultipleCustomer(String phone, Map<String, dynamic> query) async {
    var res = await _coustomerDataSource.getMultipleCustomer(phone, query);
    return Future.value(res);
  }

  @override
  Future getPersonnelList(String affId) async {
    var res = await _coustomerDataSource.getPersonnelList(affId);
    return Future.value(res);
  }
}
