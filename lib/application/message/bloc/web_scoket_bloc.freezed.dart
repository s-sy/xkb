// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'web_scoket_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$WebScoketEventTearOff {
  const _$WebScoketEventTearOff();

// ignore: unused_element
  ConnectWebsocket connectWebsocket() {
    return const ConnectWebsocket();
  }

// ignore: unused_element
  SendChatMessage sendChatMessage(String msg, String type, String contactId) {
    return SendChatMessage(
      msg,
      type,
      contactId,
    );
  }

// ignore: unused_element
  DisconnectWebsocket disconnectWebsocket() {
    return const DisconnectWebsocket();
  }

// ignore: unused_element
  GetContacts getContacts() {
    return const GetContacts();
  }

// ignore: unused_element
  GetId getId(String contactId) {
    return GetId(
      contactId,
    );
  }

// ignore: unused_element
  GetUnreadMessages getUnreadMessages() {
    return const GetUnreadMessages();
  }

// ignore: unused_element
  HistoryMessage historyMessage(String contactId, int index, int sizeNum) {
    return HistoryMessage(
      contactId,
      index,
      sizeNum,
    );
  }

// ignore: unused_element
  GetPermission getPermission() {
    return const GetPermission();
  }

// ignore: unused_element
  GetReceiveMsg getReceiveMsg() {
    return const GetReceiveMsg();
  }

// ignore: unused_element
  SetJPushRid setJPushRid() {
    return const SetJPushRid();
  }

// ignore: unused_element
  ManagerRemindList managerRemindList(int index) {
    return ManagerRemindList(
      index,
    );
  }

// ignore: unused_element
  ManagerRemindDetails managerRemindDetails(String phone, String tenantId) {
    return ManagerRemindDetails(
      phone,
      tenantId,
    );
  }

// ignore: unused_element
  RefreshRemindList refreshRemindList() {
    return const RefreshRemindList();
  }

// ignore: unused_element
  UnreadMessageCount unreadMessageCount() {
    return const UnreadMessageCount();
  }

// ignore: unused_element
  BatchUpdate batchUpdate() {
    return const BatchUpdate();
  }

// ignore: unused_element
  UnreadList unreadList() {
    return const UnreadList();
  }

// ignore: unused_element
  SendChatMessageVoice sendChatMessageVoice(
      String msg, String type, String contactId, int duration) {
    return SendChatMessageVoice(
      msg,
      type,
      contactId,
      duration,
    );
  }

// ignore: unused_element
  GetHistory gethistory(String instanceId) {
    return GetHistory(
      instanceId,
    );
  }

// ignore: unused_element
  GetSalesmanLists getSalesmanLists() {
    return const GetSalesmanLists();
  }

// ignore: unused_element
  GetProcessDefinition getProcessDefinition(String phone, String salesmanId) {
    return GetProcessDefinition(
      phone,
      salesmanId,
    );
  }

// ignore: unused_element
  IsBottomSheet isBottomSheet() {
    return const IsBottomSheet();
  }

// ignore: unused_element
  Slideshow slideshow() {
    return const Slideshow();
  }

// ignore: unused_element
  GetRoles getRoles() {
    return const GetRoles();
  }

// ignore: unused_element
  GetAffiliated getAffiliated() {
    return const GetAffiliated();
  }

// ignore: unused_element
  SubmitTestUserInfo submitTestUserInfo(String image, String name,
      String nickName, String sex, String role, List<dynamic> listAffiliated) {
    return SubmitTestUserInfo(
      image,
      name,
      nickName,
      sex,
      role,
      listAffiliated,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $WebScoketEvent = _$WebScoketEventTearOff();

/// @nodoc
mixin _$WebScoketEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result connectWebsocket(),
    @required Result sendChatMessage(String msg, String type, String contactId),
    @required Result disconnectWebsocket(),
    @required Result getContacts(),
    @required Result getId(String contactId),
    @required Result getUnreadMessages(),
    @required Result historyMessage(String contactId, int index, int sizeNum),
    @required Result getPermission(),
    @required Result getReceiveMsg(),
    @required Result setJPushRid(),
    @required Result managerRemindList(int index),
    @required Result managerRemindDetails(String phone, String tenantId),
    @required Result refreshRemindList(),
    @required Result unreadMessageCount(),
    @required Result batchUpdate(),
    @required Result unreadList(),
    @required
        Result sendChatMessageVoice(
            String msg, String type, String contactId, int duration),
    @required Result gethistory(String instanceId),
    @required Result getSalesmanLists(),
    @required Result getProcessDefinition(String phone, String salesmanId),
    @required Result isBottomSheet(),
    @required Result slideshow(),
    @required Result getRoles(),
    @required Result getAffiliated(),
    @required
        Result submitTestUserInfo(String image, String name, String nickName,
            String sex, String role, List<dynamic> listAffiliated),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result connectWebsocket(),
    Result sendChatMessage(String msg, String type, String contactId),
    Result disconnectWebsocket(),
    Result getContacts(),
    Result getId(String contactId),
    Result getUnreadMessages(),
    Result historyMessage(String contactId, int index, int sizeNum),
    Result getPermission(),
    Result getReceiveMsg(),
    Result setJPushRid(),
    Result managerRemindList(int index),
    Result managerRemindDetails(String phone, String tenantId),
    Result refreshRemindList(),
    Result unreadMessageCount(),
    Result batchUpdate(),
    Result unreadList(),
    Result sendChatMessageVoice(
        String msg, String type, String contactId, int duration),
    Result gethistory(String instanceId),
    Result getSalesmanLists(),
    Result getProcessDefinition(String phone, String salesmanId),
    Result isBottomSheet(),
    Result slideshow(),
    Result getRoles(),
    Result getAffiliated(),
    Result submitTestUserInfo(String image, String name, String nickName,
        String sex, String role, List<dynamic> listAffiliated),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result connectWebsocket(ConnectWebsocket value),
    @required Result sendChatMessage(SendChatMessage value),
    @required Result disconnectWebsocket(DisconnectWebsocket value),
    @required Result getContacts(GetContacts value),
    @required Result getId(GetId value),
    @required Result getUnreadMessages(GetUnreadMessages value),
    @required Result historyMessage(HistoryMessage value),
    @required Result getPermission(GetPermission value),
    @required Result getReceiveMsg(GetReceiveMsg value),
    @required Result setJPushRid(SetJPushRid value),
    @required Result managerRemindList(ManagerRemindList value),
    @required Result managerRemindDetails(ManagerRemindDetails value),
    @required Result refreshRemindList(RefreshRemindList value),
    @required Result unreadMessageCount(UnreadMessageCount value),
    @required Result batchUpdate(BatchUpdate value),
    @required Result unreadList(UnreadList value),
    @required Result sendChatMessageVoice(SendChatMessageVoice value),
    @required Result gethistory(GetHistory value),
    @required Result getSalesmanLists(GetSalesmanLists value),
    @required Result getProcessDefinition(GetProcessDefinition value),
    @required Result isBottomSheet(IsBottomSheet value),
    @required Result slideshow(Slideshow value),
    @required Result getRoles(GetRoles value),
    @required Result getAffiliated(GetAffiliated value),
    @required Result submitTestUserInfo(SubmitTestUserInfo value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result connectWebsocket(ConnectWebsocket value),
    Result sendChatMessage(SendChatMessage value),
    Result disconnectWebsocket(DisconnectWebsocket value),
    Result getContacts(GetContacts value),
    Result getId(GetId value),
    Result getUnreadMessages(GetUnreadMessages value),
    Result historyMessage(HistoryMessage value),
    Result getPermission(GetPermission value),
    Result getReceiveMsg(GetReceiveMsg value),
    Result setJPushRid(SetJPushRid value),
    Result managerRemindList(ManagerRemindList value),
    Result managerRemindDetails(ManagerRemindDetails value),
    Result refreshRemindList(RefreshRemindList value),
    Result unreadMessageCount(UnreadMessageCount value),
    Result batchUpdate(BatchUpdate value),
    Result unreadList(UnreadList value),
    Result sendChatMessageVoice(SendChatMessageVoice value),
    Result gethistory(GetHistory value),
    Result getSalesmanLists(GetSalesmanLists value),
    Result getProcessDefinition(GetProcessDefinition value),
    Result isBottomSheet(IsBottomSheet value),
    Result slideshow(Slideshow value),
    Result getRoles(GetRoles value),
    Result getAffiliated(GetAffiliated value),
    Result submitTestUserInfo(SubmitTestUserInfo value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $WebScoketEventCopyWith<$Res> {
  factory $WebScoketEventCopyWith(
          WebScoketEvent value, $Res Function(WebScoketEvent) then) =
      _$WebScoketEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$WebScoketEventCopyWithImpl<$Res>
    implements $WebScoketEventCopyWith<$Res> {
  _$WebScoketEventCopyWithImpl(this._value, this._then);

  final WebScoketEvent _value;
  // ignore: unused_field
  final $Res Function(WebScoketEvent) _then;
}

/// @nodoc
abstract class $ConnectWebsocketCopyWith<$Res> {
  factory $ConnectWebsocketCopyWith(
          ConnectWebsocket value, $Res Function(ConnectWebsocket) then) =
      _$ConnectWebsocketCopyWithImpl<$Res>;
}

/// @nodoc
class _$ConnectWebsocketCopyWithImpl<$Res>
    extends _$WebScoketEventCopyWithImpl<$Res>
    implements $ConnectWebsocketCopyWith<$Res> {
  _$ConnectWebsocketCopyWithImpl(
      ConnectWebsocket _value, $Res Function(ConnectWebsocket) _then)
      : super(_value, (v) => _then(v as ConnectWebsocket));

  @override
  ConnectWebsocket get _value => super._value as ConnectWebsocket;
}

/// @nodoc
class _$ConnectWebsocket implements ConnectWebsocket {
  const _$ConnectWebsocket();

  @override
  String toString() {
    return 'WebScoketEvent.connectWebsocket()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ConnectWebsocket);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result connectWebsocket(),
    @required Result sendChatMessage(String msg, String type, String contactId),
    @required Result disconnectWebsocket(),
    @required Result getContacts(),
    @required Result getId(String contactId),
    @required Result getUnreadMessages(),
    @required Result historyMessage(String contactId, int index, int sizeNum),
    @required Result getPermission(),
    @required Result getReceiveMsg(),
    @required Result setJPushRid(),
    @required Result managerRemindList(int index),
    @required Result managerRemindDetails(String phone, String tenantId),
    @required Result refreshRemindList(),
    @required Result unreadMessageCount(),
    @required Result batchUpdate(),
    @required Result unreadList(),
    @required
        Result sendChatMessageVoice(
            String msg, String type, String contactId, int duration),
    @required Result gethistory(String instanceId),
    @required Result getSalesmanLists(),
    @required Result getProcessDefinition(String phone, String salesmanId),
    @required Result isBottomSheet(),
    @required Result slideshow(),
    @required Result getRoles(),
    @required Result getAffiliated(),
    @required
        Result submitTestUserInfo(String image, String name, String nickName,
            String sex, String role, List<dynamic> listAffiliated),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return connectWebsocket();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result connectWebsocket(),
    Result sendChatMessage(String msg, String type, String contactId),
    Result disconnectWebsocket(),
    Result getContacts(),
    Result getId(String contactId),
    Result getUnreadMessages(),
    Result historyMessage(String contactId, int index, int sizeNum),
    Result getPermission(),
    Result getReceiveMsg(),
    Result setJPushRid(),
    Result managerRemindList(int index),
    Result managerRemindDetails(String phone, String tenantId),
    Result refreshRemindList(),
    Result unreadMessageCount(),
    Result batchUpdate(),
    Result unreadList(),
    Result sendChatMessageVoice(
        String msg, String type, String contactId, int duration),
    Result gethistory(String instanceId),
    Result getSalesmanLists(),
    Result getProcessDefinition(String phone, String salesmanId),
    Result isBottomSheet(),
    Result slideshow(),
    Result getRoles(),
    Result getAffiliated(),
    Result submitTestUserInfo(String image, String name, String nickName,
        String sex, String role, List<dynamic> listAffiliated),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (connectWebsocket != null) {
      return connectWebsocket();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result connectWebsocket(ConnectWebsocket value),
    @required Result sendChatMessage(SendChatMessage value),
    @required Result disconnectWebsocket(DisconnectWebsocket value),
    @required Result getContacts(GetContacts value),
    @required Result getId(GetId value),
    @required Result getUnreadMessages(GetUnreadMessages value),
    @required Result historyMessage(HistoryMessage value),
    @required Result getPermission(GetPermission value),
    @required Result getReceiveMsg(GetReceiveMsg value),
    @required Result setJPushRid(SetJPushRid value),
    @required Result managerRemindList(ManagerRemindList value),
    @required Result managerRemindDetails(ManagerRemindDetails value),
    @required Result refreshRemindList(RefreshRemindList value),
    @required Result unreadMessageCount(UnreadMessageCount value),
    @required Result batchUpdate(BatchUpdate value),
    @required Result unreadList(UnreadList value),
    @required Result sendChatMessageVoice(SendChatMessageVoice value),
    @required Result gethistory(GetHistory value),
    @required Result getSalesmanLists(GetSalesmanLists value),
    @required Result getProcessDefinition(GetProcessDefinition value),
    @required Result isBottomSheet(IsBottomSheet value),
    @required Result slideshow(Slideshow value),
    @required Result getRoles(GetRoles value),
    @required Result getAffiliated(GetAffiliated value),
    @required Result submitTestUserInfo(SubmitTestUserInfo value),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return connectWebsocket(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result connectWebsocket(ConnectWebsocket value),
    Result sendChatMessage(SendChatMessage value),
    Result disconnectWebsocket(DisconnectWebsocket value),
    Result getContacts(GetContacts value),
    Result getId(GetId value),
    Result getUnreadMessages(GetUnreadMessages value),
    Result historyMessage(HistoryMessage value),
    Result getPermission(GetPermission value),
    Result getReceiveMsg(GetReceiveMsg value),
    Result setJPushRid(SetJPushRid value),
    Result managerRemindList(ManagerRemindList value),
    Result managerRemindDetails(ManagerRemindDetails value),
    Result refreshRemindList(RefreshRemindList value),
    Result unreadMessageCount(UnreadMessageCount value),
    Result batchUpdate(BatchUpdate value),
    Result unreadList(UnreadList value),
    Result sendChatMessageVoice(SendChatMessageVoice value),
    Result gethistory(GetHistory value),
    Result getSalesmanLists(GetSalesmanLists value),
    Result getProcessDefinition(GetProcessDefinition value),
    Result isBottomSheet(IsBottomSheet value),
    Result slideshow(Slideshow value),
    Result getRoles(GetRoles value),
    Result getAffiliated(GetAffiliated value),
    Result submitTestUserInfo(SubmitTestUserInfo value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (connectWebsocket != null) {
      return connectWebsocket(this);
    }
    return orElse();
  }
}

abstract class ConnectWebsocket implements WebScoketEvent {
  const factory ConnectWebsocket() = _$ConnectWebsocket;
}

/// @nodoc
abstract class $SendChatMessageCopyWith<$Res> {
  factory $SendChatMessageCopyWith(
          SendChatMessage value, $Res Function(SendChatMessage) then) =
      _$SendChatMessageCopyWithImpl<$Res>;
  $Res call({String msg, String type, String contactId});
}

/// @nodoc
class _$SendChatMessageCopyWithImpl<$Res>
    extends _$WebScoketEventCopyWithImpl<$Res>
    implements $SendChatMessageCopyWith<$Res> {
  _$SendChatMessageCopyWithImpl(
      SendChatMessage _value, $Res Function(SendChatMessage) _then)
      : super(_value, (v) => _then(v as SendChatMessage));

  @override
  SendChatMessage get _value => super._value as SendChatMessage;

  @override
  $Res call({
    Object msg = freezed,
    Object type = freezed,
    Object contactId = freezed,
  }) {
    return _then(SendChatMessage(
      msg == freezed ? _value.msg : msg as String,
      type == freezed ? _value.type : type as String,
      contactId == freezed ? _value.contactId : contactId as String,
    ));
  }
}

/// @nodoc
class _$SendChatMessage implements SendChatMessage {
  const _$SendChatMessage(this.msg, this.type, this.contactId)
      : assert(msg != null),
        assert(type != null),
        assert(contactId != null);

  @override
  final String msg;
  @override
  final String type;
  @override
  final String contactId;

  @override
  String toString() {
    return 'WebScoketEvent.sendChatMessage(msg: $msg, type: $type, contactId: $contactId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SendChatMessage &&
            (identical(other.msg, msg) ||
                const DeepCollectionEquality().equals(other.msg, msg)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.contactId, contactId) ||
                const DeepCollectionEquality()
                    .equals(other.contactId, contactId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(msg) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(contactId);

  @override
  $SendChatMessageCopyWith<SendChatMessage> get copyWith =>
      _$SendChatMessageCopyWithImpl<SendChatMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result connectWebsocket(),
    @required Result sendChatMessage(String msg, String type, String contactId),
    @required Result disconnectWebsocket(),
    @required Result getContacts(),
    @required Result getId(String contactId),
    @required Result getUnreadMessages(),
    @required Result historyMessage(String contactId, int index, int sizeNum),
    @required Result getPermission(),
    @required Result getReceiveMsg(),
    @required Result setJPushRid(),
    @required Result managerRemindList(int index),
    @required Result managerRemindDetails(String phone, String tenantId),
    @required Result refreshRemindList(),
    @required Result unreadMessageCount(),
    @required Result batchUpdate(),
    @required Result unreadList(),
    @required
        Result sendChatMessageVoice(
            String msg, String type, String contactId, int duration),
    @required Result gethistory(String instanceId),
    @required Result getSalesmanLists(),
    @required Result getProcessDefinition(String phone, String salesmanId),
    @required Result isBottomSheet(),
    @required Result slideshow(),
    @required Result getRoles(),
    @required Result getAffiliated(),
    @required
        Result submitTestUserInfo(String image, String name, String nickName,
            String sex, String role, List<dynamic> listAffiliated),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return sendChatMessage(msg, type, contactId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result connectWebsocket(),
    Result sendChatMessage(String msg, String type, String contactId),
    Result disconnectWebsocket(),
    Result getContacts(),
    Result getId(String contactId),
    Result getUnreadMessages(),
    Result historyMessage(String contactId, int index, int sizeNum),
    Result getPermission(),
    Result getReceiveMsg(),
    Result setJPushRid(),
    Result managerRemindList(int index),
    Result managerRemindDetails(String phone, String tenantId),
    Result refreshRemindList(),
    Result unreadMessageCount(),
    Result batchUpdate(),
    Result unreadList(),
    Result sendChatMessageVoice(
        String msg, String type, String contactId, int duration),
    Result gethistory(String instanceId),
    Result getSalesmanLists(),
    Result getProcessDefinition(String phone, String salesmanId),
    Result isBottomSheet(),
    Result slideshow(),
    Result getRoles(),
    Result getAffiliated(),
    Result submitTestUserInfo(String image, String name, String nickName,
        String sex, String role, List<dynamic> listAffiliated),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendChatMessage != null) {
      return sendChatMessage(msg, type, contactId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result connectWebsocket(ConnectWebsocket value),
    @required Result sendChatMessage(SendChatMessage value),
    @required Result disconnectWebsocket(DisconnectWebsocket value),
    @required Result getContacts(GetContacts value),
    @required Result getId(GetId value),
    @required Result getUnreadMessages(GetUnreadMessages value),
    @required Result historyMessage(HistoryMessage value),
    @required Result getPermission(GetPermission value),
    @required Result getReceiveMsg(GetReceiveMsg value),
    @required Result setJPushRid(SetJPushRid value),
    @required Result managerRemindList(ManagerRemindList value),
    @required Result managerRemindDetails(ManagerRemindDetails value),
    @required Result refreshRemindList(RefreshRemindList value),
    @required Result unreadMessageCount(UnreadMessageCount value),
    @required Result batchUpdate(BatchUpdate value),
    @required Result unreadList(UnreadList value),
    @required Result sendChatMessageVoice(SendChatMessageVoice value),
    @required Result gethistory(GetHistory value),
    @required Result getSalesmanLists(GetSalesmanLists value),
    @required Result getProcessDefinition(GetProcessDefinition value),
    @required Result isBottomSheet(IsBottomSheet value),
    @required Result slideshow(Slideshow value),
    @required Result getRoles(GetRoles value),
    @required Result getAffiliated(GetAffiliated value),
    @required Result submitTestUserInfo(SubmitTestUserInfo value),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return sendChatMessage(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result connectWebsocket(ConnectWebsocket value),
    Result sendChatMessage(SendChatMessage value),
    Result disconnectWebsocket(DisconnectWebsocket value),
    Result getContacts(GetContacts value),
    Result getId(GetId value),
    Result getUnreadMessages(GetUnreadMessages value),
    Result historyMessage(HistoryMessage value),
    Result getPermission(GetPermission value),
    Result getReceiveMsg(GetReceiveMsg value),
    Result setJPushRid(SetJPushRid value),
    Result managerRemindList(ManagerRemindList value),
    Result managerRemindDetails(ManagerRemindDetails value),
    Result refreshRemindList(RefreshRemindList value),
    Result unreadMessageCount(UnreadMessageCount value),
    Result batchUpdate(BatchUpdate value),
    Result unreadList(UnreadList value),
    Result sendChatMessageVoice(SendChatMessageVoice value),
    Result gethistory(GetHistory value),
    Result getSalesmanLists(GetSalesmanLists value),
    Result getProcessDefinition(GetProcessDefinition value),
    Result isBottomSheet(IsBottomSheet value),
    Result slideshow(Slideshow value),
    Result getRoles(GetRoles value),
    Result getAffiliated(GetAffiliated value),
    Result submitTestUserInfo(SubmitTestUserInfo value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendChatMessage != null) {
      return sendChatMessage(this);
    }
    return orElse();
  }
}

abstract class SendChatMessage implements WebScoketEvent {
  const factory SendChatMessage(String msg, String type, String contactId) =
      _$SendChatMessage;

  String get msg;
  String get type;
  String get contactId;
  $SendChatMessageCopyWith<SendChatMessage> get copyWith;
}

/// @nodoc
abstract class $DisconnectWebsocketCopyWith<$Res> {
  factory $DisconnectWebsocketCopyWith(
          DisconnectWebsocket value, $Res Function(DisconnectWebsocket) then) =
      _$DisconnectWebsocketCopyWithImpl<$Res>;
}

/// @nodoc
class _$DisconnectWebsocketCopyWithImpl<$Res>
    extends _$WebScoketEventCopyWithImpl<$Res>
    implements $DisconnectWebsocketCopyWith<$Res> {
  _$DisconnectWebsocketCopyWithImpl(
      DisconnectWebsocket _value, $Res Function(DisconnectWebsocket) _then)
      : super(_value, (v) => _then(v as DisconnectWebsocket));

  @override
  DisconnectWebsocket get _value => super._value as DisconnectWebsocket;
}

/// @nodoc
class _$DisconnectWebsocket implements DisconnectWebsocket {
  const _$DisconnectWebsocket();

  @override
  String toString() {
    return 'WebScoketEvent.disconnectWebsocket()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is DisconnectWebsocket);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result connectWebsocket(),
    @required Result sendChatMessage(String msg, String type, String contactId),
    @required Result disconnectWebsocket(),
    @required Result getContacts(),
    @required Result getId(String contactId),
    @required Result getUnreadMessages(),
    @required Result historyMessage(String contactId, int index, int sizeNum),
    @required Result getPermission(),
    @required Result getReceiveMsg(),
    @required Result setJPushRid(),
    @required Result managerRemindList(int index),
    @required Result managerRemindDetails(String phone, String tenantId),
    @required Result refreshRemindList(),
    @required Result unreadMessageCount(),
    @required Result batchUpdate(),
    @required Result unreadList(),
    @required
        Result sendChatMessageVoice(
            String msg, String type, String contactId, int duration),
    @required Result gethistory(String instanceId),
    @required Result getSalesmanLists(),
    @required Result getProcessDefinition(String phone, String salesmanId),
    @required Result isBottomSheet(),
    @required Result slideshow(),
    @required Result getRoles(),
    @required Result getAffiliated(),
    @required
        Result submitTestUserInfo(String image, String name, String nickName,
            String sex, String role, List<dynamic> listAffiliated),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return disconnectWebsocket();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result connectWebsocket(),
    Result sendChatMessage(String msg, String type, String contactId),
    Result disconnectWebsocket(),
    Result getContacts(),
    Result getId(String contactId),
    Result getUnreadMessages(),
    Result historyMessage(String contactId, int index, int sizeNum),
    Result getPermission(),
    Result getReceiveMsg(),
    Result setJPushRid(),
    Result managerRemindList(int index),
    Result managerRemindDetails(String phone, String tenantId),
    Result refreshRemindList(),
    Result unreadMessageCount(),
    Result batchUpdate(),
    Result unreadList(),
    Result sendChatMessageVoice(
        String msg, String type, String contactId, int duration),
    Result gethistory(String instanceId),
    Result getSalesmanLists(),
    Result getProcessDefinition(String phone, String salesmanId),
    Result isBottomSheet(),
    Result slideshow(),
    Result getRoles(),
    Result getAffiliated(),
    Result submitTestUserInfo(String image, String name, String nickName,
        String sex, String role, List<dynamic> listAffiliated),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (disconnectWebsocket != null) {
      return disconnectWebsocket();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result connectWebsocket(ConnectWebsocket value),
    @required Result sendChatMessage(SendChatMessage value),
    @required Result disconnectWebsocket(DisconnectWebsocket value),
    @required Result getContacts(GetContacts value),
    @required Result getId(GetId value),
    @required Result getUnreadMessages(GetUnreadMessages value),
    @required Result historyMessage(HistoryMessage value),
    @required Result getPermission(GetPermission value),
    @required Result getReceiveMsg(GetReceiveMsg value),
    @required Result setJPushRid(SetJPushRid value),
    @required Result managerRemindList(ManagerRemindList value),
    @required Result managerRemindDetails(ManagerRemindDetails value),
    @required Result refreshRemindList(RefreshRemindList value),
    @required Result unreadMessageCount(UnreadMessageCount value),
    @required Result batchUpdate(BatchUpdate value),
    @required Result unreadList(UnreadList value),
    @required Result sendChatMessageVoice(SendChatMessageVoice value),
    @required Result gethistory(GetHistory value),
    @required Result getSalesmanLists(GetSalesmanLists value),
    @required Result getProcessDefinition(GetProcessDefinition value),
    @required Result isBottomSheet(IsBottomSheet value),
    @required Result slideshow(Slideshow value),
    @required Result getRoles(GetRoles value),
    @required Result getAffiliated(GetAffiliated value),
    @required Result submitTestUserInfo(SubmitTestUserInfo value),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return disconnectWebsocket(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result connectWebsocket(ConnectWebsocket value),
    Result sendChatMessage(SendChatMessage value),
    Result disconnectWebsocket(DisconnectWebsocket value),
    Result getContacts(GetContacts value),
    Result getId(GetId value),
    Result getUnreadMessages(GetUnreadMessages value),
    Result historyMessage(HistoryMessage value),
    Result getPermission(GetPermission value),
    Result getReceiveMsg(GetReceiveMsg value),
    Result setJPushRid(SetJPushRid value),
    Result managerRemindList(ManagerRemindList value),
    Result managerRemindDetails(ManagerRemindDetails value),
    Result refreshRemindList(RefreshRemindList value),
    Result unreadMessageCount(UnreadMessageCount value),
    Result batchUpdate(BatchUpdate value),
    Result unreadList(UnreadList value),
    Result sendChatMessageVoice(SendChatMessageVoice value),
    Result gethistory(GetHistory value),
    Result getSalesmanLists(GetSalesmanLists value),
    Result getProcessDefinition(GetProcessDefinition value),
    Result isBottomSheet(IsBottomSheet value),
    Result slideshow(Slideshow value),
    Result getRoles(GetRoles value),
    Result getAffiliated(GetAffiliated value),
    Result submitTestUserInfo(SubmitTestUserInfo value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (disconnectWebsocket != null) {
      return disconnectWebsocket(this);
    }
    return orElse();
  }
}

abstract class DisconnectWebsocket implements WebScoketEvent {
  const factory DisconnectWebsocket() = _$DisconnectWebsocket;
}

/// @nodoc
abstract class $GetContactsCopyWith<$Res> {
  factory $GetContactsCopyWith(
          GetContacts value, $Res Function(GetContacts) then) =
      _$GetContactsCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetContactsCopyWithImpl<$Res> extends _$WebScoketEventCopyWithImpl<$Res>
    implements $GetContactsCopyWith<$Res> {
  _$GetContactsCopyWithImpl(
      GetContacts _value, $Res Function(GetContacts) _then)
      : super(_value, (v) => _then(v as GetContacts));

  @override
  GetContacts get _value => super._value as GetContacts;
}

/// @nodoc
class _$GetContacts implements GetContacts {
  const _$GetContacts();

  @override
  String toString() {
    return 'WebScoketEvent.getContacts()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GetContacts);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result connectWebsocket(),
    @required Result sendChatMessage(String msg, String type, String contactId),
    @required Result disconnectWebsocket(),
    @required Result getContacts(),
    @required Result getId(String contactId),
    @required Result getUnreadMessages(),
    @required Result historyMessage(String contactId, int index, int sizeNum),
    @required Result getPermission(),
    @required Result getReceiveMsg(),
    @required Result setJPushRid(),
    @required Result managerRemindList(int index),
    @required Result managerRemindDetails(String phone, String tenantId),
    @required Result refreshRemindList(),
    @required Result unreadMessageCount(),
    @required Result batchUpdate(),
    @required Result unreadList(),
    @required
        Result sendChatMessageVoice(
            String msg, String type, String contactId, int duration),
    @required Result gethistory(String instanceId),
    @required Result getSalesmanLists(),
    @required Result getProcessDefinition(String phone, String salesmanId),
    @required Result isBottomSheet(),
    @required Result slideshow(),
    @required Result getRoles(),
    @required Result getAffiliated(),
    @required
        Result submitTestUserInfo(String image, String name, String nickName,
            String sex, String role, List<dynamic> listAffiliated),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return getContacts();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result connectWebsocket(),
    Result sendChatMessage(String msg, String type, String contactId),
    Result disconnectWebsocket(),
    Result getContacts(),
    Result getId(String contactId),
    Result getUnreadMessages(),
    Result historyMessage(String contactId, int index, int sizeNum),
    Result getPermission(),
    Result getReceiveMsg(),
    Result setJPushRid(),
    Result managerRemindList(int index),
    Result managerRemindDetails(String phone, String tenantId),
    Result refreshRemindList(),
    Result unreadMessageCount(),
    Result batchUpdate(),
    Result unreadList(),
    Result sendChatMessageVoice(
        String msg, String type, String contactId, int duration),
    Result gethistory(String instanceId),
    Result getSalesmanLists(),
    Result getProcessDefinition(String phone, String salesmanId),
    Result isBottomSheet(),
    Result slideshow(),
    Result getRoles(),
    Result getAffiliated(),
    Result submitTestUserInfo(String image, String name, String nickName,
        String sex, String role, List<dynamic> listAffiliated),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getContacts != null) {
      return getContacts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result connectWebsocket(ConnectWebsocket value),
    @required Result sendChatMessage(SendChatMessage value),
    @required Result disconnectWebsocket(DisconnectWebsocket value),
    @required Result getContacts(GetContacts value),
    @required Result getId(GetId value),
    @required Result getUnreadMessages(GetUnreadMessages value),
    @required Result historyMessage(HistoryMessage value),
    @required Result getPermission(GetPermission value),
    @required Result getReceiveMsg(GetReceiveMsg value),
    @required Result setJPushRid(SetJPushRid value),
    @required Result managerRemindList(ManagerRemindList value),
    @required Result managerRemindDetails(ManagerRemindDetails value),
    @required Result refreshRemindList(RefreshRemindList value),
    @required Result unreadMessageCount(UnreadMessageCount value),
    @required Result batchUpdate(BatchUpdate value),
    @required Result unreadList(UnreadList value),
    @required Result sendChatMessageVoice(SendChatMessageVoice value),
    @required Result gethistory(GetHistory value),
    @required Result getSalesmanLists(GetSalesmanLists value),
    @required Result getProcessDefinition(GetProcessDefinition value),
    @required Result isBottomSheet(IsBottomSheet value),
    @required Result slideshow(Slideshow value),
    @required Result getRoles(GetRoles value),
    @required Result getAffiliated(GetAffiliated value),
    @required Result submitTestUserInfo(SubmitTestUserInfo value),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return getContacts(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result connectWebsocket(ConnectWebsocket value),
    Result sendChatMessage(SendChatMessage value),
    Result disconnectWebsocket(DisconnectWebsocket value),
    Result getContacts(GetContacts value),
    Result getId(GetId value),
    Result getUnreadMessages(GetUnreadMessages value),
    Result historyMessage(HistoryMessage value),
    Result getPermission(GetPermission value),
    Result getReceiveMsg(GetReceiveMsg value),
    Result setJPushRid(SetJPushRid value),
    Result managerRemindList(ManagerRemindList value),
    Result managerRemindDetails(ManagerRemindDetails value),
    Result refreshRemindList(RefreshRemindList value),
    Result unreadMessageCount(UnreadMessageCount value),
    Result batchUpdate(BatchUpdate value),
    Result unreadList(UnreadList value),
    Result sendChatMessageVoice(SendChatMessageVoice value),
    Result gethistory(GetHistory value),
    Result getSalesmanLists(GetSalesmanLists value),
    Result getProcessDefinition(GetProcessDefinition value),
    Result isBottomSheet(IsBottomSheet value),
    Result slideshow(Slideshow value),
    Result getRoles(GetRoles value),
    Result getAffiliated(GetAffiliated value),
    Result submitTestUserInfo(SubmitTestUserInfo value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getContacts != null) {
      return getContacts(this);
    }
    return orElse();
  }
}

abstract class GetContacts implements WebScoketEvent {
  const factory GetContacts() = _$GetContacts;
}

/// @nodoc
abstract class $GetIdCopyWith<$Res> {
  factory $GetIdCopyWith(GetId value, $Res Function(GetId) then) =
      _$GetIdCopyWithImpl<$Res>;
  $Res call({String contactId});
}

/// @nodoc
class _$GetIdCopyWithImpl<$Res> extends _$WebScoketEventCopyWithImpl<$Res>
    implements $GetIdCopyWith<$Res> {
  _$GetIdCopyWithImpl(GetId _value, $Res Function(GetId) _then)
      : super(_value, (v) => _then(v as GetId));

  @override
  GetId get _value => super._value as GetId;

  @override
  $Res call({
    Object contactId = freezed,
  }) {
    return _then(GetId(
      contactId == freezed ? _value.contactId : contactId as String,
    ));
  }
}

/// @nodoc
class _$GetId implements GetId {
  const _$GetId(this.contactId) : assert(contactId != null);

  @override
  final String contactId;

  @override
  String toString() {
    return 'WebScoketEvent.getId(contactId: $contactId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetId &&
            (identical(other.contactId, contactId) ||
                const DeepCollectionEquality()
                    .equals(other.contactId, contactId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(contactId);

  @override
  $GetIdCopyWith<GetId> get copyWith =>
      _$GetIdCopyWithImpl<GetId>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result connectWebsocket(),
    @required Result sendChatMessage(String msg, String type, String contactId),
    @required Result disconnectWebsocket(),
    @required Result getContacts(),
    @required Result getId(String contactId),
    @required Result getUnreadMessages(),
    @required Result historyMessage(String contactId, int index, int sizeNum),
    @required Result getPermission(),
    @required Result getReceiveMsg(),
    @required Result setJPushRid(),
    @required Result managerRemindList(int index),
    @required Result managerRemindDetails(String phone, String tenantId),
    @required Result refreshRemindList(),
    @required Result unreadMessageCount(),
    @required Result batchUpdate(),
    @required Result unreadList(),
    @required
        Result sendChatMessageVoice(
            String msg, String type, String contactId, int duration),
    @required Result gethistory(String instanceId),
    @required Result getSalesmanLists(),
    @required Result getProcessDefinition(String phone, String salesmanId),
    @required Result isBottomSheet(),
    @required Result slideshow(),
    @required Result getRoles(),
    @required Result getAffiliated(),
    @required
        Result submitTestUserInfo(String image, String name, String nickName,
            String sex, String role, List<dynamic> listAffiliated),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return getId(contactId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result connectWebsocket(),
    Result sendChatMessage(String msg, String type, String contactId),
    Result disconnectWebsocket(),
    Result getContacts(),
    Result getId(String contactId),
    Result getUnreadMessages(),
    Result historyMessage(String contactId, int index, int sizeNum),
    Result getPermission(),
    Result getReceiveMsg(),
    Result setJPushRid(),
    Result managerRemindList(int index),
    Result managerRemindDetails(String phone, String tenantId),
    Result refreshRemindList(),
    Result unreadMessageCount(),
    Result batchUpdate(),
    Result unreadList(),
    Result sendChatMessageVoice(
        String msg, String type, String contactId, int duration),
    Result gethistory(String instanceId),
    Result getSalesmanLists(),
    Result getProcessDefinition(String phone, String salesmanId),
    Result isBottomSheet(),
    Result slideshow(),
    Result getRoles(),
    Result getAffiliated(),
    Result submitTestUserInfo(String image, String name, String nickName,
        String sex, String role, List<dynamic> listAffiliated),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getId != null) {
      return getId(contactId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result connectWebsocket(ConnectWebsocket value),
    @required Result sendChatMessage(SendChatMessage value),
    @required Result disconnectWebsocket(DisconnectWebsocket value),
    @required Result getContacts(GetContacts value),
    @required Result getId(GetId value),
    @required Result getUnreadMessages(GetUnreadMessages value),
    @required Result historyMessage(HistoryMessage value),
    @required Result getPermission(GetPermission value),
    @required Result getReceiveMsg(GetReceiveMsg value),
    @required Result setJPushRid(SetJPushRid value),
    @required Result managerRemindList(ManagerRemindList value),
    @required Result managerRemindDetails(ManagerRemindDetails value),
    @required Result refreshRemindList(RefreshRemindList value),
    @required Result unreadMessageCount(UnreadMessageCount value),
    @required Result batchUpdate(BatchUpdate value),
    @required Result unreadList(UnreadList value),
    @required Result sendChatMessageVoice(SendChatMessageVoice value),
    @required Result gethistory(GetHistory value),
    @required Result getSalesmanLists(GetSalesmanLists value),
    @required Result getProcessDefinition(GetProcessDefinition value),
    @required Result isBottomSheet(IsBottomSheet value),
    @required Result slideshow(Slideshow value),
    @required Result getRoles(GetRoles value),
    @required Result getAffiliated(GetAffiliated value),
    @required Result submitTestUserInfo(SubmitTestUserInfo value),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return getId(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result connectWebsocket(ConnectWebsocket value),
    Result sendChatMessage(SendChatMessage value),
    Result disconnectWebsocket(DisconnectWebsocket value),
    Result getContacts(GetContacts value),
    Result getId(GetId value),
    Result getUnreadMessages(GetUnreadMessages value),
    Result historyMessage(HistoryMessage value),
    Result getPermission(GetPermission value),
    Result getReceiveMsg(GetReceiveMsg value),
    Result setJPushRid(SetJPushRid value),
    Result managerRemindList(ManagerRemindList value),
    Result managerRemindDetails(ManagerRemindDetails value),
    Result refreshRemindList(RefreshRemindList value),
    Result unreadMessageCount(UnreadMessageCount value),
    Result batchUpdate(BatchUpdate value),
    Result unreadList(UnreadList value),
    Result sendChatMessageVoice(SendChatMessageVoice value),
    Result gethistory(GetHistory value),
    Result getSalesmanLists(GetSalesmanLists value),
    Result getProcessDefinition(GetProcessDefinition value),
    Result isBottomSheet(IsBottomSheet value),
    Result slideshow(Slideshow value),
    Result getRoles(GetRoles value),
    Result getAffiliated(GetAffiliated value),
    Result submitTestUserInfo(SubmitTestUserInfo value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getId != null) {
      return getId(this);
    }
    return orElse();
  }
}

abstract class GetId implements WebScoketEvent {
  const factory GetId(String contactId) = _$GetId;

  String get contactId;
  $GetIdCopyWith<GetId> get copyWith;
}

/// @nodoc
abstract class $GetUnreadMessagesCopyWith<$Res> {
  factory $GetUnreadMessagesCopyWith(
          GetUnreadMessages value, $Res Function(GetUnreadMessages) then) =
      _$GetUnreadMessagesCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetUnreadMessagesCopyWithImpl<$Res>
    extends _$WebScoketEventCopyWithImpl<$Res>
    implements $GetUnreadMessagesCopyWith<$Res> {
  _$GetUnreadMessagesCopyWithImpl(
      GetUnreadMessages _value, $Res Function(GetUnreadMessages) _then)
      : super(_value, (v) => _then(v as GetUnreadMessages));

  @override
  GetUnreadMessages get _value => super._value as GetUnreadMessages;
}

/// @nodoc
class _$GetUnreadMessages implements GetUnreadMessages {
  const _$GetUnreadMessages();

  @override
  String toString() {
    return 'WebScoketEvent.getUnreadMessages()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GetUnreadMessages);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result connectWebsocket(),
    @required Result sendChatMessage(String msg, String type, String contactId),
    @required Result disconnectWebsocket(),
    @required Result getContacts(),
    @required Result getId(String contactId),
    @required Result getUnreadMessages(),
    @required Result historyMessage(String contactId, int index, int sizeNum),
    @required Result getPermission(),
    @required Result getReceiveMsg(),
    @required Result setJPushRid(),
    @required Result managerRemindList(int index),
    @required Result managerRemindDetails(String phone, String tenantId),
    @required Result refreshRemindList(),
    @required Result unreadMessageCount(),
    @required Result batchUpdate(),
    @required Result unreadList(),
    @required
        Result sendChatMessageVoice(
            String msg, String type, String contactId, int duration),
    @required Result gethistory(String instanceId),
    @required Result getSalesmanLists(),
    @required Result getProcessDefinition(String phone, String salesmanId),
    @required Result isBottomSheet(),
    @required Result slideshow(),
    @required Result getRoles(),
    @required Result getAffiliated(),
    @required
        Result submitTestUserInfo(String image, String name, String nickName,
            String sex, String role, List<dynamic> listAffiliated),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return getUnreadMessages();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result connectWebsocket(),
    Result sendChatMessage(String msg, String type, String contactId),
    Result disconnectWebsocket(),
    Result getContacts(),
    Result getId(String contactId),
    Result getUnreadMessages(),
    Result historyMessage(String contactId, int index, int sizeNum),
    Result getPermission(),
    Result getReceiveMsg(),
    Result setJPushRid(),
    Result managerRemindList(int index),
    Result managerRemindDetails(String phone, String tenantId),
    Result refreshRemindList(),
    Result unreadMessageCount(),
    Result batchUpdate(),
    Result unreadList(),
    Result sendChatMessageVoice(
        String msg, String type, String contactId, int duration),
    Result gethistory(String instanceId),
    Result getSalesmanLists(),
    Result getProcessDefinition(String phone, String salesmanId),
    Result isBottomSheet(),
    Result slideshow(),
    Result getRoles(),
    Result getAffiliated(),
    Result submitTestUserInfo(String image, String name, String nickName,
        String sex, String role, List<dynamic> listAffiliated),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getUnreadMessages != null) {
      return getUnreadMessages();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result connectWebsocket(ConnectWebsocket value),
    @required Result sendChatMessage(SendChatMessage value),
    @required Result disconnectWebsocket(DisconnectWebsocket value),
    @required Result getContacts(GetContacts value),
    @required Result getId(GetId value),
    @required Result getUnreadMessages(GetUnreadMessages value),
    @required Result historyMessage(HistoryMessage value),
    @required Result getPermission(GetPermission value),
    @required Result getReceiveMsg(GetReceiveMsg value),
    @required Result setJPushRid(SetJPushRid value),
    @required Result managerRemindList(ManagerRemindList value),
    @required Result managerRemindDetails(ManagerRemindDetails value),
    @required Result refreshRemindList(RefreshRemindList value),
    @required Result unreadMessageCount(UnreadMessageCount value),
    @required Result batchUpdate(BatchUpdate value),
    @required Result unreadList(UnreadList value),
    @required Result sendChatMessageVoice(SendChatMessageVoice value),
    @required Result gethistory(GetHistory value),
    @required Result getSalesmanLists(GetSalesmanLists value),
    @required Result getProcessDefinition(GetProcessDefinition value),
    @required Result isBottomSheet(IsBottomSheet value),
    @required Result slideshow(Slideshow value),
    @required Result getRoles(GetRoles value),
    @required Result getAffiliated(GetAffiliated value),
    @required Result submitTestUserInfo(SubmitTestUserInfo value),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return getUnreadMessages(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result connectWebsocket(ConnectWebsocket value),
    Result sendChatMessage(SendChatMessage value),
    Result disconnectWebsocket(DisconnectWebsocket value),
    Result getContacts(GetContacts value),
    Result getId(GetId value),
    Result getUnreadMessages(GetUnreadMessages value),
    Result historyMessage(HistoryMessage value),
    Result getPermission(GetPermission value),
    Result getReceiveMsg(GetReceiveMsg value),
    Result setJPushRid(SetJPushRid value),
    Result managerRemindList(ManagerRemindList value),
    Result managerRemindDetails(ManagerRemindDetails value),
    Result refreshRemindList(RefreshRemindList value),
    Result unreadMessageCount(UnreadMessageCount value),
    Result batchUpdate(BatchUpdate value),
    Result unreadList(UnreadList value),
    Result sendChatMessageVoice(SendChatMessageVoice value),
    Result gethistory(GetHistory value),
    Result getSalesmanLists(GetSalesmanLists value),
    Result getProcessDefinition(GetProcessDefinition value),
    Result isBottomSheet(IsBottomSheet value),
    Result slideshow(Slideshow value),
    Result getRoles(GetRoles value),
    Result getAffiliated(GetAffiliated value),
    Result submitTestUserInfo(SubmitTestUserInfo value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getUnreadMessages != null) {
      return getUnreadMessages(this);
    }
    return orElse();
  }
}

abstract class GetUnreadMessages implements WebScoketEvent {
  const factory GetUnreadMessages() = _$GetUnreadMessages;
}

/// @nodoc
abstract class $HistoryMessageCopyWith<$Res> {
  factory $HistoryMessageCopyWith(
          HistoryMessage value, $Res Function(HistoryMessage) then) =
      _$HistoryMessageCopyWithImpl<$Res>;
  $Res call({String contactId, int index, int sizeNum});
}

/// @nodoc
class _$HistoryMessageCopyWithImpl<$Res>
    extends _$WebScoketEventCopyWithImpl<$Res>
    implements $HistoryMessageCopyWith<$Res> {
  _$HistoryMessageCopyWithImpl(
      HistoryMessage _value, $Res Function(HistoryMessage) _then)
      : super(_value, (v) => _then(v as HistoryMessage));

  @override
  HistoryMessage get _value => super._value as HistoryMessage;

  @override
  $Res call({
    Object contactId = freezed,
    Object index = freezed,
    Object sizeNum = freezed,
  }) {
    return _then(HistoryMessage(
      contactId == freezed ? _value.contactId : contactId as String,
      index == freezed ? _value.index : index as int,
      sizeNum == freezed ? _value.sizeNum : sizeNum as int,
    ));
  }
}

/// @nodoc
class _$HistoryMessage implements HistoryMessage {
  const _$HistoryMessage(this.contactId, this.index, this.sizeNum)
      : assert(contactId != null),
        assert(index != null),
        assert(sizeNum != null);

  @override
  final String contactId;
  @override
  final int index;
  @override
  final int sizeNum;

  @override
  String toString() {
    return 'WebScoketEvent.historyMessage(contactId: $contactId, index: $index, sizeNum: $sizeNum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HistoryMessage &&
            (identical(other.contactId, contactId) ||
                const DeepCollectionEquality()
                    .equals(other.contactId, contactId)) &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)) &&
            (identical(other.sizeNum, sizeNum) ||
                const DeepCollectionEquality().equals(other.sizeNum, sizeNum)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(contactId) ^
      const DeepCollectionEquality().hash(index) ^
      const DeepCollectionEquality().hash(sizeNum);

  @override
  $HistoryMessageCopyWith<HistoryMessage> get copyWith =>
      _$HistoryMessageCopyWithImpl<HistoryMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result connectWebsocket(),
    @required Result sendChatMessage(String msg, String type, String contactId),
    @required Result disconnectWebsocket(),
    @required Result getContacts(),
    @required Result getId(String contactId),
    @required Result getUnreadMessages(),
    @required Result historyMessage(String contactId, int index, int sizeNum),
    @required Result getPermission(),
    @required Result getReceiveMsg(),
    @required Result setJPushRid(),
    @required Result managerRemindList(int index),
    @required Result managerRemindDetails(String phone, String tenantId),
    @required Result refreshRemindList(),
    @required Result unreadMessageCount(),
    @required Result batchUpdate(),
    @required Result unreadList(),
    @required
        Result sendChatMessageVoice(
            String msg, String type, String contactId, int duration),
    @required Result gethistory(String instanceId),
    @required Result getSalesmanLists(),
    @required Result getProcessDefinition(String phone, String salesmanId),
    @required Result isBottomSheet(),
    @required Result slideshow(),
    @required Result getRoles(),
    @required Result getAffiliated(),
    @required
        Result submitTestUserInfo(String image, String name, String nickName,
            String sex, String role, List<dynamic> listAffiliated),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return historyMessage(contactId, index, sizeNum);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result connectWebsocket(),
    Result sendChatMessage(String msg, String type, String contactId),
    Result disconnectWebsocket(),
    Result getContacts(),
    Result getId(String contactId),
    Result getUnreadMessages(),
    Result historyMessage(String contactId, int index, int sizeNum),
    Result getPermission(),
    Result getReceiveMsg(),
    Result setJPushRid(),
    Result managerRemindList(int index),
    Result managerRemindDetails(String phone, String tenantId),
    Result refreshRemindList(),
    Result unreadMessageCount(),
    Result batchUpdate(),
    Result unreadList(),
    Result sendChatMessageVoice(
        String msg, String type, String contactId, int duration),
    Result gethistory(String instanceId),
    Result getSalesmanLists(),
    Result getProcessDefinition(String phone, String salesmanId),
    Result isBottomSheet(),
    Result slideshow(),
    Result getRoles(),
    Result getAffiliated(),
    Result submitTestUserInfo(String image, String name, String nickName,
        String sex, String role, List<dynamic> listAffiliated),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (historyMessage != null) {
      return historyMessage(contactId, index, sizeNum);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result connectWebsocket(ConnectWebsocket value),
    @required Result sendChatMessage(SendChatMessage value),
    @required Result disconnectWebsocket(DisconnectWebsocket value),
    @required Result getContacts(GetContacts value),
    @required Result getId(GetId value),
    @required Result getUnreadMessages(GetUnreadMessages value),
    @required Result historyMessage(HistoryMessage value),
    @required Result getPermission(GetPermission value),
    @required Result getReceiveMsg(GetReceiveMsg value),
    @required Result setJPushRid(SetJPushRid value),
    @required Result managerRemindList(ManagerRemindList value),
    @required Result managerRemindDetails(ManagerRemindDetails value),
    @required Result refreshRemindList(RefreshRemindList value),
    @required Result unreadMessageCount(UnreadMessageCount value),
    @required Result batchUpdate(BatchUpdate value),
    @required Result unreadList(UnreadList value),
    @required Result sendChatMessageVoice(SendChatMessageVoice value),
    @required Result gethistory(GetHistory value),
    @required Result getSalesmanLists(GetSalesmanLists value),
    @required Result getProcessDefinition(GetProcessDefinition value),
    @required Result isBottomSheet(IsBottomSheet value),
    @required Result slideshow(Slideshow value),
    @required Result getRoles(GetRoles value),
    @required Result getAffiliated(GetAffiliated value),
    @required Result submitTestUserInfo(SubmitTestUserInfo value),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return historyMessage(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result connectWebsocket(ConnectWebsocket value),
    Result sendChatMessage(SendChatMessage value),
    Result disconnectWebsocket(DisconnectWebsocket value),
    Result getContacts(GetContacts value),
    Result getId(GetId value),
    Result getUnreadMessages(GetUnreadMessages value),
    Result historyMessage(HistoryMessage value),
    Result getPermission(GetPermission value),
    Result getReceiveMsg(GetReceiveMsg value),
    Result setJPushRid(SetJPushRid value),
    Result managerRemindList(ManagerRemindList value),
    Result managerRemindDetails(ManagerRemindDetails value),
    Result refreshRemindList(RefreshRemindList value),
    Result unreadMessageCount(UnreadMessageCount value),
    Result batchUpdate(BatchUpdate value),
    Result unreadList(UnreadList value),
    Result sendChatMessageVoice(SendChatMessageVoice value),
    Result gethistory(GetHistory value),
    Result getSalesmanLists(GetSalesmanLists value),
    Result getProcessDefinition(GetProcessDefinition value),
    Result isBottomSheet(IsBottomSheet value),
    Result slideshow(Slideshow value),
    Result getRoles(GetRoles value),
    Result getAffiliated(GetAffiliated value),
    Result submitTestUserInfo(SubmitTestUserInfo value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (historyMessage != null) {
      return historyMessage(this);
    }
    return orElse();
  }
}

abstract class HistoryMessage implements WebScoketEvent {
  const factory HistoryMessage(String contactId, int index, int sizeNum) =
      _$HistoryMessage;

  String get contactId;
  int get index;
  int get sizeNum;
  $HistoryMessageCopyWith<HistoryMessage> get copyWith;
}

/// @nodoc
abstract class $GetPermissionCopyWith<$Res> {
  factory $GetPermissionCopyWith(
          GetPermission value, $Res Function(GetPermission) then) =
      _$GetPermissionCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetPermissionCopyWithImpl<$Res>
    extends _$WebScoketEventCopyWithImpl<$Res>
    implements $GetPermissionCopyWith<$Res> {
  _$GetPermissionCopyWithImpl(
      GetPermission _value, $Res Function(GetPermission) _then)
      : super(_value, (v) => _then(v as GetPermission));

  @override
  GetPermission get _value => super._value as GetPermission;
}

/// @nodoc
class _$GetPermission implements GetPermission {
  const _$GetPermission();

  @override
  String toString() {
    return 'WebScoketEvent.getPermission()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GetPermission);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result connectWebsocket(),
    @required Result sendChatMessage(String msg, String type, String contactId),
    @required Result disconnectWebsocket(),
    @required Result getContacts(),
    @required Result getId(String contactId),
    @required Result getUnreadMessages(),
    @required Result historyMessage(String contactId, int index, int sizeNum),
    @required Result getPermission(),
    @required Result getReceiveMsg(),
    @required Result setJPushRid(),
    @required Result managerRemindList(int index),
    @required Result managerRemindDetails(String phone, String tenantId),
    @required Result refreshRemindList(),
    @required Result unreadMessageCount(),
    @required Result batchUpdate(),
    @required Result unreadList(),
    @required
        Result sendChatMessageVoice(
            String msg, String type, String contactId, int duration),
    @required Result gethistory(String instanceId),
    @required Result getSalesmanLists(),
    @required Result getProcessDefinition(String phone, String salesmanId),
    @required Result isBottomSheet(),
    @required Result slideshow(),
    @required Result getRoles(),
    @required Result getAffiliated(),
    @required
        Result submitTestUserInfo(String image, String name, String nickName,
            String sex, String role, List<dynamic> listAffiliated),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return getPermission();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result connectWebsocket(),
    Result sendChatMessage(String msg, String type, String contactId),
    Result disconnectWebsocket(),
    Result getContacts(),
    Result getId(String contactId),
    Result getUnreadMessages(),
    Result historyMessage(String contactId, int index, int sizeNum),
    Result getPermission(),
    Result getReceiveMsg(),
    Result setJPushRid(),
    Result managerRemindList(int index),
    Result managerRemindDetails(String phone, String tenantId),
    Result refreshRemindList(),
    Result unreadMessageCount(),
    Result batchUpdate(),
    Result unreadList(),
    Result sendChatMessageVoice(
        String msg, String type, String contactId, int duration),
    Result gethistory(String instanceId),
    Result getSalesmanLists(),
    Result getProcessDefinition(String phone, String salesmanId),
    Result isBottomSheet(),
    Result slideshow(),
    Result getRoles(),
    Result getAffiliated(),
    Result submitTestUserInfo(String image, String name, String nickName,
        String sex, String role, List<dynamic> listAffiliated),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPermission != null) {
      return getPermission();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result connectWebsocket(ConnectWebsocket value),
    @required Result sendChatMessage(SendChatMessage value),
    @required Result disconnectWebsocket(DisconnectWebsocket value),
    @required Result getContacts(GetContacts value),
    @required Result getId(GetId value),
    @required Result getUnreadMessages(GetUnreadMessages value),
    @required Result historyMessage(HistoryMessage value),
    @required Result getPermission(GetPermission value),
    @required Result getReceiveMsg(GetReceiveMsg value),
    @required Result setJPushRid(SetJPushRid value),
    @required Result managerRemindList(ManagerRemindList value),
    @required Result managerRemindDetails(ManagerRemindDetails value),
    @required Result refreshRemindList(RefreshRemindList value),
    @required Result unreadMessageCount(UnreadMessageCount value),
    @required Result batchUpdate(BatchUpdate value),
    @required Result unreadList(UnreadList value),
    @required Result sendChatMessageVoice(SendChatMessageVoice value),
    @required Result gethistory(GetHistory value),
    @required Result getSalesmanLists(GetSalesmanLists value),
    @required Result getProcessDefinition(GetProcessDefinition value),
    @required Result isBottomSheet(IsBottomSheet value),
    @required Result slideshow(Slideshow value),
    @required Result getRoles(GetRoles value),
    @required Result getAffiliated(GetAffiliated value),
    @required Result submitTestUserInfo(SubmitTestUserInfo value),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return getPermission(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result connectWebsocket(ConnectWebsocket value),
    Result sendChatMessage(SendChatMessage value),
    Result disconnectWebsocket(DisconnectWebsocket value),
    Result getContacts(GetContacts value),
    Result getId(GetId value),
    Result getUnreadMessages(GetUnreadMessages value),
    Result historyMessage(HistoryMessage value),
    Result getPermission(GetPermission value),
    Result getReceiveMsg(GetReceiveMsg value),
    Result setJPushRid(SetJPushRid value),
    Result managerRemindList(ManagerRemindList value),
    Result managerRemindDetails(ManagerRemindDetails value),
    Result refreshRemindList(RefreshRemindList value),
    Result unreadMessageCount(UnreadMessageCount value),
    Result batchUpdate(BatchUpdate value),
    Result unreadList(UnreadList value),
    Result sendChatMessageVoice(SendChatMessageVoice value),
    Result gethistory(GetHistory value),
    Result getSalesmanLists(GetSalesmanLists value),
    Result getProcessDefinition(GetProcessDefinition value),
    Result isBottomSheet(IsBottomSheet value),
    Result slideshow(Slideshow value),
    Result getRoles(GetRoles value),
    Result getAffiliated(GetAffiliated value),
    Result submitTestUserInfo(SubmitTestUserInfo value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPermission != null) {
      return getPermission(this);
    }
    return orElse();
  }
}

abstract class GetPermission implements WebScoketEvent {
  const factory GetPermission() = _$GetPermission;
}

/// @nodoc
abstract class $GetReceiveMsgCopyWith<$Res> {
  factory $GetReceiveMsgCopyWith(
          GetReceiveMsg value, $Res Function(GetReceiveMsg) then) =
      _$GetReceiveMsgCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetReceiveMsgCopyWithImpl<$Res>
    extends _$WebScoketEventCopyWithImpl<$Res>
    implements $GetReceiveMsgCopyWith<$Res> {
  _$GetReceiveMsgCopyWithImpl(
      GetReceiveMsg _value, $Res Function(GetReceiveMsg) _then)
      : super(_value, (v) => _then(v as GetReceiveMsg));

  @override
  GetReceiveMsg get _value => super._value as GetReceiveMsg;
}

/// @nodoc
class _$GetReceiveMsg implements GetReceiveMsg {
  const _$GetReceiveMsg();

  @override
  String toString() {
    return 'WebScoketEvent.getReceiveMsg()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GetReceiveMsg);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result connectWebsocket(),
    @required Result sendChatMessage(String msg, String type, String contactId),
    @required Result disconnectWebsocket(),
    @required Result getContacts(),
    @required Result getId(String contactId),
    @required Result getUnreadMessages(),
    @required Result historyMessage(String contactId, int index, int sizeNum),
    @required Result getPermission(),
    @required Result getReceiveMsg(),
    @required Result setJPushRid(),
    @required Result managerRemindList(int index),
    @required Result managerRemindDetails(String phone, String tenantId),
    @required Result refreshRemindList(),
    @required Result unreadMessageCount(),
    @required Result batchUpdate(),
    @required Result unreadList(),
    @required
        Result sendChatMessageVoice(
            String msg, String type, String contactId, int duration),
    @required Result gethistory(String instanceId),
    @required Result getSalesmanLists(),
    @required Result getProcessDefinition(String phone, String salesmanId),
    @required Result isBottomSheet(),
    @required Result slideshow(),
    @required Result getRoles(),
    @required Result getAffiliated(),
    @required
        Result submitTestUserInfo(String image, String name, String nickName,
            String sex, String role, List<dynamic> listAffiliated),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return getReceiveMsg();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result connectWebsocket(),
    Result sendChatMessage(String msg, String type, String contactId),
    Result disconnectWebsocket(),
    Result getContacts(),
    Result getId(String contactId),
    Result getUnreadMessages(),
    Result historyMessage(String contactId, int index, int sizeNum),
    Result getPermission(),
    Result getReceiveMsg(),
    Result setJPushRid(),
    Result managerRemindList(int index),
    Result managerRemindDetails(String phone, String tenantId),
    Result refreshRemindList(),
    Result unreadMessageCount(),
    Result batchUpdate(),
    Result unreadList(),
    Result sendChatMessageVoice(
        String msg, String type, String contactId, int duration),
    Result gethistory(String instanceId),
    Result getSalesmanLists(),
    Result getProcessDefinition(String phone, String salesmanId),
    Result isBottomSheet(),
    Result slideshow(),
    Result getRoles(),
    Result getAffiliated(),
    Result submitTestUserInfo(String image, String name, String nickName,
        String sex, String role, List<dynamic> listAffiliated),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getReceiveMsg != null) {
      return getReceiveMsg();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result connectWebsocket(ConnectWebsocket value),
    @required Result sendChatMessage(SendChatMessage value),
    @required Result disconnectWebsocket(DisconnectWebsocket value),
    @required Result getContacts(GetContacts value),
    @required Result getId(GetId value),
    @required Result getUnreadMessages(GetUnreadMessages value),
    @required Result historyMessage(HistoryMessage value),
    @required Result getPermission(GetPermission value),
    @required Result getReceiveMsg(GetReceiveMsg value),
    @required Result setJPushRid(SetJPushRid value),
    @required Result managerRemindList(ManagerRemindList value),
    @required Result managerRemindDetails(ManagerRemindDetails value),
    @required Result refreshRemindList(RefreshRemindList value),
    @required Result unreadMessageCount(UnreadMessageCount value),
    @required Result batchUpdate(BatchUpdate value),
    @required Result unreadList(UnreadList value),
    @required Result sendChatMessageVoice(SendChatMessageVoice value),
    @required Result gethistory(GetHistory value),
    @required Result getSalesmanLists(GetSalesmanLists value),
    @required Result getProcessDefinition(GetProcessDefinition value),
    @required Result isBottomSheet(IsBottomSheet value),
    @required Result slideshow(Slideshow value),
    @required Result getRoles(GetRoles value),
    @required Result getAffiliated(GetAffiliated value),
    @required Result submitTestUserInfo(SubmitTestUserInfo value),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return getReceiveMsg(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result connectWebsocket(ConnectWebsocket value),
    Result sendChatMessage(SendChatMessage value),
    Result disconnectWebsocket(DisconnectWebsocket value),
    Result getContacts(GetContacts value),
    Result getId(GetId value),
    Result getUnreadMessages(GetUnreadMessages value),
    Result historyMessage(HistoryMessage value),
    Result getPermission(GetPermission value),
    Result getReceiveMsg(GetReceiveMsg value),
    Result setJPushRid(SetJPushRid value),
    Result managerRemindList(ManagerRemindList value),
    Result managerRemindDetails(ManagerRemindDetails value),
    Result refreshRemindList(RefreshRemindList value),
    Result unreadMessageCount(UnreadMessageCount value),
    Result batchUpdate(BatchUpdate value),
    Result unreadList(UnreadList value),
    Result sendChatMessageVoice(SendChatMessageVoice value),
    Result gethistory(GetHistory value),
    Result getSalesmanLists(GetSalesmanLists value),
    Result getProcessDefinition(GetProcessDefinition value),
    Result isBottomSheet(IsBottomSheet value),
    Result slideshow(Slideshow value),
    Result getRoles(GetRoles value),
    Result getAffiliated(GetAffiliated value),
    Result submitTestUserInfo(SubmitTestUserInfo value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getReceiveMsg != null) {
      return getReceiveMsg(this);
    }
    return orElse();
  }
}

abstract class GetReceiveMsg implements WebScoketEvent {
  const factory GetReceiveMsg() = _$GetReceiveMsg;
}

/// @nodoc
abstract class $SetJPushRidCopyWith<$Res> {
  factory $SetJPushRidCopyWith(
          SetJPushRid value, $Res Function(SetJPushRid) then) =
      _$SetJPushRidCopyWithImpl<$Res>;
}

/// @nodoc
class _$SetJPushRidCopyWithImpl<$Res> extends _$WebScoketEventCopyWithImpl<$Res>
    implements $SetJPushRidCopyWith<$Res> {
  _$SetJPushRidCopyWithImpl(
      SetJPushRid _value, $Res Function(SetJPushRid) _then)
      : super(_value, (v) => _then(v as SetJPushRid));

  @override
  SetJPushRid get _value => super._value as SetJPushRid;
}

/// @nodoc
class _$SetJPushRid implements SetJPushRid {
  const _$SetJPushRid();

  @override
  String toString() {
    return 'WebScoketEvent.setJPushRid()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SetJPushRid);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result connectWebsocket(),
    @required Result sendChatMessage(String msg, String type, String contactId),
    @required Result disconnectWebsocket(),
    @required Result getContacts(),
    @required Result getId(String contactId),
    @required Result getUnreadMessages(),
    @required Result historyMessage(String contactId, int index, int sizeNum),
    @required Result getPermission(),
    @required Result getReceiveMsg(),
    @required Result setJPushRid(),
    @required Result managerRemindList(int index),
    @required Result managerRemindDetails(String phone, String tenantId),
    @required Result refreshRemindList(),
    @required Result unreadMessageCount(),
    @required Result batchUpdate(),
    @required Result unreadList(),
    @required
        Result sendChatMessageVoice(
            String msg, String type, String contactId, int duration),
    @required Result gethistory(String instanceId),
    @required Result getSalesmanLists(),
    @required Result getProcessDefinition(String phone, String salesmanId),
    @required Result isBottomSheet(),
    @required Result slideshow(),
    @required Result getRoles(),
    @required Result getAffiliated(),
    @required
        Result submitTestUserInfo(String image, String name, String nickName,
            String sex, String role, List<dynamic> listAffiliated),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return setJPushRid();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result connectWebsocket(),
    Result sendChatMessage(String msg, String type, String contactId),
    Result disconnectWebsocket(),
    Result getContacts(),
    Result getId(String contactId),
    Result getUnreadMessages(),
    Result historyMessage(String contactId, int index, int sizeNum),
    Result getPermission(),
    Result getReceiveMsg(),
    Result setJPushRid(),
    Result managerRemindList(int index),
    Result managerRemindDetails(String phone, String tenantId),
    Result refreshRemindList(),
    Result unreadMessageCount(),
    Result batchUpdate(),
    Result unreadList(),
    Result sendChatMessageVoice(
        String msg, String type, String contactId, int duration),
    Result gethistory(String instanceId),
    Result getSalesmanLists(),
    Result getProcessDefinition(String phone, String salesmanId),
    Result isBottomSheet(),
    Result slideshow(),
    Result getRoles(),
    Result getAffiliated(),
    Result submitTestUserInfo(String image, String name, String nickName,
        String sex, String role, List<dynamic> listAffiliated),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (setJPushRid != null) {
      return setJPushRid();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result connectWebsocket(ConnectWebsocket value),
    @required Result sendChatMessage(SendChatMessage value),
    @required Result disconnectWebsocket(DisconnectWebsocket value),
    @required Result getContacts(GetContacts value),
    @required Result getId(GetId value),
    @required Result getUnreadMessages(GetUnreadMessages value),
    @required Result historyMessage(HistoryMessage value),
    @required Result getPermission(GetPermission value),
    @required Result getReceiveMsg(GetReceiveMsg value),
    @required Result setJPushRid(SetJPushRid value),
    @required Result managerRemindList(ManagerRemindList value),
    @required Result managerRemindDetails(ManagerRemindDetails value),
    @required Result refreshRemindList(RefreshRemindList value),
    @required Result unreadMessageCount(UnreadMessageCount value),
    @required Result batchUpdate(BatchUpdate value),
    @required Result unreadList(UnreadList value),
    @required Result sendChatMessageVoice(SendChatMessageVoice value),
    @required Result gethistory(GetHistory value),
    @required Result getSalesmanLists(GetSalesmanLists value),
    @required Result getProcessDefinition(GetProcessDefinition value),
    @required Result isBottomSheet(IsBottomSheet value),
    @required Result slideshow(Slideshow value),
    @required Result getRoles(GetRoles value),
    @required Result getAffiliated(GetAffiliated value),
    @required Result submitTestUserInfo(SubmitTestUserInfo value),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return setJPushRid(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result connectWebsocket(ConnectWebsocket value),
    Result sendChatMessage(SendChatMessage value),
    Result disconnectWebsocket(DisconnectWebsocket value),
    Result getContacts(GetContacts value),
    Result getId(GetId value),
    Result getUnreadMessages(GetUnreadMessages value),
    Result historyMessage(HistoryMessage value),
    Result getPermission(GetPermission value),
    Result getReceiveMsg(GetReceiveMsg value),
    Result setJPushRid(SetJPushRid value),
    Result managerRemindList(ManagerRemindList value),
    Result managerRemindDetails(ManagerRemindDetails value),
    Result refreshRemindList(RefreshRemindList value),
    Result unreadMessageCount(UnreadMessageCount value),
    Result batchUpdate(BatchUpdate value),
    Result unreadList(UnreadList value),
    Result sendChatMessageVoice(SendChatMessageVoice value),
    Result gethistory(GetHistory value),
    Result getSalesmanLists(GetSalesmanLists value),
    Result getProcessDefinition(GetProcessDefinition value),
    Result isBottomSheet(IsBottomSheet value),
    Result slideshow(Slideshow value),
    Result getRoles(GetRoles value),
    Result getAffiliated(GetAffiliated value),
    Result submitTestUserInfo(SubmitTestUserInfo value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (setJPushRid != null) {
      return setJPushRid(this);
    }
    return orElse();
  }
}

abstract class SetJPushRid implements WebScoketEvent {
  const factory SetJPushRid() = _$SetJPushRid;
}

/// @nodoc
abstract class $ManagerRemindListCopyWith<$Res> {
  factory $ManagerRemindListCopyWith(
          ManagerRemindList value, $Res Function(ManagerRemindList) then) =
      _$ManagerRemindListCopyWithImpl<$Res>;
  $Res call({int index});
}

/// @nodoc
class _$ManagerRemindListCopyWithImpl<$Res>
    extends _$WebScoketEventCopyWithImpl<$Res>
    implements $ManagerRemindListCopyWith<$Res> {
  _$ManagerRemindListCopyWithImpl(
      ManagerRemindList _value, $Res Function(ManagerRemindList) _then)
      : super(_value, (v) => _then(v as ManagerRemindList));

  @override
  ManagerRemindList get _value => super._value as ManagerRemindList;

  @override
  $Res call({
    Object index = freezed,
  }) {
    return _then(ManagerRemindList(
      index == freezed ? _value.index : index as int,
    ));
  }
}

/// @nodoc
class _$ManagerRemindList implements ManagerRemindList {
  const _$ManagerRemindList(this.index) : assert(index != null);

  @override
  final int index;

  @override
  String toString() {
    return 'WebScoketEvent.managerRemindList(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ManagerRemindList &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(index);

  @override
  $ManagerRemindListCopyWith<ManagerRemindList> get copyWith =>
      _$ManagerRemindListCopyWithImpl<ManagerRemindList>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result connectWebsocket(),
    @required Result sendChatMessage(String msg, String type, String contactId),
    @required Result disconnectWebsocket(),
    @required Result getContacts(),
    @required Result getId(String contactId),
    @required Result getUnreadMessages(),
    @required Result historyMessage(String contactId, int index, int sizeNum),
    @required Result getPermission(),
    @required Result getReceiveMsg(),
    @required Result setJPushRid(),
    @required Result managerRemindList(int index),
    @required Result managerRemindDetails(String phone, String tenantId),
    @required Result refreshRemindList(),
    @required Result unreadMessageCount(),
    @required Result batchUpdate(),
    @required Result unreadList(),
    @required
        Result sendChatMessageVoice(
            String msg, String type, String contactId, int duration),
    @required Result gethistory(String instanceId),
    @required Result getSalesmanLists(),
    @required Result getProcessDefinition(String phone, String salesmanId),
    @required Result isBottomSheet(),
    @required Result slideshow(),
    @required Result getRoles(),
    @required Result getAffiliated(),
    @required
        Result submitTestUserInfo(String image, String name, String nickName,
            String sex, String role, List<dynamic> listAffiliated),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return managerRemindList(index);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result connectWebsocket(),
    Result sendChatMessage(String msg, String type, String contactId),
    Result disconnectWebsocket(),
    Result getContacts(),
    Result getId(String contactId),
    Result getUnreadMessages(),
    Result historyMessage(String contactId, int index, int sizeNum),
    Result getPermission(),
    Result getReceiveMsg(),
    Result setJPushRid(),
    Result managerRemindList(int index),
    Result managerRemindDetails(String phone, String tenantId),
    Result refreshRemindList(),
    Result unreadMessageCount(),
    Result batchUpdate(),
    Result unreadList(),
    Result sendChatMessageVoice(
        String msg, String type, String contactId, int duration),
    Result gethistory(String instanceId),
    Result getSalesmanLists(),
    Result getProcessDefinition(String phone, String salesmanId),
    Result isBottomSheet(),
    Result slideshow(),
    Result getRoles(),
    Result getAffiliated(),
    Result submitTestUserInfo(String image, String name, String nickName,
        String sex, String role, List<dynamic> listAffiliated),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (managerRemindList != null) {
      return managerRemindList(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result connectWebsocket(ConnectWebsocket value),
    @required Result sendChatMessage(SendChatMessage value),
    @required Result disconnectWebsocket(DisconnectWebsocket value),
    @required Result getContacts(GetContacts value),
    @required Result getId(GetId value),
    @required Result getUnreadMessages(GetUnreadMessages value),
    @required Result historyMessage(HistoryMessage value),
    @required Result getPermission(GetPermission value),
    @required Result getReceiveMsg(GetReceiveMsg value),
    @required Result setJPushRid(SetJPushRid value),
    @required Result managerRemindList(ManagerRemindList value),
    @required Result managerRemindDetails(ManagerRemindDetails value),
    @required Result refreshRemindList(RefreshRemindList value),
    @required Result unreadMessageCount(UnreadMessageCount value),
    @required Result batchUpdate(BatchUpdate value),
    @required Result unreadList(UnreadList value),
    @required Result sendChatMessageVoice(SendChatMessageVoice value),
    @required Result gethistory(GetHistory value),
    @required Result getSalesmanLists(GetSalesmanLists value),
    @required Result getProcessDefinition(GetProcessDefinition value),
    @required Result isBottomSheet(IsBottomSheet value),
    @required Result slideshow(Slideshow value),
    @required Result getRoles(GetRoles value),
    @required Result getAffiliated(GetAffiliated value),
    @required Result submitTestUserInfo(SubmitTestUserInfo value),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return managerRemindList(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result connectWebsocket(ConnectWebsocket value),
    Result sendChatMessage(SendChatMessage value),
    Result disconnectWebsocket(DisconnectWebsocket value),
    Result getContacts(GetContacts value),
    Result getId(GetId value),
    Result getUnreadMessages(GetUnreadMessages value),
    Result historyMessage(HistoryMessage value),
    Result getPermission(GetPermission value),
    Result getReceiveMsg(GetReceiveMsg value),
    Result setJPushRid(SetJPushRid value),
    Result managerRemindList(ManagerRemindList value),
    Result managerRemindDetails(ManagerRemindDetails value),
    Result refreshRemindList(RefreshRemindList value),
    Result unreadMessageCount(UnreadMessageCount value),
    Result batchUpdate(BatchUpdate value),
    Result unreadList(UnreadList value),
    Result sendChatMessageVoice(SendChatMessageVoice value),
    Result gethistory(GetHistory value),
    Result getSalesmanLists(GetSalesmanLists value),
    Result getProcessDefinition(GetProcessDefinition value),
    Result isBottomSheet(IsBottomSheet value),
    Result slideshow(Slideshow value),
    Result getRoles(GetRoles value),
    Result getAffiliated(GetAffiliated value),
    Result submitTestUserInfo(SubmitTestUserInfo value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (managerRemindList != null) {
      return managerRemindList(this);
    }
    return orElse();
  }
}

abstract class ManagerRemindList implements WebScoketEvent {
  const factory ManagerRemindList(int index) = _$ManagerRemindList;

  int get index;
  $ManagerRemindListCopyWith<ManagerRemindList> get copyWith;
}

/// @nodoc
abstract class $ManagerRemindDetailsCopyWith<$Res> {
  factory $ManagerRemindDetailsCopyWith(ManagerRemindDetails value,
          $Res Function(ManagerRemindDetails) then) =
      _$ManagerRemindDetailsCopyWithImpl<$Res>;
  $Res call({String phone, String tenantId});
}

/// @nodoc
class _$ManagerRemindDetailsCopyWithImpl<$Res>
    extends _$WebScoketEventCopyWithImpl<$Res>
    implements $ManagerRemindDetailsCopyWith<$Res> {
  _$ManagerRemindDetailsCopyWithImpl(
      ManagerRemindDetails _value, $Res Function(ManagerRemindDetails) _then)
      : super(_value, (v) => _then(v as ManagerRemindDetails));

  @override
  ManagerRemindDetails get _value => super._value as ManagerRemindDetails;

  @override
  $Res call({
    Object phone = freezed,
    Object tenantId = freezed,
  }) {
    return _then(ManagerRemindDetails(
      phone == freezed ? _value.phone : phone as String,
      tenantId == freezed ? _value.tenantId : tenantId as String,
    ));
  }
}

/// @nodoc
class _$ManagerRemindDetails implements ManagerRemindDetails {
  const _$ManagerRemindDetails(this.phone, this.tenantId)
      : assert(phone != null),
        assert(tenantId != null);

  @override
  final String phone;
  @override
  final String tenantId;

  @override
  String toString() {
    return 'WebScoketEvent.managerRemindDetails(phone: $phone, tenantId: $tenantId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ManagerRemindDetails &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.tenantId, tenantId) ||
                const DeepCollectionEquality()
                    .equals(other.tenantId, tenantId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(tenantId);

  @override
  $ManagerRemindDetailsCopyWith<ManagerRemindDetails> get copyWith =>
      _$ManagerRemindDetailsCopyWithImpl<ManagerRemindDetails>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result connectWebsocket(),
    @required Result sendChatMessage(String msg, String type, String contactId),
    @required Result disconnectWebsocket(),
    @required Result getContacts(),
    @required Result getId(String contactId),
    @required Result getUnreadMessages(),
    @required Result historyMessage(String contactId, int index, int sizeNum),
    @required Result getPermission(),
    @required Result getReceiveMsg(),
    @required Result setJPushRid(),
    @required Result managerRemindList(int index),
    @required Result managerRemindDetails(String phone, String tenantId),
    @required Result refreshRemindList(),
    @required Result unreadMessageCount(),
    @required Result batchUpdate(),
    @required Result unreadList(),
    @required
        Result sendChatMessageVoice(
            String msg, String type, String contactId, int duration),
    @required Result gethistory(String instanceId),
    @required Result getSalesmanLists(),
    @required Result getProcessDefinition(String phone, String salesmanId),
    @required Result isBottomSheet(),
    @required Result slideshow(),
    @required Result getRoles(),
    @required Result getAffiliated(),
    @required
        Result submitTestUserInfo(String image, String name, String nickName,
            String sex, String role, List<dynamic> listAffiliated),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return managerRemindDetails(phone, tenantId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result connectWebsocket(),
    Result sendChatMessage(String msg, String type, String contactId),
    Result disconnectWebsocket(),
    Result getContacts(),
    Result getId(String contactId),
    Result getUnreadMessages(),
    Result historyMessage(String contactId, int index, int sizeNum),
    Result getPermission(),
    Result getReceiveMsg(),
    Result setJPushRid(),
    Result managerRemindList(int index),
    Result managerRemindDetails(String phone, String tenantId),
    Result refreshRemindList(),
    Result unreadMessageCount(),
    Result batchUpdate(),
    Result unreadList(),
    Result sendChatMessageVoice(
        String msg, String type, String contactId, int duration),
    Result gethistory(String instanceId),
    Result getSalesmanLists(),
    Result getProcessDefinition(String phone, String salesmanId),
    Result isBottomSheet(),
    Result slideshow(),
    Result getRoles(),
    Result getAffiliated(),
    Result submitTestUserInfo(String image, String name, String nickName,
        String sex, String role, List<dynamic> listAffiliated),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (managerRemindDetails != null) {
      return managerRemindDetails(phone, tenantId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result connectWebsocket(ConnectWebsocket value),
    @required Result sendChatMessage(SendChatMessage value),
    @required Result disconnectWebsocket(DisconnectWebsocket value),
    @required Result getContacts(GetContacts value),
    @required Result getId(GetId value),
    @required Result getUnreadMessages(GetUnreadMessages value),
    @required Result historyMessage(HistoryMessage value),
    @required Result getPermission(GetPermission value),
    @required Result getReceiveMsg(GetReceiveMsg value),
    @required Result setJPushRid(SetJPushRid value),
    @required Result managerRemindList(ManagerRemindList value),
    @required Result managerRemindDetails(ManagerRemindDetails value),
    @required Result refreshRemindList(RefreshRemindList value),
    @required Result unreadMessageCount(UnreadMessageCount value),
    @required Result batchUpdate(BatchUpdate value),
    @required Result unreadList(UnreadList value),
    @required Result sendChatMessageVoice(SendChatMessageVoice value),
    @required Result gethistory(GetHistory value),
    @required Result getSalesmanLists(GetSalesmanLists value),
    @required Result getProcessDefinition(GetProcessDefinition value),
    @required Result isBottomSheet(IsBottomSheet value),
    @required Result slideshow(Slideshow value),
    @required Result getRoles(GetRoles value),
    @required Result getAffiliated(GetAffiliated value),
    @required Result submitTestUserInfo(SubmitTestUserInfo value),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return managerRemindDetails(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result connectWebsocket(ConnectWebsocket value),
    Result sendChatMessage(SendChatMessage value),
    Result disconnectWebsocket(DisconnectWebsocket value),
    Result getContacts(GetContacts value),
    Result getId(GetId value),
    Result getUnreadMessages(GetUnreadMessages value),
    Result historyMessage(HistoryMessage value),
    Result getPermission(GetPermission value),
    Result getReceiveMsg(GetReceiveMsg value),
    Result setJPushRid(SetJPushRid value),
    Result managerRemindList(ManagerRemindList value),
    Result managerRemindDetails(ManagerRemindDetails value),
    Result refreshRemindList(RefreshRemindList value),
    Result unreadMessageCount(UnreadMessageCount value),
    Result batchUpdate(BatchUpdate value),
    Result unreadList(UnreadList value),
    Result sendChatMessageVoice(SendChatMessageVoice value),
    Result gethistory(GetHistory value),
    Result getSalesmanLists(GetSalesmanLists value),
    Result getProcessDefinition(GetProcessDefinition value),
    Result isBottomSheet(IsBottomSheet value),
    Result slideshow(Slideshow value),
    Result getRoles(GetRoles value),
    Result getAffiliated(GetAffiliated value),
    Result submitTestUserInfo(SubmitTestUserInfo value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (managerRemindDetails != null) {
      return managerRemindDetails(this);
    }
    return orElse();
  }
}

abstract class ManagerRemindDetails implements WebScoketEvent {
  const factory ManagerRemindDetails(String phone, String tenantId) =
      _$ManagerRemindDetails;

  String get phone;
  String get tenantId;
  $ManagerRemindDetailsCopyWith<ManagerRemindDetails> get copyWith;
}

/// @nodoc
abstract class $RefreshRemindListCopyWith<$Res> {
  factory $RefreshRemindListCopyWith(
          RefreshRemindList value, $Res Function(RefreshRemindList) then) =
      _$RefreshRemindListCopyWithImpl<$Res>;
}

/// @nodoc
class _$RefreshRemindListCopyWithImpl<$Res>
    extends _$WebScoketEventCopyWithImpl<$Res>
    implements $RefreshRemindListCopyWith<$Res> {
  _$RefreshRemindListCopyWithImpl(
      RefreshRemindList _value, $Res Function(RefreshRemindList) _then)
      : super(_value, (v) => _then(v as RefreshRemindList));

  @override
  RefreshRemindList get _value => super._value as RefreshRemindList;
}

/// @nodoc
class _$RefreshRemindList implements RefreshRemindList {
  const _$RefreshRemindList();

  @override
  String toString() {
    return 'WebScoketEvent.refreshRemindList()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RefreshRemindList);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result connectWebsocket(),
    @required Result sendChatMessage(String msg, String type, String contactId),
    @required Result disconnectWebsocket(),
    @required Result getContacts(),
    @required Result getId(String contactId),
    @required Result getUnreadMessages(),
    @required Result historyMessage(String contactId, int index, int sizeNum),
    @required Result getPermission(),
    @required Result getReceiveMsg(),
    @required Result setJPushRid(),
    @required Result managerRemindList(int index),
    @required Result managerRemindDetails(String phone, String tenantId),
    @required Result refreshRemindList(),
    @required Result unreadMessageCount(),
    @required Result batchUpdate(),
    @required Result unreadList(),
    @required
        Result sendChatMessageVoice(
            String msg, String type, String contactId, int duration),
    @required Result gethistory(String instanceId),
    @required Result getSalesmanLists(),
    @required Result getProcessDefinition(String phone, String salesmanId),
    @required Result isBottomSheet(),
    @required Result slideshow(),
    @required Result getRoles(),
    @required Result getAffiliated(),
    @required
        Result submitTestUserInfo(String image, String name, String nickName,
            String sex, String role, List<dynamic> listAffiliated),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return refreshRemindList();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result connectWebsocket(),
    Result sendChatMessage(String msg, String type, String contactId),
    Result disconnectWebsocket(),
    Result getContacts(),
    Result getId(String contactId),
    Result getUnreadMessages(),
    Result historyMessage(String contactId, int index, int sizeNum),
    Result getPermission(),
    Result getReceiveMsg(),
    Result setJPushRid(),
    Result managerRemindList(int index),
    Result managerRemindDetails(String phone, String tenantId),
    Result refreshRemindList(),
    Result unreadMessageCount(),
    Result batchUpdate(),
    Result unreadList(),
    Result sendChatMessageVoice(
        String msg, String type, String contactId, int duration),
    Result gethistory(String instanceId),
    Result getSalesmanLists(),
    Result getProcessDefinition(String phone, String salesmanId),
    Result isBottomSheet(),
    Result slideshow(),
    Result getRoles(),
    Result getAffiliated(),
    Result submitTestUserInfo(String image, String name, String nickName,
        String sex, String role, List<dynamic> listAffiliated),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (refreshRemindList != null) {
      return refreshRemindList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result connectWebsocket(ConnectWebsocket value),
    @required Result sendChatMessage(SendChatMessage value),
    @required Result disconnectWebsocket(DisconnectWebsocket value),
    @required Result getContacts(GetContacts value),
    @required Result getId(GetId value),
    @required Result getUnreadMessages(GetUnreadMessages value),
    @required Result historyMessage(HistoryMessage value),
    @required Result getPermission(GetPermission value),
    @required Result getReceiveMsg(GetReceiveMsg value),
    @required Result setJPushRid(SetJPushRid value),
    @required Result managerRemindList(ManagerRemindList value),
    @required Result managerRemindDetails(ManagerRemindDetails value),
    @required Result refreshRemindList(RefreshRemindList value),
    @required Result unreadMessageCount(UnreadMessageCount value),
    @required Result batchUpdate(BatchUpdate value),
    @required Result unreadList(UnreadList value),
    @required Result sendChatMessageVoice(SendChatMessageVoice value),
    @required Result gethistory(GetHistory value),
    @required Result getSalesmanLists(GetSalesmanLists value),
    @required Result getProcessDefinition(GetProcessDefinition value),
    @required Result isBottomSheet(IsBottomSheet value),
    @required Result slideshow(Slideshow value),
    @required Result getRoles(GetRoles value),
    @required Result getAffiliated(GetAffiliated value),
    @required Result submitTestUserInfo(SubmitTestUserInfo value),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return refreshRemindList(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result connectWebsocket(ConnectWebsocket value),
    Result sendChatMessage(SendChatMessage value),
    Result disconnectWebsocket(DisconnectWebsocket value),
    Result getContacts(GetContacts value),
    Result getId(GetId value),
    Result getUnreadMessages(GetUnreadMessages value),
    Result historyMessage(HistoryMessage value),
    Result getPermission(GetPermission value),
    Result getReceiveMsg(GetReceiveMsg value),
    Result setJPushRid(SetJPushRid value),
    Result managerRemindList(ManagerRemindList value),
    Result managerRemindDetails(ManagerRemindDetails value),
    Result refreshRemindList(RefreshRemindList value),
    Result unreadMessageCount(UnreadMessageCount value),
    Result batchUpdate(BatchUpdate value),
    Result unreadList(UnreadList value),
    Result sendChatMessageVoice(SendChatMessageVoice value),
    Result gethistory(GetHistory value),
    Result getSalesmanLists(GetSalesmanLists value),
    Result getProcessDefinition(GetProcessDefinition value),
    Result isBottomSheet(IsBottomSheet value),
    Result slideshow(Slideshow value),
    Result getRoles(GetRoles value),
    Result getAffiliated(GetAffiliated value),
    Result submitTestUserInfo(SubmitTestUserInfo value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (refreshRemindList != null) {
      return refreshRemindList(this);
    }
    return orElse();
  }
}

abstract class RefreshRemindList implements WebScoketEvent {
  const factory RefreshRemindList() = _$RefreshRemindList;
}

/// @nodoc
abstract class $UnreadMessageCountCopyWith<$Res> {
  factory $UnreadMessageCountCopyWith(
          UnreadMessageCount value, $Res Function(UnreadMessageCount) then) =
      _$UnreadMessageCountCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnreadMessageCountCopyWithImpl<$Res>
    extends _$WebScoketEventCopyWithImpl<$Res>
    implements $UnreadMessageCountCopyWith<$Res> {
  _$UnreadMessageCountCopyWithImpl(
      UnreadMessageCount _value, $Res Function(UnreadMessageCount) _then)
      : super(_value, (v) => _then(v as UnreadMessageCount));

  @override
  UnreadMessageCount get _value => super._value as UnreadMessageCount;
}

/// @nodoc
class _$UnreadMessageCount implements UnreadMessageCount {
  const _$UnreadMessageCount();

  @override
  String toString() {
    return 'WebScoketEvent.unreadMessageCount()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UnreadMessageCount);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result connectWebsocket(),
    @required Result sendChatMessage(String msg, String type, String contactId),
    @required Result disconnectWebsocket(),
    @required Result getContacts(),
    @required Result getId(String contactId),
    @required Result getUnreadMessages(),
    @required Result historyMessage(String contactId, int index, int sizeNum),
    @required Result getPermission(),
    @required Result getReceiveMsg(),
    @required Result setJPushRid(),
    @required Result managerRemindList(int index),
    @required Result managerRemindDetails(String phone, String tenantId),
    @required Result refreshRemindList(),
    @required Result unreadMessageCount(),
    @required Result batchUpdate(),
    @required Result unreadList(),
    @required
        Result sendChatMessageVoice(
            String msg, String type, String contactId, int duration),
    @required Result gethistory(String instanceId),
    @required Result getSalesmanLists(),
    @required Result getProcessDefinition(String phone, String salesmanId),
    @required Result isBottomSheet(),
    @required Result slideshow(),
    @required Result getRoles(),
    @required Result getAffiliated(),
    @required
        Result submitTestUserInfo(String image, String name, String nickName,
            String sex, String role, List<dynamic> listAffiliated),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return unreadMessageCount();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result connectWebsocket(),
    Result sendChatMessage(String msg, String type, String contactId),
    Result disconnectWebsocket(),
    Result getContacts(),
    Result getId(String contactId),
    Result getUnreadMessages(),
    Result historyMessage(String contactId, int index, int sizeNum),
    Result getPermission(),
    Result getReceiveMsg(),
    Result setJPushRid(),
    Result managerRemindList(int index),
    Result managerRemindDetails(String phone, String tenantId),
    Result refreshRemindList(),
    Result unreadMessageCount(),
    Result batchUpdate(),
    Result unreadList(),
    Result sendChatMessageVoice(
        String msg, String type, String contactId, int duration),
    Result gethistory(String instanceId),
    Result getSalesmanLists(),
    Result getProcessDefinition(String phone, String salesmanId),
    Result isBottomSheet(),
    Result slideshow(),
    Result getRoles(),
    Result getAffiliated(),
    Result submitTestUserInfo(String image, String name, String nickName,
        String sex, String role, List<dynamic> listAffiliated),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unreadMessageCount != null) {
      return unreadMessageCount();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result connectWebsocket(ConnectWebsocket value),
    @required Result sendChatMessage(SendChatMessage value),
    @required Result disconnectWebsocket(DisconnectWebsocket value),
    @required Result getContacts(GetContacts value),
    @required Result getId(GetId value),
    @required Result getUnreadMessages(GetUnreadMessages value),
    @required Result historyMessage(HistoryMessage value),
    @required Result getPermission(GetPermission value),
    @required Result getReceiveMsg(GetReceiveMsg value),
    @required Result setJPushRid(SetJPushRid value),
    @required Result managerRemindList(ManagerRemindList value),
    @required Result managerRemindDetails(ManagerRemindDetails value),
    @required Result refreshRemindList(RefreshRemindList value),
    @required Result unreadMessageCount(UnreadMessageCount value),
    @required Result batchUpdate(BatchUpdate value),
    @required Result unreadList(UnreadList value),
    @required Result sendChatMessageVoice(SendChatMessageVoice value),
    @required Result gethistory(GetHistory value),
    @required Result getSalesmanLists(GetSalesmanLists value),
    @required Result getProcessDefinition(GetProcessDefinition value),
    @required Result isBottomSheet(IsBottomSheet value),
    @required Result slideshow(Slideshow value),
    @required Result getRoles(GetRoles value),
    @required Result getAffiliated(GetAffiliated value),
    @required Result submitTestUserInfo(SubmitTestUserInfo value),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return unreadMessageCount(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result connectWebsocket(ConnectWebsocket value),
    Result sendChatMessage(SendChatMessage value),
    Result disconnectWebsocket(DisconnectWebsocket value),
    Result getContacts(GetContacts value),
    Result getId(GetId value),
    Result getUnreadMessages(GetUnreadMessages value),
    Result historyMessage(HistoryMessage value),
    Result getPermission(GetPermission value),
    Result getReceiveMsg(GetReceiveMsg value),
    Result setJPushRid(SetJPushRid value),
    Result managerRemindList(ManagerRemindList value),
    Result managerRemindDetails(ManagerRemindDetails value),
    Result refreshRemindList(RefreshRemindList value),
    Result unreadMessageCount(UnreadMessageCount value),
    Result batchUpdate(BatchUpdate value),
    Result unreadList(UnreadList value),
    Result sendChatMessageVoice(SendChatMessageVoice value),
    Result gethistory(GetHistory value),
    Result getSalesmanLists(GetSalesmanLists value),
    Result getProcessDefinition(GetProcessDefinition value),
    Result isBottomSheet(IsBottomSheet value),
    Result slideshow(Slideshow value),
    Result getRoles(GetRoles value),
    Result getAffiliated(GetAffiliated value),
    Result submitTestUserInfo(SubmitTestUserInfo value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unreadMessageCount != null) {
      return unreadMessageCount(this);
    }
    return orElse();
  }
}

abstract class UnreadMessageCount implements WebScoketEvent {
  const factory UnreadMessageCount() = _$UnreadMessageCount;
}

/// @nodoc
abstract class $BatchUpdateCopyWith<$Res> {
  factory $BatchUpdateCopyWith(
          BatchUpdate value, $Res Function(BatchUpdate) then) =
      _$BatchUpdateCopyWithImpl<$Res>;
}

/// @nodoc
class _$BatchUpdateCopyWithImpl<$Res> extends _$WebScoketEventCopyWithImpl<$Res>
    implements $BatchUpdateCopyWith<$Res> {
  _$BatchUpdateCopyWithImpl(
      BatchUpdate _value, $Res Function(BatchUpdate) _then)
      : super(_value, (v) => _then(v as BatchUpdate));

  @override
  BatchUpdate get _value => super._value as BatchUpdate;
}

/// @nodoc
class _$BatchUpdate implements BatchUpdate {
  const _$BatchUpdate();

  @override
  String toString() {
    return 'WebScoketEvent.batchUpdate()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BatchUpdate);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result connectWebsocket(),
    @required Result sendChatMessage(String msg, String type, String contactId),
    @required Result disconnectWebsocket(),
    @required Result getContacts(),
    @required Result getId(String contactId),
    @required Result getUnreadMessages(),
    @required Result historyMessage(String contactId, int index, int sizeNum),
    @required Result getPermission(),
    @required Result getReceiveMsg(),
    @required Result setJPushRid(),
    @required Result managerRemindList(int index),
    @required Result managerRemindDetails(String phone, String tenantId),
    @required Result refreshRemindList(),
    @required Result unreadMessageCount(),
    @required Result batchUpdate(),
    @required Result unreadList(),
    @required
        Result sendChatMessageVoice(
            String msg, String type, String contactId, int duration),
    @required Result gethistory(String instanceId),
    @required Result getSalesmanLists(),
    @required Result getProcessDefinition(String phone, String salesmanId),
    @required Result isBottomSheet(),
    @required Result slideshow(),
    @required Result getRoles(),
    @required Result getAffiliated(),
    @required
        Result submitTestUserInfo(String image, String name, String nickName,
            String sex, String role, List<dynamic> listAffiliated),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return batchUpdate();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result connectWebsocket(),
    Result sendChatMessage(String msg, String type, String contactId),
    Result disconnectWebsocket(),
    Result getContacts(),
    Result getId(String contactId),
    Result getUnreadMessages(),
    Result historyMessage(String contactId, int index, int sizeNum),
    Result getPermission(),
    Result getReceiveMsg(),
    Result setJPushRid(),
    Result managerRemindList(int index),
    Result managerRemindDetails(String phone, String tenantId),
    Result refreshRemindList(),
    Result unreadMessageCount(),
    Result batchUpdate(),
    Result unreadList(),
    Result sendChatMessageVoice(
        String msg, String type, String contactId, int duration),
    Result gethistory(String instanceId),
    Result getSalesmanLists(),
    Result getProcessDefinition(String phone, String salesmanId),
    Result isBottomSheet(),
    Result slideshow(),
    Result getRoles(),
    Result getAffiliated(),
    Result submitTestUserInfo(String image, String name, String nickName,
        String sex, String role, List<dynamic> listAffiliated),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (batchUpdate != null) {
      return batchUpdate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result connectWebsocket(ConnectWebsocket value),
    @required Result sendChatMessage(SendChatMessage value),
    @required Result disconnectWebsocket(DisconnectWebsocket value),
    @required Result getContacts(GetContacts value),
    @required Result getId(GetId value),
    @required Result getUnreadMessages(GetUnreadMessages value),
    @required Result historyMessage(HistoryMessage value),
    @required Result getPermission(GetPermission value),
    @required Result getReceiveMsg(GetReceiveMsg value),
    @required Result setJPushRid(SetJPushRid value),
    @required Result managerRemindList(ManagerRemindList value),
    @required Result managerRemindDetails(ManagerRemindDetails value),
    @required Result refreshRemindList(RefreshRemindList value),
    @required Result unreadMessageCount(UnreadMessageCount value),
    @required Result batchUpdate(BatchUpdate value),
    @required Result unreadList(UnreadList value),
    @required Result sendChatMessageVoice(SendChatMessageVoice value),
    @required Result gethistory(GetHistory value),
    @required Result getSalesmanLists(GetSalesmanLists value),
    @required Result getProcessDefinition(GetProcessDefinition value),
    @required Result isBottomSheet(IsBottomSheet value),
    @required Result slideshow(Slideshow value),
    @required Result getRoles(GetRoles value),
    @required Result getAffiliated(GetAffiliated value),
    @required Result submitTestUserInfo(SubmitTestUserInfo value),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return batchUpdate(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result connectWebsocket(ConnectWebsocket value),
    Result sendChatMessage(SendChatMessage value),
    Result disconnectWebsocket(DisconnectWebsocket value),
    Result getContacts(GetContacts value),
    Result getId(GetId value),
    Result getUnreadMessages(GetUnreadMessages value),
    Result historyMessage(HistoryMessage value),
    Result getPermission(GetPermission value),
    Result getReceiveMsg(GetReceiveMsg value),
    Result setJPushRid(SetJPushRid value),
    Result managerRemindList(ManagerRemindList value),
    Result managerRemindDetails(ManagerRemindDetails value),
    Result refreshRemindList(RefreshRemindList value),
    Result unreadMessageCount(UnreadMessageCount value),
    Result batchUpdate(BatchUpdate value),
    Result unreadList(UnreadList value),
    Result sendChatMessageVoice(SendChatMessageVoice value),
    Result gethistory(GetHistory value),
    Result getSalesmanLists(GetSalesmanLists value),
    Result getProcessDefinition(GetProcessDefinition value),
    Result isBottomSheet(IsBottomSheet value),
    Result slideshow(Slideshow value),
    Result getRoles(GetRoles value),
    Result getAffiliated(GetAffiliated value),
    Result submitTestUserInfo(SubmitTestUserInfo value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (batchUpdate != null) {
      return batchUpdate(this);
    }
    return orElse();
  }
}

abstract class BatchUpdate implements WebScoketEvent {
  const factory BatchUpdate() = _$BatchUpdate;
}

/// @nodoc
abstract class $UnreadListCopyWith<$Res> {
  factory $UnreadListCopyWith(
          UnreadList value, $Res Function(UnreadList) then) =
      _$UnreadListCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnreadListCopyWithImpl<$Res> extends _$WebScoketEventCopyWithImpl<$Res>
    implements $UnreadListCopyWith<$Res> {
  _$UnreadListCopyWithImpl(UnreadList _value, $Res Function(UnreadList) _then)
      : super(_value, (v) => _then(v as UnreadList));

  @override
  UnreadList get _value => super._value as UnreadList;
}

/// @nodoc
class _$UnreadList implements UnreadList {
  const _$UnreadList();

  @override
  String toString() {
    return 'WebScoketEvent.unreadList()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UnreadList);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result connectWebsocket(),
    @required Result sendChatMessage(String msg, String type, String contactId),
    @required Result disconnectWebsocket(),
    @required Result getContacts(),
    @required Result getId(String contactId),
    @required Result getUnreadMessages(),
    @required Result historyMessage(String contactId, int index, int sizeNum),
    @required Result getPermission(),
    @required Result getReceiveMsg(),
    @required Result setJPushRid(),
    @required Result managerRemindList(int index),
    @required Result managerRemindDetails(String phone, String tenantId),
    @required Result refreshRemindList(),
    @required Result unreadMessageCount(),
    @required Result batchUpdate(),
    @required Result unreadList(),
    @required
        Result sendChatMessageVoice(
            String msg, String type, String contactId, int duration),
    @required Result gethistory(String instanceId),
    @required Result getSalesmanLists(),
    @required Result getProcessDefinition(String phone, String salesmanId),
    @required Result isBottomSheet(),
    @required Result slideshow(),
    @required Result getRoles(),
    @required Result getAffiliated(),
    @required
        Result submitTestUserInfo(String image, String name, String nickName,
            String sex, String role, List<dynamic> listAffiliated),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return unreadList();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result connectWebsocket(),
    Result sendChatMessage(String msg, String type, String contactId),
    Result disconnectWebsocket(),
    Result getContacts(),
    Result getId(String contactId),
    Result getUnreadMessages(),
    Result historyMessage(String contactId, int index, int sizeNum),
    Result getPermission(),
    Result getReceiveMsg(),
    Result setJPushRid(),
    Result managerRemindList(int index),
    Result managerRemindDetails(String phone, String tenantId),
    Result refreshRemindList(),
    Result unreadMessageCount(),
    Result batchUpdate(),
    Result unreadList(),
    Result sendChatMessageVoice(
        String msg, String type, String contactId, int duration),
    Result gethistory(String instanceId),
    Result getSalesmanLists(),
    Result getProcessDefinition(String phone, String salesmanId),
    Result isBottomSheet(),
    Result slideshow(),
    Result getRoles(),
    Result getAffiliated(),
    Result submitTestUserInfo(String image, String name, String nickName,
        String sex, String role, List<dynamic> listAffiliated),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unreadList != null) {
      return unreadList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result connectWebsocket(ConnectWebsocket value),
    @required Result sendChatMessage(SendChatMessage value),
    @required Result disconnectWebsocket(DisconnectWebsocket value),
    @required Result getContacts(GetContacts value),
    @required Result getId(GetId value),
    @required Result getUnreadMessages(GetUnreadMessages value),
    @required Result historyMessage(HistoryMessage value),
    @required Result getPermission(GetPermission value),
    @required Result getReceiveMsg(GetReceiveMsg value),
    @required Result setJPushRid(SetJPushRid value),
    @required Result managerRemindList(ManagerRemindList value),
    @required Result managerRemindDetails(ManagerRemindDetails value),
    @required Result refreshRemindList(RefreshRemindList value),
    @required Result unreadMessageCount(UnreadMessageCount value),
    @required Result batchUpdate(BatchUpdate value),
    @required Result unreadList(UnreadList value),
    @required Result sendChatMessageVoice(SendChatMessageVoice value),
    @required Result gethistory(GetHistory value),
    @required Result getSalesmanLists(GetSalesmanLists value),
    @required Result getProcessDefinition(GetProcessDefinition value),
    @required Result isBottomSheet(IsBottomSheet value),
    @required Result slideshow(Slideshow value),
    @required Result getRoles(GetRoles value),
    @required Result getAffiliated(GetAffiliated value),
    @required Result submitTestUserInfo(SubmitTestUserInfo value),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return unreadList(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result connectWebsocket(ConnectWebsocket value),
    Result sendChatMessage(SendChatMessage value),
    Result disconnectWebsocket(DisconnectWebsocket value),
    Result getContacts(GetContacts value),
    Result getId(GetId value),
    Result getUnreadMessages(GetUnreadMessages value),
    Result historyMessage(HistoryMessage value),
    Result getPermission(GetPermission value),
    Result getReceiveMsg(GetReceiveMsg value),
    Result setJPushRid(SetJPushRid value),
    Result managerRemindList(ManagerRemindList value),
    Result managerRemindDetails(ManagerRemindDetails value),
    Result refreshRemindList(RefreshRemindList value),
    Result unreadMessageCount(UnreadMessageCount value),
    Result batchUpdate(BatchUpdate value),
    Result unreadList(UnreadList value),
    Result sendChatMessageVoice(SendChatMessageVoice value),
    Result gethistory(GetHistory value),
    Result getSalesmanLists(GetSalesmanLists value),
    Result getProcessDefinition(GetProcessDefinition value),
    Result isBottomSheet(IsBottomSheet value),
    Result slideshow(Slideshow value),
    Result getRoles(GetRoles value),
    Result getAffiliated(GetAffiliated value),
    Result submitTestUserInfo(SubmitTestUserInfo value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unreadList != null) {
      return unreadList(this);
    }
    return orElse();
  }
}

abstract class UnreadList implements WebScoketEvent {
  const factory UnreadList() = _$UnreadList;
}

/// @nodoc
abstract class $SendChatMessageVoiceCopyWith<$Res> {
  factory $SendChatMessageVoiceCopyWith(SendChatMessageVoice value,
          $Res Function(SendChatMessageVoice) then) =
      _$SendChatMessageVoiceCopyWithImpl<$Res>;
  $Res call({String msg, String type, String contactId, int duration});
}

/// @nodoc
class _$SendChatMessageVoiceCopyWithImpl<$Res>
    extends _$WebScoketEventCopyWithImpl<$Res>
    implements $SendChatMessageVoiceCopyWith<$Res> {
  _$SendChatMessageVoiceCopyWithImpl(
      SendChatMessageVoice _value, $Res Function(SendChatMessageVoice) _then)
      : super(_value, (v) => _then(v as SendChatMessageVoice));

  @override
  SendChatMessageVoice get _value => super._value as SendChatMessageVoice;

  @override
  $Res call({
    Object msg = freezed,
    Object type = freezed,
    Object contactId = freezed,
    Object duration = freezed,
  }) {
    return _then(SendChatMessageVoice(
      msg == freezed ? _value.msg : msg as String,
      type == freezed ? _value.type : type as String,
      contactId == freezed ? _value.contactId : contactId as String,
      duration == freezed ? _value.duration : duration as int,
    ));
  }
}

/// @nodoc
class _$SendChatMessageVoice implements SendChatMessageVoice {
  const _$SendChatMessageVoice(
      this.msg, this.type, this.contactId, this.duration)
      : assert(msg != null),
        assert(type != null),
        assert(contactId != null),
        assert(duration != null);

  @override
  final String msg;
  @override
  final String type;
  @override
  final String contactId;
  @override
  final int duration;

  @override
  String toString() {
    return 'WebScoketEvent.sendChatMessageVoice(msg: $msg, type: $type, contactId: $contactId, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SendChatMessageVoice &&
            (identical(other.msg, msg) ||
                const DeepCollectionEquality().equals(other.msg, msg)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.contactId, contactId) ||
                const DeepCollectionEquality()
                    .equals(other.contactId, contactId)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(msg) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(contactId) ^
      const DeepCollectionEquality().hash(duration);

  @override
  $SendChatMessageVoiceCopyWith<SendChatMessageVoice> get copyWith =>
      _$SendChatMessageVoiceCopyWithImpl<SendChatMessageVoice>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result connectWebsocket(),
    @required Result sendChatMessage(String msg, String type, String contactId),
    @required Result disconnectWebsocket(),
    @required Result getContacts(),
    @required Result getId(String contactId),
    @required Result getUnreadMessages(),
    @required Result historyMessage(String contactId, int index, int sizeNum),
    @required Result getPermission(),
    @required Result getReceiveMsg(),
    @required Result setJPushRid(),
    @required Result managerRemindList(int index),
    @required Result managerRemindDetails(String phone, String tenantId),
    @required Result refreshRemindList(),
    @required Result unreadMessageCount(),
    @required Result batchUpdate(),
    @required Result unreadList(),
    @required
        Result sendChatMessageVoice(
            String msg, String type, String contactId, int duration),
    @required Result gethistory(String instanceId),
    @required Result getSalesmanLists(),
    @required Result getProcessDefinition(String phone, String salesmanId),
    @required Result isBottomSheet(),
    @required Result slideshow(),
    @required Result getRoles(),
    @required Result getAffiliated(),
    @required
        Result submitTestUserInfo(String image, String name, String nickName,
            String sex, String role, List<dynamic> listAffiliated),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return sendChatMessageVoice(msg, type, contactId, duration);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result connectWebsocket(),
    Result sendChatMessage(String msg, String type, String contactId),
    Result disconnectWebsocket(),
    Result getContacts(),
    Result getId(String contactId),
    Result getUnreadMessages(),
    Result historyMessage(String contactId, int index, int sizeNum),
    Result getPermission(),
    Result getReceiveMsg(),
    Result setJPushRid(),
    Result managerRemindList(int index),
    Result managerRemindDetails(String phone, String tenantId),
    Result refreshRemindList(),
    Result unreadMessageCount(),
    Result batchUpdate(),
    Result unreadList(),
    Result sendChatMessageVoice(
        String msg, String type, String contactId, int duration),
    Result gethistory(String instanceId),
    Result getSalesmanLists(),
    Result getProcessDefinition(String phone, String salesmanId),
    Result isBottomSheet(),
    Result slideshow(),
    Result getRoles(),
    Result getAffiliated(),
    Result submitTestUserInfo(String image, String name, String nickName,
        String sex, String role, List<dynamic> listAffiliated),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendChatMessageVoice != null) {
      return sendChatMessageVoice(msg, type, contactId, duration);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result connectWebsocket(ConnectWebsocket value),
    @required Result sendChatMessage(SendChatMessage value),
    @required Result disconnectWebsocket(DisconnectWebsocket value),
    @required Result getContacts(GetContacts value),
    @required Result getId(GetId value),
    @required Result getUnreadMessages(GetUnreadMessages value),
    @required Result historyMessage(HistoryMessage value),
    @required Result getPermission(GetPermission value),
    @required Result getReceiveMsg(GetReceiveMsg value),
    @required Result setJPushRid(SetJPushRid value),
    @required Result managerRemindList(ManagerRemindList value),
    @required Result managerRemindDetails(ManagerRemindDetails value),
    @required Result refreshRemindList(RefreshRemindList value),
    @required Result unreadMessageCount(UnreadMessageCount value),
    @required Result batchUpdate(BatchUpdate value),
    @required Result unreadList(UnreadList value),
    @required Result sendChatMessageVoice(SendChatMessageVoice value),
    @required Result gethistory(GetHistory value),
    @required Result getSalesmanLists(GetSalesmanLists value),
    @required Result getProcessDefinition(GetProcessDefinition value),
    @required Result isBottomSheet(IsBottomSheet value),
    @required Result slideshow(Slideshow value),
    @required Result getRoles(GetRoles value),
    @required Result getAffiliated(GetAffiliated value),
    @required Result submitTestUserInfo(SubmitTestUserInfo value),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return sendChatMessageVoice(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result connectWebsocket(ConnectWebsocket value),
    Result sendChatMessage(SendChatMessage value),
    Result disconnectWebsocket(DisconnectWebsocket value),
    Result getContacts(GetContacts value),
    Result getId(GetId value),
    Result getUnreadMessages(GetUnreadMessages value),
    Result historyMessage(HistoryMessage value),
    Result getPermission(GetPermission value),
    Result getReceiveMsg(GetReceiveMsg value),
    Result setJPushRid(SetJPushRid value),
    Result managerRemindList(ManagerRemindList value),
    Result managerRemindDetails(ManagerRemindDetails value),
    Result refreshRemindList(RefreshRemindList value),
    Result unreadMessageCount(UnreadMessageCount value),
    Result batchUpdate(BatchUpdate value),
    Result unreadList(UnreadList value),
    Result sendChatMessageVoice(SendChatMessageVoice value),
    Result gethistory(GetHistory value),
    Result getSalesmanLists(GetSalesmanLists value),
    Result getProcessDefinition(GetProcessDefinition value),
    Result isBottomSheet(IsBottomSheet value),
    Result slideshow(Slideshow value),
    Result getRoles(GetRoles value),
    Result getAffiliated(GetAffiliated value),
    Result submitTestUserInfo(SubmitTestUserInfo value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendChatMessageVoice != null) {
      return sendChatMessageVoice(this);
    }
    return orElse();
  }
}

abstract class SendChatMessageVoice implements WebScoketEvent {
  const factory SendChatMessageVoice(
          String msg, String type, String contactId, int duration) =
      _$SendChatMessageVoice;

  String get msg;
  String get type;
  String get contactId;
  int get duration;
  $SendChatMessageVoiceCopyWith<SendChatMessageVoice> get copyWith;
}

/// @nodoc
abstract class $GetHistoryCopyWith<$Res> {
  factory $GetHistoryCopyWith(
          GetHistory value, $Res Function(GetHistory) then) =
      _$GetHistoryCopyWithImpl<$Res>;
  $Res call({String instanceId});
}

/// @nodoc
class _$GetHistoryCopyWithImpl<$Res> extends _$WebScoketEventCopyWithImpl<$Res>
    implements $GetHistoryCopyWith<$Res> {
  _$GetHistoryCopyWithImpl(GetHistory _value, $Res Function(GetHistory) _then)
      : super(_value, (v) => _then(v as GetHistory));

  @override
  GetHistory get _value => super._value as GetHistory;

  @override
  $Res call({
    Object instanceId = freezed,
  }) {
    return _then(GetHistory(
      instanceId == freezed ? _value.instanceId : instanceId as String,
    ));
  }
}

/// @nodoc
class _$GetHistory implements GetHistory {
  const _$GetHistory(this.instanceId) : assert(instanceId != null);

  @override
  final String instanceId;

  @override
  String toString() {
    return 'WebScoketEvent.gethistory(instanceId: $instanceId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetHistory &&
            (identical(other.instanceId, instanceId) ||
                const DeepCollectionEquality()
                    .equals(other.instanceId, instanceId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(instanceId);

  @override
  $GetHistoryCopyWith<GetHistory> get copyWith =>
      _$GetHistoryCopyWithImpl<GetHistory>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result connectWebsocket(),
    @required Result sendChatMessage(String msg, String type, String contactId),
    @required Result disconnectWebsocket(),
    @required Result getContacts(),
    @required Result getId(String contactId),
    @required Result getUnreadMessages(),
    @required Result historyMessage(String contactId, int index, int sizeNum),
    @required Result getPermission(),
    @required Result getReceiveMsg(),
    @required Result setJPushRid(),
    @required Result managerRemindList(int index),
    @required Result managerRemindDetails(String phone, String tenantId),
    @required Result refreshRemindList(),
    @required Result unreadMessageCount(),
    @required Result batchUpdate(),
    @required Result unreadList(),
    @required
        Result sendChatMessageVoice(
            String msg, String type, String contactId, int duration),
    @required Result gethistory(String instanceId),
    @required Result getSalesmanLists(),
    @required Result getProcessDefinition(String phone, String salesmanId),
    @required Result isBottomSheet(),
    @required Result slideshow(),
    @required Result getRoles(),
    @required Result getAffiliated(),
    @required
        Result submitTestUserInfo(String image, String name, String nickName,
            String sex, String role, List<dynamic> listAffiliated),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return gethistory(instanceId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result connectWebsocket(),
    Result sendChatMessage(String msg, String type, String contactId),
    Result disconnectWebsocket(),
    Result getContacts(),
    Result getId(String contactId),
    Result getUnreadMessages(),
    Result historyMessage(String contactId, int index, int sizeNum),
    Result getPermission(),
    Result getReceiveMsg(),
    Result setJPushRid(),
    Result managerRemindList(int index),
    Result managerRemindDetails(String phone, String tenantId),
    Result refreshRemindList(),
    Result unreadMessageCount(),
    Result batchUpdate(),
    Result unreadList(),
    Result sendChatMessageVoice(
        String msg, String type, String contactId, int duration),
    Result gethistory(String instanceId),
    Result getSalesmanLists(),
    Result getProcessDefinition(String phone, String salesmanId),
    Result isBottomSheet(),
    Result slideshow(),
    Result getRoles(),
    Result getAffiliated(),
    Result submitTestUserInfo(String image, String name, String nickName,
        String sex, String role, List<dynamic> listAffiliated),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (gethistory != null) {
      return gethistory(instanceId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result connectWebsocket(ConnectWebsocket value),
    @required Result sendChatMessage(SendChatMessage value),
    @required Result disconnectWebsocket(DisconnectWebsocket value),
    @required Result getContacts(GetContacts value),
    @required Result getId(GetId value),
    @required Result getUnreadMessages(GetUnreadMessages value),
    @required Result historyMessage(HistoryMessage value),
    @required Result getPermission(GetPermission value),
    @required Result getReceiveMsg(GetReceiveMsg value),
    @required Result setJPushRid(SetJPushRid value),
    @required Result managerRemindList(ManagerRemindList value),
    @required Result managerRemindDetails(ManagerRemindDetails value),
    @required Result refreshRemindList(RefreshRemindList value),
    @required Result unreadMessageCount(UnreadMessageCount value),
    @required Result batchUpdate(BatchUpdate value),
    @required Result unreadList(UnreadList value),
    @required Result sendChatMessageVoice(SendChatMessageVoice value),
    @required Result gethistory(GetHistory value),
    @required Result getSalesmanLists(GetSalesmanLists value),
    @required Result getProcessDefinition(GetProcessDefinition value),
    @required Result isBottomSheet(IsBottomSheet value),
    @required Result slideshow(Slideshow value),
    @required Result getRoles(GetRoles value),
    @required Result getAffiliated(GetAffiliated value),
    @required Result submitTestUserInfo(SubmitTestUserInfo value),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return gethistory(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result connectWebsocket(ConnectWebsocket value),
    Result sendChatMessage(SendChatMessage value),
    Result disconnectWebsocket(DisconnectWebsocket value),
    Result getContacts(GetContacts value),
    Result getId(GetId value),
    Result getUnreadMessages(GetUnreadMessages value),
    Result historyMessage(HistoryMessage value),
    Result getPermission(GetPermission value),
    Result getReceiveMsg(GetReceiveMsg value),
    Result setJPushRid(SetJPushRid value),
    Result managerRemindList(ManagerRemindList value),
    Result managerRemindDetails(ManagerRemindDetails value),
    Result refreshRemindList(RefreshRemindList value),
    Result unreadMessageCount(UnreadMessageCount value),
    Result batchUpdate(BatchUpdate value),
    Result unreadList(UnreadList value),
    Result sendChatMessageVoice(SendChatMessageVoice value),
    Result gethistory(GetHistory value),
    Result getSalesmanLists(GetSalesmanLists value),
    Result getProcessDefinition(GetProcessDefinition value),
    Result isBottomSheet(IsBottomSheet value),
    Result slideshow(Slideshow value),
    Result getRoles(GetRoles value),
    Result getAffiliated(GetAffiliated value),
    Result submitTestUserInfo(SubmitTestUserInfo value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (gethistory != null) {
      return gethistory(this);
    }
    return orElse();
  }
}

abstract class GetHistory implements WebScoketEvent {
  const factory GetHistory(String instanceId) = _$GetHistory;

  String get instanceId;
  $GetHistoryCopyWith<GetHistory> get copyWith;
}

/// @nodoc
abstract class $GetSalesmanListsCopyWith<$Res> {
  factory $GetSalesmanListsCopyWith(
          GetSalesmanLists value, $Res Function(GetSalesmanLists) then) =
      _$GetSalesmanListsCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetSalesmanListsCopyWithImpl<$Res>
    extends _$WebScoketEventCopyWithImpl<$Res>
    implements $GetSalesmanListsCopyWith<$Res> {
  _$GetSalesmanListsCopyWithImpl(
      GetSalesmanLists _value, $Res Function(GetSalesmanLists) _then)
      : super(_value, (v) => _then(v as GetSalesmanLists));

  @override
  GetSalesmanLists get _value => super._value as GetSalesmanLists;
}

/// @nodoc
class _$GetSalesmanLists implements GetSalesmanLists {
  const _$GetSalesmanLists();

  @override
  String toString() {
    return 'WebScoketEvent.getSalesmanLists()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GetSalesmanLists);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result connectWebsocket(),
    @required Result sendChatMessage(String msg, String type, String contactId),
    @required Result disconnectWebsocket(),
    @required Result getContacts(),
    @required Result getId(String contactId),
    @required Result getUnreadMessages(),
    @required Result historyMessage(String contactId, int index, int sizeNum),
    @required Result getPermission(),
    @required Result getReceiveMsg(),
    @required Result setJPushRid(),
    @required Result managerRemindList(int index),
    @required Result managerRemindDetails(String phone, String tenantId),
    @required Result refreshRemindList(),
    @required Result unreadMessageCount(),
    @required Result batchUpdate(),
    @required Result unreadList(),
    @required
        Result sendChatMessageVoice(
            String msg, String type, String contactId, int duration),
    @required Result gethistory(String instanceId),
    @required Result getSalesmanLists(),
    @required Result getProcessDefinition(String phone, String salesmanId),
    @required Result isBottomSheet(),
    @required Result slideshow(),
    @required Result getRoles(),
    @required Result getAffiliated(),
    @required
        Result submitTestUserInfo(String image, String name, String nickName,
            String sex, String role, List<dynamic> listAffiliated),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return getSalesmanLists();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result connectWebsocket(),
    Result sendChatMessage(String msg, String type, String contactId),
    Result disconnectWebsocket(),
    Result getContacts(),
    Result getId(String contactId),
    Result getUnreadMessages(),
    Result historyMessage(String contactId, int index, int sizeNum),
    Result getPermission(),
    Result getReceiveMsg(),
    Result setJPushRid(),
    Result managerRemindList(int index),
    Result managerRemindDetails(String phone, String tenantId),
    Result refreshRemindList(),
    Result unreadMessageCount(),
    Result batchUpdate(),
    Result unreadList(),
    Result sendChatMessageVoice(
        String msg, String type, String contactId, int duration),
    Result gethistory(String instanceId),
    Result getSalesmanLists(),
    Result getProcessDefinition(String phone, String salesmanId),
    Result isBottomSheet(),
    Result slideshow(),
    Result getRoles(),
    Result getAffiliated(),
    Result submitTestUserInfo(String image, String name, String nickName,
        String sex, String role, List<dynamic> listAffiliated),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getSalesmanLists != null) {
      return getSalesmanLists();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result connectWebsocket(ConnectWebsocket value),
    @required Result sendChatMessage(SendChatMessage value),
    @required Result disconnectWebsocket(DisconnectWebsocket value),
    @required Result getContacts(GetContacts value),
    @required Result getId(GetId value),
    @required Result getUnreadMessages(GetUnreadMessages value),
    @required Result historyMessage(HistoryMessage value),
    @required Result getPermission(GetPermission value),
    @required Result getReceiveMsg(GetReceiveMsg value),
    @required Result setJPushRid(SetJPushRid value),
    @required Result managerRemindList(ManagerRemindList value),
    @required Result managerRemindDetails(ManagerRemindDetails value),
    @required Result refreshRemindList(RefreshRemindList value),
    @required Result unreadMessageCount(UnreadMessageCount value),
    @required Result batchUpdate(BatchUpdate value),
    @required Result unreadList(UnreadList value),
    @required Result sendChatMessageVoice(SendChatMessageVoice value),
    @required Result gethistory(GetHistory value),
    @required Result getSalesmanLists(GetSalesmanLists value),
    @required Result getProcessDefinition(GetProcessDefinition value),
    @required Result isBottomSheet(IsBottomSheet value),
    @required Result slideshow(Slideshow value),
    @required Result getRoles(GetRoles value),
    @required Result getAffiliated(GetAffiliated value),
    @required Result submitTestUserInfo(SubmitTestUserInfo value),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return getSalesmanLists(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result connectWebsocket(ConnectWebsocket value),
    Result sendChatMessage(SendChatMessage value),
    Result disconnectWebsocket(DisconnectWebsocket value),
    Result getContacts(GetContacts value),
    Result getId(GetId value),
    Result getUnreadMessages(GetUnreadMessages value),
    Result historyMessage(HistoryMessage value),
    Result getPermission(GetPermission value),
    Result getReceiveMsg(GetReceiveMsg value),
    Result setJPushRid(SetJPushRid value),
    Result managerRemindList(ManagerRemindList value),
    Result managerRemindDetails(ManagerRemindDetails value),
    Result refreshRemindList(RefreshRemindList value),
    Result unreadMessageCount(UnreadMessageCount value),
    Result batchUpdate(BatchUpdate value),
    Result unreadList(UnreadList value),
    Result sendChatMessageVoice(SendChatMessageVoice value),
    Result gethistory(GetHistory value),
    Result getSalesmanLists(GetSalesmanLists value),
    Result getProcessDefinition(GetProcessDefinition value),
    Result isBottomSheet(IsBottomSheet value),
    Result slideshow(Slideshow value),
    Result getRoles(GetRoles value),
    Result getAffiliated(GetAffiliated value),
    Result submitTestUserInfo(SubmitTestUserInfo value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getSalesmanLists != null) {
      return getSalesmanLists(this);
    }
    return orElse();
  }
}

abstract class GetSalesmanLists implements WebScoketEvent {
  const factory GetSalesmanLists() = _$GetSalesmanLists;
}

/// @nodoc
abstract class $GetProcessDefinitionCopyWith<$Res> {
  factory $GetProcessDefinitionCopyWith(GetProcessDefinition value,
          $Res Function(GetProcessDefinition) then) =
      _$GetProcessDefinitionCopyWithImpl<$Res>;
  $Res call({String phone, String salesmanId});
}

/// @nodoc
class _$GetProcessDefinitionCopyWithImpl<$Res>
    extends _$WebScoketEventCopyWithImpl<$Res>
    implements $GetProcessDefinitionCopyWith<$Res> {
  _$GetProcessDefinitionCopyWithImpl(
      GetProcessDefinition _value, $Res Function(GetProcessDefinition) _then)
      : super(_value, (v) => _then(v as GetProcessDefinition));

  @override
  GetProcessDefinition get _value => super._value as GetProcessDefinition;

  @override
  $Res call({
    Object phone = freezed,
    Object salesmanId = freezed,
  }) {
    return _then(GetProcessDefinition(
      phone == freezed ? _value.phone : phone as String,
      salesmanId == freezed ? _value.salesmanId : salesmanId as String,
    ));
  }
}

/// @nodoc
class _$GetProcessDefinition implements GetProcessDefinition {
  const _$GetProcessDefinition(this.phone, this.salesmanId)
      : assert(phone != null),
        assert(salesmanId != null);

  @override
  final String phone;
  @override
  final String salesmanId;

  @override
  String toString() {
    return 'WebScoketEvent.getProcessDefinition(phone: $phone, salesmanId: $salesmanId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetProcessDefinition &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.salesmanId, salesmanId) ||
                const DeepCollectionEquality()
                    .equals(other.salesmanId, salesmanId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(salesmanId);

  @override
  $GetProcessDefinitionCopyWith<GetProcessDefinition> get copyWith =>
      _$GetProcessDefinitionCopyWithImpl<GetProcessDefinition>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result connectWebsocket(),
    @required Result sendChatMessage(String msg, String type, String contactId),
    @required Result disconnectWebsocket(),
    @required Result getContacts(),
    @required Result getId(String contactId),
    @required Result getUnreadMessages(),
    @required Result historyMessage(String contactId, int index, int sizeNum),
    @required Result getPermission(),
    @required Result getReceiveMsg(),
    @required Result setJPushRid(),
    @required Result managerRemindList(int index),
    @required Result managerRemindDetails(String phone, String tenantId),
    @required Result refreshRemindList(),
    @required Result unreadMessageCount(),
    @required Result batchUpdate(),
    @required Result unreadList(),
    @required
        Result sendChatMessageVoice(
            String msg, String type, String contactId, int duration),
    @required Result gethistory(String instanceId),
    @required Result getSalesmanLists(),
    @required Result getProcessDefinition(String phone, String salesmanId),
    @required Result isBottomSheet(),
    @required Result slideshow(),
    @required Result getRoles(),
    @required Result getAffiliated(),
    @required
        Result submitTestUserInfo(String image, String name, String nickName,
            String sex, String role, List<dynamic> listAffiliated),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return getProcessDefinition(phone, salesmanId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result connectWebsocket(),
    Result sendChatMessage(String msg, String type, String contactId),
    Result disconnectWebsocket(),
    Result getContacts(),
    Result getId(String contactId),
    Result getUnreadMessages(),
    Result historyMessage(String contactId, int index, int sizeNum),
    Result getPermission(),
    Result getReceiveMsg(),
    Result setJPushRid(),
    Result managerRemindList(int index),
    Result managerRemindDetails(String phone, String tenantId),
    Result refreshRemindList(),
    Result unreadMessageCount(),
    Result batchUpdate(),
    Result unreadList(),
    Result sendChatMessageVoice(
        String msg, String type, String contactId, int duration),
    Result gethistory(String instanceId),
    Result getSalesmanLists(),
    Result getProcessDefinition(String phone, String salesmanId),
    Result isBottomSheet(),
    Result slideshow(),
    Result getRoles(),
    Result getAffiliated(),
    Result submitTestUserInfo(String image, String name, String nickName,
        String sex, String role, List<dynamic> listAffiliated),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getProcessDefinition != null) {
      return getProcessDefinition(phone, salesmanId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result connectWebsocket(ConnectWebsocket value),
    @required Result sendChatMessage(SendChatMessage value),
    @required Result disconnectWebsocket(DisconnectWebsocket value),
    @required Result getContacts(GetContacts value),
    @required Result getId(GetId value),
    @required Result getUnreadMessages(GetUnreadMessages value),
    @required Result historyMessage(HistoryMessage value),
    @required Result getPermission(GetPermission value),
    @required Result getReceiveMsg(GetReceiveMsg value),
    @required Result setJPushRid(SetJPushRid value),
    @required Result managerRemindList(ManagerRemindList value),
    @required Result managerRemindDetails(ManagerRemindDetails value),
    @required Result refreshRemindList(RefreshRemindList value),
    @required Result unreadMessageCount(UnreadMessageCount value),
    @required Result batchUpdate(BatchUpdate value),
    @required Result unreadList(UnreadList value),
    @required Result sendChatMessageVoice(SendChatMessageVoice value),
    @required Result gethistory(GetHistory value),
    @required Result getSalesmanLists(GetSalesmanLists value),
    @required Result getProcessDefinition(GetProcessDefinition value),
    @required Result isBottomSheet(IsBottomSheet value),
    @required Result slideshow(Slideshow value),
    @required Result getRoles(GetRoles value),
    @required Result getAffiliated(GetAffiliated value),
    @required Result submitTestUserInfo(SubmitTestUserInfo value),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return getProcessDefinition(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result connectWebsocket(ConnectWebsocket value),
    Result sendChatMessage(SendChatMessage value),
    Result disconnectWebsocket(DisconnectWebsocket value),
    Result getContacts(GetContacts value),
    Result getId(GetId value),
    Result getUnreadMessages(GetUnreadMessages value),
    Result historyMessage(HistoryMessage value),
    Result getPermission(GetPermission value),
    Result getReceiveMsg(GetReceiveMsg value),
    Result setJPushRid(SetJPushRid value),
    Result managerRemindList(ManagerRemindList value),
    Result managerRemindDetails(ManagerRemindDetails value),
    Result refreshRemindList(RefreshRemindList value),
    Result unreadMessageCount(UnreadMessageCount value),
    Result batchUpdate(BatchUpdate value),
    Result unreadList(UnreadList value),
    Result sendChatMessageVoice(SendChatMessageVoice value),
    Result gethistory(GetHistory value),
    Result getSalesmanLists(GetSalesmanLists value),
    Result getProcessDefinition(GetProcessDefinition value),
    Result isBottomSheet(IsBottomSheet value),
    Result slideshow(Slideshow value),
    Result getRoles(GetRoles value),
    Result getAffiliated(GetAffiliated value),
    Result submitTestUserInfo(SubmitTestUserInfo value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getProcessDefinition != null) {
      return getProcessDefinition(this);
    }
    return orElse();
  }
}

abstract class GetProcessDefinition implements WebScoketEvent {
  const factory GetProcessDefinition(String phone, String salesmanId) =
      _$GetProcessDefinition;

  String get phone;
  String get salesmanId;
  $GetProcessDefinitionCopyWith<GetProcessDefinition> get copyWith;
}

/// @nodoc
abstract class $IsBottomSheetCopyWith<$Res> {
  factory $IsBottomSheetCopyWith(
          IsBottomSheet value, $Res Function(IsBottomSheet) then) =
      _$IsBottomSheetCopyWithImpl<$Res>;
}

/// @nodoc
class _$IsBottomSheetCopyWithImpl<$Res>
    extends _$WebScoketEventCopyWithImpl<$Res>
    implements $IsBottomSheetCopyWith<$Res> {
  _$IsBottomSheetCopyWithImpl(
      IsBottomSheet _value, $Res Function(IsBottomSheet) _then)
      : super(_value, (v) => _then(v as IsBottomSheet));

  @override
  IsBottomSheet get _value => super._value as IsBottomSheet;
}

/// @nodoc
class _$IsBottomSheet implements IsBottomSheet {
  const _$IsBottomSheet();

  @override
  String toString() {
    return 'WebScoketEvent.isBottomSheet()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is IsBottomSheet);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result connectWebsocket(),
    @required Result sendChatMessage(String msg, String type, String contactId),
    @required Result disconnectWebsocket(),
    @required Result getContacts(),
    @required Result getId(String contactId),
    @required Result getUnreadMessages(),
    @required Result historyMessage(String contactId, int index, int sizeNum),
    @required Result getPermission(),
    @required Result getReceiveMsg(),
    @required Result setJPushRid(),
    @required Result managerRemindList(int index),
    @required Result managerRemindDetails(String phone, String tenantId),
    @required Result refreshRemindList(),
    @required Result unreadMessageCount(),
    @required Result batchUpdate(),
    @required Result unreadList(),
    @required
        Result sendChatMessageVoice(
            String msg, String type, String contactId, int duration),
    @required Result gethistory(String instanceId),
    @required Result getSalesmanLists(),
    @required Result getProcessDefinition(String phone, String salesmanId),
    @required Result isBottomSheet(),
    @required Result slideshow(),
    @required Result getRoles(),
    @required Result getAffiliated(),
    @required
        Result submitTestUserInfo(String image, String name, String nickName,
            String sex, String role, List<dynamic> listAffiliated),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return isBottomSheet();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result connectWebsocket(),
    Result sendChatMessage(String msg, String type, String contactId),
    Result disconnectWebsocket(),
    Result getContacts(),
    Result getId(String contactId),
    Result getUnreadMessages(),
    Result historyMessage(String contactId, int index, int sizeNum),
    Result getPermission(),
    Result getReceiveMsg(),
    Result setJPushRid(),
    Result managerRemindList(int index),
    Result managerRemindDetails(String phone, String tenantId),
    Result refreshRemindList(),
    Result unreadMessageCount(),
    Result batchUpdate(),
    Result unreadList(),
    Result sendChatMessageVoice(
        String msg, String type, String contactId, int duration),
    Result gethistory(String instanceId),
    Result getSalesmanLists(),
    Result getProcessDefinition(String phone, String salesmanId),
    Result isBottomSheet(),
    Result slideshow(),
    Result getRoles(),
    Result getAffiliated(),
    Result submitTestUserInfo(String image, String name, String nickName,
        String sex, String role, List<dynamic> listAffiliated),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (isBottomSheet != null) {
      return isBottomSheet();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result connectWebsocket(ConnectWebsocket value),
    @required Result sendChatMessage(SendChatMessage value),
    @required Result disconnectWebsocket(DisconnectWebsocket value),
    @required Result getContacts(GetContacts value),
    @required Result getId(GetId value),
    @required Result getUnreadMessages(GetUnreadMessages value),
    @required Result historyMessage(HistoryMessage value),
    @required Result getPermission(GetPermission value),
    @required Result getReceiveMsg(GetReceiveMsg value),
    @required Result setJPushRid(SetJPushRid value),
    @required Result managerRemindList(ManagerRemindList value),
    @required Result managerRemindDetails(ManagerRemindDetails value),
    @required Result refreshRemindList(RefreshRemindList value),
    @required Result unreadMessageCount(UnreadMessageCount value),
    @required Result batchUpdate(BatchUpdate value),
    @required Result unreadList(UnreadList value),
    @required Result sendChatMessageVoice(SendChatMessageVoice value),
    @required Result gethistory(GetHistory value),
    @required Result getSalesmanLists(GetSalesmanLists value),
    @required Result getProcessDefinition(GetProcessDefinition value),
    @required Result isBottomSheet(IsBottomSheet value),
    @required Result slideshow(Slideshow value),
    @required Result getRoles(GetRoles value),
    @required Result getAffiliated(GetAffiliated value),
    @required Result submitTestUserInfo(SubmitTestUserInfo value),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return isBottomSheet(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result connectWebsocket(ConnectWebsocket value),
    Result sendChatMessage(SendChatMessage value),
    Result disconnectWebsocket(DisconnectWebsocket value),
    Result getContacts(GetContacts value),
    Result getId(GetId value),
    Result getUnreadMessages(GetUnreadMessages value),
    Result historyMessage(HistoryMessage value),
    Result getPermission(GetPermission value),
    Result getReceiveMsg(GetReceiveMsg value),
    Result setJPushRid(SetJPushRid value),
    Result managerRemindList(ManagerRemindList value),
    Result managerRemindDetails(ManagerRemindDetails value),
    Result refreshRemindList(RefreshRemindList value),
    Result unreadMessageCount(UnreadMessageCount value),
    Result batchUpdate(BatchUpdate value),
    Result unreadList(UnreadList value),
    Result sendChatMessageVoice(SendChatMessageVoice value),
    Result gethistory(GetHistory value),
    Result getSalesmanLists(GetSalesmanLists value),
    Result getProcessDefinition(GetProcessDefinition value),
    Result isBottomSheet(IsBottomSheet value),
    Result slideshow(Slideshow value),
    Result getRoles(GetRoles value),
    Result getAffiliated(GetAffiliated value),
    Result submitTestUserInfo(SubmitTestUserInfo value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (isBottomSheet != null) {
      return isBottomSheet(this);
    }
    return orElse();
  }
}

abstract class IsBottomSheet implements WebScoketEvent {
  const factory IsBottomSheet() = _$IsBottomSheet;
}

/// @nodoc
abstract class $SlideshowCopyWith<$Res> {
  factory $SlideshowCopyWith(Slideshow value, $Res Function(Slideshow) then) =
      _$SlideshowCopyWithImpl<$Res>;
}

/// @nodoc
class _$SlideshowCopyWithImpl<$Res> extends _$WebScoketEventCopyWithImpl<$Res>
    implements $SlideshowCopyWith<$Res> {
  _$SlideshowCopyWithImpl(Slideshow _value, $Res Function(Slideshow) _then)
      : super(_value, (v) => _then(v as Slideshow));

  @override
  Slideshow get _value => super._value as Slideshow;
}

/// @nodoc
class _$Slideshow implements Slideshow {
  const _$Slideshow();

  @override
  String toString() {
    return 'WebScoketEvent.slideshow()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Slideshow);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result connectWebsocket(),
    @required Result sendChatMessage(String msg, String type, String contactId),
    @required Result disconnectWebsocket(),
    @required Result getContacts(),
    @required Result getId(String contactId),
    @required Result getUnreadMessages(),
    @required Result historyMessage(String contactId, int index, int sizeNum),
    @required Result getPermission(),
    @required Result getReceiveMsg(),
    @required Result setJPushRid(),
    @required Result managerRemindList(int index),
    @required Result managerRemindDetails(String phone, String tenantId),
    @required Result refreshRemindList(),
    @required Result unreadMessageCount(),
    @required Result batchUpdate(),
    @required Result unreadList(),
    @required
        Result sendChatMessageVoice(
            String msg, String type, String contactId, int duration),
    @required Result gethistory(String instanceId),
    @required Result getSalesmanLists(),
    @required Result getProcessDefinition(String phone, String salesmanId),
    @required Result isBottomSheet(),
    @required Result slideshow(),
    @required Result getRoles(),
    @required Result getAffiliated(),
    @required
        Result submitTestUserInfo(String image, String name, String nickName,
            String sex, String role, List<dynamic> listAffiliated),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return slideshow();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result connectWebsocket(),
    Result sendChatMessage(String msg, String type, String contactId),
    Result disconnectWebsocket(),
    Result getContacts(),
    Result getId(String contactId),
    Result getUnreadMessages(),
    Result historyMessage(String contactId, int index, int sizeNum),
    Result getPermission(),
    Result getReceiveMsg(),
    Result setJPushRid(),
    Result managerRemindList(int index),
    Result managerRemindDetails(String phone, String tenantId),
    Result refreshRemindList(),
    Result unreadMessageCount(),
    Result batchUpdate(),
    Result unreadList(),
    Result sendChatMessageVoice(
        String msg, String type, String contactId, int duration),
    Result gethistory(String instanceId),
    Result getSalesmanLists(),
    Result getProcessDefinition(String phone, String salesmanId),
    Result isBottomSheet(),
    Result slideshow(),
    Result getRoles(),
    Result getAffiliated(),
    Result submitTestUserInfo(String image, String name, String nickName,
        String sex, String role, List<dynamic> listAffiliated),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (slideshow != null) {
      return slideshow();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result connectWebsocket(ConnectWebsocket value),
    @required Result sendChatMessage(SendChatMessage value),
    @required Result disconnectWebsocket(DisconnectWebsocket value),
    @required Result getContacts(GetContacts value),
    @required Result getId(GetId value),
    @required Result getUnreadMessages(GetUnreadMessages value),
    @required Result historyMessage(HistoryMessage value),
    @required Result getPermission(GetPermission value),
    @required Result getReceiveMsg(GetReceiveMsg value),
    @required Result setJPushRid(SetJPushRid value),
    @required Result managerRemindList(ManagerRemindList value),
    @required Result managerRemindDetails(ManagerRemindDetails value),
    @required Result refreshRemindList(RefreshRemindList value),
    @required Result unreadMessageCount(UnreadMessageCount value),
    @required Result batchUpdate(BatchUpdate value),
    @required Result unreadList(UnreadList value),
    @required Result sendChatMessageVoice(SendChatMessageVoice value),
    @required Result gethistory(GetHistory value),
    @required Result getSalesmanLists(GetSalesmanLists value),
    @required Result getProcessDefinition(GetProcessDefinition value),
    @required Result isBottomSheet(IsBottomSheet value),
    @required Result slideshow(Slideshow value),
    @required Result getRoles(GetRoles value),
    @required Result getAffiliated(GetAffiliated value),
    @required Result submitTestUserInfo(SubmitTestUserInfo value),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return slideshow(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result connectWebsocket(ConnectWebsocket value),
    Result sendChatMessage(SendChatMessage value),
    Result disconnectWebsocket(DisconnectWebsocket value),
    Result getContacts(GetContacts value),
    Result getId(GetId value),
    Result getUnreadMessages(GetUnreadMessages value),
    Result historyMessage(HistoryMessage value),
    Result getPermission(GetPermission value),
    Result getReceiveMsg(GetReceiveMsg value),
    Result setJPushRid(SetJPushRid value),
    Result managerRemindList(ManagerRemindList value),
    Result managerRemindDetails(ManagerRemindDetails value),
    Result refreshRemindList(RefreshRemindList value),
    Result unreadMessageCount(UnreadMessageCount value),
    Result batchUpdate(BatchUpdate value),
    Result unreadList(UnreadList value),
    Result sendChatMessageVoice(SendChatMessageVoice value),
    Result gethistory(GetHistory value),
    Result getSalesmanLists(GetSalesmanLists value),
    Result getProcessDefinition(GetProcessDefinition value),
    Result isBottomSheet(IsBottomSheet value),
    Result slideshow(Slideshow value),
    Result getRoles(GetRoles value),
    Result getAffiliated(GetAffiliated value),
    Result submitTestUserInfo(SubmitTestUserInfo value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (slideshow != null) {
      return slideshow(this);
    }
    return orElse();
  }
}

abstract class Slideshow implements WebScoketEvent {
  const factory Slideshow() = _$Slideshow;
}

/// @nodoc
abstract class $GetRolesCopyWith<$Res> {
  factory $GetRolesCopyWith(GetRoles value, $Res Function(GetRoles) then) =
      _$GetRolesCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetRolesCopyWithImpl<$Res> extends _$WebScoketEventCopyWithImpl<$Res>
    implements $GetRolesCopyWith<$Res> {
  _$GetRolesCopyWithImpl(GetRoles _value, $Res Function(GetRoles) _then)
      : super(_value, (v) => _then(v as GetRoles));

  @override
  GetRoles get _value => super._value as GetRoles;
}

/// @nodoc
class _$GetRoles implements GetRoles {
  const _$GetRoles();

  @override
  String toString() {
    return 'WebScoketEvent.getRoles()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GetRoles);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result connectWebsocket(),
    @required Result sendChatMessage(String msg, String type, String contactId),
    @required Result disconnectWebsocket(),
    @required Result getContacts(),
    @required Result getId(String contactId),
    @required Result getUnreadMessages(),
    @required Result historyMessage(String contactId, int index, int sizeNum),
    @required Result getPermission(),
    @required Result getReceiveMsg(),
    @required Result setJPushRid(),
    @required Result managerRemindList(int index),
    @required Result managerRemindDetails(String phone, String tenantId),
    @required Result refreshRemindList(),
    @required Result unreadMessageCount(),
    @required Result batchUpdate(),
    @required Result unreadList(),
    @required
        Result sendChatMessageVoice(
            String msg, String type, String contactId, int duration),
    @required Result gethistory(String instanceId),
    @required Result getSalesmanLists(),
    @required Result getProcessDefinition(String phone, String salesmanId),
    @required Result isBottomSheet(),
    @required Result slideshow(),
    @required Result getRoles(),
    @required Result getAffiliated(),
    @required
        Result submitTestUserInfo(String image, String name, String nickName,
            String sex, String role, List<dynamic> listAffiliated),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return getRoles();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result connectWebsocket(),
    Result sendChatMessage(String msg, String type, String contactId),
    Result disconnectWebsocket(),
    Result getContacts(),
    Result getId(String contactId),
    Result getUnreadMessages(),
    Result historyMessage(String contactId, int index, int sizeNum),
    Result getPermission(),
    Result getReceiveMsg(),
    Result setJPushRid(),
    Result managerRemindList(int index),
    Result managerRemindDetails(String phone, String tenantId),
    Result refreshRemindList(),
    Result unreadMessageCount(),
    Result batchUpdate(),
    Result unreadList(),
    Result sendChatMessageVoice(
        String msg, String type, String contactId, int duration),
    Result gethistory(String instanceId),
    Result getSalesmanLists(),
    Result getProcessDefinition(String phone, String salesmanId),
    Result isBottomSheet(),
    Result slideshow(),
    Result getRoles(),
    Result getAffiliated(),
    Result submitTestUserInfo(String image, String name, String nickName,
        String sex, String role, List<dynamic> listAffiliated),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getRoles != null) {
      return getRoles();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result connectWebsocket(ConnectWebsocket value),
    @required Result sendChatMessage(SendChatMessage value),
    @required Result disconnectWebsocket(DisconnectWebsocket value),
    @required Result getContacts(GetContacts value),
    @required Result getId(GetId value),
    @required Result getUnreadMessages(GetUnreadMessages value),
    @required Result historyMessage(HistoryMessage value),
    @required Result getPermission(GetPermission value),
    @required Result getReceiveMsg(GetReceiveMsg value),
    @required Result setJPushRid(SetJPushRid value),
    @required Result managerRemindList(ManagerRemindList value),
    @required Result managerRemindDetails(ManagerRemindDetails value),
    @required Result refreshRemindList(RefreshRemindList value),
    @required Result unreadMessageCount(UnreadMessageCount value),
    @required Result batchUpdate(BatchUpdate value),
    @required Result unreadList(UnreadList value),
    @required Result sendChatMessageVoice(SendChatMessageVoice value),
    @required Result gethistory(GetHistory value),
    @required Result getSalesmanLists(GetSalesmanLists value),
    @required Result getProcessDefinition(GetProcessDefinition value),
    @required Result isBottomSheet(IsBottomSheet value),
    @required Result slideshow(Slideshow value),
    @required Result getRoles(GetRoles value),
    @required Result getAffiliated(GetAffiliated value),
    @required Result submitTestUserInfo(SubmitTestUserInfo value),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return getRoles(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result connectWebsocket(ConnectWebsocket value),
    Result sendChatMessage(SendChatMessage value),
    Result disconnectWebsocket(DisconnectWebsocket value),
    Result getContacts(GetContacts value),
    Result getId(GetId value),
    Result getUnreadMessages(GetUnreadMessages value),
    Result historyMessage(HistoryMessage value),
    Result getPermission(GetPermission value),
    Result getReceiveMsg(GetReceiveMsg value),
    Result setJPushRid(SetJPushRid value),
    Result managerRemindList(ManagerRemindList value),
    Result managerRemindDetails(ManagerRemindDetails value),
    Result refreshRemindList(RefreshRemindList value),
    Result unreadMessageCount(UnreadMessageCount value),
    Result batchUpdate(BatchUpdate value),
    Result unreadList(UnreadList value),
    Result sendChatMessageVoice(SendChatMessageVoice value),
    Result gethistory(GetHistory value),
    Result getSalesmanLists(GetSalesmanLists value),
    Result getProcessDefinition(GetProcessDefinition value),
    Result isBottomSheet(IsBottomSheet value),
    Result slideshow(Slideshow value),
    Result getRoles(GetRoles value),
    Result getAffiliated(GetAffiliated value),
    Result submitTestUserInfo(SubmitTestUserInfo value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getRoles != null) {
      return getRoles(this);
    }
    return orElse();
  }
}

abstract class GetRoles implements WebScoketEvent {
  const factory GetRoles() = _$GetRoles;
}

/// @nodoc
abstract class $GetAffiliatedCopyWith<$Res> {
  factory $GetAffiliatedCopyWith(
          GetAffiliated value, $Res Function(GetAffiliated) then) =
      _$GetAffiliatedCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetAffiliatedCopyWithImpl<$Res>
    extends _$WebScoketEventCopyWithImpl<$Res>
    implements $GetAffiliatedCopyWith<$Res> {
  _$GetAffiliatedCopyWithImpl(
      GetAffiliated _value, $Res Function(GetAffiliated) _then)
      : super(_value, (v) => _then(v as GetAffiliated));

  @override
  GetAffiliated get _value => super._value as GetAffiliated;
}

/// @nodoc
class _$GetAffiliated implements GetAffiliated {
  const _$GetAffiliated();

  @override
  String toString() {
    return 'WebScoketEvent.getAffiliated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GetAffiliated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result connectWebsocket(),
    @required Result sendChatMessage(String msg, String type, String contactId),
    @required Result disconnectWebsocket(),
    @required Result getContacts(),
    @required Result getId(String contactId),
    @required Result getUnreadMessages(),
    @required Result historyMessage(String contactId, int index, int sizeNum),
    @required Result getPermission(),
    @required Result getReceiveMsg(),
    @required Result setJPushRid(),
    @required Result managerRemindList(int index),
    @required Result managerRemindDetails(String phone, String tenantId),
    @required Result refreshRemindList(),
    @required Result unreadMessageCount(),
    @required Result batchUpdate(),
    @required Result unreadList(),
    @required
        Result sendChatMessageVoice(
            String msg, String type, String contactId, int duration),
    @required Result gethistory(String instanceId),
    @required Result getSalesmanLists(),
    @required Result getProcessDefinition(String phone, String salesmanId),
    @required Result isBottomSheet(),
    @required Result slideshow(),
    @required Result getRoles(),
    @required Result getAffiliated(),
    @required
        Result submitTestUserInfo(String image, String name, String nickName,
            String sex, String role, List<dynamic> listAffiliated),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return getAffiliated();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result connectWebsocket(),
    Result sendChatMessage(String msg, String type, String contactId),
    Result disconnectWebsocket(),
    Result getContacts(),
    Result getId(String contactId),
    Result getUnreadMessages(),
    Result historyMessage(String contactId, int index, int sizeNum),
    Result getPermission(),
    Result getReceiveMsg(),
    Result setJPushRid(),
    Result managerRemindList(int index),
    Result managerRemindDetails(String phone, String tenantId),
    Result refreshRemindList(),
    Result unreadMessageCount(),
    Result batchUpdate(),
    Result unreadList(),
    Result sendChatMessageVoice(
        String msg, String type, String contactId, int duration),
    Result gethistory(String instanceId),
    Result getSalesmanLists(),
    Result getProcessDefinition(String phone, String salesmanId),
    Result isBottomSheet(),
    Result slideshow(),
    Result getRoles(),
    Result getAffiliated(),
    Result submitTestUserInfo(String image, String name, String nickName,
        String sex, String role, List<dynamic> listAffiliated),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getAffiliated != null) {
      return getAffiliated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result connectWebsocket(ConnectWebsocket value),
    @required Result sendChatMessage(SendChatMessage value),
    @required Result disconnectWebsocket(DisconnectWebsocket value),
    @required Result getContacts(GetContacts value),
    @required Result getId(GetId value),
    @required Result getUnreadMessages(GetUnreadMessages value),
    @required Result historyMessage(HistoryMessage value),
    @required Result getPermission(GetPermission value),
    @required Result getReceiveMsg(GetReceiveMsg value),
    @required Result setJPushRid(SetJPushRid value),
    @required Result managerRemindList(ManagerRemindList value),
    @required Result managerRemindDetails(ManagerRemindDetails value),
    @required Result refreshRemindList(RefreshRemindList value),
    @required Result unreadMessageCount(UnreadMessageCount value),
    @required Result batchUpdate(BatchUpdate value),
    @required Result unreadList(UnreadList value),
    @required Result sendChatMessageVoice(SendChatMessageVoice value),
    @required Result gethistory(GetHistory value),
    @required Result getSalesmanLists(GetSalesmanLists value),
    @required Result getProcessDefinition(GetProcessDefinition value),
    @required Result isBottomSheet(IsBottomSheet value),
    @required Result slideshow(Slideshow value),
    @required Result getRoles(GetRoles value),
    @required Result getAffiliated(GetAffiliated value),
    @required Result submitTestUserInfo(SubmitTestUserInfo value),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return getAffiliated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result connectWebsocket(ConnectWebsocket value),
    Result sendChatMessage(SendChatMessage value),
    Result disconnectWebsocket(DisconnectWebsocket value),
    Result getContacts(GetContacts value),
    Result getId(GetId value),
    Result getUnreadMessages(GetUnreadMessages value),
    Result historyMessage(HistoryMessage value),
    Result getPermission(GetPermission value),
    Result getReceiveMsg(GetReceiveMsg value),
    Result setJPushRid(SetJPushRid value),
    Result managerRemindList(ManagerRemindList value),
    Result managerRemindDetails(ManagerRemindDetails value),
    Result refreshRemindList(RefreshRemindList value),
    Result unreadMessageCount(UnreadMessageCount value),
    Result batchUpdate(BatchUpdate value),
    Result unreadList(UnreadList value),
    Result sendChatMessageVoice(SendChatMessageVoice value),
    Result gethistory(GetHistory value),
    Result getSalesmanLists(GetSalesmanLists value),
    Result getProcessDefinition(GetProcessDefinition value),
    Result isBottomSheet(IsBottomSheet value),
    Result slideshow(Slideshow value),
    Result getRoles(GetRoles value),
    Result getAffiliated(GetAffiliated value),
    Result submitTestUserInfo(SubmitTestUserInfo value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getAffiliated != null) {
      return getAffiliated(this);
    }
    return orElse();
  }
}

abstract class GetAffiliated implements WebScoketEvent {
  const factory GetAffiliated() = _$GetAffiliated;
}

/// @nodoc
abstract class $SubmitTestUserInfoCopyWith<$Res> {
  factory $SubmitTestUserInfoCopyWith(
          SubmitTestUserInfo value, $Res Function(SubmitTestUserInfo) then) =
      _$SubmitTestUserInfoCopyWithImpl<$Res>;
  $Res call(
      {String image,
      String name,
      String nickName,
      String sex,
      String role,
      List<dynamic> listAffiliated});
}

/// @nodoc
class _$SubmitTestUserInfoCopyWithImpl<$Res>
    extends _$WebScoketEventCopyWithImpl<$Res>
    implements $SubmitTestUserInfoCopyWith<$Res> {
  _$SubmitTestUserInfoCopyWithImpl(
      SubmitTestUserInfo _value, $Res Function(SubmitTestUserInfo) _then)
      : super(_value, (v) => _then(v as SubmitTestUserInfo));

  @override
  SubmitTestUserInfo get _value => super._value as SubmitTestUserInfo;

  @override
  $Res call({
    Object image = freezed,
    Object name = freezed,
    Object nickName = freezed,
    Object sex = freezed,
    Object role = freezed,
    Object listAffiliated = freezed,
  }) {
    return _then(SubmitTestUserInfo(
      image == freezed ? _value.image : image as String,
      name == freezed ? _value.name : name as String,
      nickName == freezed ? _value.nickName : nickName as String,
      sex == freezed ? _value.sex : sex as String,
      role == freezed ? _value.role : role as String,
      listAffiliated == freezed
          ? _value.listAffiliated
          : listAffiliated as List<dynamic>,
    ));
  }
}

/// @nodoc
class _$SubmitTestUserInfo implements SubmitTestUserInfo {
  const _$SubmitTestUserInfo(this.image, this.name, this.nickName, this.sex,
      this.role, this.listAffiliated)
      : assert(image != null),
        assert(name != null),
        assert(nickName != null),
        assert(sex != null),
        assert(role != null),
        assert(listAffiliated != null);

  @override
  final String image;
  @override
  final String name;
  @override
  final String nickName;
  @override
  final String sex;
  @override
  final String role;
  @override
  final List<dynamic> listAffiliated;

  @override
  String toString() {
    return 'WebScoketEvent.submitTestUserInfo(image: $image, name: $name, nickName: $nickName, sex: $sex, role: $role, listAffiliated: $listAffiliated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SubmitTestUserInfo &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.nickName, nickName) ||
                const DeepCollectionEquality()
                    .equals(other.nickName, nickName)) &&
            (identical(other.sex, sex) ||
                const DeepCollectionEquality().equals(other.sex, sex)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)) &&
            (identical(other.listAffiliated, listAffiliated) ||
                const DeepCollectionEquality()
                    .equals(other.listAffiliated, listAffiliated)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(nickName) ^
      const DeepCollectionEquality().hash(sex) ^
      const DeepCollectionEquality().hash(role) ^
      const DeepCollectionEquality().hash(listAffiliated);

  @override
  $SubmitTestUserInfoCopyWith<SubmitTestUserInfo> get copyWith =>
      _$SubmitTestUserInfoCopyWithImpl<SubmitTestUserInfo>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result connectWebsocket(),
    @required Result sendChatMessage(String msg, String type, String contactId),
    @required Result disconnectWebsocket(),
    @required Result getContacts(),
    @required Result getId(String contactId),
    @required Result getUnreadMessages(),
    @required Result historyMessage(String contactId, int index, int sizeNum),
    @required Result getPermission(),
    @required Result getReceiveMsg(),
    @required Result setJPushRid(),
    @required Result managerRemindList(int index),
    @required Result managerRemindDetails(String phone, String tenantId),
    @required Result refreshRemindList(),
    @required Result unreadMessageCount(),
    @required Result batchUpdate(),
    @required Result unreadList(),
    @required
        Result sendChatMessageVoice(
            String msg, String type, String contactId, int duration),
    @required Result gethistory(String instanceId),
    @required Result getSalesmanLists(),
    @required Result getProcessDefinition(String phone, String salesmanId),
    @required Result isBottomSheet(),
    @required Result slideshow(),
    @required Result getRoles(),
    @required Result getAffiliated(),
    @required
        Result submitTestUserInfo(String image, String name, String nickName,
            String sex, String role, List<dynamic> listAffiliated),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return submitTestUserInfo(image, name, nickName, sex, role, listAffiliated);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result connectWebsocket(),
    Result sendChatMessage(String msg, String type, String contactId),
    Result disconnectWebsocket(),
    Result getContacts(),
    Result getId(String contactId),
    Result getUnreadMessages(),
    Result historyMessage(String contactId, int index, int sizeNum),
    Result getPermission(),
    Result getReceiveMsg(),
    Result setJPushRid(),
    Result managerRemindList(int index),
    Result managerRemindDetails(String phone, String tenantId),
    Result refreshRemindList(),
    Result unreadMessageCount(),
    Result batchUpdate(),
    Result unreadList(),
    Result sendChatMessageVoice(
        String msg, String type, String contactId, int duration),
    Result gethistory(String instanceId),
    Result getSalesmanLists(),
    Result getProcessDefinition(String phone, String salesmanId),
    Result isBottomSheet(),
    Result slideshow(),
    Result getRoles(),
    Result getAffiliated(),
    Result submitTestUserInfo(String image, String name, String nickName,
        String sex, String role, List<dynamic> listAffiliated),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (submitTestUserInfo != null) {
      return submitTestUserInfo(
          image, name, nickName, sex, role, listAffiliated);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result connectWebsocket(ConnectWebsocket value),
    @required Result sendChatMessage(SendChatMessage value),
    @required Result disconnectWebsocket(DisconnectWebsocket value),
    @required Result getContacts(GetContacts value),
    @required Result getId(GetId value),
    @required Result getUnreadMessages(GetUnreadMessages value),
    @required Result historyMessage(HistoryMessage value),
    @required Result getPermission(GetPermission value),
    @required Result getReceiveMsg(GetReceiveMsg value),
    @required Result setJPushRid(SetJPushRid value),
    @required Result managerRemindList(ManagerRemindList value),
    @required Result managerRemindDetails(ManagerRemindDetails value),
    @required Result refreshRemindList(RefreshRemindList value),
    @required Result unreadMessageCount(UnreadMessageCount value),
    @required Result batchUpdate(BatchUpdate value),
    @required Result unreadList(UnreadList value),
    @required Result sendChatMessageVoice(SendChatMessageVoice value),
    @required Result gethistory(GetHistory value),
    @required Result getSalesmanLists(GetSalesmanLists value),
    @required Result getProcessDefinition(GetProcessDefinition value),
    @required Result isBottomSheet(IsBottomSheet value),
    @required Result slideshow(Slideshow value),
    @required Result getRoles(GetRoles value),
    @required Result getAffiliated(GetAffiliated value),
    @required Result submitTestUserInfo(SubmitTestUserInfo value),
  }) {
    assert(connectWebsocket != null);
    assert(sendChatMessage != null);
    assert(disconnectWebsocket != null);
    assert(getContacts != null);
    assert(getId != null);
    assert(getUnreadMessages != null);
    assert(historyMessage != null);
    assert(getPermission != null);
    assert(getReceiveMsg != null);
    assert(setJPushRid != null);
    assert(managerRemindList != null);
    assert(managerRemindDetails != null);
    assert(refreshRemindList != null);
    assert(unreadMessageCount != null);
    assert(batchUpdate != null);
    assert(unreadList != null);
    assert(sendChatMessageVoice != null);
    assert(gethistory != null);
    assert(getSalesmanLists != null);
    assert(getProcessDefinition != null);
    assert(isBottomSheet != null);
    assert(slideshow != null);
    assert(getRoles != null);
    assert(getAffiliated != null);
    assert(submitTestUserInfo != null);
    return submitTestUserInfo(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result connectWebsocket(ConnectWebsocket value),
    Result sendChatMessage(SendChatMessage value),
    Result disconnectWebsocket(DisconnectWebsocket value),
    Result getContacts(GetContacts value),
    Result getId(GetId value),
    Result getUnreadMessages(GetUnreadMessages value),
    Result historyMessage(HistoryMessage value),
    Result getPermission(GetPermission value),
    Result getReceiveMsg(GetReceiveMsg value),
    Result setJPushRid(SetJPushRid value),
    Result managerRemindList(ManagerRemindList value),
    Result managerRemindDetails(ManagerRemindDetails value),
    Result refreshRemindList(RefreshRemindList value),
    Result unreadMessageCount(UnreadMessageCount value),
    Result batchUpdate(BatchUpdate value),
    Result unreadList(UnreadList value),
    Result sendChatMessageVoice(SendChatMessageVoice value),
    Result gethistory(GetHistory value),
    Result getSalesmanLists(GetSalesmanLists value),
    Result getProcessDefinition(GetProcessDefinition value),
    Result isBottomSheet(IsBottomSheet value),
    Result slideshow(Slideshow value),
    Result getRoles(GetRoles value),
    Result getAffiliated(GetAffiliated value),
    Result submitTestUserInfo(SubmitTestUserInfo value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (submitTestUserInfo != null) {
      return submitTestUserInfo(this);
    }
    return orElse();
  }
}

abstract class SubmitTestUserInfo implements WebScoketEvent {
  const factory SubmitTestUserInfo(
      String image,
      String name,
      String nickName,
      String sex,
      String role,
      List<dynamic> listAffiliated) = _$SubmitTestUserInfo;

  String get image;
  String get name;
  String get nickName;
  String get sex;
  String get role;
  List<dynamic> get listAffiliated;
  $SubmitTestUserInfoCopyWith<SubmitTestUserInfo> get copyWith;
}

/// @nodoc
class _$WebScoketStateTearOff {
  const _$WebScoketStateTearOff();

// ignore: unused_element
  _WebScoketState call(
      {@required
          bool isReceiveChatMessage,
      @required
          List<dynamic> getContactsList,
      @required
          List<dynamic> getUnreadMessageList,
      @required
          List<dynamic> historyMessageList,
      @required
          Map<String, dynamic> getReceiveMsg,
      @required
          List<dynamic> managerRemindList,
      @required
          Map<String, dynamic> managerRemindDetails,
      @required
          String unreadMessageCount,
      @required
          List<dynamic> unreadList,
      @required
          List<dynamic> history,
      @required
          List<dynamic> salesman,
      @required
          List<dynamic> salesmanList,
      @required
          List<dynamic> historyVariable,
      @required
          String choosingId,
      @required
          bool isManagerRemindDetails,
      @required
          List<dynamic> slideshow,
      @required
          List<dynamic> listRoles,
      @required
          List<dynamic> listAffiliated,
      @required
          bool isReset,
      @required
          Option<Either<WebScoketFailure, Unit>>
              webScoketFailureOrSuccessOption}) {
    return _WebScoketState(
      isReceiveChatMessage: isReceiveChatMessage,
      getContactsList: getContactsList,
      getUnreadMessageList: getUnreadMessageList,
      historyMessageList: historyMessageList,
      getReceiveMsg: getReceiveMsg,
      managerRemindList: managerRemindList,
      managerRemindDetails: managerRemindDetails,
      unreadMessageCount: unreadMessageCount,
      unreadList: unreadList,
      history: history,
      salesman: salesman,
      salesmanList: salesmanList,
      historyVariable: historyVariable,
      choosingId: choosingId,
      isManagerRemindDetails: isManagerRemindDetails,
      slideshow: slideshow,
      listRoles: listRoles,
      listAffiliated: listAffiliated,
      isReset: isReset,
      webScoketFailureOrSuccessOption: webScoketFailureOrSuccessOption,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $WebScoketState = _$WebScoketStateTearOff();

/// @nodoc
mixin _$WebScoketState {
  bool get isReceiveChatMessage;
  List<dynamic> get getContactsList;
  List<dynamic> get getUnreadMessageList;
  List<dynamic> get historyMessageList;
  Map<String, dynamic> get getReceiveMsg;
  List<dynamic> get managerRemindList;
  Map<String, dynamic> get managerRemindDetails;
  String get unreadMessageCount;
  List<dynamic> get unreadList;
  List<dynamic> get history;
  List<dynamic> get salesman;
  List<dynamic> get salesmanList;
  List<dynamic> get historyVariable;
  String get choosingId;
  bool get isManagerRemindDetails;
  List<dynamic> get slideshow;
  List<dynamic> get listRoles;
  List<dynamic> get listAffiliated;
  bool get isReset;
  Option<Either<WebScoketFailure, Unit>> get webScoketFailureOrSuccessOption;

  $WebScoketStateCopyWith<WebScoketState> get copyWith;
}

/// @nodoc
abstract class $WebScoketStateCopyWith<$Res> {
  factory $WebScoketStateCopyWith(
          WebScoketState value, $Res Function(WebScoketState) then) =
      _$WebScoketStateCopyWithImpl<$Res>;
  $Res call(
      {bool isReceiveChatMessage,
      List<dynamic> getContactsList,
      List<dynamic> getUnreadMessageList,
      List<dynamic> historyMessageList,
      Map<String, dynamic> getReceiveMsg,
      List<dynamic> managerRemindList,
      Map<String, dynamic> managerRemindDetails,
      String unreadMessageCount,
      List<dynamic> unreadList,
      List<dynamic> history,
      List<dynamic> salesman,
      List<dynamic> salesmanList,
      List<dynamic> historyVariable,
      String choosingId,
      bool isManagerRemindDetails,
      List<dynamic> slideshow,
      List<dynamic> listRoles,
      List<dynamic> listAffiliated,
      bool isReset,
      Option<Either<WebScoketFailure, Unit>> webScoketFailureOrSuccessOption});
}

/// @nodoc
class _$WebScoketStateCopyWithImpl<$Res>
    implements $WebScoketStateCopyWith<$Res> {
  _$WebScoketStateCopyWithImpl(this._value, this._then);

  final WebScoketState _value;
  // ignore: unused_field
  final $Res Function(WebScoketState) _then;

  @override
  $Res call({
    Object isReceiveChatMessage = freezed,
    Object getContactsList = freezed,
    Object getUnreadMessageList = freezed,
    Object historyMessageList = freezed,
    Object getReceiveMsg = freezed,
    Object managerRemindList = freezed,
    Object managerRemindDetails = freezed,
    Object unreadMessageCount = freezed,
    Object unreadList = freezed,
    Object history = freezed,
    Object salesman = freezed,
    Object salesmanList = freezed,
    Object historyVariable = freezed,
    Object choosingId = freezed,
    Object isManagerRemindDetails = freezed,
    Object slideshow = freezed,
    Object listRoles = freezed,
    Object listAffiliated = freezed,
    Object isReset = freezed,
    Object webScoketFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      isReceiveChatMessage: isReceiveChatMessage == freezed
          ? _value.isReceiveChatMessage
          : isReceiveChatMessage as bool,
      getContactsList: getContactsList == freezed
          ? _value.getContactsList
          : getContactsList as List<dynamic>,
      getUnreadMessageList: getUnreadMessageList == freezed
          ? _value.getUnreadMessageList
          : getUnreadMessageList as List<dynamic>,
      historyMessageList: historyMessageList == freezed
          ? _value.historyMessageList
          : historyMessageList as List<dynamic>,
      getReceiveMsg: getReceiveMsg == freezed
          ? _value.getReceiveMsg
          : getReceiveMsg as Map<String, dynamic>,
      managerRemindList: managerRemindList == freezed
          ? _value.managerRemindList
          : managerRemindList as List<dynamic>,
      managerRemindDetails: managerRemindDetails == freezed
          ? _value.managerRemindDetails
          : managerRemindDetails as Map<String, dynamic>,
      unreadMessageCount: unreadMessageCount == freezed
          ? _value.unreadMessageCount
          : unreadMessageCount as String,
      unreadList: unreadList == freezed
          ? _value.unreadList
          : unreadList as List<dynamic>,
      history: history == freezed ? _value.history : history as List<dynamic>,
      salesman:
          salesman == freezed ? _value.salesman : salesman as List<dynamic>,
      salesmanList: salesmanList == freezed
          ? _value.salesmanList
          : salesmanList as List<dynamic>,
      historyVariable: historyVariable == freezed
          ? _value.historyVariable
          : historyVariable as List<dynamic>,
      choosingId:
          choosingId == freezed ? _value.choosingId : choosingId as String,
      isManagerRemindDetails: isManagerRemindDetails == freezed
          ? _value.isManagerRemindDetails
          : isManagerRemindDetails as bool,
      slideshow:
          slideshow == freezed ? _value.slideshow : slideshow as List<dynamic>,
      listRoles:
          listRoles == freezed ? _value.listRoles : listRoles as List<dynamic>,
      listAffiliated: listAffiliated == freezed
          ? _value.listAffiliated
          : listAffiliated as List<dynamic>,
      isReset: isReset == freezed ? _value.isReset : isReset as bool,
      webScoketFailureOrSuccessOption:
          webScoketFailureOrSuccessOption == freezed
              ? _value.webScoketFailureOrSuccessOption
              : webScoketFailureOrSuccessOption
                  as Option<Either<WebScoketFailure, Unit>>,
    ));
  }
}

/// @nodoc
abstract class _$WebScoketStateCopyWith<$Res>
    implements $WebScoketStateCopyWith<$Res> {
  factory _$WebScoketStateCopyWith(
          _WebScoketState value, $Res Function(_WebScoketState) then) =
      __$WebScoketStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isReceiveChatMessage,
      List<dynamic> getContactsList,
      List<dynamic> getUnreadMessageList,
      List<dynamic> historyMessageList,
      Map<String, dynamic> getReceiveMsg,
      List<dynamic> managerRemindList,
      Map<String, dynamic> managerRemindDetails,
      String unreadMessageCount,
      List<dynamic> unreadList,
      List<dynamic> history,
      List<dynamic> salesman,
      List<dynamic> salesmanList,
      List<dynamic> historyVariable,
      String choosingId,
      bool isManagerRemindDetails,
      List<dynamic> slideshow,
      List<dynamic> listRoles,
      List<dynamic> listAffiliated,
      bool isReset,
      Option<Either<WebScoketFailure, Unit>> webScoketFailureOrSuccessOption});
}

/// @nodoc
class __$WebScoketStateCopyWithImpl<$Res>
    extends _$WebScoketStateCopyWithImpl<$Res>
    implements _$WebScoketStateCopyWith<$Res> {
  __$WebScoketStateCopyWithImpl(
      _WebScoketState _value, $Res Function(_WebScoketState) _then)
      : super(_value, (v) => _then(v as _WebScoketState));

  @override
  _WebScoketState get _value => super._value as _WebScoketState;

  @override
  $Res call({
    Object isReceiveChatMessage = freezed,
    Object getContactsList = freezed,
    Object getUnreadMessageList = freezed,
    Object historyMessageList = freezed,
    Object getReceiveMsg = freezed,
    Object managerRemindList = freezed,
    Object managerRemindDetails = freezed,
    Object unreadMessageCount = freezed,
    Object unreadList = freezed,
    Object history = freezed,
    Object salesman = freezed,
    Object salesmanList = freezed,
    Object historyVariable = freezed,
    Object choosingId = freezed,
    Object isManagerRemindDetails = freezed,
    Object slideshow = freezed,
    Object listRoles = freezed,
    Object listAffiliated = freezed,
    Object isReset = freezed,
    Object webScoketFailureOrSuccessOption = freezed,
  }) {
    return _then(_WebScoketState(
      isReceiveChatMessage: isReceiveChatMessage == freezed
          ? _value.isReceiveChatMessage
          : isReceiveChatMessage as bool,
      getContactsList: getContactsList == freezed
          ? _value.getContactsList
          : getContactsList as List<dynamic>,
      getUnreadMessageList: getUnreadMessageList == freezed
          ? _value.getUnreadMessageList
          : getUnreadMessageList as List<dynamic>,
      historyMessageList: historyMessageList == freezed
          ? _value.historyMessageList
          : historyMessageList as List<dynamic>,
      getReceiveMsg: getReceiveMsg == freezed
          ? _value.getReceiveMsg
          : getReceiveMsg as Map<String, dynamic>,
      managerRemindList: managerRemindList == freezed
          ? _value.managerRemindList
          : managerRemindList as List<dynamic>,
      managerRemindDetails: managerRemindDetails == freezed
          ? _value.managerRemindDetails
          : managerRemindDetails as Map<String, dynamic>,
      unreadMessageCount: unreadMessageCount == freezed
          ? _value.unreadMessageCount
          : unreadMessageCount as String,
      unreadList: unreadList == freezed
          ? _value.unreadList
          : unreadList as List<dynamic>,
      history: history == freezed ? _value.history : history as List<dynamic>,
      salesman:
          salesman == freezed ? _value.salesman : salesman as List<dynamic>,
      salesmanList: salesmanList == freezed
          ? _value.salesmanList
          : salesmanList as List<dynamic>,
      historyVariable: historyVariable == freezed
          ? _value.historyVariable
          : historyVariable as List<dynamic>,
      choosingId:
          choosingId == freezed ? _value.choosingId : choosingId as String,
      isManagerRemindDetails: isManagerRemindDetails == freezed
          ? _value.isManagerRemindDetails
          : isManagerRemindDetails as bool,
      slideshow:
          slideshow == freezed ? _value.slideshow : slideshow as List<dynamic>,
      listRoles:
          listRoles == freezed ? _value.listRoles : listRoles as List<dynamic>,
      listAffiliated: listAffiliated == freezed
          ? _value.listAffiliated
          : listAffiliated as List<dynamic>,
      isReset: isReset == freezed ? _value.isReset : isReset as bool,
      webScoketFailureOrSuccessOption:
          webScoketFailureOrSuccessOption == freezed
              ? _value.webScoketFailureOrSuccessOption
              : webScoketFailureOrSuccessOption
                  as Option<Either<WebScoketFailure, Unit>>,
    ));
  }
}

/// @nodoc
class _$_WebScoketState implements _WebScoketState {
  const _$_WebScoketState(
      {@required this.isReceiveChatMessage,
      @required this.getContactsList,
      @required this.getUnreadMessageList,
      @required this.historyMessageList,
      @required this.getReceiveMsg,
      @required this.managerRemindList,
      @required this.managerRemindDetails,
      @required this.unreadMessageCount,
      @required this.unreadList,
      @required this.history,
      @required this.salesman,
      @required this.salesmanList,
      @required this.historyVariable,
      @required this.choosingId,
      @required this.isManagerRemindDetails,
      @required this.slideshow,
      @required this.listRoles,
      @required this.listAffiliated,
      @required this.isReset,
      @required this.webScoketFailureOrSuccessOption})
      : assert(isReceiveChatMessage != null),
        assert(getContactsList != null),
        assert(getUnreadMessageList != null),
        assert(historyMessageList != null),
        assert(getReceiveMsg != null),
        assert(managerRemindList != null),
        assert(managerRemindDetails != null),
        assert(unreadMessageCount != null),
        assert(unreadList != null),
        assert(history != null),
        assert(salesman != null),
        assert(salesmanList != null),
        assert(historyVariable != null),
        assert(choosingId != null),
        assert(isManagerRemindDetails != null),
        assert(slideshow != null),
        assert(listRoles != null),
        assert(listAffiliated != null),
        assert(isReset != null),
        assert(webScoketFailureOrSuccessOption != null);

  @override
  final bool isReceiveChatMessage;
  @override
  final List<dynamic> getContactsList;
  @override
  final List<dynamic> getUnreadMessageList;
  @override
  final List<dynamic> historyMessageList;
  @override
  final Map<String, dynamic> getReceiveMsg;
  @override
  final List<dynamic> managerRemindList;
  @override
  final Map<String, dynamic> managerRemindDetails;
  @override
  final String unreadMessageCount;
  @override
  final List<dynamic> unreadList;
  @override
  final List<dynamic> history;
  @override
  final List<dynamic> salesman;
  @override
  final List<dynamic> salesmanList;
  @override
  final List<dynamic> historyVariable;
  @override
  final String choosingId;
  @override
  final bool isManagerRemindDetails;
  @override
  final List<dynamic> slideshow;
  @override
  final List<dynamic> listRoles;
  @override
  final List<dynamic> listAffiliated;
  @override
  final bool isReset;
  @override
  final Option<Either<WebScoketFailure, Unit>> webScoketFailureOrSuccessOption;

  @override
  String toString() {
    return 'WebScoketState(isReceiveChatMessage: $isReceiveChatMessage, getContactsList: $getContactsList, getUnreadMessageList: $getUnreadMessageList, historyMessageList: $historyMessageList, getReceiveMsg: $getReceiveMsg, managerRemindList: $managerRemindList, managerRemindDetails: $managerRemindDetails, unreadMessageCount: $unreadMessageCount, unreadList: $unreadList, history: $history, salesman: $salesman, salesmanList: $salesmanList, historyVariable: $historyVariable, choosingId: $choosingId, isManagerRemindDetails: $isManagerRemindDetails, slideshow: $slideshow, listRoles: $listRoles, listAffiliated: $listAffiliated, isReset: $isReset, webScoketFailureOrSuccessOption: $webScoketFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WebScoketState &&
            (identical(other.isReceiveChatMessage, isReceiveChatMessage) ||
                const DeepCollectionEquality().equals(
                    other.isReceiveChatMessage, isReceiveChatMessage)) &&
            (identical(other.getContactsList, getContactsList) ||
                const DeepCollectionEquality()
                    .equals(other.getContactsList, getContactsList)) &&
            (identical(other.getUnreadMessageList, getUnreadMessageList) ||
                const DeepCollectionEquality().equals(
                    other.getUnreadMessageList, getUnreadMessageList)) &&
            (identical(other.historyMessageList, historyMessageList) ||
                const DeepCollectionEquality()
                    .equals(other.historyMessageList, historyMessageList)) &&
            (identical(other.getReceiveMsg, getReceiveMsg) ||
                const DeepCollectionEquality()
                    .equals(other.getReceiveMsg, getReceiveMsg)) &&
            (identical(other.managerRemindList, managerRemindList) ||
                const DeepCollectionEquality()
                    .equals(other.managerRemindList, managerRemindList)) &&
            (identical(other.managerRemindDetails, managerRemindDetails) ||
                const DeepCollectionEquality().equals(
                    other.managerRemindDetails, managerRemindDetails)) &&
            (identical(other.unreadMessageCount, unreadMessageCount) ||
                const DeepCollectionEquality()
                    .equals(other.unreadMessageCount, unreadMessageCount)) &&
            (identical(other.unreadList, unreadList) ||
                const DeepCollectionEquality()
                    .equals(other.unreadList, unreadList)) &&
            (identical(other.history, history) ||
                const DeepCollectionEquality()
                    .equals(other.history, history)) &&
            (identical(other.salesman, salesman) ||
                const DeepCollectionEquality()
                    .equals(other.salesman, salesman)) &&
            (identical(other.salesmanList, salesmanList) ||
                const DeepCollectionEquality()
                    .equals(other.salesmanList, salesmanList)) &&
            (identical(other.historyVariable, historyVariable) ||
                const DeepCollectionEquality()
                    .equals(other.historyVariable, historyVariable)) &&
            (identical(other.choosingId, choosingId) ||
                const DeepCollectionEquality()
                    .equals(other.choosingId, choosingId)) &&
            (identical(other.isManagerRemindDetails, isManagerRemindDetails) ||
                const DeepCollectionEquality().equals(
                    other.isManagerRemindDetails, isManagerRemindDetails)) &&
            (identical(other.slideshow, slideshow) ||
                const DeepCollectionEquality()
                    .equals(other.slideshow, slideshow)) &&
            (identical(other.listRoles, listRoles) ||
                const DeepCollectionEquality()
                    .equals(other.listRoles, listRoles)) &&
            (identical(other.listAffiliated, listAffiliated) ||
                const DeepCollectionEquality()
                    .equals(other.listAffiliated, listAffiliated)) &&
            (identical(other.isReset, isReset) ||
                const DeepCollectionEquality()
                    .equals(other.isReset, isReset)) &&
            (identical(other.webScoketFailureOrSuccessOption, webScoketFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.webScoketFailureOrSuccessOption,
                    webScoketFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isReceiveChatMessage) ^
      const DeepCollectionEquality().hash(getContactsList) ^
      const DeepCollectionEquality().hash(getUnreadMessageList) ^
      const DeepCollectionEquality().hash(historyMessageList) ^
      const DeepCollectionEquality().hash(getReceiveMsg) ^
      const DeepCollectionEquality().hash(managerRemindList) ^
      const DeepCollectionEquality().hash(managerRemindDetails) ^
      const DeepCollectionEquality().hash(unreadMessageCount) ^
      const DeepCollectionEquality().hash(unreadList) ^
      const DeepCollectionEquality().hash(history) ^
      const DeepCollectionEquality().hash(salesman) ^
      const DeepCollectionEquality().hash(salesmanList) ^
      const DeepCollectionEquality().hash(historyVariable) ^
      const DeepCollectionEquality().hash(choosingId) ^
      const DeepCollectionEquality().hash(isManagerRemindDetails) ^
      const DeepCollectionEquality().hash(slideshow) ^
      const DeepCollectionEquality().hash(listRoles) ^
      const DeepCollectionEquality().hash(listAffiliated) ^
      const DeepCollectionEquality().hash(isReset) ^
      const DeepCollectionEquality().hash(webScoketFailureOrSuccessOption);

  @override
  _$WebScoketStateCopyWith<_WebScoketState> get copyWith =>
      __$WebScoketStateCopyWithImpl<_WebScoketState>(this, _$identity);
}

abstract class _WebScoketState implements WebScoketState {
  const factory _WebScoketState(
      {@required
          bool isReceiveChatMessage,
      @required
          List<dynamic> getContactsList,
      @required
          List<dynamic> getUnreadMessageList,
      @required
          List<dynamic> historyMessageList,
      @required
          Map<String, dynamic> getReceiveMsg,
      @required
          List<dynamic> managerRemindList,
      @required
          Map<String, dynamic> managerRemindDetails,
      @required
          String unreadMessageCount,
      @required
          List<dynamic> unreadList,
      @required
          List<dynamic> history,
      @required
          List<dynamic> salesman,
      @required
          List<dynamic> salesmanList,
      @required
          List<dynamic> historyVariable,
      @required
          String choosingId,
      @required
          bool isManagerRemindDetails,
      @required
          List<dynamic> slideshow,
      @required
          List<dynamic> listRoles,
      @required
          List<dynamic> listAffiliated,
      @required
          bool isReset,
      @required
          Option<Either<WebScoketFailure, Unit>>
              webScoketFailureOrSuccessOption}) = _$_WebScoketState;

  @override
  bool get isReceiveChatMessage;
  @override
  List<dynamic> get getContactsList;
  @override
  List<dynamic> get getUnreadMessageList;
  @override
  List<dynamic> get historyMessageList;
  @override
  Map<String, dynamic> get getReceiveMsg;
  @override
  List<dynamic> get managerRemindList;
  @override
  Map<String, dynamic> get managerRemindDetails;
  @override
  String get unreadMessageCount;
  @override
  List<dynamic> get unreadList;
  @override
  List<dynamic> get history;
  @override
  List<dynamic> get salesman;
  @override
  List<dynamic> get salesmanList;
  @override
  List<dynamic> get historyVariable;
  @override
  String get choosingId;
  @override
  bool get isManagerRemindDetails;
  @override
  List<dynamic> get slideshow;
  @override
  List<dynamic> get listRoles;
  @override
  List<dynamic> get listAffiliated;
  @override
  bool get isReset;
  @override
  Option<Either<WebScoketFailure, Unit>> get webScoketFailureOrSuccessOption;
  @override
  _$WebScoketStateCopyWith<_WebScoketState> get copyWith;
}
