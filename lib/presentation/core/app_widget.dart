import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/app_theme.dart';
import 'package:flutter_ui/application/auth/auth_bloc.dart';
import 'package:flutter_ui/application/autoenter/autoenter_bloc.dart';
import 'package:flutter_ui/application/wxpage/choose_tented/choosetented_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart' as route;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // 该属性仅用于 **Android** 设备且 **SDK >= M** 时，顶部状态栏颜色；
      statusBarColor: Colors.transparent,
      //  该属性仅用于 **Android** 设备且 **SDK >= M** 时，顶部状态栏图标的亮度；但感觉并不明显；
      statusBarIconBrightness: Brightness.dark,
      // 该属性仅用于 **iOS** 设备顶部状态栏亮度；
      statusBarBrightness:
          Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    final botToastBuilder = BotToastInit();
    return RefreshConfiguration(
        headerBuilder: () =>
            WaterDropHeader(), // 配置默认头部指示器,假如你每个页面的头部指示器都一样的话,你需要设置这个
        footerBuilder: () => ClassicFooter(), // 配置默认底部指示器
        headerTriggerDistance: 80.0, // 头部触发刷新的越界距离
        springDescription: SpringDescription(
            stiffness: 170,
            damping: 16,
            mass: 1.9), // 自定义回弹动画,三个属性值意义请查询flutter api
        maxOverScrollExtent: 100, //头部最大可以拖动的范围,如果发生冲出视图范围区域,请设置这个属性
        maxUnderScrollExtent: 0, // 底部最大可以拖动的范围
        enableScrollWhenRefreshCompleted:
            true, //这个属性不兼容PageView和TabBarView,如果你特别需要TabBarView左右滑动,你需要把它设置为true
        enableLoadingWhenFailed: true, //在加载失败的状态下,用户仍然可以通过手势上拉来触发加载更多
        hideFooterWhenNotFull: false, // Viewport不满一屏时,禁用上拉加载更多功能
        enableBallisticLoad: true, // 可以通过惯性滑动触发加载更多
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  getIt<AutoenterBloc>()..add(AutoenterEvent.getcoumerstype()),
            ),
            BlocProvider(
              create: (context) => getIt<AuthBloc>()
                ..add(const AuthBlocEvent.authCheckRequested()),
            ),
            BlocProvider(
              create: (context) =>
                  getIt<ChoosetentedBloc>()..add(ChoosetentedEvent.started()),
            ),
          ],
          //       MaterialApp(
          //         localizationsDelegates: [
          //           // 这行是关键
          //           RefreshLocalizations.delegate,
          //           GlobalWidgetsLocalizations.delegate,
          //           GlobalMaterialLocalizations.delegate
          //         ],
          //         supportedLocales: [
          //           const Locale('en'),
          //           const Locale('zh'),
          //         ],
          //         localeResolutionCallback:
          //             (Locale locale, Iterable<Locale> supportedLocales) {
          //           //print("change language");
          //           return locale;
          //         },
          // )
          child: MaterialApp(
            title: '新客邦',
            debugShowCheckedModeBanner: false,
            // builder: ExtendedNavigator(router: route.Router()),
            builder: (context, child) {
              child = ExtendedNavigator(router: route.Router());
              child = botToastBuilder(context, child);
              return child;
            },
            navigatorObservers: [BotToastNavigatorObserver()],
            home: ExtendedNavigator(router: route.Router()),
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: AppTheme.textTheme,
              platform: TargetPlatform.iOS,
            ),
            localizationsDelegates: [
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [Locale('pt', 'BR')],
            // theme: ThemeData.light().copyWith(
            //   primaryColor: Colors.blue[500],
            //   accentColor: Colors.blueAccent,
            //   floatingActionButtonTheme: FloatingActionButtonThemeData(
            //     backgroundColor: Colors.blue[900],
            //   ),
            //   inputDecorationTheme: InputDecorationTheme(
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(8),
            //     ),
            //   ),
            // ),
          ),
        ));
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
