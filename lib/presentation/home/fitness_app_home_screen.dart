import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

import 'package:flutter_ui/application/message/bloc/web_scoket_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/core/fintness_app_theme.dart';
import 'package:flutter_ui/presentation/home/customer/customer_page.dart';
import 'package:flutter_ui/presentation/home/houseing/houseing_screen.dart';
import 'package:flutter_ui/presentation/home/message/message_page.dart';
import 'package:flutter_ui/presentation/home/mine/mine_screen.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';

import 'bottom_navigation_view/bottom_bar_view.dart';
import 'models/tabIcon_data.dart';

class FitnessAppHomeScreen extends StatefulWidget {
  final int msgPageTabIndex;

  const FitnessAppHomeScreen({Key key, this.msgPageTabIndex}) : super(key: key);

  @override
  _FitnessAppHomeScreenState createState() => _FitnessAppHomeScreenState();
}

class _FitnessAppHomeScreenState extends State<FitnessAppHomeScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  AnimationController animationController;
  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: FitnessAppTheme.background,
  );
  final JPush jPush = JPush();

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = MessagePage(msgPageTabIndex: widget.msgPageTabIndex);
    super.initState();
    //监听是否前后台
    WidgetsBinding.instance.addObserver(this);
    jPush.addEventHandler(
        onReceiveNotification: (Map<String, dynamic> message) async {
      print("接收到推送: $message");
      FlutterAppBadger.updateBadgeCount(1);
    }, onOpenNotification: (Map<String, dynamic> message) async {
      print("通过点击推送进入app: $message");
      FlutterAppBadger.removeBadge();
      if (message['alert'].toString().startsWith('您收到一条客户咨询消息'))
        ExtendedNavigator.of(context).replace(Routes.fitnessAppHomeScreen,
            arguments: FitnessAppHomeScreenArguments(
              msgPageTabIndex: 1,
            ));
      if (message['alert'].toString().startsWith('您有一条推荐客户'))
        // Navigator.push(
        //   context,
        //   new MaterialPageRoute(
        //       builder: (context) => new FitnessAppHomeScreen(
        //             msgPageTabIndex: 1,
        //           )),
        // );
        ExtendedNavigator.of(context).replace(Routes.fitnessAppHomeScreen,
            arguments: FitnessAppHomeScreenArguments(
              msgPageTabIndex: 0,
            ));
      if (message['alert'].toString().endsWith('号码客户被推荐'))
        ExtendedNavigator.of(context).replace(Routes.fitnessAppHomeScreen,
            arguments: FitnessAppHomeScreenArguments(
              msgPageTabIndex: 3,
            ));
      //号码客户重复被推荐
    }, onReceiveMessage: (Map<String, dynamic> message) async {
      print("接收到自定义消息: $message");
    }, onReceiveNotificationAuthorization:
            (Map<String, dynamic> message) async {
      print("通知权限状态: $message");
    });
    // FlutterAppBadger.removeBadge(); //直接清除呢？
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive: // 处于这种状态的应用程序应该假设它们可能在任何时候暂停。
        break;
      case AppLifecycleState.resumed: // 应用程序可见，前台
        FlutterAppBadger.removeBadge(); //点击进入前台让角标消失，没有多次测试
        break;
      case AppLifecycleState.paused: // 应用程序不可见，后台
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<WebScoketBloc>()
          ..add(const WebScoketEvent.connectWebsocket())
          ..add(WebScoketEvent.setJPushRid()),
        child: BlocConsumer<WebScoketBloc, WebScoketState>(
            listener: (context, state) async {},
            builder: (context, state) {
              return Container(
                color: FitnessAppTheme.background,
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: FutureBuilder<bool>(
                    future: getData(),
                    builder:
                        (BuildContext context, AsyncSnapshot<bool> snapshot) {
                      if (!snapshot.hasData) {
                        return const SizedBox();
                      } else {
                        return Stack(
                          children: <Widget>[
                            tabBody,
                            bottomBar(),
                          ],
                        );
                      }
                    },
                  ),
                ),
              );
            }));
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      MessagePage(msgPageTabIndex: widget.msgPageTabIndex);
                });
              });
            } else if (index == 1) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = CustomerPage();
                });
              });
            } else if (index == 2) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      HouseingScreen(animationController: animationController);
                });
              });
            } else if (index == 3) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      MineScreen(animationController: animationController);
                });
              });
            }
          },
        ),
      ],
    );
  }
}
