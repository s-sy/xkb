import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_ui/infrastructure/webscoket/client_service.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

abstract class WebScoket {
  Future<Unit> clientConnect();
  Future<Unit> sendChatMessage(String msg, String type, String contactId);
  Future<Unit> disconnectWebsocket();
  Future<Unit> receiveChatMessage(String contactId);
  Future<Unit> getContacts();
  Future<Unit> getId(String contactId);
  Future<Unit> getUnreadMessages();
  Future<Unit> historyMessage(String contactId);
}

const REQUEST_MASTER_USRL = 'https://dev.aiforest.net/broker';
const UNREAD_MESSAGES = 'UNREAD_MESSAGES';
const GET_CONTACTS = 'GET_CONTACTS';
const HISTORYMESSAGE = 'HISTORYMESSAGE';

@LazySingleton(as: WebScoket)
class StompServiceImpl implements WebScoket {
  final http.Client client;
  ClientService _clientService;
  StompServiceImpl(this._clientService, this.client) : super();
  @override
  Future<Unit> clientConnect() async {
    _clientService.client.activate();
    return unit;
  }

  @override
  Future<Unit> sendChatMessage(msg, type, contactId) async {
    Dio dio = new Dio();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String cachedSignInUser = sharedPreferences.get('CACHED_SIGN_IN_USER');
    String sessionKey = sharedPreferences.get('CACHED_SESSION_KEY');
    var imageName = msg.substring(msg.lastIndexOf("/") + 1, msg.length);
    if (type == '1' || type == '2') {
      FormData formdata = FormData.fromMap({
        "file": await MultipartFile.fromFile(msg, filename: imageName),
        'dir': 'material',
        'fileType': 'image',
        'tenantId': jsonDecode(cachedSignInUser)['tenantId'],
      });

      var respone = await dio.post<String>(
        "https://dev.aiforest.net/broker/mapi/br/file/upload",
        data: formdata,
        options: Options(headers: {'third-session': sessionKey}),
      );
      if (respone.statusCode == 200) {
        msg = jsonDecode(respone.data)['link'];
      }
    }

    Map<String, dynamic> _setFormData = {
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
    _clientService.client.send(
        destination: '/app/chat.private/' + contactId,
        body: json.encode({
          'id': jsonDecode(cachedSignInUser)['id'],
          'userName': jsonDecode(cachedSignInUser)['realName'],
          'userAvatar': jsonDecode(cachedSignInUser)['headimgUrl'],
          'type': type,
          'message': msg
        }));
    final response = await client.post(
        REQUEST_MASTER_USRL + '/mapi/br/chatting/add',
        headers: {
          'third-session': sessionKey,
          "content-type": "application/json"
        },
        body: jsonEncode(_setFormData));
    if (response.statusCode == 200) {
      print('success');
    } else {
      print('fail');
    }
    return unit;
  }

  @override
  Future<Unit> disconnectWebsocket() async {
    _clientService.client.deactivate();
    return unit;
  }

  @override
  Future<Unit> historyMessage(String contactId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String sessionKey = sharedPreferences.get('CACHED_SESSION_KEY');
    String cachedSignInUser = sharedPreferences.get('CACHED_SIGN_IN_USER');
    Dio dio = new Dio();
    Map<String, dynamic> formdata = {
      "receiverId": contactId,
      "senderId": jsonDecode(cachedSignInUser)['id'],
    };
    final response = await dio.get<String>(
      REQUEST_MASTER_USRL + '/mapi/br/chatting/page',
      queryParameters: formdata,
      options: Options(headers: {'third-session': sessionKey}),
    );
    // print(response);
    if (response.statusCode == 200) {
      String responseString =
          jsonEncode(jsonDecode(response.data)['data']['records']);
      sharedPreferences.setString(HISTORYMESSAGE, responseString);
    } else {
      print('写异常');
    }
    return unit;
  }

  @override
  Future<Unit> receiveChatMessage(contactId) async {
    //这个地方怎么写呢？
    print(contactId);
    return unit;
  }

  @override
  Future<Unit> getContacts() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String sessionKey = sharedPreferences.get('CACHED_SESSION_KEY');
    String cachedSignInUser = sharedPreferences.get('CACHED_SIGN_IN_USER');
    // print(sessionKey);
    // print(jsonDecode(cachedSignInUser)['tenantId']);
    Dio dio = new Dio();
    Map<String, dynamic> formdata = {
      "tenantId": jsonDecode(cachedSignInUser)['tenantId'],
    };
    final response = await dio.get<String>(
      REQUEST_MASTER_USRL + '/mapi/br/chatting/contacts',
      queryParameters: formdata,
      options: Options(headers: {'third-session': sessionKey}),
    );
    // print(jsonDecode(response.data));
    if (response.statusCode == 200) {
      String responseString = jsonEncode(jsonDecode(response.data)['data']);
      sharedPreferences.setString(GET_CONTACTS, responseString);
    } else {
      print('写异常');
    }
    return unit;
  }

  @override
  Future<Unit> getId(String contactId) async {
    Dio dio = new Dio();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String sessionKey = sharedPreferences.get('CACHED_SESSION_KEY');
    final response = await dio.get<String>(
      REQUEST_MASTER_USRL + '/mapi/br/chatting/received/' + contactId,
      options: Options(headers: {'third-session': sessionKey}),
    );
    // print("未读消息变已读");
    // print(jsonDecode(response.data)['data']);
    return unit;
  }

  @override
  Future<Unit> getUnreadMessages() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String sessionKey = sharedPreferences.get('CACHED_SESSION_KEY');
    String cachedSignInUser = sharedPreferences.get('CACHED_SIGN_IN_USER');
    Dio dio = new Dio();
    Map<String, dynamic> formdata = {
      "tenantId": jsonDecode(cachedSignInUser)['tenantId']
    };
    final response = await dio.get<String>(
      REQUEST_MASTER_USRL + '/mapi/br/chatting/unread',
      queryParameters: formdata,
      options: Options(headers: {'third-session': sessionKey}),
    );
    if (response.statusCode == 200) {
      if (jsonDecode(response.data)['data'] == '无新消息' ||
          jsonDecode(response.data)['data'] == null) {
        print('无新消息');
      } else {
        String responseString =
            jsonEncode(jsonDecode(response.data)['data']['unReadRecords']);
        sharedPreferences.setString(UNREAD_MESSAGES, responseString);
      }
    } else {
      print('写异常');
    }
    return unit;
  }
}
