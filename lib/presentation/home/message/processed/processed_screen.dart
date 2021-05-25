import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/messages/processed/processed_bloc.dart';

import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/core/fintness_app_theme.dart';
import 'package:flutter_ui/presentation/home/message/processed/is_processed_view.dart';
import 'package:flutter_ui/presentation/home/message/processed/processed_houseing_view.dart';
import 'package:flutter_ui/presentation/home/message/processed/processed_view.dart';
import 'package:flutter_ui/presentation/home/ui_view/processed_botton_view.dart';

import 'package:flutter_ui/presentation/home/ui_view/processed_custom_view.dart';
import 'package:flutter_ui/presentation/home/ui_view/processed_title_view.dart';

class ProcessedScreen extends StatefulWidget {
  const ProcessedScreen() : super();

  @override
  _ProcessedScreenState createState() => _ProcessedScreenState();
}

class _ProcessedScreenState extends State<ProcessedScreen>
    with TickerProviderStateMixin {
  Animation<double> topBarAnimation;
  AnimationController animationController;
  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;
  Map<String, dynamic> processedData = {};
  var pf = ['A', 'B', 'C', 'D'];
  String showStringDate;
  Map<String, dynamic> routdatas;
  @override
  void initState() {
    routdatas = {};
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
  }

  void addAllListData(routdata) {
    const int count = 9;
    listViews.add(Padding(
      padding: const EdgeInsets.only(
        left: 10,
      ),
      child: Container(
        child: Text(
          routdata["tenantName"],
          style: TextStyle(
            fontFamily: FitnessAppTheme.fontName,
            fontWeight: FontWeight.w500,
            fontSize: 18,
            letterSpacing: 0.5,
            color: FitnessAppTheme.lightText,
          ),
        ),
      ),
    ));
    if (routdata["taskDefinitionKey"] != "Activity_0fvuxs2" &&
        routdata["taskDefinitionKey"] != "Activity_0ossp3s") {
      // listViews.add(ProcessedTitleView(
      //   titleTxt: '客户信息',
      //   animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      //       parent: animationController,
      //       curve:
      //           Interval((1 / count) * 4, 1.0, curve: Curves.fastOutSlowIn))),
      //   animationController: animationController,
      // ));
      listViews.add(ProcessedCustomView(
        action: "1",
        title: "客户信息",
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: animationController,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: animationController,
      ));

      // if (routdata["taskDefinitionKey"] != "Activity_1h77h4t" &&
      //     routdata["taskDefinitionKey"] != "Activity_0qk9snp" &&
      //     routdata["taskDefinitionKey"] != "Activity_0x97rbo" &&
      //     routdata["taskDefinitionKey"] != "Activity_0cy1bz9" &&
      //     routdata["taskDefinitionKey"] != "Activity_0zeqsng" &&
      //     routdata["taskDefinitionKey"] != "Activity_00n2pwo" &&
      //     routdata["taskDefinitionKey"] != "Activity_0kdzv8w" &&
      //     routdata["taskDefinitionKey"] != "Activity_1cbo1ao") {
      // listViews.add(ProcessedTitleView(
      //   titleTxt: '经纪人信息',
      //   animation: Tween<double>(begin: 0.0, end: 1.0).animate(
      //       CurvedAnimation(
      //           parent: animationController,
      //           curve: Interval((1 / count) * 4, 1.0,
      //               curve: Curves.fastOutSlowIn))),
      //   animationController: animationController,
      // ));
      if (routdata["taskDefinitionKey"] != "Activity_1h77h4t" &&
          routdata["taskDefinitionKey"] != "Activity_0qk9snp" &&
          routdata["taskDefinitionKey"] != "Activity_0x97rbo" &&
          routdata["taskDefinitionKey"] != "Activity_0cy1bz9" &&
          routdata["taskDefinitionKey"] != "Activity_0zeqsng" &&
          routdata["taskDefinitionKey"] != "Activity_00n2pwo" &&
          routdata["taskDefinitionKey"] != "Activity_0kdzv8w" &&
          routdata["taskDefinitionKey"] != "Activity_1cbo1ao" &&
          routdata["taskDefinitionKey"] != "Activity_1u7ja7r") {
        listViews.add(ProcessedCustomView(
          action: "2",
          title: "经纪人信息",
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: animationController,
                  curve: Interval((1 / count) * 2, 1.0,
                      curve: Curves.fastOutSlowIn))),
          animationController: animationController,
        ));
      }
      // }
      // listViews.add(ProcessedTitleView(
      //   titleTxt: '置业顾问信息',
      //   animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      //       parent: animationController,
      //       curve:
      //           Interval((1 / count) * 4, 1.0, curve: Curves.fastOutSlowIn))),
      //   animationController: animationController,
      // ));
      listViews.add(ProcessedCustomView(
        action: "3",
        title: "置业顾问信息",
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: animationController,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: animationController,
      ));
    }
    if (routdata["taskDefinitionKey"] == "Activity_0fvuxs2" ||
        routdata["taskDefinitionKey"] == "Activity_0ossp3s") {
      listViews.add(ProcessedHouseIngView(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: animationController,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: animationController,
      ));
    }
    listViews.add(ProcessedTitleView(
      titleTxt: '',
      animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: animationController,
          curve: Interval((1 / count) * 4, 1.0, curve: Curves.fastOutSlowIn))),
      animationController: animationController,
    ));
    // listViews.add(ProcessedManageNo(
    //   animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    //       parent: animationController,
    //       curve: Interval((1 / count) * 4, 1.0, curve: Curves.fastOutSlowIn))),
    //   animationController: animationController,
    // ));
    listViews.add(ProcessedsView());
    // listViews.add(Container(
    //   padding: EdgeInsets.fromLTRB(30, 10, 40, 10),
    //   child: JhPhotoPicker(
    //       lfPaddingSpace: 20,
    //       callBack: (var img) {
    //         print("img-------------");
    //         print(img.length);
    //         print(img);
    //         print("img-------------");
    //       }),
    // ));
    listViews.add(IsProcessedView());
    listViews.add(
      ProcessedBottonView(),
    );
    listViews.add(SizedBox(height: 50));

    // listViews.add(
    //   AreaListView(
    //     mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
    //         CurvedAnimation(
    //             parent: animationController,
    //             curve: Interval((1 / count) * 5, 1.0,
    //                 curve: Curves.fastOutSlowIn))),
    //     mainScreenAnimationController: animationController,
    //   ),
    // );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> routdata = RouteData.of(context).arguments;
    print(routdata);
    setState(() {
      listViews = [];
    });
    this.addAllListData(routdata);
    return BlocProvider<ProcessedBloc>(
        create: (context) => getIt<ProcessedBloc>()
          ..add(ProcessedEvent.saveData(routdata))
          ..add(ProcessedEvent.getProcessData())
          ..add(ProcessedEvent.getNextTimeData(routdata["processInstanceId"])),

        //..add(ProcessedEvent.getNextTimeData(routdata["processInstanceId"])),

        // ..mapEventToState(
        //     ProcessedEvent.getProcessData(routdata["processInstanceId"])),
        // ..add(ProcessedEvent.getProcessData(routdata["processInstanceId"])),
        child: BlocConsumer<ProcessedBloc, ProcessedState>(
          builder: (BuildContext context, state) {
            return Listener(
              onPointerDown: (onPointerDown) {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Container(
                color: FitnessAppTheme.background,
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body:
                      // SingleChildScrollView(
                      //   physics: BouncingScrollPhysics(),
                      //   // scrollDirection: Axis.horizontal,
                      //   controller: ScrollController(),
                      //   child:
                      Stack(
                    children: <Widget>[
                      getMainListViewUI(),
                      getAppBarUI(),
                      SizedBox(
                        height: MediaQuery.of(context).padding.bottom,
                      )
                    ],
                  ),
                  // ),
                ),
              ),
            );
          },
          listener: (BuildContext context, state) {
            showStringDate = state.showStringDate;
          },
        ));
  }

  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              animationController.forward();
              return listViews[index];
            },
          );
        }
      },
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget child) {
            return FadeTransition(
              opacity: topBarAnimation,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FitnessAppTheme.white.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: FitnessAppTheme.grey
                              .withOpacity(0.4 * topBarOpacity),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16 - 8.0 * topBarOpacity,
                            bottom: 12 - 8.0 * topBarOpacity),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                                icon: Icon(Icons.arrow_back,
                                    color: Colors.blue, size: 25),
                                onPressed: () {
                                  Navigator.of(context).pop("refresh");
                                }),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '流程处理',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: FitnessAppTheme.fontName,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22 + 6 - 6 * topBarOpacity,
                                    letterSpacing: 1.2,
                                    color: Colors.blue,
                                    // FitnessAppTheme.darkerText,
                                  ),
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   height: 38,
                            //   width: 38,
                            //   child: InkWell(
                            //     highlightColor: Colors.transparent,
                            //     borderRadius: const BorderRadius.all(
                            //         Radius.circular(32.0)),
                            //     onTap: () {
                            //       print("日期左边按钮");
                            //     },
                            //     child: Center(
                            //       child: Icon(
                            //         Icons.keyboard_arrow_left,
                            //         color: FitnessAppTheme.grey,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //     left: 8,
                            //     right: 8,
                            //   ),
                            //   child: Row(
                            //     children: <Widget>[
                            //       Padding(
                            //         padding: const EdgeInsets.only(right: 8),
                            //         child: Icon(
                            //           Icons.calendar_today,
                            //           color: FitnessAppTheme.grey,
                            //           size: 18,
                            //         ),
                            //       ),
                            //       Text(
                            //         '15 May',
                            //         textAlign: TextAlign.left,
                            //         style: TextStyle(
                            //           fontFamily: FitnessAppTheme.fontName,
                            //           fontWeight: FontWeight.normal,
                            //           fontSize: 18,
                            //           letterSpacing: -0.2,
                            //           color: FitnessAppTheme.darkerText,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 38,
                            //   width: 38,
                            //   child: InkWell(
                            //     highlightColor: Colors.transparent,
                            //     borderRadius: const BorderRadius.all(
                            //         Radius.circular(32.0)),
                            //     onTap: () {
                            //       print("日期右边按钮");
                            //     },
                            //     child: Center(
                            //       child: Icon(
                            //         Icons.keyboard_arrow_right,
                            //         color: FitnessAppTheme.grey,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
