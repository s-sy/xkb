part of 'coustomer_bloc.dart';

@freezed
abstract class CoustomerEvent with _$CoustomerEvent {
  const factory CoustomerEvent.started() = _Started;
  const factory CoustomerEvent.executionWithoutdelay(String processIntanceId) =
      _ExecutionWithoutdelay;
  const factory CoustomerEvent.gethistorydata(String instanceId) =
      _GetHistoryData;
  const factory CoustomerEvent.gethistory(String instanceId) = _GetHistory;
  const factory CoustomerEvent.unFreezedCustomer(String processedId) =
      _UnFreezedCustomer;
  const factory CoustomerEvent.getSalesmanLists(String affId) =
      _GetSalesmanLists;
  const factory CoustomerEvent.buyinghouse(Map<String, dynamic> listData) =
      _BuyingHouse;
  const factory CoustomerEvent.getContacts() = GetContacts;
  const factory CoustomerEvent.frezzeCoumer(String processedId) = _FrezzeCoumer;
  const factory CoustomerEvent.getProcessDefinition(
          String name, String phone, String gender, String description) =
      GetProcessDefinition;
  const factory CoustomerEvent.updateRemarks(String id, String description) =
      UpdateRemarks;
  const factory CoustomerEvent.updateCustomerName(
      String id, String customerName) = UpdateCustomerName;
  const factory CoustomerEvent.updateCustomerPhone(String id, String phone) =
      UpdateCustomerPhone;
  const factory CoustomerEvent.isConfirm() = IsConfirm;
  const factory CoustomerEvent.isReset() = IsReset;
  const factory CoustomerEvent.saveCustomerItem(
      Map<String, dynamic> coustomDataItem) = _SaveCustomerItem;
  const factory CoustomerEvent.getSalesman() = _GetSalesman;
}
