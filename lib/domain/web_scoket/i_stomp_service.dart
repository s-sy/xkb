import 'package:dartz/dartz.dart';
import 'package:flutter_ui/domain/web_scoket/web_scoket_failure.dart';

abstract class IStompService {
  Future<Either<WebScoketFailure, Unit>> clientConnect();
  Future<Either<WebScoketFailure, Unit>> sendChatMessage(
      String msg, String type, String contactId);
  Future<Either<WebScoketFailure, Unit>> disconnectWebsocket();
  // Future<Either<WebScoketFailure, Unit>> receiveChatMessage(String contactId);
  Future<Either<WebScoketFailure, List<dynamic>>> getContacts();
  Future<Either<WebScoketFailure, Unit>> getId(String contactId);
  Future<Either<WebScoketFailure, List<dynamic>>> getUnreadMessages();
  Future<Either<WebScoketFailure, List<dynamic>>> historyMessage(
      String contactId, int index, int sizeNum);
  Future<Either<WebScoketFailure, Unit>> setJPushRid();
  Future<Either<WebScoketFailure, List<dynamic>>> managerRemindList(int index);
  Future<Either<WebScoketFailure, Map<String, dynamic>>> managerRemindDetails(
      String phone, String tenantId);
  Future<Either<WebScoketFailure, Unit>> refreshRemindList();

  Future<Either<WebScoketFailure, String>> unreadMessageCount();
  Future<Either<WebScoketFailure, Unit>> batchUpdate();

  Future<Either<WebScoketFailure, List<dynamic>>> unreadList();

  Future<Either<WebScoketFailure, Unit>> sendChatMessageVoice(
      msg, type, contactId, duration);

  Future<Either<WebScoketFailure, List<dynamic>>> slideshow();

  Future<Either<WebScoketFailure, List<dynamic>>> getRoles();

  Future<Either<WebScoketFailure, List<dynamic>>> getAffiliated();

  Future<Either<WebScoketFailure, List<dynamic>>> submitTestUserInfo(
      image, name, nickName, sex, role, listAffiliated);
}
