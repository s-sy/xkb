part of 'processed_bloc.dart';

@freezed
abstract class ProcessedEvent with _$ProcessedEvent {
  const factory ProcessedEvent.started(String processInstanceId) = _Started;
  const factory ProcessedEvent.getProcessData() = _GetProcessData;
  const factory ProcessedEvent.saveData(Map<String, dynamic> data) = _SaveData;
  const factory ProcessedEvent.pushProcessed(String type) = _PushProcessed;
  const factory ProcessedEvent.changeRadio(int value) = _ChangeRadio;
  const factory ProcessedEvent.changeNextTime(bool value) = _ChangeNextTime;
  const factory ProcessedEvent.getSalesmanList(String affId) = _GetSalesmanList;
  const factory ProcessedEvent.saveManageAssignmentUser(
      String manageAssignmentUser) = _SaveManageAssignmentUser;
  const factory ProcessedEvent.getNextTimeData(String processInstanceId) =
      _GetNextTimeData;
  const factory ProcessedEvent.saveDateAndTime(
      dynamic resultDate, int oneDayTimeMine) = _SaveDateAndTime;
  const factory ProcessedEvent.saveRate(String rate) = _SaveRate;
  const factory ProcessedEvent.savePS(String ps) = _SavePS;
  const factory ProcessedEvent.qiNiuLoad(String imgPath) = _QiNiuLoad;
  const factory ProcessedEvent.saveZDValue(String zDValue) = _SaveZDValue;
  const factory ProcessedEvent.removeImg(int index) = _RemoveImg;
  const factory ProcessedEvent.frezzeCoumer(String inputValue) = _FrezzeCoumer;
  const factory ProcessedEvent.unFrezzeCoumer() = _UnFrezzeCoumer;
  const factory ProcessedEvent.isPressed() = _IsPressed;
  const factory ProcessedEvent.updateRemarks(String id, String name) =
      UpdateRemarks;
  const factory ProcessedEvent.getHouseList() = _GetHouseList;
  const factory ProcessedEvent.saveNextDate(String date) = _SaveNextDate;

  const factory ProcessedEvent.getHouseListData() = _GetHouseListData;
  const factory ProcessedEvent.saveHouseData(dynamic data, String type) =
      _SaveHouseData;
  const factory ProcessedEvent.saveHouseChoose() = _SaveHouseChoose;
  const factory ProcessedEvent.checkHouse() = _CheckHouse;
  const factory ProcessedEvent.changefollowState() = _ChangefollowState;
  const factory ProcessedEvent.getRate() = _GetRate;
}
