import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

Map<String, dynamic> onlineChat;
const ONLINE_CHAT = 'ONLINE_CHAT';

@lazySingleton
class ClientService {
  // final String session;

  static const Duration CONNECTION_TIMEOUT = const Duration(milliseconds: 3000);

  // static const STOMPURL = 'https://dev.aiforest.net/broker/ws';
  static const STOMPURL = 'https://ad.kehuoa.com/broker/ws';
  // static const STOMPURL = 'http://192.168.22.201:8082/broker/ws';
  StompClient _stompClient;
  StompClient get client => _stompClient;
  Map<String, dynamic> receiveMsg;

  ClientService({@Named("baseSession") String baseSession}) {
    _stompClient = StompClient(
        config: StompConfig.SockJS(
            url: STOMPURL,
            connectionTimeout: CONNECTION_TIMEOUT,
            stompConnectHeaders: {'token': baseSession},
            heartbeatOutgoing: 20000,
            heartbeatIncoming: 0,
            onConnect: onConnect,
            reconnectDelay: 60000,
            onWebSocketError: error));
  }
  dynamic error(e) {
    print(e.toString());
  }

  dynamic onConnect(StompClient client, StompFrame frame) {
    client.subscribe(
        destination: '/user/exchange/amq.direct/chat.message',
        callback: (StompFrame frame) async {
          Map<String, dynamic> result = json.decode(frame.body);
          print('接收消息');
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          sharedPreferences.setString(ONLINE_CHAT, jsonEncode(result));
          receiveMsg = result;
        });
    client.subscribe(
        destination: '/app/chat.participants',
        callback: (StompFrame frame) {
          List<dynamic> result = json.decode(frame.body);
          print('获取在线列表');
          print(result);
        });
    client.subscribe(
        destination: '/topic/chat.login',
        callback: (StompFrame frame) {
          var result = json.decode(frame.body);
          print('登陆');
          print(result);
        });
    client.subscribe(
        destination: '/topic/chat.logout',
        callback: (StompFrame frame) {
          var result = json.decode(frame.body);
          print('退出');
          print(result);
        });
    return receiveMsg;
  }

  Map<String, dynamic> getReceiveMsg() {
    // print('zheliyoumeiyou~~~~~~~~~~~~~~~~~');
    return receiveMsg;
  }
}
