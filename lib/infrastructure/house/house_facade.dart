import 'package:flutter_ui/domain/house/i_house_facade.dart';
import 'package:flutter_ui/infrastructure/datasources/house_data_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IHouseFacade)
class HouseFacade implements IHouseFacade {
  HoseDataSource _hoseDataSource;

  HouseFacade(this._hoseDataSource);

  @override
  Future<List> getHouseq() async {
    // TODO: implement getHouseq
    List list = await _hoseDataSource.gethouseq();
    return Future.value(list);
  }

  @override
  Future<Map<String, dynamic>> getListData(a, b, c) async {
    // TODO: implement getListData
    Map<String, dynamic> map = await _hoseDataSource.getListData(a, b, c);
    return Future.value(map);
  }

  @override
  Future getReferrals(Map<String, dynamic> activeData) async {
    // TODO: implement getReferrals
    var res = await _hoseDataSource.getReferrals(activeData);
    return Future.value(res);
  }

  @override
  Future<List<dynamic>> getProcessDefinition(Map<String, dynamic> query) async {
    var res = await _hoseDataSource.getProcessDefinition(query);
    return Future.value(res);
  }

  @override
  Future controlPrecess(String processId, Map<String, dynamic> data) async {
    var res = await _hoseDataSource.controlPrecess(processId, data);
    return Future.value(res);
  }

  @override
  Future updateRemarks(Map<String, dynamic> data) async {
    var res = await _hoseDataSource.updateRemarks(data);
    return Future.value(res);
  }

  @override
  Future updataHousing(Map<String, dynamic> data) async {
    var res = await _hoseDataSource.updataHousing(data);
    return Future.value(res);
  }

  @override
  Future changeHouse(Map<String, dynamic> formdata) async {
    var res = await _hoseDataSource.changeHouse(formdata);
    return Future.value(res);
  }
}
