import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/messages/processed/processed_bloc.dart';
import 'package:flutter_ui/presentation/core/app_widget.dart';
import 'package:flutter_ui/presentation/core/fintness_app_theme.dart';
// import 'package:flutter_ui/presentation/home/message/processed/processed_photoselect_view.dart';

class ProcessedHouseIngView extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;
  final String name;
  final String phone;
  final String xingbie;

  const ProcessedHouseIngView({
    Key key,
    this.animationController,
    this.animation,
    this.name,
    this.phone,
    this.xingbie,
  }) : super(key: key);

  getKey(String key) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      width: 100,
      child: Text(key,
          style: TextStyle(
            fontFamily: FitnessAppTheme.fontName,
            fontWeight: FontWeight.w500,
            fontSize: 15,
            letterSpacing: 0.0,
            color: FitnessAppTheme.grey,
          )),
    );
  }

  getName(String name) {
    return Container(
      child: Text(name,
          style: TextStyle(
            fontFamily: FitnessAppTheme.fontName,
            fontWeight: FontWeight.w500,
            fontSize: 15,
            letterSpacing: 0.0,
            color: Colors.grey[600],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
              transform: new Matrix4.translationValues(
                  0.0, 30 * (1.0 - animation.value), 0.0),
              child: BlocBuilder<ProcessedBloc, ProcessedState>(
                  builder: (context, state) {
                return
                    //  Padding(
                    //   padding: const EdgeInsets.only(
                    //       left: 24, right: 24, top: 16, bottom: 18),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       color: Colors.blue,
                    //       // gradient: LinearGradient(colors: [
                    //       //   FitnessAppTheme.nearlyDarkBlue,
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
                    //       child:
                    Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (state.processedData.length != 0 &&
                        state.processedData["buyerName"]["value"] != null &&
                        state.processedData["buyerName"]["value"] != "")
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            getKey("姓        名:"),
                            getName(state.processedData["buyerName"]["value"]),
                          ],
                        ),
                      ),
                    if (state.processedData.length != 0 &&
                        state.processedData["buyerPhone"]["value"] != "" &&
                        state.processedData["buyerPhone"]["value"] != null)
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            getKey("电        话:"),
                            getName(state.processedData["buyerPhone"]["value"]),
                            // Container(
                            //   width: 100,
                            //   child: Text("电        话:",
                            //       style: TextStyle(
                            //         fontFamily: FitnessAppTheme.fontName,
                            //         fontWeight: FontWeight.normal,
                            //         fontSize: 20,
                            //         letterSpacing: 0.0,
                            //         color: FitnessAppTheme.white,
                            //       )),
                            // ),
                            // Container(
                            //   child: Text(
                            //       state.processedData["buyerPhone"]["value"],
                            //       style: TextStyle(
                            //         fontFamily: FitnessAppTheme.fontName,
                            //         fontWeight: FontWeight.normal,
                            //         fontSize: 20,
                            //         letterSpacing: 0.0,
                            //         color: FitnessAppTheme.white,
                            //       )),
                            // )
                          ],
                        ),
                      ),
                    if (state.processedData.length != 0)
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            getKey("楼        号:"),
                            getName(
                                state.processedData["housmessage"]["value"]),
                            // Container(
                            //   width: 100,
                            //   child: Text("楼        号:",
                            //       style: TextStyle(
                            //         fontFamily: FitnessAppTheme.fontName,
                            //         fontWeight: FontWeight.normal,
                            //         fontSize: 20,
                            //         letterSpacing: 0.0,
                            //         color: FitnessAppTheme.nearlyBlack,
                            //       )),
                            // ),
                            // Container(
                            //     child: Expanded(
                            //   child: Text(
                            //       state.processedData["housmessage"]["value"],
                            //       style: TextStyle(
                            //         fontFamily: FitnessAppTheme.fontName,
                            //         fontWeight: FontWeight.normal,
                            //         fontSize: 20,
                            //         letterSpacing: 0.0,
                            //         color: FitnessAppTheme.white,
                            //       )),
                            // ))
                          ],
                        ),
                      ),
                    if (state.processedData.containsKey('contractPrice') &&
                        state.processedData.length != 0 &&
                        state.processedData["contractPrice"]["value"] != "" &&
                        state.processedData["contractPrice"]["value"] != null)
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            getKey("签约总价:"),
                            getName(state.processedData["contractPrice"]
                                    ["value"]
                                .toString()),
                            // Container(
                            //   width: 100,
                            //   child: Text("签约总价:",
                            //       style: TextStyle(
                            //         fontFamily: FitnessAppTheme.fontName,
                            //         fontWeight: FontWeight.normal,
                            //         fontSize: 20,
                            //         letterSpacing: 0.0,
                            //         color: FitnessAppTheme.white,
                            //       )),
                            // ),
                            // Container(
                            //   child: Text(
                            //       state.processedData["contractPrice"]["value"]
                            //           .toString(),
                            //       style: TextStyle(
                            //         fontFamily: FitnessAppTheme.fontName,
                            //         fontWeight: FontWeight.normal,
                            //         fontSize: 20,
                            //         letterSpacing: 0.0,
                            //         color: FitnessAppTheme.white,
                            //       )),
                            // )
                          ],
                        ),
                      ),
                    if (state.processedData.length != 0 &&
                        state.processedData["comments"]["value"] != "" &&
                        state.processedData["comments"]["value"] != null)
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            getKey("备注:"),
                            getName(state.processedData["comments"]["value"]),
                            // Container(
                            //   width: 100,
                            //   child: Text("备注:",
                            //       style: TextStyle(
                            //         fontFamily: FitnessAppTheme.fontName,
                            //         fontWeight: FontWeight.normal,
                            //         fontSize: 20,
                            //         letterSpacing: 0.0,
                            //         color: FitnessAppTheme.white,
                            //       )),
                            // ),
                            // Container(
                            //     child: Expanded(
                            //   child:
                            //       Text(state.processedData["comments"]["value"],
                            //           style: TextStyle(
                            //             fontFamily: FitnessAppTheme.fontName,
                            //             fontWeight: FontWeight.normal,
                            //             fontSize: 20,
                            //             letterSpacing: 0.0,
                            //             color: FitnessAppTheme.white,
                            //           )),
                            // ))
                          ],
                        ),
                      ),
                    if (state.processedData.length != 0 &&
                        state.showsalesMan.containsKey('realName') &&
                        state.showsalesMan["realName"] != null &&
                        state.showsalesMan["realName"] != "")
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            getKey("置业顾问:"),
                            getName(state.showsalesMan["realName"]),
                            // Container(
                            //   width: 100,
                            //   child: Text("置业顾问:",
                            //       style: TextStyle(
                            //         fontFamily: FitnessAppTheme.fontName,
                            //         fontWeight: FontWeight.normal,
                            //         fontSize: 20,
                            //         letterSpacing: 0.0,
                            //         color: FitnessAppTheme.white,
                            //       )),
                            // ),
                            // Container(
                            //     child: Expanded(
                            //   child: Text(state.showsalesMan["realName"],
                            //       style: TextStyle(
                            //         fontFamily: FitnessAppTheme.fontName,
                            //         fontWeight: FontWeight.normal,
                            //         fontSize: 20,
                            //         letterSpacing: 0.0,
                            //         color: FitnessAppTheme.white,
                            //       )),
                            // ))
                          ],
                        ),
                      ),

                    if (state.processedData.length != 0)
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            getKey("申请状态:"),
                            getName(
                              state.processedData["state"]["value"] == "0"
                                  ? "待售"
                                  : state.processedData["state"]["value"] == "1"
                                      ? "认购"
                                      : state.processedData["state"]["value"] ==
                                              "2"
                                          ? "签约"
                                          : state.processedData["state"]
                                                      ["value"] ==
                                                  "3"
                                              ? "销控"
                                              : state.processedData["state"]
                                                          ["value"] ==
                                                      "4"
                                                  ? "管理销控"
                                                  : "",
                            ),
                            // Container(
                            //   width: 100,
                            //   child: Text("申请状态:",
                            //       style: TextStyle(
                            //         fontFamily: FitnessAppTheme.fontName,
                            //         fontWeight: FontWeight.normal,
                            //         fontSize: 20,
                            //         letterSpacing: 0.0,
                            //         color: FitnessAppTheme.white,
                            //       )),
                            // ),
                            // Container(
                            //     child: Expanded(
                            //   //0：待售；1：认购 2：签约 3：销控 4: 管理销控
                            //   child: Text(
                            //       state.processedData["state"]["value"] == "0"
                            //           ? "待售"
                            //           : state.processedData["state"]["value"] ==
                            //                   "1"
                            //               ? "认购"
                            //               : state.processedData["state"]
                            //                           ["value"] ==
                            //                       "2"
                            //                   ? "签约"
                            //                   : state.processedData["state"]
                            //                               ["value"] ==
                            //                           "3"
                            //                       ? "销控"
                            //                       : state.processedData["state"]
                            //                                   ["value"] ==
                            //                               "4"
                            //                           ? "管理销控"
                            //                           : "",
                            //       style: TextStyle(
                            //         fontFamily: FitnessAppTheme.fontName,
                            //         fontWeight: FontWeight.normal,
                            //         fontSize: 20,
                            //         letterSpacing: 0.0,
                            //         color: FitnessAppTheme.white,
                            //       )),
                            // ))
                          ],
                        ),
                      ),
                    if (state.processedData.length != 0 &&
                        state.processedData.containsKey("approve"))
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            getKey("审核状态:"),
                            getName(
                              state.processedData["approve"]["value"] == false
                                  ? "未通过"
                                  : "通过",
                            ),
                            // Container(
                            //   child: Text("审核状态:",
                            //       style: TextStyle(
                            //         fontFamily: FitnessAppTheme.fontName,
                            //         fontWeight: FontWeight.normal,
                            //         fontSize: 20,
                            //         letterSpacing: 0.0,
                            //         color: FitnessAppTheme.white,
                            //       )),
                            // ),
                            // Container(
                            //     child: Expanded(
                            //   //0：待售；1：认购 2：签约 3：销控 4: 管理销控
                            //   child: Text(
                            //       state.processedData["approve"]["value"] ==
                            //               false
                            //           ? "未通过"
                            //           : "通过",
                            //       style: TextStyle(
                            //         fontFamily: FitnessAppTheme.fontName,
                            //         fontWeight: FontWeight.normal,
                            //         fontSize: 20,
                            //         letterSpacing: 0.0,
                            //         color: FitnessAppTheme.white,
                            //       )),
                            // ))
                          ],
                        ),
                      ),
                    if (state.processedData.length != 0 &&
                        state.processedData
                            .containsKey("Activity_0fvuxs2_managerDeration"))
                      Container(
                        child: Row(
                          children: [
                            getKey("未过理由:"),
                            getName(
                              state.processedData[
                                  "Activity_0fvuxs2_managerDeration"]["value"],
                            ),
                            // Container(
                            //   child: Text("未通过理由:",
                            //       style: TextStyle(
                            //         fontFamily: FitnessAppTheme.fontName,
                            //         fontWeight: FontWeight.normal,
                            //         fontSize: 20,
                            //         letterSpacing: 0.0,
                            //         color: FitnessAppTheme.white,
                            //       )),
                            // ),
                            // Container(
                            //     child: Expanded(
                            //   //0：待售；1：认购 2：签约 3：销控 4: 管理销控
                            //   child: Text(
                            //       state.processedData[
                            //               "Activity_0fvuxs2_managerDeration"]
                            //           ["value"],
                            //       style: TextStyle(
                            //         fontFamily: FitnessAppTheme.fontName,
                            //         fontWeight: FontWeight.normal,
                            //         fontSize: 20,
                            //         letterSpacing: 0.0,
                            //         color: FitnessAppTheme.white,
                            //       )),
                            // ))
                          ],
                        ),
                      ),
                    // Text(
                    //   'Next workout',
                    //   textAlign: TextAlign.left,
                    //   style: TextStyle(
                    //     fontFamily: FitnessAppTheme.fontName,
                    //     fontWeight: FontWeight.normal,
                    //     fontSize: 14,
                    //     letterSpacing: 0.0,
                    //     color: FitnessAppTheme.white,
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 8.0),
                    //   child: Text(
                    //     'Legs Toning and\nGlutes Workout at Home',
                    //     textAlign: TextAlign.left,
                    //     style: TextStyle(
                    //       fontFamily: FitnessAppTheme.fontName,
                    //       fontWeight: FontWeight.normal,
                    //       fontSize: 20,
                    //       letterSpacing: 0.0,
                    //       color: FitnessAppTheme.white,
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 32,
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 4),
                          //   child: Icon(
                          //     Icons.timer,
                          //     color: FitnessAppTheme.white,
                          //     size: 16,
                          //   ),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 4.0),
                          //   child: Text(
                          //     '68 min',
                          //     textAlign: TextAlign.center,
                          //     style: TextStyle(
                          //       fontFamily: FitnessAppTheme.fontName,
                          //       fontWeight: FontWeight.w500,
                          //       fontSize: 14,
                          //       letterSpacing: 0.0,
                          //       color: FitnessAppTheme.white,
                          //     ),
                          //   ),
                          // ),
                          Expanded(
                            child: SizedBox(),
                          ),
                          // Container(
                          //   decoration: BoxDecoration(
                          //     color: FitnessAppTheme.nearlyWhite,
                          //     shape: BoxShape.circle,
                          //     boxShadow: <BoxShadow>[
                          //       BoxShadow(
                          //           color: FitnessAppTheme.nearlyBlack
                          //               .withOpacity(0.4),
                          //           offset: Offset(8.0, 8.0),
                          //           blurRadius: 8.0),
                          //     ],
                          //   ),
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(0.0),
                          //     child: Icon(
                          //       Icons.arrow_right,
                          //       color: HexColor("#6F56E8"),
                          //       size: 44,
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    )
                  ],
                );

                //     ),
                //   ),
                // );
              })),
        );
      },
    );
  }
}
