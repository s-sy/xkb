part of 'web_scoket_bloc.dart';

@freezed
abstract class WebScoketEvent with _$WebScoketEvent {
  const factory WebScoketEvent.connectWebsocket() = ConnectWebsocket;
  const factory WebScoketEvent.sendChatMessage(
      String msg, String type, String contactId) = SendChatMessage;
  const factory WebScoketEvent.disconnectWebsocket() = DisconnectWebsocket;
  const factory WebScoketEvent.getContacts() = GetContacts;
  const factory WebScoketEvent.getId(String contactId) = GetId;
  const factory WebScoketEvent.getUnreadMessages() = GetUnreadMessages;
  const factory WebScoketEvent.historyMessage(
      String contactId, int index, int sizeNum) = HistoryMessage;
  const factory WebScoketEvent.getPermission() = GetPermission;
  const factory WebScoketEvent.getReceiveMsg() = GetReceiveMsg;
  const factory WebScoketEvent.setJPushRid() = SetJPushRid;
  const factory WebScoketEvent.managerRemindList(int index) = ManagerRemindList;
  const factory WebScoketEvent.managerRemindDetails(
      String phone, String tenantId) = ManagerRemindDetails;
  const factory WebScoketEvent.refreshRemindList() = RefreshRemindList;
  const factory WebScoketEvent.unreadMessageCount() = UnreadMessageCount;
  const factory WebScoketEvent.batchUpdate() = BatchUpdate;
  const factory WebScoketEvent.unreadList() = UnreadList;
  const factory WebScoketEvent.sendChatMessageVoice(
          String msg, String type, String contactId, int duration) =
      SendChatMessageVoice;
  const factory WebScoketEvent.gethistory(String instanceId) = GetHistory;
  const factory WebScoketEvent.getSalesmanLists() = GetSalesmanLists;
  const factory WebScoketEvent.getProcessDefinition(
      String phone, String salesmanId) = GetProcessDefinition;
  const factory WebScoketEvent.isBottomSheet() = IsBottomSheet;
  const factory WebScoketEvent.slideshow() = Slideshow;
  const factory WebScoketEvent.getRoles() = GetRoles;
  const factory WebScoketEvent.getAffiliated() = GetAffiliated;
  const factory WebScoketEvent.submitTestUserInfo(
      String image,
      String name,
      String nickName,
      String sex,
      String role,
      List listAffiliated) = SubmitTestUserInfo;
}
