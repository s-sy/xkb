import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/messages/messages_bloc.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';

class MessageDoSth extends StatefulWidget {
  final Map<String, dynamic> value;
  final List<dynamic> projectList;
  const MessageDoSth(this.value, this.projectList) : super();
  @override
  _MessageDoSthState createState() => _MessageDoSthState();
}

class _MessageDoSthState extends State<MessageDoSth> {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   decoration: BoxDecoration(
    //       // border: Border.all(color: Colors.red),
    //       borderRadius: BorderRadius.circular(10),
    //       boxShadow: [
    //         BoxShadow(
    //           color: Colors.blueGrey,
    //           offset: Offset(3.0, 3.0),
    //         ),
    //       ]),
    //   padding: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
    //   margin: EdgeInsets.only(left: 10, right: 10),
    //   child: Column(
    //     children: [
    //       Container(
    //         decoration: BoxDecoration(),
    //         child: Row(
    //           children: [
    //             Container(
    //                 decoration: BoxDecoration(),
    //                 child: Text(
    //                   widget.value["name"] == null ? "" : widget.value["name"],
    //                   style: TextStyle(fontSize: 20),
    //                 )),
    //           ],
    //         ),
    //       ),
    //       Container(
    //         child: Row(
    //           children: [
    //             Container(child: Text("楼盘ID")),
    //             Container(child: Text(":")),
    //             Container(
    //               child: Text(
    //                   getName(widget.value["tenantId"], widget.projectList)),
    //             ),
    //           ],
    //         ),
    //       ),
    //       Container(
    //         child: Row(
    //           children: [
    //             Container(child: Text("流程名")),
    //             Container(child: Text(":")),
    //             Container(
    //               child: Text(widget.value["taskDefinitionKey"]),
    //             ),
    //           ],
    //         ),
    //       ),
    //       Container(
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Row(
    //               children: [
    //                 Container(child: Text("创建时间")),
    //                 Container(child: Text(":")),
    //                 Container(
    //                   child: Text(widget.value["created"]
    //                       .substring(0, 19)
    //                       .replaceAll('T', ' ')),
    //                 ),
    //               ],
    //             ),
    //             Container(
    //               child: RaisedButton(
    //                 onPressed: () {
    //                   if (widget.value["suspended"] == false &&
    //                       (widget.value["taskDefinitionKey"] !=
    //                               "CategoryManagent" ||
    //                           widget.value["taskDefinitionKey"] !=
    //                               "Activity_0vv7s63")) {
    //                     ExtendedNavigator.of(context)
    //                         .push(Routes.processedScreen, arguments: {
    //                       "processInstanceId":
    //                           widget.value["processInstanceId"],
    //                       "id": widget.value["id"],
    //                       "taskDefinitionKey":
    //                           widget.value["taskDefinitionKey"],
    //                     }).then((value) {
    //                       if (value == "refresh") {
    //                         BlocProvider.of<MessagesBloc>(context)
    //                             .add(MessagesEvent.dosth());
    //                       }
    //                     });
    //                   } else {
    //                     //解冻
    //                     // BotToast.showText(text: "解冻交钱");
    //                     print(widget.value["processInstanceId"]);
    //                     BlocProvider.of<MessagesBloc>(context).add(
    //                         MessagesEvent.unFreezedCustomer(
    //                             widget.value["processInstanceId"]));
    //                     BlocProvider.of<MessagesBloc>(context)
    //                         .add(MessagesEvent.dosth());
    //                   }
    //                 },
    //                 child: widget.value["suspended"] == false &&
    //                         (widget.value["taskDefinitionKey"] !=
    //                                 "CategoryManagent" ||
    //                             widget.value["taskDefinitionKey"] !=
    //                                 "Activity_0vv7s63")
    //                     ? Text("处理")
    //                     : Text("解除冻结"),
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //       SizedBox(
    //         height: 10,
    //       ),
    //     ],
    //   ),
    // );
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        (widget.value.containsKey("name") &&
                                widget.value["name"] != null &&
                                widget.value["name"] != "")
                            ? widget.value["name"] + " "
                            : "审核结果",

                        // (widget.value.containsKey("name") &&
                        //         (widget.value["name"] == null ||
                        //             widget.value["name"] == ""))
                        //     ? ""
                        //     : widget.value["name"] + " ",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: Colors.blue[300],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Text('楼盘名'),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 50.0),
                      child: Text('创建时间'),
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(right: 30.0),
                    //   child: Text('当前流程'),
                    // ),
                  ],
                ),
                SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Text(
                          (widget.value.containsKey("tenantId") &&
                                  widget.value["tenantId"] != null &&
                                  widget.value["tenantId"] != "")
                              ? getName(
                                  widget.value["tenantId"], widget.projectList)
                              : "数据异常",

                          // getName(widget.value["tenantId"], widget.projectList),
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 14)),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10.0),
                      child: Text(
                        (widget.value.containsKey("created") &&
                                widget.value["created"] != null &&
                                widget.value["created"] != "")
                            ? widget.value["created"]
                                .substring(0, 19)
                                .replaceAll('T', ' ')
                            : "数据异常",

                        // widget.value["created"]
                        //     .substring(0, 19)
                        //     .replaceAll('T', ' '),
                        // widget.value["created"]
                        //     .substring(0, 19)
                        //     .replaceRange(10, 11, ' ' * 1),
                        style: TextStyle(color: Colors.grey[700], fontSize: 14),
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(right: 30.0),
                    //   child: Text(
                    //     widget.value["taskDefinitionKey"],
                    //     // widget.value["created"]
                    //     //     .substring(0, 19)
                    //     //     .replaceAll('T', ' '),
                    //     // headerText(),
                    //     style: TextStyle(color: Colors.grey[700], fontSize: 14),
                    //   ),
                    // ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        if (widget.value["suspended"] == false &&
            (widget.value["taskDefinitionKey"] != "CategoryManagent" ||
                widget.value["taskDefinitionKey"] != "Activity_0vv7s63")) {
          ExtendedNavigator.of(context)
              .push(Routes.processedScreen, arguments: {
            "processInstanceId": widget.value["processInstanceId"],
            "id": widget.value["id"],
            "taskDefinitionKey": widget.value["taskDefinitionKey"],
            "tenantName": getName(widget.value["tenantId"], widget.projectList),
          }).then((value) {
            if (value == "refresh") {
              BlocProvider.of<MessagesBloc>(context)
                ..add(MessagesEvent.dosth())
                ..add(MessagesEvent.getProcessDefinition())
                ..add(MessagesEvent.getNewCoustomer());
            }
          });
        } else {
          //解冻
          // BotToast.showText(text: "解冻交钱");
          print(widget.value["processInstanceId"]);
          BlocProvider.of<MessagesBloc>(context).add(
              MessagesEvent.unFreezedCustomer(
                  widget.value["processInstanceId"]));
          BlocProvider.of<MessagesBloc>(context).add(MessagesEvent.dosth());
        }
      },
    );
  }

  String getName(id, list) {
    String name = "";
    for (var i = 0; i < list.length; i++) {
      if (id == list[i]["id"]) {
        name = list[i]["projectName"];
      }
    }
    if (name == "") {
      name = "未知楼盘";
    }
    return name + " ";
  }

  // justOnTap(List processList, String processKey) {
  //   return ListView.builder(
  //     padding: EdgeInsets.only(top: 0),
  //     scrollDirection: Axis.vertical,
  //     reverse: false,
  //     primary: true,
  //     shrinkWrap: true,
  //     itemCount: processList.length,
  //     physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
  //     itemBuilder: (context, i) => InkWell(
  //       child: Container(
  //         height: 100,
  //         margin: EdgeInsets.only(top: 10.0),
  //         decoration: BoxDecoration(
  //           color: Colors.blue[100],
  //           borderRadius: BorderRadius.circular(8.0),
  //         ),
  //         child: Column(
  //           children: <Widget>[
  //             Container(
  //               height: 5.0,
  //               decoration: BoxDecoration(
  //                   color: Colors.blue[400],
  //                   borderRadius: BorderRadius.only(
  //                       topLeft: Radius.circular(20.0),
  //                       topRight: Radius.circular(20.0))),
  //             ),
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: <Widget>[
  //                 Container(
  //                   margin: EdgeInsets.fromLTRB(10, 10, 10, 7),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: <Widget>[
  //                       Text(
  //                         '${processList[i].name}',
  //                         style: TextStyle(
  //                             fontSize: 17, fontWeight: FontWeight.w500),
  //                       ),
  //                       Icon(
  //                         Icons.navigate_next,
  //                         color: Colors.blue[300],
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: <Widget>[
  //                     Container(
  //                       margin: EdgeInsets.only(left: 10.0),
  //                       child: Text('发起人'),
  //                     ),
  //                     Container(
  //                       margin: EdgeInsets.only(right: 10.0),
  //                       child: Text('发起时间'),
  //                     ),
  //                     Container(
  //                       margin: EdgeInsets.only(right: 30.0),
  //                       child: Text('当前状态'),
  //                     ),
  //                   ],
  //                 ),
  //                 SizedBox(height: 7),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: <Widget>[
  //                     Container(
  //                       margin: EdgeInsets.only(left: 10.0),
  //                       child: Text('${processList[i].brokerName}',
  //                           style: TextStyle(color: Colors.grey[700])),
  //                     ),
  //                     Container(
  //                       child: Text(
  //                         '${processList[i].created}',
  //                         style: TextStyle(color: Colors.grey[700]),
  //                       ),
  //                     ),
  //                     Container(
  //                       margin: EdgeInsets.only(right: 30.0),
  //                       child: Text(
  //                         '销秘审核',
  //                         // headerText(),
  //                         style: TextStyle(color: Colors.blue, fontSize: 15),
  //                       ),
  //                     ),
  //                   ],
  //                 )
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //       onTap: () {
  //         if (processKey == "3" || processKey == "4") {
  //           ExtendedNavigator.of(context)
  //               .push(Routes.salesmanDetails,
  //                   arguments: SalesmanDetailsArguments(
  //                     processBean: processList[i],
  //                   ))
  //               .then((value) {
  //             if (value == 'refresh') {
  //               BlocProvider.of<ProcessBloc>(context)
  //                   .add(const ProcessEvent.handleProcess());
  //             }
  //           });
  //         } else if (processKey == "5") {
  //           ExtendedNavigator.of(context)
  //               .push(Routes.managerDetails,
  //                   arguments: ManagerDetailsArguments(
  //                     processBean: processList[i],
  //                   ))
  //               .then((value) {
  //             if (value == 'refresh') {
  //               BlocProvider.of<ProcessBloc>(context)
  //                   .add(const ProcessEvent.handleProcess());
  //             }
  //           });
  //         } else {
  //           showDialog(
  //               barrierDismissible: true,
  //               context: context,
  //               builder: (context) {
  //                 return AlertDialog(
  //                   title: Text("提示信息"),
  //                   content: Container(
  //                     height: 200,
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: <Widget>[
  //                         _getHeader("客户信息"),
  //                         _getDetail("客户:", "${processList[i].customerName}"),
  //                         _getDetail("电话:", "${processList[i].phone}"),
  //                         SizedBox(height: 10.0),
  //                         _getHeader("经纪人信息"),
  //                         _getDetail("用户:", "${processList[i].brokerName}"),
  //                         _getDetail("电话:", "${processList[i].brokerPhone}"),
  //                         _getDetail("意向:", "${processList[i].introduction}"),
  //                       ],
  //                     ),
  //                   ),
  //                   actions: <Widget>[
  //                     FlatButton(
  //                       child: Text("取消",
  //                           style: TextStyle(color: Colors.blue[200])),
  //                       onPressed: () {
  //                         Navigator.of(context).pop(false);
  //                       },
  //                     ),
  //                     FlatButton(
  //                       child: Text("确定"),
  //                       onPressed: () {
  //                         Navigator.of(context).pop(true);
  //                       },
  //                     )
  //                   ],
  //                 );
  //               }).then((value) {
  //             if (value) {
  //               BlocProvider.of<ProcessBloc>(context)
  //                 ..add(ProcessEvent.dealWithProcess("${processList[i].id}",
  //                     "${processList[i].taskDefinitionKey}"))
  //                 ..add(const ProcessEvent.handleProcess());
  //             }
  //           });
  //         }
  //       },
  //     ),
  //   );
  // }
}
