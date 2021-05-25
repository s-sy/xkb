part of 'house_control_bloc.dart';

@freezed
abstract class HouseControlEvent with _$HouseControlEvent {
  const factory HouseControlEvent.started(Map<String, dynamic> routedata) =
      _Started;
  const factory HouseControlEvent.getProcessDefinition() =
      _GetProcessDefinition;
  const factory HouseControlEvent.getReferrals() = _GetReferrals;
  const factory HouseControlEvent.controlPrecess(String stateName) =
      _ControlPrecess;
  const factory HouseControlEvent.getgroupValue(int v) = _GetgroupValue;
  const factory HouseControlEvent.saveName(String name) = _SaveName;
  const factory HouseControlEvent.savePhone(String phone) = _SavePhone;
  const factory HouseControlEvent.savePrice(String price) = _SavePrice;
  const factory HouseControlEvent.saveRemark(String remark) = _SaveRemark;
  const factory HouseControlEvent.releaseControlPrecess() =
      _ReleaseControlPrecess;
  const factory HouseControlEvent.getStateValues(Map<String, dynamic> data) =
      _GetStateValues;
  // const factory HouseControlEvent.changeHouse(String currentId,String alterationId) = _ChangeHouse;
  const factory HouseControlEvent.getListData(
      String buildText, String houseText, String entranceText) = _GetListDatas;
  const factory HouseControlEvent.isHouseUnit(String value) = _IsHouseUnit;
  const factory HouseControlEvent.offHouseState(String value) = _OffHouseState;
  const factory HouseControlEvent.changeHouse(String oldId, String newId) =
      _ChangeHouse;
}
