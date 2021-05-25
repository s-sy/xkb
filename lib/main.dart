import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui/presentation/core/app_widget.dart';
import 'package:injectable/injectable.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injection.dart';

//极光推送
final JPush jPush = JPush();
String JPUSHRID = "JPUSHRID";
Future<void> initPlatformStateJPush() async {
  jPush.getRegistrationID().then((rid) async {
    print('------->rid:${rid}');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(JPUSHRID, rid);
  });
  jPush.setup(
    appKey: "6d90238b1d07184f75a8ba48",
    channel: "developer-default",
    production: false,
    debug: true,
  );
  jPush.applyPushAuthority(
      NotificationSettingsIOS(sound: true, alert: true, badge: true));
  try {
    jPush.addEventHandler(
        onReceiveNotification: (Map<String, dynamic> message) async {
      print('---->接收到推送:${message}');
    });
  } on Exception {
    print("---->获取平台版本失败");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Environment.prod);

  await enableFluttifyLog(false);
  await AmapService.instance.init(
    iosKey: '7cf6ca84921fbeb6d6ed5641f0f877e0',
    androidKey: 'd3a3302d8f1b948c0e8efe7bac73d2d4',
  );
  await AmapCore.init('7cf6ca84921fbeb6d6ed5641f0f877e0');

  initPlatformStateJPush();

  // 竖直方向
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(AppWidget()));
  SystemUiOverlayStyle systemUiOverlayStyle =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}
