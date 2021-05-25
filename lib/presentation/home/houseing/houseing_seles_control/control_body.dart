import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/house/house_control_bloc/house_control_bloc.dart';
import 'package:flutter_ui/presentation/core/fintness_app_theme.dart';
import 'package:flutter_ui/presentation/home/ui_view/house_from.dart';
import 'package:flutter_ui/presentation/home/ui_view/houseing_body_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControlBody extends StatefulWidget {
  final Map<String, dynamic> data;
  final AnimationController animationController;
  final List<dynamic> buildingList;
  final List<dynamic> housList;
  final List<dynamic> entranceList;
  final List<dynamic> buildEntranceList;
  const ControlBody(
      {Key key,
      this.data,
      this.animationController,
      this.buildingList,
      this.housList,
      this.entranceList,
      this.buildEntranceList})
      : super(key: key);
  @override
  _ControlBodyState createState() => _ControlBodyState();
}

class _ControlBodyState extends State<ControlBody>
    with TickerProviderStateMixin {
  Animation<double> topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
    addAllListData();

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

  Future<void> addAllListData() async {
    const int count = 5;
    // listViews.add(HouseingBodyItem(
    //   titleName: '楼盘ID',
    //   iconType: Icon(Icons.swap_calls),
    //   content: widget.data["affiliationId"],
    //   animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    //       parent: widget.animationController,
    //       curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
    //   animationController: widget.animationController,
    // ));

    // listViews.add(HouseingBodyItem(
    //   titleName: '楼栋号',
    //   iconType: Icon(Icons.swap_calls),
    //   content: widget.data["building"],
    //   animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    //       parent: widget.animationController,
    //       curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
    //   animationController: widget.animationController,
    // ));
    // listViews.add(HouseingBodyItem(
    //   titleName: '单元号',
    //   iconType: Icon(Icons.swap_calls),
    //   content: widget.data["entrance"],
    //   animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    //       parent: widget.animationController,
    //       curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
    //   animationController: widget.animationController,
    // ));
    // listViews.add(HouseingBodyItem(
    //   titleName: '房间号',
    //   iconType: Icon(Icons.swap_calls),
    //   content: widget.data["serialNumber"],
    //   animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    //       parent: widget.animationController,
    //       curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
    //   animationController: widget.animationController,
    // ));
    // listViews.add(HouseingBodyItem(
    //   titleName: '户型类型',
    //   iconType: Icon(Icons.swap_calls),
    //   content: widget.data["propertyType"],
    //   animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    //       parent: widget.animationController,
    //       curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
    //   animationController: widget.animationController,
    // ));
    // listViews.add(HouseingBodyItem(
    //   titleName: '物业类型',
    //   iconType: Icon(Icons.swap_calls),
    //   content: widget.data["propertyType"],
    //   animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    //       parent: widget.animationController,
    //       curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
    //   animationController: widget.animationController,
    // ));
    // listViews.add(HouseingBodyItem(
    //   titleName: '建筑面积',
    //   iconType: Icon(Icons.swap_calls),
    //   content: widget.data["floorage"],
    //   animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    //       parent: widget.animationController,
    //       curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
    //   animationController: widget.animationController,
    // ));
    // listViews.add(HouseingBodyItem(
    //   titleName: '房间状态',
    //   iconType: Icon(Icons.swap_calls),
    //   content: widget.data["state"] == '0'
    //       ? "待售"
    //       : widget.data["state"] == '1'
    //           ? "认购"
    //           : widget.data["state"] == '2'
    //               ? "签约"
    //               : widget.data["state"] == '3'
    //                   ? "销控"
    //                   : "",
    //   animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    //       parent: widget.animationController,
    //       curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
    //   animationController: widget.animationController,
    // ));
    // listViews.add(HouseingBodyItem(
    //   titleName: '单价/平',
    //   iconType: Icon(Icons.swap_calls),
    //   content: widget.data["unitPrice"].toString(),
    //   animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    //       parent: widget.animationController,
    //       curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
    //   animationController: widget.animationController,
    // ));
    // listViews.add(HouseingBodyItem(
    //   titleName: '成本价',
    //   iconType: Icon(Icons.swap_calls),
    //   content: widget.data["costPrice"].toString(),
    //   animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    //       parent: widget.animationController,
    //       curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
    //   animationController: widget.animationController,
    // ));
    // listViews.add(HouseingBodyItem(
    //   titleName: '成交价',
    //   iconType: Icon(Icons.swap_calls),
    //   content: widget.data["strikePrice"].toString(),
    //   animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    //       parent: widget.animationController,
    //       curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
    //   animationController: widget.animationController,
    // ));
    // if (widget.data["contractPrice"] != null)
    //   listViews.add(HouseingBodyItem(
    //     titleName: '签约总价',
    //     iconType: Icon(Icons.swap_calls),
    //     content: widget.data["contractPrice"].toString(),
    //     animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    //         parent: widget.animationController,
    //         curve:
    //             Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
    //     animationController: widget.animationController,
    //   ));

    // if (widget.data["buyerName"] != "") {
    //   listViews.add(HouseingBodyItem(
    //     titleName: '业主姓名',
    //     iconType: Icon(Icons.swap_calls),
    //     content: widget.data["buyerName"].toString(),
    //     animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    //         parent: widget.animationController,
    //         curve:
    //             Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
    //     animationController: widget.animationController,
    //   ));
    // }
    // if (widget.data["buyerPhone"] != "") {
    //   listViews.add(HouseingBodyItem(
    //     titleName: '业主电话',
    //     iconType: Icon(Icons.swap_calls),
    //     content: widget.data["buyerPhone"].toString(),
    //     animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    //         parent: widget.animationController,
    //         curve:
    //             Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
    //     animationController: widget.animationController,
    //   ));
    // }
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String houseName = sharedPreferences.get('HOUSESNAME');
    var userInfo = jsonDecode(sharedPreferences.get('CACHED_SIGN_IN_USER'));
    // print(houseName);
    if (houseName == null) {
      String affiliateds = sharedPreferences.get('AFFILIATEDS');
      // print(affiliateds);
      if (affiliateds != null) {
        houseName = jsonDecode(affiliateds)[0]["projectName"];
      }
    }
    listViews.add(Container(
      // decoration: BoxDecoration(color: Colors.lightBlue[200]),
      // margin: EdgeInsets.fromLTRB(20, 0, 40, bottom),
      child: Column(
        children: <Widget>[
          // _infoList('楼盘名:', houseName),
          // _infoList('楼栋号:', widget.data["building"]),
          _infoList02('楼栋号', houseName, widget.data["building"],
              widget.data["staging"]),
          _infoList('单元号:', widget.data["entrance"]),
          _infoList('房间号:', widget.data["serialNumber"]),
          _infoList('建筑面积:', widget.data["floorage"]),
          _infoList('套内面积:', widget.data["insideFloorage"]),
          _infoList(
              '房间状态:',
              widget.data["state"] == '0'
                  ? "待售"
                  : widget.data["state"] == '1'
                      ? "认购"
                      : widget.data["state"] == '2'
                          ? "签约"
                          : widget.data["state"] == '3'
                              ? "销控"
                              : widget.data["state"] == '4'
                                  ? "经理销控"
                                  : ""),
          _underLine(),
          _infoList('成本价:', widget.data["costPrice"].toString()),
          _infoList('成交价:', widget.data["strikePrice"].toString()),
          _infoList('单价/平:', widget.data["unitPrice"].toString()),
          if (widget.data["state"] != "0") _underLine(),
          if (widget.data["state"] != "0")
            _infoList('业主姓名:', widget.data["buyerName"].toString()),
          if (widget.data["state"] != "0")
            _infoList('业主电话:', widget.data["buyerPhone"].toString()),
          // _infoList('户型类型:', widget.data["propertyType"]),
          // _infoList('物业类型:', widget.data["propertyType"]),
        ],
      ),
    ));

    if (userInfo["userRole"] == 'salesman' ||
        userInfo["userRole"] == 'manager' ||
        userInfo["userRole"] == 'director') {
      listViews.add(FromdataView(
        buildingList: widget.buildingList,
        housList: widget.housList,
        entranceList: widget.entranceList,
        buildEntranceList: widget.buildEntranceList,
        data: widget.data,
      ));
    }
  }

  _infoList(String key, String value) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10.0, 0, 0),
      child: Row(
        children: <Widget>[
          Container(
              width: 100,
              child: Text(
                key,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              )),
          Container(
            child: Text(
              value != 'null' ? _getValue(value) + " " : '暂无',
              style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500,
                  fontSize: 15),
            ),
          )
        ],
      ),
    );
  }

  String _getValue(String value) {
    if (value.length != 11) {
      return value;
    } else {
      return value.replaceAll(value.substring(4, 7), "***");
    }
  }

  _infoList02(String key, String value, String value02, String value03) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10.0, 0, 0),
      child: Row(
        children: <Widget>[
          Container(
              width: 100,
              child: Text(
                key,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              )),
          Container(
            child: Text(
              value != 'null' ? value + " " : '暂无',
              style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500,
                  fontSize: 15),
            ),
          ),
          Text(
            " " + value03 != 'null' ? value03 + " " : '暂无',
            style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
                fontSize: 15),
          ),
          Text(
            " " + value02 != 'null' ? value02 + " " : '暂无',
            style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
                fontSize: 15),
          ),
        ],
      ),
    );
  }

  _underLine() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 40, 0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey[400])),
      ),
    );
  }

  _editParentText() {
    Navigator.pop(context);
  }
  // listViews.add(MineItemView(
  //   titleName: '客户咨询',
  //   iconType: Icon(Icons.sms),
  //   content: '',
  //   animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
  //       parent: widget.animationController,
  //       curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
  //   animationController: widget.animationController,
  // ));
  // listViews.add(MineItemView(
  //   titleName: 'AI名片',
  //   iconType: Icon(Icons.assignment_ind),
  //   content: '',
  //   animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
  //       parent: widget.animationController,
  //       curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
  //   animationController: widget.animationController,
  // ));
  // listViews.add(MineItemView(
  //   titleName: '业绩',
  //   iconType: Icon(Icons.class_),
  //   content: '',
  //   animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
  //       parent: widget.animationController,
  //       curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
  //   animationController: widget.animationController,
  // ));
  // listViews.add(MineItemView(
  //   titleName: '我的交易订单',
  //   iconType: Icon(Icons.payment),
  //   content: '',
  //   animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
  //       parent: widget.animationController,
  //       curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
  //   animationController: widget.animationController,
  // ));
  // listViews.add(MineItemView(
  //   titleName: '留电客户',
  //   iconType: Icon(Icons.settings_phone),
  //   content: '',
  //   animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
  //       parent: widget.animationController,
  //       curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
  //   animationController: widget.animationController,
  // ));
  // listViews.add(MineItemView(
  //   titleName: '置业计划',
  //   iconType: Icon(Icons.add_photo_alternate),
  //   content: '',
  //   animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
  //       parent: widget.animationController,
  //       curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
  //   animationController: widget.animationController,
  // ));
  // listViews.add(MineItemView(
  //   titleName: '建议反馈',
  //   iconType: Icon(Icons.mail),
  //   content: '',
  //   animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
  //       parent: widget.animationController,
  //       curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
  //   animationController: widget.animationController,
  // ));
  // listViews.add(MineItemView(
  //   titleName: '在线客服',
  //   iconType: Icon(Icons.near_me),
  //   content: '',
  //   animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
  //       parent: widget.animationController,
  //       curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
  //   animationController: widget.animationController,
  // ));
  // listViews.add(MineItemView(
  //   titleName: '推出登錄/切換賬號',
  //   iconType: Icon(Icons.power_settings_new),
  //   content: '',
  //   animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
  //       parent: widget.animationController,
  //       curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
  //   animationController: widget.animationController,
  // ));
  // listViews.add(
  //   TitleView(
  //     titleTxt: 'Your program',
  //     subTxt: 'Details',
  //     animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
  //         parent: widget.animationController,
  //         curve:
  //             Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
  //     animationController: widget.animationController,
  //   ),
  // );

  // listViews.add(
  //   WorkoutView(
  //     animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
  //         parent: widget.animationController,
  //         curve:
  //             Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
  //     animationController: widget.animationController,
  //   ),
  // );
  // listViews.add(
  //   RunningView(
  //     animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
  //         parent: widget.animationController,
  //         curve:
  //             Interval((1 / count) * 3, 1.0, curve: Curves.fastOutSlowIn))),
  //     animationController: widget.animationController,
  //   ),
  // );

  // listViews.add(
  //   TitleView(
  //     titleTxt: 'Area of focus',
  //     subTxt: 'more',
  //     animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
  //         parent: widget.animationController,
  //         curve:
  //             Interval((1 / count) * 4, 1.0, curve: Curves.fastOutSlowIn))),
  //     animationController: widget.animationController,
  //   ),
  // );

  //   listViews.add(
  //     AreaListView(
  //       mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
  //           CurvedAnimation(
  //               parent: widget.animationController,
  //               curve: Interval((1 / count) * 5, 1.0,
  //                   curve: Curves.fastOutSlowIn))),
  //       mainScreenAnimationController: widget.animationController,
  //     ),
  //   );

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FitnessAppTheme.background,
      child: Stack(
        children: <Widget>[
          getMainListViewUI(),
          getAppBarUI(),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          )
        ],
      ),
    );
  }

  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return Listener(
            onPointerDown: (onPointerDown) {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: ListView.builder(
              shrinkWrap: true,
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
                widget.animationController.forward();
                return listViews[index];
              },
            ),
          );
        }
      },
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController,
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
                                  '房源详细信息',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: FitnessAppTheme.fontName,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22 + 6 - 6 * topBarOpacity,
                                    letterSpacing: 1.2,
                                    color: FitnessAppTheme.blue,
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
