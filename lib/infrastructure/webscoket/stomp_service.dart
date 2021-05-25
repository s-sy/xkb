import 'package:dartz/dartz.dart';
import 'package:flutter_ui/domain/web_scoket/i_stomp_service.dart';
import 'package:flutter_ui/domain/web_scoket/web_scoket_failure.dart';
// import 'package:flutter_ui/infrastructure/webscoket/stomp_service_impl.dart';
import 'package:flutter_ui/infrastructure/datasources/web_socket_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IStompService, env: [Environment.prod])
class StompService implements IStompService {
  final WebScoket webScoket;
  StompService(this.webScoket);

  @override
  Future<Either<WebScoketFailure, Unit>> clientConnect() async {
    await webScoket.clientConnect();
    return right(unit);
  }

  @override
  Future<Either<WebScoketFailure, Unit>> sendChatMessage(
      String msg, String type, String contactId) async {
    await webScoket.sendChatMessage(msg, type, contactId);
    return right(unit);
  }

  @override
  Future<Either<WebScoketFailure, Unit>> disconnectWebsocket() async {
    await webScoket.disconnectWebsocket();
    return right(unit);
  }

  // @override
  // Future<Either<WebScoketFailure, Unit>> receiveChatMessage(
  //     String contactId) async {
  //   await webScoket.receiveChatMessage(contactId);
  //   return right(unit);
  // }

  @override
  Future<Either<WebScoketFailure, List<dynamic>>> getContacts() async {
    var apiResult = await webScoket.getContacts();
    List<dynamic> list = [];
    try {
      bool successAndFailure = false;
      apiResult.when(
          success: (right) {
            successAndFailure = true;
            list = right;
          },
          failure: (error) => successAndFailure = false);
      // print(list);
      return successAndFailure
          ? right(list)
          : left(const WebScoketFailure.receiveMessageFail());
    } on Exception catch (error) {
      print("error is :: " + error.toString());
      return left(const WebScoketFailure.serverError());
    }
  }

  @override
  Future<Either<WebScoketFailure, Unit>> getId(String contactId) async {
    await webScoket.getId(contactId);
    return right(unit);
  }

  @override
  Future<Either<WebScoketFailure, List<dynamic>>> getUnreadMessages() async {
    var apiResult = await webScoket.getUnreadMessages();
    List<dynamic> list = [];
    try {
      bool successAndFailure = false;
      apiResult.when(
          success: (right) {
            successAndFailure = true;
            list = right;
          },
          failure: (error) => successAndFailure = false);
      return successAndFailure
          ? right(list)
          : left(const WebScoketFailure.receiveMessageFail());
    } on Exception catch (error) {
      print("error is :: " + error.toString());
      return left(const WebScoketFailure.serverError());
    }
  }

  @override
  Future<Either<WebScoketFailure, List<dynamic>>> historyMessage(
      String contactId, int index, int sizeNum) async {
    var apiResult = await webScoket.historyMessage(contactId, index, sizeNum);
    List<dynamic> list = [];
    try {
      bool successAndFailure = false;
      apiResult.when(
          success: (right) {
            successAndFailure = true;
            list = right;
          },
          failure: (error) => successAndFailure = false);
      return successAndFailure
          ? right(list)
          : left(const WebScoketFailure.receiveMessageFail());
    } on Exception catch (error) {
      print("error is :: " + error.toString());
      return left(const WebScoketFailure.serverError());
    }
  }

  @override
  Future<Either<WebScoketFailure, Unit>> setJPushRid() async {
    await webScoket.setJPushRid();
    return right(unit);
  }

  @override
  Future<Either<WebScoketFailure, List<dynamic>>> managerRemindList(
      int index) async {
    var apiResult = await webScoket.managerRemindList(index);
    List<dynamic> list = [];
    try {
      bool successAndFailure = false;
      apiResult.when(
          success: (right) {
            successAndFailure = true;
            list = right;
          },
          failure: (error) => successAndFailure = false);
      return successAndFailure
          ? right(list)
          : left(const WebScoketFailure.receiveMessageFail());
    } on Exception catch (error) {
      print("error is :: " + error.toString());
      return left(const WebScoketFailure.serverError());
    }
  }

  @override
  Future<Either<WebScoketFailure, Map<String, dynamic>>> managerRemindDetails(
      String phone, String tenantId) async {
    var apiResult = await webScoket.managerRemindDetails(phone, tenantId);
    Map<String, dynamic> map;
    try {
      bool successAndFailure = false;
      apiResult.when(
          success: (right) {
            successAndFailure = true;
            map = right;
          },
          failure: (error) => successAndFailure = false);
      return successAndFailure
          ? right(map)
          : left(const WebScoketFailure.receiveMessageFail());
    } on Exception catch (error) {
      print("error is :: " + error.toString());
      return left(const WebScoketFailure.serverError());
    }
  }

  @override
  Future<Either<WebScoketFailure, Unit>> refreshRemindList() async {
    await webScoket.refreshRemindList();
    return right(unit);
  }

  @override
  Future<Either<WebScoketFailure, Unit>> batchUpdate() async {
    await webScoket.batchUpdate();
    return right(unit);
  }

  @override
  Future<Either<WebScoketFailure, String>> unreadMessageCount() async {
    var apiResult = await webScoket.unreadMessageCount();
    String count = "";
    try {
      bool successAndFailure = false;
      apiResult.when(
          success: (right) {
            successAndFailure = true;
            count = right;
          },
          failure: (error) => successAndFailure = false);
      return successAndFailure
          ? right(count)
          : left(const WebScoketFailure.receiveMessageFail());
    } on Exception catch (error) {
      print("error is :: " + error.toString());
      return left(const WebScoketFailure.serverError());
    }
  }

  @override
  Future<Either<WebScoketFailure, List<dynamic>>> unreadList() async {
    var apiResult = await webScoket.unreadList();
    List<dynamic> list = [];
    try {
      bool successAndFailure = false;
      apiResult.when(
          success: (right) {
            successAndFailure = true;
            list = right;
          },
          failure: (error) => successAndFailure = false);
      return successAndFailure
          ? right(list)
          : left(const WebScoketFailure.receiveMessageFail());
    } on Exception catch (error) {
      print("error is :: " + error.toString());
      return left(const WebScoketFailure.serverError());
    }
  }

  @override
  Future<Either<WebScoketFailure, Unit>> sendChatMessageVoice(
      msg, type, contactId, duration) async {
    await webScoket.sendChatMessageVoice(msg, type, contactId, duration);
    return right(unit);
  }

  @override
  Future<Either<WebScoketFailure, List<dynamic>>> slideshow() async {
    var apiResult = await webScoket.slideshow();
    List<dynamic> list = [];
    try {
      bool successAndFailure = false;
      apiResult.when(
          success: (right) {
            successAndFailure = true;
            list = right;
          },
          failure: (error) => successAndFailure = false);
      return successAndFailure
          ? right(list)
          : left(const WebScoketFailure.receiveMessageFail());
    } on Exception catch (error) {
      print("error is :: " + error.toString());
      return left(const WebScoketFailure.serverError());
    }
  }

  @override
  Future<Either<WebScoketFailure, List>> getAffiliated() async {
    var apiResult = await webScoket.getAffiliated();
    List<dynamic> list = [];
    try {
      bool successAndFailure = false;
      apiResult.when(
          success: (right) {
            successAndFailure = true;
            list = right;
          },
          failure: (error) => successAndFailure = false);
      return successAndFailure
          ? right(list)
          : left(const WebScoketFailure.receiveMessageFail());
    } on Exception catch (error) {
      print("error is :: " + error.toString());
      return left(const WebScoketFailure.serverError());
    }
  }

  @override
  Future<Either<WebScoketFailure, List>> getRoles() async {
    var apiResult = await webScoket.getRoles();
    List<dynamic> list = [];
    try {
      bool successAndFailure = false;
      apiResult.when(
          success: (right) {
            successAndFailure = true;
            list = right;
          },
          failure: (error) => successAndFailure = false);
      return successAndFailure
          ? right(list)
          : left(const WebScoketFailure.receiveMessageFail());
    } on Exception catch (error) {
      print("error is :: " + error.toString());
      return left(const WebScoketFailure.serverError());
    }
  }

  @override
  Future<Either<WebScoketFailure, List>> submitTestUserInfo(
      image, name, nickName, sex, role, listAffiliated) async {
    var apiResult = await webScoket.submitTestUserInfo(
        image, name, nickName, sex, role, listAffiliated);
    List<dynamic> list = [];
    try {
      bool successAndFailure = false;
      apiResult.when(
          success: (right) {
            successAndFailure = true;
            list = right;
          },
          failure: (error) => successAndFailure = false);
      return successAndFailure
          ? right(list)
          : left(const WebScoketFailure.receiveMessageFail());
    } on Exception catch (error) {
      print("error is :: " + error.toString());
      return left(const WebScoketFailure.serverError());
    }
  }
}
