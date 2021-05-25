import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_ui/application/message/bloc/web_scoket_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/core/fintness_app_theme.dart';
import 'package:flutter_ui/presentation/home/message/contacts_list.dart';
import 'package:flutter_ui/presentation/home/message/follow_up.dart';
import 'package:flutter_ui/presentation/home/message/need_to_deal.dart';
import 'package:flutter_ui/presentation/home/message/process_need_deal.dart';
import 'package:flutter_ui/presentation/home/message/remind_list.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MessagePage extends StatefulWidget {
  final int msgPageTabIndex;
  MessagePage({Key key, this.msgPageTabIndex}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

bool _isManager = false;

class _MessagePageState extends State<MessagePage>
    with SingleTickerProviderStateMixin {
  final JPush jPush = JPush();
  String remindCount = "0";
  String talkCount = "0";
  TabController _tabController;
  double topBarOpacity = 0.0;

  Future<String> _getUserRole() async {
    String manager = "";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String cachedSignInUser = sharedPreferences.get('CACHED_SIGN_IN_USER');
    if (cachedSignInUser != null) {
      manager = jsonDecode(cachedSignInUser)['userRole'];
      // print(manager + '+++++++++++++++++++++++');
    }
    return manager;
  }

  Future<void> _userRoleJudge() async {
    String manager = "";
    await _getUserRole().then((value) {
      manager = value;
    });
    if (manager == "manager") {
      setState(() {
        _isManager = true;
      });
    }
    _tabController = new TabController(
        initialIndex:
            widget.msgPageTabIndex != null ? widget.msgPageTabIndex : 0,
        length: _isManager ? 4 : 3,
        vsync: this);
    // print(manager + '-----------------------');
  }

  @override
  void initState() {
    super.initState();
    _userRoleJudge();
    // print(_isManager);
    // _tabController.addListener(() {
    //   print(_tabController.index);
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _isManager = false;
  }

  @override
  Widget build(BuildContext context) {
//     return
//     MultiBlocProvider(
//   providers: [
//     BlocProvider<WebScoketBloc>(
//       create: (BuildContext context) =>  getIt<WebScoketBloc>()
//       ..add(const WebScoketEvent.unreadMessageCount()),
//     ),
//     BlocProvider<ProcessedBloc>(
//       create: (BuildContext context) => getIt<ProcessedBloc>(),
//     ),
//   ],

//   child: MultiBlocListener(
//   listeners: [
//     BlocListener<WebScoketBloc, WebScoketState>(
//       listener: (context, state) {},
//     ),
//     BlocListener<ProcessedBloc, ProcessedState>(
//       listener: (context, state) {

//       },
//     ),
//   ],
//   child:  RefreshConfiguration.copyAncestor(
//               enableLoadingWhenFailed: true,
//               context: context,
//               child: DefaultTabController(
//                 length: _isManager ? 4 : 3,
//                 child: Scaffold(
//                   appBar: AppBar(
//                     title: Text('消息'),
//                     elevation: 0.1,
//                     bottom: PreferredSize(
//                       preferredSize: Size.fromHeight(48),
//                       child: Container(
//                           decoration: BoxDecoration(color: Colors.grey[50]),
//                           child: Column(
//                             children: <Widget>[
//                               Container(
//                                 decoration: BoxDecoration(color: Colors.white),
//                                 child: TabBar(
//                                   indicatorColor: Colors.blue[400],
//                                   indicatorSize: TabBarIndicatorSize.label,
//                                   indicatorWeight: 2.0,
//                                   tabs: <Widget>[
//                                     _mainTabBar('跟进', Icons.assignment),
//                                     _mainTabBar(
//                                         '待办', Icons.assignment_turned_in),
//                                     _mainTabBar('通讯', Icons.assignment_ind),
//                                     if (_isManager)
//                                       _otherTabBar(
//                                           '提醒', Icons.assignment_late, state),
//                                   ],
//                                   onTap: (int index) {
//                                     if (index == 3) {
//                                       setState(() {
//                                         count = "0";
//                                       });
//                                     }
//                                   },
//                                 ),
//                               )
//                             ],
//                           )),
//                     ),
//                   ),
//                   body: TabBarView(
//                     children: <Widget>[
//                       FollowUp(),
//                        MessageDoSth(state.doSth[index])),
//                       // Icon(Icons.change_history,
//                       //     size: 128.0, color: Colors.black12),
//                       ContactsList(),
//                       if (_isManager) RemindList()
//                     ],
//                   ),
//                 ),
//               ),
// ));

    return BlocProvider(
        create: (BuildContext context) => getIt<WebScoketBloc>()
          ..add(const WebScoketEvent.unreadMessageCount())
          ..add(const WebScoketEvent.unreadList())
          ..add(const WebScoketEvent.slideshow()),
        child: BlocConsumer<WebScoketBloc, WebScoketState>(
            listener: (context, state) async {
          int messageCount = 0;
          for (int i = 0; i < state.unreadList.length; i++) {
            String messageNum = state.unreadList[i].messageNum;
            messageCount = int.parse(messageNum) + messageCount;
          }
          setState(() {
            remindCount = state.unreadMessageCount;
            talkCount = messageCount.toString();
          });
        }, builder: (BuildContext context, state) {
          return RefreshConfiguration.copyAncestor(
              enableLoadingWhenFailed: true,
              context: context,
              child: DefaultTabController(
                length: _isManager ? 4 : 3,
                child: Scaffold(
                  appBar: AppBar(
                    // title: Container(
                    //   color: Colors.yellow,
                    //   child: Padding(
                    //     padding: EdgeInsets.only(
                    //         left: 16,
                    //         right: 16,
                    //         top: 16 - 8.0 * topBarOpacity,
                    //         bottom: 12 - 8.0 * topBarOpacity),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: <Widget>[
                    //         Expanded(
                    //           child: Padding(
                    //             padding: const EdgeInsets.all(8.0),
                    //             child: Text(
                    //               '工作台',
                    //               textAlign: TextAlign.left,
                    //               style: TextStyle(
                    //                   fontFamily: FitnessAppTheme.fontName,
                    //                   fontWeight: FontWeight.w700,
                    //                   fontSize: 22 + 6 - 6 * topBarOpacity,
                    //                   letterSpacing: 1.2,
                    //                   color: Colors.blue
                    //                   // FitnessAppTheme.nearlyBlue,
                    //                   ),
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    brightness: Brightness.light,
                    backgroundColor: Colors.white,
                    elevation: 0.2,
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(170),
                      child: Container(
                          decoration: BoxDecoration(color: Colors.grey[50]),
                          child: Column(
                            children: <Widget>[
                              if (state.slideshow.length != 0)
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  height: 170,
                                  child: Swiper(
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Image.network(
                                        // "http://via.placeholder.com/350x150",
                                        // list[index],
                                        state.slideshow[index]['url'],
                                        fit: BoxFit.fill,
                                      );
                                    },
                                    itemCount: state.slideshow.length,
                                    pagination: SwiperPagination(),
                                    control: SwiperControl(),
                                  ),
                                  //     new Swiper(
                                  //   itemBuilder:
                                  //       (BuildContext context, int index) {
                                  //     return new Image.network(
                                  //       list[index],
                                  //       // "http://via.placeholder.com/288x188",
                                  //       fit: BoxFit.fill,
                                  //     );
                                  //   },
                                  //   itemCount: 3,
                                  //   viewportFraction: 0.8,
                                  //   scale: 0.9,
                                  // )
                                  //     new Swiper(
                                  //   itemBuilder:
                                  //       (BuildContext context, int index) {
                                  //     return new Image.network(
                                  //       // "http://via.placeholder.com/288x188",
                                  //       list[index],
                                  //       fit: BoxFit.fill,
                                  //     );
                                  //   },
                                  //   itemCount: 3,
                                  //   itemWidth: 300.0,
                                  //   layout: SwiperLayout.STACK,
                                  // )
                                ),
                              if (state.slideshow.length == 0)
                                Container(
                                  height: 150,
                                  width: 500,
                                  child: Image.asset(
                                    "assets/images/loupan02.jpeg",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              Container(
                                decoration: BoxDecoration(color: Colors.white),
                                child: TabBar(
                                  controller: _tabController,
                                  indicatorColor: Colors.blue[400],
                                  indicatorSize: TabBarIndicatorSize.label,
                                  indicatorWeight: 2.0,
                                  tabs: <Widget>[
                                    _mainTabBar(
                                        '待办', Icons.assignment_turned_in),
                                    _otherTabBar(
                                        '聊天', Icons.assignment, talkCount),
                                    _mainTabBar('通讯', Icons.assignment_ind),
                                    if (_isManager)
                                      _otherTabBar('提醒', Icons.assignment_late,
                                          remindCount),
                                  ],
                                  onTap: (int index) {
                                    if (index == 3) {
                                      setState(() {
                                        remindCount = "0";
                                      });
                                    } else if (index == 1) {
                                      setState(() {
                                        talkCount = "0";
                                      });
                                    }
                                  },
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                  body: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      // NeedToDeal(),
                      ProcessNeedDeal(),
                      FollowUp(),
                      ContactsList(),
                      if (_isManager) RemindList()
                    ],
                  ),
                ),
              ));
        }));

    // return RefreshConfiguration.copyAncestor(
    //     enableLoadingWhenFailed: true,
    //     context: context,
    //     child: DefaultTabController(
    //       length: _isManager ? 4 : 3,
    //       child: Scaffold(
    //         appBar: AppBar(
    //           title: Center(
    //             child: Text('消息'),
    //           ),
    //           // actions: <Widget>[
    //           //   IconButton(
    //           //     icon: Icon(Icons.menu),
    //           //     tooltip: 'More',
    //           //     onPressed: () async {
    //           //       /*三秒后出发本地推送*/
    //           //       var fireDate = DateTime.fromMillisecondsSinceEpoch(
    //           //           DateTime.now().millisecondsSinceEpoch + 3000);
    //           //       var localNotification = LocalNotification(
    //           //         id: 234,
    //           //         title: '我是推送测试标题',
    //           //         buildId: 1,
    //           //         content: '看到了说明已经成功了~~~',
    //           //         fireTime: fireDate,
    //           //         subtitle: '一个测试',
    //           //       );
    //           //       jPush.sendLocalNotification(localNotification).then((res) {
    //           //         print('发送本地消息，这里却不打印！');
    //           //         print(res);
    //           //         // setState(() {
    //           //         //   debugLable = res;
    //           //         // });
    //           //       });
    //           //     },
    //           //   )
    //           // ],
    //           elevation: 0.1,
    //           // backgroundColor: Colors.white,
    //           // toolbarHeight: 110.0,
    //           // toolbarHeight: 100.0,
    //           bottom: PreferredSize(
    //             preferredSize: Size.fromHeight(48),
    //             child: Container(
    //                 // height: 110,
    //                 decoration: BoxDecoration(color: Colors.grey[50]),
    //                 child: Column(
    //                   children: <Widget>[
    //                     // SizedBox(height: 2),
    //                     // CustonAppBar(),
    //                     // SizedBox(height: 10),
    //                     Container(
    //                       // height: 50.0,
    //                       decoration: BoxDecoration(color: Colors.white),
    //                       child: TabBar(
    //                         // unselectedLabelColor: Colors.black,
    //                         indicatorColor: Colors.blue[400],
    //                         indicatorSize: TabBarIndicatorSize.label,
    //                         // labelColor: Colors.yellow,
    //                         indicatorWeight: 2.0,
    //                         tabs: <Widget>[
    //                           main_tabBar('跟进', Icons.assignment),
    //                           main_tabBar('待办', Icons.assignment_turned_in),
    //                           main_tabBar('通讯', Icons.assignment_ind),
    //                           if (_isManager)
    //                             main_tabBar('提醒', Icons.assignment_late),
    //                         ],
    //                       ),
    //                     )
    //                   ],
    //                 )),
    //           ),
    //         ),
    //         body: TabBarView(
    //           children: <Widget>[
    //             FollowUp(),
    //             Icon(Icons.change_history, size: 128.0, color: Colors.black12),
    //             ContactsList(),
    //             if (_isManager) RemindList()
    //           ],
    //         ),
    //       ),
    //     ));
  }

  _mainTabBar(String _tabName, IconData icon) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.grey,
          ),
          Text(
            _tabName,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  _otherTabBar(String _tabName, IconData icon, String tabCount) {
    return Tab(
      child: Stack(
        alignment: Alignment.bottomRight,
        overflow: Overflow.visible,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.grey,
                ),
                Text(
                  _tabName,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          if (tabCount != "0")
            Container(
              margin: EdgeInsets.only(bottom: 18),
              width: 17,
              height: 17,
              decoration: new BoxDecoration(
                border: new Border.all(color: Colors.red, width: 0.5),
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  // '23',
                  tabCount,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
