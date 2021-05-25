part of 'house_bloc.dart';

@freezed
abstract class HouseEvent with _$HouseEvent {
  const factory HouseEvent.started() = _Started;
  const factory HouseEvent.getListData() = _GetListData;
  const factory HouseEvent.changebuilding(int index, String name) =
      _ChangeBuilding;
  const factory HouseEvent.changehouse(int index, String name) = _ChangeHouse;
  const factory HouseEvent.changeentrance(int index, String name) =
      _ChangeEntrance;
  const factory HouseEvent.getSalesmanLists(String createId) =
      _GetSalesmanLists;
}
