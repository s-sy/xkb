import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_ui/infrastructure/api/auth_rest_service.dart';
import 'package:flutter_ui/infrastructure/api/result/api_result.dart';
import 'package:flutter_ui/infrastructure/api/result/network_exceptions.dart';
import 'package:flutter_ui/infrastructure/api/retro_rest_service.dart';
import 'package:flutter_ui/infrastructure/webscoket/client_service.dart';
import 'package:flutter_ui/presentation/bean/chat_contact_list.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

abstract class WebScoket {
  Future<Unit> clientConnect();
  Future<Unit> sendChatMessage(String msg, String type, String contactId);
  Future<Unit> disconnectWebsocket();
  // Future<Unit> receiveChatMessage(String contactId);
  Future<ApiResult> getContacts();
  Future<Unit> getId(String contactId);
  Future<ApiResult> getUnreadMessages();
  Future<ApiResult> historyMessage(String contactId, int index, int sizeNum);
  Future<Unit> setJPushRid();
  Future<ApiResult> managerRemindList(int index);
  Future<ApiResult> managerRemindDetails(String phone, String tenantId);
  Future<Unit> refreshRemindList();
  Future<Unit> batchUpdate();
  Future<ApiResult> unreadMessageCount();
  Future<ApiResult> unreadList();
  Future<Unit> sendChatMessageVoice(
      String msg, String type, String contactId, int duration);
  Future<ApiResult> slideshow();
  Future<ApiResult> getAffiliated();
  Future<ApiResult> getRoles();
  Future<ApiResult> submitTestUserInfo(
      image, name, nickName, sex, role, listAffiliated);
}

// const REQUEST_MASTER_USRL = 'https://dev.aiforest.net/broker';
const UNREAD_MESSAGES = 'UNREAD_MESSAGES';
const GET_CONTACTS = 'GET_CONTACTS';
const HISTORYMESSAGE = 'HISTORYMESSAGE';
const CACHED_SIGN_IN_USER = 'CACHED_SIGN_IN_USER';
const AFFILIATEDS = "AFFILIATEDS";

@LazySingleton(as: WebScoket)
class StompServiceImpl implements WebScoket {
  final AuthRestService authRestService;
  final RetroRestService retroRestService;
  final SharedPreferences sharedPreferences;
  final http.Client client;
  ClientService _clientService;
  StompServiceImpl(this._clientService, this.client, this.retroRestService,
      this.sharedPreferences, this.authRestService)
      : super();

  @override
  Future<Unit> clientConnect() async {
    _clientService.client.activate();
    // Workmanager.registerOneOffTask("1", "simpleTask");
    return unit;
  }

  @override
  Future<Unit> sendChatMessage(msg, type, contactId) async {
    String cachedSignInUser = sharedPreferences.get('CACHED_SIGN_IN_USER');
    var imageName = msg.substring(msg.lastIndexOf("/") + 1, msg.length);
    if (type == '1' || type == '2') {
      FormData formdataUpload = FormData.fromMap({
        "file": await MultipartFile.fromFile(msg, filename: imageName),
        'dir': 'material',
        'fileType': 'image',
        'tenantId': jsonDecode(cachedSignInUser)['tenantId'],
      });
      final response = await retroRestService.uploadImgOrAudio(formdataUpload);
      if (response != null) {
        msg = jsonDecode(response)['link'];
      }
    }
    Map<String, dynamic> formdata = {
      "tenantId": jsonDecode(cachedSignInUser)['tenantId'],
      "affiliationId": jsonDecode(cachedSignInUser)['affiliated'].first,
      "delFlag": jsonDecode(cachedSignInUser)['delFlag'],
      "createTime": DateTime.now().toString().substring(0, 19),
      "senderId": jsonDecode(cachedSignInUser)['id'],
      "receiverId": contactId,
      "messageblob": msg,
      "status": "0",
      "type": type
    };
    if (msg != "") {
      final response = await retroRestService.sendChatMessage(formdata);
      if (response['ok'] == true) {
        print(contactId);
        _clientService.client.send(
            destination: '/app/chat.private/' + contactId,
            body: json.encode({
              'id': jsonDecode(cachedSignInUser)['id'],
              'userName': jsonDecode(cachedSignInUser)['realName'],
              'userAvatar': jsonDecode(cachedSignInUser)['headimgUrl'],
              'type': type,
              'message': msg
            }));
        print('success');
      } else {
        print('fail');
      }
    }
    return unit;
  }

  @override
  Future<Unit> disconnectWebsocket() async {
    _clientService.client.deactivate();
    return unit;
  }

  @override
  Future<ApiResult> historyMessage(
      String contactId, int index, int sizeNum) async {
    String cachedSignInUser = sharedPreferences.get('CACHED_SIGN_IN_USER');
    Map<String, dynamic> formdata = {
      "receiverId": contactId,
      "senderId": jsonDecode(cachedSignInUser)['id'],
      "size": sizeNum,
      "current": index,
      'desc': 'create_time',
    };
    try {
      final response = await retroRestService.historyMessage(formdata);
      if (response['ok'] == true) {
        //   List list = [];
        // if (response['data']['records'] != null) {
        //   for (int i = 0; i < response['data']['records'].length; i++) {
        //     if (response['data']['records']['messageblob']
        //         .toString()
        //         .startsWith('<img src="https://img.0728jh.com/Emoji')) {
        //           response['data']['records']['messageblob'] =
        //         } 把type改为1，还要截取字符串，太繁琐了 不做了
        //     list.add(response['data']['records'][i]);
        //   }
        // }
        return ApiResult.success(data: response['data']['records']);
      }
      return ApiResult.failure(
          error: NetworkExceptions.getDioException('login failed'));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult> getContacts() async {
    String cachedSignInUser = sharedPreferences.get('CACHED_SIGN_IN_USER');
    // String sission = sharedPreferences.get('CACHED_SESSION_KEY');
    // print(sission);
    Map<String, dynamic> formdata = {
      "tenantId": jsonDecode(cachedSignInUser)['tenantId'],
    };
    try {
      final response = await retroRestService.getContacts(formdata);
      // print(response);
      if (response['ok'] == true) {
        if (response['data'] == "no contacts") {
          print('no contacts');
          return ApiResult.success(data: []);
        } else {
          return ApiResult.success(data: response['data']);
        }
      }
      return ApiResult.failure(
          error: NetworkExceptions.getDioException('login failed'));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<Unit> getId(String contactId) async {
    final response = await retroRestService.getId(contactId);
    if (response['ok'] == true) {
      print("未读消息变已读");
    }
    return unit;
  }

  @override
  Future<ApiResult> getUnreadMessages() async {
    String cachedSignInUser = sharedPreferences.get('CACHED_SIGN_IN_USER');
    Map<String, dynamic> formdata = {
      "tenantId": jsonDecode(cachedSignInUser)['tenantId'],
    };
    try {
      final response = await retroRestService.getUnreadMessages(formdata);
      // print(response);
      if (response['ok'] == true) {
        if (response['data'] == '无新消息') {
          return ApiResult.success(data: ['无新消息']);
        } else {
          return ApiResult.success(data: response['data']['unReadRecords']);
        }
      }
      return ApiResult.failure(
          error: NetworkExceptions.getDioException('login failed'));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<Unit> setJPushRid() async {
    String cachedSignInUser = sharedPreferences.get('CACHED_SIGN_IN_USER');
    String rid = sharedPreferences.getString("JPUSHRID");
    if (cachedSignInUser != null) {
      Map<String, dynamic> formdata = {
        "registrationId": rid,
        "id": jsonDecode(cachedSignInUser)['id'],
      };
      try {
        final response = await retroRestService.setJPushRid(formdata);
        //     .catchError((error, stackTrace) {
        //   print(error);
        //   print(stackTrace);
        // });
      } catch (e) {
        ApiResult.failure(error: NetworkExceptions.getDioException(e));
      }
    }
    return unit;
  }

  @override
  Future<ApiResult> managerRemindList(int index) async {
    // print("~~~~~~~~~~~~~~~~~~" + index.toString());
    String cachedSignInUser = sharedPreferences.get('CACHED_SIGN_IN_USER');
    // print(cachedSignInUser);
    String houseId = sharedPreferences.get('HOUSEID');
    if (houseId == null) {
      String affiliateds = sharedPreferences.get('AFFILIATEDS');
      if (affiliateds != null) {
        houseId = jsonDecode(affiliateds)[0]["id"];
      }
    }
    // print(houseId);
    Map<String, dynamic> formdata = {
      "size": 10,
      "current": index,
      "desc": "create_time",
      "houseId": houseId,
      "tenantId": jsonDecode(cachedSignInUser)["tenantId"],
      "groupId": jsonDecode(cachedSignInUser)["memberGroup"],
    };
    try {
      final response = await retroRestService.managerRemindList(formdata);
      // print(response);
      if (response['ok'] == true) {
        return ApiResult.success(data: response['data']['records']);
      }
      return ApiResult.failure(
          error: NetworkExceptions.getDioException('login failed'));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult> managerRemindDetails(String phone, String tenantId) async {
    Map<String, dynamic> formdata = {
      "phone": phone,
      "tenantId": tenantId,
    };
    try {
      final response = await retroRestService.managerRemindDetails(formdata);
      print(response);
      if (response['ok'] == true) {
        return ApiResult.success(data: response['data']);
      }
      return ApiResult.failure(
          error: NetworkExceptions.getDioException('login failed'));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  //这里要删的
  @override
  Future<Unit> refreshRemindList() async {
    // String cachedSignInUser = sharedPreferences.get('CACHED_SIGN_IN_USER');
    // if (cachedSignInUser != null) {
    //   // print(jsonDecode(cachedSignInUser)['affiliated'][0]);
    //   // print(jsonDecode(cachedSignInUser)['tenantId']);
    //   String houseId = sharedPreferences.get('HOUSEID');
    //   print(houseId);
    //   Map<String, dynamic> formdata = {
    //     "affId": houseId,
    //     "tenantId": jsonDecode(cachedSignInUser)['tenantId'],
    //   };
    //   final unreadMessageCount = await retroRestService
    //       .unreadMessageCount(formdata); //@ApiOperation(value = "未读消息计数")
    //   print(unreadMessageCount);
    //   final batchUpdate = await retroRestService
    //       .batchUpdate(formdata); //@ApiOperation(value = "批量更新")
    //   print(batchUpdate);
    // }
    return unit;
  }

  @override
  Future<Unit> batchUpdate() async {
    String cachedSignInUser = sharedPreferences.get('CACHED_SIGN_IN_USER');
    String houseId = sharedPreferences.get('HOUSEID');
    if (houseId == null) {
      String affiliateds = sharedPreferences.get('AFFILIATEDS');
      if (affiliateds != null) {
        houseId = jsonDecode(affiliateds)[0]["id"];
      }
    }
    Map<String, dynamic> formdata = {
      "affId": houseId,
      "tenantId": jsonDecode(cachedSignInUser)['tenantId'],
    };
    final batchUpdate = await retroRestService.batchUpdate(formdata);
    // print(batchUpdate);
    return unit;
  }

  @override
  Future<ApiResult> unreadMessageCount() async {
    String cachedSignInUser = sharedPreferences.get('CACHED_SIGN_IN_USER');
    String houseId = sharedPreferences.get('HOUSEID');
    if (houseId == null) {
      String affiliateds = sharedPreferences.get('AFFILIATEDS');
      if (affiliateds != null) {
        houseId = jsonDecode(affiliateds)[0]["id"];
      }
    }
    try {
      if (cachedSignInUser != null) {
        Map<String, dynamic> formdata = {
          "affId": houseId,
          "tenantId": jsonDecode(cachedSignInUser)['tenantId'],
        };
        final response = await retroRestService.unreadMessageCount(formdata);
        // print(response);
        if (response['ok'] == true) {
          return ApiResult.success(data: response['data'].toString());
        }
      }
      return ApiResult.failure(
          error: NetworkExceptions.getDioException('login failed'));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult> unreadList() async {
    List<ChatContactList> _listBaseBean = [];
    String messageNum;
    String lastMessage;
    String createTime;
    String cachedSignInUser = sharedPreferences.get('CACHED_SIGN_IN_USER');
    if (cachedSignInUser == null) {
      return ApiResult.failure(
          error: NetworkExceptions.getDioException('login failed'));
    }
    Map<String, dynamic> formdata = {
      "tenantId": jsonDecode(cachedSignInUser)['tenantId'],
    };
    try {
      final responseMsg = await retroRestService.getUnreadMessages(formdata);
      final responseContacts = await retroRestService.getContacts(formdata);
      // print(responseMsg);
      // print(responseContacts);
      if (responseMsg['ok'] == true && responseContacts['ok'] == true) {
        if (responseMsg['data'] != "无新消息" &&
            responseContacts['data'] != ["no contacts"]) {
          List listMsg = responseMsg['data']['unReadRecords'];
          List listContacts = responseContacts['data'];
          for (int i = 0; i < listContacts.length; i++) {
            int count = 0;
            for (int j = 0; j < listMsg.length; j++) {
              if (listContacts[i]['contactId'] == listMsg[j]['senderId']) {
                count++;
                lastMessage = listMsg[j]['messageblob'];
                createTime = listMsg[j]['createTime'];
              }
            }
            if (lastMessage != null && createTime != null) {
              if (lastMessage.endsWith('.jpeg') ||
                  lastMessage.endsWith('.jpg') ||
                  lastMessage.endsWith('.png') ||
                  lastMessage.endsWith('.gif')) {
                lastMessage = "[图片]";
              } else if (lastMessage.endsWith('.m4a') ||
                  lastMessage.endsWith('.mp3')) {
                lastMessage = "[语音]";
              }
              messageNum = count.toString();
              if (messageNum != "0") {
                _listBaseBean.add(ChatContactList(
                    contactId: listContacts[i]['contactId'],
                    contactAvatar: listContacts[i]['contactAvatar'],
                    contactName: listContacts[i]['contactName'],
                    lastMessage: lastMessage,
                    createTime: createTime.substring(0, 16),
                    messageNum: messageNum));
              }
            }
          }
        }
        return ApiResult.success(data: _listBaseBean);
      }
      return ApiResult.failure(
          error: NetworkExceptions.getDioException('login failed'));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<Unit> sendChatMessageVoice(
      String msg, String type, String contactId, int duration) async {
    String cachedSignInUser = sharedPreferences.get('CACHED_SIGN_IN_USER');
    var imageName = msg.substring(msg.lastIndexOf("/") + 1, msg.length);
    if (type == '1' || type == '2') {
      FormData formdataUpload = FormData.fromMap({
        "file": await MultipartFile.fromFile(msg, filename: imageName),
        'dir': 'material',
        'fileType': 'image',
        'tenantId': jsonDecode(cachedSignInUser)['tenantId'],
      });
      final response = await retroRestService.uploadImgOrAudio(formdataUpload);
      if (response != null) {
        msg = jsonDecode(response)['link'];
      }
    }
    Map<String, dynamic> formdata = {
      "tenantId": jsonDecode(cachedSignInUser)['tenantId'],
      "affiliationId": jsonDecode(cachedSignInUser)['affiliated'].first,
      "delFlag": jsonDecode(cachedSignInUser)['delFlag'],
      "createTime": DateTime.now().toString().substring(0, 19),
      "senderId": jsonDecode(cachedSignInUser)['id'],
      "receiverId": contactId,
      "messageblob": msg,
      "status": "0",
      "type": type,
      "speech": duration
    };
    if (msg != "") {
      final response = await retroRestService.sendChatMessage(formdata);
      if (response['ok'] == true) {
        print(contactId);
        _clientService.client.send(
            destination: '/app/chat.private/' + contactId,
            body: json.encode({
              'id': jsonDecode(cachedSignInUser)['id'],
              'userName': jsonDecode(cachedSignInUser)['realName'],
              'userAvatar': jsonDecode(cachedSignInUser)['headimgUrl'],
              'type': type,
              'message': msg,
              "speech": duration
            }));
        print('success');
      } else {
        print('fail');
      }
    }
    return unit;
  }

  @override
  Future<ApiResult> slideshow() async {
    String cachedSignInUser = sharedPreferences.get('CACHED_SIGN_IN_USER');
    // String houseId = sharedPreferences.get('HOUSEID');
    // if (houseId == null) {
    //   String affiliateds = sharedPreferences.get('AFFILIATEDS');
    //   if (affiliateds != null) {
    //     houseId = jsonDecode(affiliateds)[0]["id"];
    //   }
    // }
    try {
      if (cachedSignInUser != null) {
        Map<String, dynamic> formdata = {
          "tenantId": jsonDecode(cachedSignInUser)['tenantId'],
        };
        final response = await retroRestService.slideshow(formdata);
        print(response);
        if (response['ok'] == true) {
          return ApiResult.success(data: response['data']);
        }
      }
      return ApiResult.failure(
          error: NetworkExceptions.getDioException('login failed'));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult> getAffiliated() async {
    String cachedSignInUser = sharedPreferences.get('CACHED_SIGN_IN_USER');
    print(jsonDecode(cachedSignInUser)['sessionKey']);
    try {
      if (cachedSignInUser != null) {
        Map<String, dynamic> formdata = {
          "tenantId": jsonDecode(cachedSignInUser)['tenantId'],
        };
        final response = await retroRestService.getAffiliated(formdata);
        print(response);
        if (response['ok'] == true) {
          return ApiResult.success(data: response['data']);
        }
      }
      return ApiResult.failure(
          error: NetworkExceptions.getDioException('login failed'));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult> getRoles() async {
    String cachedSignInUser = sharedPreferences.get('CACHED_SIGN_IN_USER');
    try {
      if (cachedSignInUser != null) {
        Map<String, dynamic> formdata = {
          "tenantId": jsonDecode(cachedSignInUser)['tenantId'],
        };
        final response = await retroRestService.getRoles(formdata);
        print(response);
        if (response['ok'] == true) {
          return ApiResult.success(data: response['data']);
        }
      }
      return ApiResult.failure(
          error: NetworkExceptions.getDioException('login failed'));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult> submitTestUserInfo(
      image, name, nickName, sex, role, listAffiliated) async {
    String cachedSignInUser = sharedPreferences.get('CACHED_SIGN_IN_USER');
    // print(cachedSignInUser);
    // print(image);
    // print(nickName);
    Map<String, dynamic> map = jsonDecode(cachedSignInUser);
    map['nickName'] = nickName;
    map['realName'] = name;
    map['realName'] = name;
    map['sex'] = sex;
    map['userRole'] = role;
    map['affiliated'] = listAffiliated;
    if (image.startsWith('https')) {
      map['headimgUrl'] = image;
    } else {
      var imageName = image.substring(image.lastIndexOf("/") + 1, image.length);
      FormData formdataUpload = FormData.fromMap({
        "file": await MultipartFile.fromFile(image, filename: imageName),
        'dir': 'material',
        'fileType': 'image',
        'tenantId': jsonDecode(cachedSignInUser)['tenantId'],
      });
      final response = await retroRestService.uploadImgOrAudio(formdataUpload);
      if (response != null) {
        String imgOnline = jsonDecode(response)['link'];
        // print(imgOnline);
        map['headimgUrl'] = imgOnline;
      }
    }
    try {
      final response = await retroRestService.submitInfo(map);
      print(response);
      if (response['ok'] == true) {
        sharedPreferences.remove('CACHED_SIGN_IN_USER');
        sharedPreferences.setString(CACHED_SIGN_IN_USER, json.encode(map));

        List<String> listAid = [];
        List listAffid = listAffiliated;
        for (int i = 0; i < listAffid.length; i++) {
          listAid.add(listAffid[i].toString());
        }
        final responseAffIds = await authRestService.getAffCode(listAid,
            "application/json", jsonDecode(cachedSignInUser)['sessionKey']);
        print(responseAffIds);
        await sharedPreferences.setString(
            AFFILIATEDS, json.encode(responseAffIds['data']));

        List list = [];
        list.add(response['data'].toString());
        return ApiResult.success(data: list);
      }
      return ApiResult.failure(
          error: NetworkExceptions.getDioException('login failed'));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
