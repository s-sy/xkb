import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/messages/processed/processed_bloc.dart';
import 'package:flutter_ui/presentation/core/app_widget.dart';
import 'package:flutter_ui/presentation/core/fintness_app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ProcessedCustomView extends StatefulWidget {
  final AnimationController animationController;
  final Animation animation;
  final String name;
  final String phone;
  final String xingbie;
  final String action;
  final String title;

  const ProcessedCustomView(
      {Key key,
      this.animationController,
      this.animation,
      this.name,
      this.phone,
      this.xingbie,
      this.action,
      this.title})
      : super(key: key);
  @override
  _ProcessedCustomViewState createState() => _ProcessedCustomViewState();
}

class _ProcessedCustomViewState extends State<ProcessedCustomView> {
  String _textFeid = "";
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: widget.animation,
          child: new Transform(
              transform: new Matrix4.translationValues(
                  0.0, 30 * (1.0 - widget.animation.value), 0.0),
              child: BlocBuilder<ProcessedBloc, ProcessedState>(
                  builder: (context, state) {
                if (widget.action == "3")
                  return InkWell(
                    child: Container(
                      height: 100,
                      margin: EdgeInsets.fromLTRB(8, 10, 8, 0),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 5.0,
                            decoration: BoxDecoration(
                                color: Colors.blue[400],
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0))),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 10, 10, 7),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      widget.title + " ",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    if (state.processedData.length != 0)
                                      InkWell(
                                          child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 0, 10, 0),
                                            child: Icon(
                                              Icons.phone,
                                              color: Colors.blue,
                                              size: 20,
                                            ),
                                          ),
                                          onTap: () {
                                            showDialog(
                                                barrierDismissible: true,
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: Text("提示"),
                                                    content: Text("请确认是否要拨打电话"),
                                                    actions: <Widget>[
                                                      FlatButton(
                                                        child: Text("取消",
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.blue[
                                                                        200])),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop(false);
                                                        },
                                                      ),
                                                      FlatButton(
                                                        child: Text("确定"),
                                                        onPressed: () async {
                                                          String phone = widget
                                                                      .action ==
                                                                  "1"
                                                              ? state.processedData["phone"]
                                                                  ["value"]
                                                              : widget.action ==
                                                                      '2'
                                                                  ? ((state.processedData.containsKey("brokerPhone") &&
                                                                          state.processedData["brokerPhone"]["value"] !=
                                                                              null)
                                                                      ? state.processedData["brokerPhone"]
                                                                          [
                                                                          "value"]
                                                                      : "无")
                                                                  : widget.action ==
                                                                          '3'
                                                                      ? ((state.showsalesMan.containsKey("phone") &&
                                                                              state.showsalesMan["phone"] != null)
                                                                          ? state.showsalesMan["phone"]
                                                                          : "无")
                                                                      : "无";
                                                          if (phone == "无" ||
                                                              phone == "") {
                                                            BotToast.showText(
                                                                text: '暂无数据');
                                                          } else {
                                                            String url =
                                                                "tel:" + phone;
                                                            if (await canLaunch(
                                                                url)) {
                                                              await launch(url);
                                                            } else {
                                                              throw 'Could not launch $url';
                                                            }
                                                          }
                                                          Navigator.of(context)
                                                              .pop(true);
                                                        },
                                                      )
                                                    ],
                                                  );
                                                });
                                          }),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  if (state.processedData.length != 0)
                                    Container(
                                        width: 60.0,
                                        child: Column(
                                          children: <Widget>[
                                            SizedBox(height: 5.0),
                                            Text("姓名"),
                                            SizedBox(height: 5.0),
                                            SingleChildScrollView(
                                                physics:
                                                    BouncingScrollPhysics(),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                controller: ScrollController(),
                                                child: Text(
                                                    widget.action == '1'
                                                        ? ((state.processedData
                                                                    .containsKey(
                                                                        "customerName") &&
                                                                state.processedData["customerName"]["value"] !=
                                                                    null)
                                                            ? state.processedData["customerName"]
                                                                ["value"]
                                                            : "无")
                                                        : widget.action == '2'
                                                            ? ((state.processedData.containsKey("brokerName") &&
                                                                    state.processedData["brokerName"]["value"] !=
                                                                        null)
                                                                ? state.processedData["brokerName"]
                                                                    ["value"]
                                                                : "无")
                                                            : widget.action ==
                                                                    '3'
                                                                ? ((state.showsalesMan.containsKey("realName") &&
                                                                        state.showsalesMan["realName"] != null)
                                                                    ? state.showsalesMan["realName"]
                                                                    : "")
                                                                : "暂无数据",
                                                    maxLines: 1,
                                                    // overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(color: Colors.grey[700], fontSize: 16)))
                                          ],
                                        )),
                                  if (state.processedData.length != 0 &&
                                      widget.action == '2')
                                    // state.processedData
                                    //     .containsKey("description")
                                    Expanded(
                                        child: Column(
                                      children: <Widget>[
                                        SizedBox(height: 5.0),
                                        Text('备注'),
                                        SizedBox(height: 5.0),
                                        SingleChildScrollView(
                                            physics: BouncingScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            controller: ScrollController(),
                                            child: Container(
                                              child: Text(
                                                  (state.processedData.containsKey(
                                                              "description") &&
                                                          state.processedData["description"]
                                                                  ["value"] !=
                                                              null)
                                                      ? (state.processedData.containsKey(
                                                                  "description") &&
                                                              state.processedData["description"][
                                                                      "value"] !=
                                                                  "")
                                                          ? state.processedData[
                                                                  "description"]
                                                              ["value"]
                                                          : "无"
                                                      : "无",
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      color: Colors.grey[700],
                                                      fontSize: 16)),
                                            ))
                                      ],
                                    )),
                                  if (state.processedData.length != 0)
                                    Container(
                                        width: 110.0,
                                        child: Column(
                                          children: <Widget>[
                                            SizedBox(height: 5.0),
                                            Text('电话'),
                                            SizedBox(height: 5.0),
                                            Text(
                                              widget.action == '1'
                                                  ? ((state.processedData.containsKey("phone") &&
                                                          state.processedData["phone"]
                                                                  ["value"] !=
                                                              null)
                                                      ? state.processedData["phone"]
                                                          ["value"]
                                                      : "无")
                                                  : widget.action == '2'
                                                      ? ((state.processedData
                                                                  .containsKey(
                                                                      "brokerPhone") &&
                                                              state.processedData["brokerPhone"]["value"] !=
                                                                  null)
                                                          ? state.processedData["brokerPhone"]
                                                              ["value"]
                                                          : "无")
                                                      : widget.action == '3'
                                                          ? ((state.showsalesMan
                                                                      .containsKey("phone") &&
                                                                  state.showsalesMan["phone"] != null)
                                                              ? state.showsalesMan["phone"]
                                                              : "")
                                                          : "暂无数据",
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ))
                                ],
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: <Widget>[
                              //     if (state.processedData.length != 0)
                              //       Container(
                              //         // width: 60,
                              //         margin: EdgeInsets.only(left: 10.0),
                              //         child: Text('姓名'),
                              //       ),
                              //     if (state.processedData.length != 0 &&
                              //         widget.action == '2')
                              //       Container(
                              //         margin: EdgeInsets.only(right: 40.0),
                              //         child: Text("备注"),
                              //       ),
                              //     if (state.processedData.length != 0)
                              //       Container(
                              //         // width: 110,
                              //         margin: EdgeInsets.only(right: 40.0),
                              //         child: Text('电话'),
                              //       ),
                              //   ],
                              // ),
                              // SizedBox(height: 7),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   // crossAxisAlignment: CrossAxisAlignment.end,
                              //   children: <Widget>[
                              //     if (state.processedData.length != 0)
                              //       Container(
                              //           width: 55,
                              //           // decoration:
                              //           //     BoxDecoration(color: Colors.red[100]),
                              //           margin: EdgeInsets.only(left: 10.0),
                              //           child: SingleChildScrollView(
                              //               physics: BouncingScrollPhysics(),
                              //               scrollDirection: Axis.horizontal,
                              //               controller: ScrollController(),
                              //               child:
                              //                   // (state.processedData.containsKey("customerName") &&
                              //                   //         state.processedData["customerName"]
                              //                   //                 ["value"] !=
                              //                   //             null)
                              //                   //     ?
                              //                   Text(
                              //                       widget.action == '1'
                              //                           ?
                              //                           // state.processedData[
                              //                           //     "customerName"]["value"]
                              //                           ((state.processedData.containsKey(
                              //                                           "customerName") &&
                              //                                       state.processedData["customerName"]["value"] !=
                              //                                           null)
                              //                                   ? state.processedData["customerName"]
                              //                                       ["value"]
                              //                                   : "无"
                              //                               // _textfildRemarks(context)
                              //                               )
                              //                           : widget.action == '2'
                              //                               ?
                              //                               // state.processedData["brokerName"]
                              //                               //     ["value"]
                              //                               ((state.processedData
                              //                                           .containsKey(
                              //                                               "brokerName") &&
                              //                                       state.processedData["brokerName"]["value"] !=
                              //                                           null)
                              //                                   ? state.processedData["brokerName"]
                              //                                       ["value"]
                              //                                   : "无")
                              //                               : widget.action == '3'
                              //                                   ? ((state.showsalesMan.containsKey("realName") &&
                              //                                           state.showsalesMan["realName"] !=
                              //                                               null)
                              //                                       ? state.showsalesMan["realName"]
                              //                                       : "")
                              //                                   : "暂无数据",
                              //                       overflow: TextOverflow.ellipsis,
                              //                       style: TextStyle(color: Colors.grey[700], fontSize: 14))
                              //               // : _textfildRemarks(context),
                              //               )),
                              //     if (state.processedData.length != 0 &&
                              //         widget.action == '2')
                              //       Expanded(
                              //         child: Container(
                              //             alignment: Alignment.center,
                              //             child: SingleChildScrollView(
                              //                 physics: BouncingScrollPhysics(),
                              //                 scrollDirection: Axis.horizontal,
                              //                 controller: ScrollController(),
                              //                 child: Container(
                              //                   child: Text(
                              //                       widget.action == '1'
                              //                           ? state.processedData[
                              //                                   "customerName"]
                              //                               ["value"]
                              //                           : widget.action == '2'
                              //                               ? state.processedData[
                              //                                       "description"]
                              //                                   ["value"]
                              //                               : widget.action == '3'
                              //                                   ? state.processedData[
                              //                                           "depositDuration"]
                              //                                       ["value"]
                              //                                   : "暂无数据",
                              //                       // overflow: TextOverflow.ellipsis,
                              //                       textAlign: TextAlign.center,
                              //                       maxLines: 1,
                              //                       style: TextStyle(
                              //                           color: Colors.grey[700],
                              //                           fontSize: 14)),
                              //                 ))),
                              //       ),
                              //     SizedBox(width: 10),
                              //     if (state.processedData.length != 0)
                              //       Container(
                              //         // width: 110,
                              //         // decoration:
                              //         //     BoxDecoration(color: Colors.red[100]),
                              //         margin: EdgeInsets.only(right: 10.0),
                              //         child: Text(
                              //           widget.action == '1'
                              //               ?
                              //               // state.processedData["phone"]
                              //               //     ["value"]
                              //               ((state.processedData.containsKey("phone") &&
                              //                       state.processedData["phone"]
                              //                               ["value"] !=
                              //                           null)
                              //                   ? state.processedData["phone"]
                              //                       ["value"]
                              //                   : "无")
                              //               : widget.action == '2'
                              //                   ?
                              //                   // state.processedData[
                              //                   //     "brokerPhone"]["value"]
                              //                   ((state.processedData.containsKey(
                              //                               "brokerPhone") &&
                              //                           state.processedData["brokerPhone"]
                              //                                   ["value"] !=
                              //                               null)
                              //                       ? state.processedData["brokerPhone"]
                              //                           ["value"]
                              //                       : "无")
                              //                   : widget.action == '3'
                              //                       ? ((state.showsalesMan
                              //                                   .containsKey("phone") &&
                              //                               state.showsalesMan["phone"] != null)
                              //                           ? state.showsalesMan["phone"]
                              //                           : "")
                              //                       : "暂无数据",
                              //           style: TextStyle(
                              //               color: Colors.grey[700],
                              //               fontSize: 14),
                              //         ),
                              //       ),
                              //   ],
                              // )
                            ],
                          ),
                        ],
                      ),
                    ),
                    onTap: () {},
                  );
                return Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.title + " ",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Text('姓名:',
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(width: 10),
                            Expanded(
                                child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              controller: ScrollController(),
                              child: Text(
                                  widget.action == '1'
                                      ? ((state.processedData.containsKey("customerName") &&
                                              state.processedData["customerName"]["value"] !=
                                                  null)
                                          ? state.processedData["customerName"]
                                              ["value"]
                                          : "无")
                                      : widget.action == '2'
                                          ? ((state.processedData.containsKey("brokerName") &&
                                                  state.processedData["brokerName"]["value"] !=
                                                      null)
                                              ? state.processedData["brokerName"]
                                                  ["value"]
                                              : "无")
                                          : widget.action == '3'
                                              ? ((state.showsalesMan.containsKey("realName") &&
                                                      state.showsalesMan["realName"] !=
                                                          null)
                                                  ? state
                                                      .showsalesMan["realName"]
                                                  : "")
                                              : "暂无数据",
                                  maxLines: 1,
                                  // overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                            ))
                          ],
                        ),
                        if (widget.action == '2')
                          Row(children: [
                            Text("备注:",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                )),
                            SizedBox(width: 10),
                            Expanded(
                                child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              controller: ScrollController(),
                              child: Text(
                                  (state.processedData
                                              .containsKey("description") &&
                                          state.processedData["description"]
                                                  ["value"] !=
                                              null)
                                      ? (state.processedData
                                                  .containsKey("description") &&
                                              state.processedData["description"]
                                                      ["value"] !=
                                                  "")
                                          ? state.processedData["description"]
                                              ["value"]
                                          : "无"
                                      : "无",
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                            ))
                          ]),
                        Row(
                          children: <Widget>[
                            Text('电话:',
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(width: 10),
                            Text(
                              widget.action == '1'
                                  ? ((state.processedData
                                              .containsKey("phone") &&
                                          state.processedData["phone"]
                                                  ["value"] !=
                                              null)
                                      ? state.processedData["phone"]["value"]
                                      : "无")
                                  : widget.action == '2'
                                      ? ((state.processedData
                                                  .containsKey("brokerPhone") &&
                                              state.processedData["brokerPhone"]
                                                      ["value"] !=
                                                  null)
                                          ? state.processedData["brokerPhone"]
                                              ["value"]
                                          : "无")
                                      : widget.action == '3'
                                          ? ((state.showsalesMan
                                                      .containsKey("phone") &&
                                                  state.showsalesMan["phone"] !=
                                                      null)
                                              ? state.showsalesMan["phone"]
                                              : "")
                                          : "暂无数据",
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            if (state.processedData.length != 0 &&
                                (widget.action == "1"
                                        ? state.processedData["phone"]["value"]
                                        : widget.action == '2'
                                            ? ((state.processedData.containsKey(
                                                        "brokerPhone") &&
                                                    state.processedData[
                                                                "brokerPhone"]
                                                            ["value"] !=
                                                        null)
                                                ? state.processedData[
                                                    "brokerPhone"]["value"]
                                                : "无")
                                            : widget.action == '3'
                                                ? ((state.showsalesMan
                                                            .containsKey(
                                                                "phone") &&
                                                        state.showsalesMan[
                                                                "phone"] !=
                                                            null)
                                                    ? state
                                                        .showsalesMan["phone"]
                                                    : "无")
                                                : "无") !=
                                    "无")
                              InkWell(
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                                    child: Icon(
                                      Icons.phone,
                                      color: Colors.blue,
                                      size: 20,
                                    ),
                                  ),
                                  onTap: () {
                                    showDialog(
                                        barrierDismissible: true,
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text("提示"),
                                            content: Text("请确认是否要拨打电话"),
                                            actions: <Widget>[
                                              FlatButton(
                                                child: Text("取消",
                                                    style: TextStyle(
                                                        color:
                                                            Colors.blue[200])),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop(false);
                                                },
                                              ),
                                              FlatButton(
                                                child: Text("确定"),
                                                onPressed: () async {
                                                  String phone = widget.action ==
                                                          "1"
                                                      ? state.processedData["phone"]
                                                          ["value"]
                                                      : widget.action == '2'
                                                          ? ((state.processedData
                                                                      .containsKey(
                                                                          "brokerPhone") &&
                                                                  state.processedData["brokerPhone"]["value"] !=
                                                                      null)
                                                              ? state.processedData["brokerPhone"]
                                                                  ["value"]
                                                              : "无")
                                                          : widget.action == '3'
                                                              ? ((state.showsalesMan.containsKey(
                                                                          "phone") &&
                                                                      state.showsalesMan["phone"] !=
                                                                          null)
                                                                  ? state.showsalesMan["phone"]
                                                                  : "无")
                                                              : "无";
                                                  if (phone == "无" ||
                                                      phone == "") {
                                                    BotToast.showText(
                                                        text: '暂无数据');
                                                  } else {
                                                    String url = "tel:" + phone;
                                                    if (await canLaunch(url)) {
                                                      await launch(url);
                                                    } else {
                                                      throw 'Could not launch $url';
                                                    }
                                                  }
                                                  Navigator.of(context)
                                                      .pop(true);
                                                },
                                              )
                                            ],
                                          );
                                        });
                                  }),
                          ],
                        ),
                        if (widget.action == '1')
                          Row(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "创建时间:",
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(
                                  state.startTime,
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          )
                      ],
                    ));

                // return Padding(
                //   padding: const EdgeInsets.only(
                //       left: 24, right: 24, top: 16, bottom: 18),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: Colors.blue,
                //       // gradient: LinearGradient(colors: [
                //       //   FitnessAppTheme.nearlyLightBlue,
                //       //   HexColor("#6F56E8")
                //       // ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                //       borderRadius: BorderRadius.only(
                //           topLeft: Radius.circular(8.0),
                //           bottomLeft: Radius.circular(8.0),
                //           bottomRight: Radius.circular(8.0),
                //           topRight: Radius.circular(68.0)),
                //       boxShadow: <BoxShadow>[
                //         BoxShadow(
                //             color: FitnessAppTheme.grey.withOpacity(0.6),
                //             offset: Offset(1.1, 1.1),
                //             blurRadius: 10.0),
                //       ],
                //     ),
                //     child: Padding(
                //       padding: const EdgeInsets.all(16.0),
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: <Widget>[
                //           if (state.processedData.length != 0)
                //             Container(
                //               child: Row(
                //                 children: [
                //                   Container(
                //                     child: Text("姓名:",
                //                         style: TextStyle(
                //                           fontFamily: FitnessAppTheme.fontName,
                //                           fontWeight: FontWeight.normal,
                //                           fontSize: 20,
                //                           letterSpacing: 0.0,
                //                           color: FitnessAppTheme.white,
                //                         )),
                //                   ),
                //                   Container(
                //                     child: Text(
                //                         action == '1'
                //                             ? state.processedData[
                //                                 "customerName"]["value"]
                //                             : action == '2'
                //                                 ? state.processedData[
                //                                     "brokerName"]["value"]
                //                                 : action == '3'
                //                                     ? ((state.showsalesMan
                //                                                 .containsKey(
                //                                                     "realName") &&
                //                                             state.showsalesMan[
                //                                                     "realName"] !=
                //                                                 null)
                //                                         ? state.showsalesMan[
                //                                             "realName"]
                //                                         : "")
                //                                     : "暂无数据",
                //                         style: TextStyle(
                //                           fontFamily: FitnessAppTheme.fontName,
                //                           fontWeight: FontWeight.normal,
                //                           fontSize: 20,
                //                           letterSpacing: 0.0,
                //                           color: FitnessAppTheme.white,
                //                         )),
                //                   )
                //                 ],
                //               ),
                //             ),
                //           if (state.processedData.length != 0)
                //             Container(
                //               child: Row(
                //                 children: [
                //                   Container(
                //                     child: Text("电话:",
                //                         style: TextStyle(
                //                           fontFamily: FitnessAppTheme.fontName,
                //                           fontWeight: FontWeight.normal,
                //                           fontSize: 20,
                //                           letterSpacing: 0.0,
                //                           color: FitnessAppTheme.white,
                //                         )),
                //                   ),
                //                   Container(
                //                     child: Text(
                //                         action == '1'
                //                             ? state.processedData["phone"]
                //                                 ["value"]
                //                             : action == '2'
                //                                 ? state.processedData[
                //                                     "brokerPhone"]["value"]
                //                                 : action == '3'
                //                                     ? ((state.showsalesMan
                //                                                 .containsKey(
                //                                                     "phone") &&
                //                                             state.showsalesMan[
                //                                                     "phone"] !=
                //                                                 null)
                //                                         ? state.showsalesMan[
                //                                             "phone"]
                //                                         : "")
                //                                     : "暂无数据",
                //                         style: TextStyle(
                //                           fontFamily: FitnessAppTheme.fontName,
                //                           fontWeight: FontWeight.normal,
                //                           fontSize: 20,
                //                           letterSpacing: 0.0,
                //                           color: FitnessAppTheme.white,
                //                         )),
                //                   )
                //                 ],
                //               ),
                //             ),
                //           if (state.processedData.length != 0 && action == '2')
                //             Container(
                //               child: Row(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Container(
                //                     child: Text("备注:",
                //                         style: TextStyle(
                //                           fontFamily: FitnessAppTheme.fontName,
                //                           fontWeight: FontWeight.normal,
                //                           fontSize: 20,
                //                           letterSpacing: 0.0,
                //                           color: FitnessAppTheme.white,
                //                         )),
                //                   ),
                //                   Container(
                //                       child: Expanded(
                //                     child: Text(
                //                         action == '1'
                //                             ? state.processedData[
                //                                 "customerName"]["value"]
                //                             : action == '2'
                //                                 ? state.processedData[
                //                                     "description"]["value"]
                //                                 : action == '3'
                //                                     ? state.processedData[
                //                                             "depositDuration"]
                //                                         ["value"]
                //                                     : "暂无数据",
                //                         style: TextStyle(
                //                           fontFamily: FitnessAppTheme.fontName,
                //                           fontWeight: FontWeight.normal,
                //                           fontSize: 20,
                //                           letterSpacing: 0.0,
                //                           color: FitnessAppTheme.white,
                //                         )),
                //                   ))
                //                 ],
                //               ),
                //             ),

                //           // Text(
                //           //   'Next workout',
                //           //   textAlign: TextAlign.left,
                //           //   style: TextStyle(
                //           //     fontFamily: FitnessAppTheme.fontName,
                //           //     fontWeight: FontWeight.normal,
                //           //     fontSize: 14,
                //           //     letterSpacing: 0.0,
                //           //     color: FitnessAppTheme.white,
                //           //   ),
                //           // ),
                //           // Padding(
                //           //   padding: const EdgeInsets.only(top: 8.0),
                //           //   child: Text(
                //           //     'Legs Toning and\nGlutes Workout at Home',
                //           //     textAlign: TextAlign.left,
                //           //     style: TextStyle(
                //           //       fontFamily: FitnessAppTheme.fontName,
                //           //       fontWeight: FontWeight.normal,
                //           //       fontSize: 20,
                //           //       letterSpacing: 0.0,
                //           //       color: FitnessAppTheme.white,
                //           //     ),
                //           //   ),
                //           // ),
                //           // SizedBox(
                //           //   height: 32,
                //           // ),
                //           Padding(
                //             padding: const EdgeInsets.only(right: 4),
                //             child: Row(
                //               crossAxisAlignment: CrossAxisAlignment.end,
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: <Widget>[
                //                 // Padding(
                //                 //   padding: const EdgeInsets.only(left: 4),
                //                 //   child: Icon(
                //                 //     Icons.timer,
                //                 //     color: FitnessAppTheme.white,
                //                 //     size: 16,
                //                 //   ),
                //                 // ),
                //                 // Padding(
                //                 //   padding: const EdgeInsets.only(left: 4.0),
                //                 //   child: Text(
                //                 //     '68 min',
                //                 //     textAlign: TextAlign.center,
                //                 //     style: TextStyle(
                //                 //       fontFamily: FitnessAppTheme.fontName,
                //                 //       fontWeight: FontWeight.w500,
                //                 //       fontSize: 14,
                //                 //       letterSpacing: 0.0,
                //                 //       color: FitnessAppTheme.white,
                //                 //     ),
                //                 //   ),
                //                 // ),
                //                 Expanded(
                //                   child: SizedBox(),
                //                 ),
                //                 // Container(
                //                 //   decoration: BoxDecoration(
                //                 //     color: FitnessAppTheme.nearlyWhite,
                //                 //     shape: BoxShape.circle,
                //                 //     boxShadow: <BoxShadow>[
                //                 //       BoxShadow(
                //                 //           color: FitnessAppTheme.nearlyBlack
                //                 //               .withOpacity(0.4),
                //                 //           offset: Offset(8.0, 8.0),
                //                 //           blurRadius: 8.0),
                //                 //     ],
                //                 //   ),
                //                 //   child: Padding(
                //                 //     padding: const EdgeInsets.all(0.0),
                //                 //     child: Icon(
                //                 //       Icons.arrow_right,
                //                 //       color: HexColor("#6F56E8"),
                //                 //       size: 44,
                //                 //     ),
                //                 //   ),
                //                 // )
                //               ],
                //             ),
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // );
              })),
        );
      },
    );
  }

  // _textfildRemarks(context) {
  //   return Container(
  //     width: 60,
  //     height: 25,
  //     // alignment: Alignment.bottomCenter,
  //     // decoration: BoxDecoration(color: Colors.yellow),
  //     child: TextField(
  //         textInputAction: TextInputAction.go,
  //         decoration: InputDecoration(
  //           hintText: '添加姓名',
  //           border: InputBorder.none,
  //           isDense: true,
  //           hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
  //         ),
  //         textAlign: TextAlign.start,
  //         controller: TextEditingController.fromValue(
  //           TextEditingValue(
  //             text: _textFeid != "" ? _textFeid : '',
  //             // 保持光标在最后
  //             selection: TextSelection.fromPosition(TextPosition(
  //               affinity: TextAffinity.downstream,
  //               offset: _textFeid != "" ? _textFeid.length : 0,
  //             )),
  //           ),
  //         ),
  //         onChanged: (val) {
  //           _textFeid = val;
  //         }),
  //   );
  // }

  _textfildRemarks(context) {
    return Container(
      width: 60,
      height: 20,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      decoration: BoxDecoration(
        color: Colors.yellow,

        // border:
        //     Border(bottom: BorderSide(width: 1.0, color: Color(0xffe5e5e5))),
      ),
      child: TextField(
          textInputAction: TextInputAction.go,
          decoration: InputDecoration(
            hintText: '添加姓名',
            // border:
            //     OutlineInputBorder(borderSide: BorderSide(color: Colors.pink)),
            isDense: true,
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
          ),
          maxLines: 1,
          textAlign: TextAlign.start,
          controller: TextEditingController.fromValue(
            TextEditingValue(
              text: _textFeid != ""
                  ? _textFeid
                  // : infoValue != null
                  //     ? infoValue
                  : "",
              // 保持光标在最后
              selection: TextSelection.fromPosition(TextPosition(
                affinity: TextAffinity.downstream,
                offset: _textFeid != ""
                    ? _textFeid.length
                    // : infoValue != null
                    //     ? infoValue.length
                    : 0,
              )),
            ),
          ),
          onSubmitted: (val) {
            showDialog(
                barrierDismissible: true,
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("提示"),
                    content: StatefulBuilder(
                        builder: (context, StateSetter setState) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[Text('是否修改备注')],
                        ),
                      );
                    }),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("取消",
                            style: TextStyle(color: Colors.blue[200])),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                      ),
                      FlatButton(
                        child: Text("确定"),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                      )
                    ],
                  );
                }).then((value) {
              if (value != null) {
                if (value) {
                  if (_textFeid != '') {
                    // BlocProvider.of<CoustomerBloc>(context)
                    //   ..add(CoustomerEvent.updateRemarks(
                    //       widget.listData['id'], _textFeid));
                  }
                  BotToast.showAttachedWidget(
                      attachedBuilder: (_) => Center(
                              child: Card(
                            child: Container(
                                width: 150,
                                height: 80,
                                // padding:
                                //     const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Icon(
                                      Icons.done,
                                      color: Colors.blue,
                                    ),
                                    Text(
                                      "备注修改成功！",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                )),
                          )),
                      duration: Duration(seconds: 2),
                      target: Offset(520, 520));
                }
              }
            });
            _textFeid = val;
          }),
    );
  }
}
