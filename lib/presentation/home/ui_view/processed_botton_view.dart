import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/messages/messages_bloc.dart';
import 'package:flutter_ui/application/messages/processed/processed_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:bot_toast/bot_toast.dart';

class ProcessedBottonView extends StatefulWidget {
  @override
  _ProcessedBottonViewState createState() => _ProcessedBottonViewState();
}

class _ProcessedBottonViewState extends State<ProcessedBottonView> {
  String _getText(list) {
    String str = "";
    for (var i = 0; i < list.length; i++) {
      str = list[i]["staging"] +
          list[i]["building"] +
          list[i]["entrance"] +
          list[i]["serialNumber"] +
          " ";
    }

    str = str + "房源已被控";
    return str;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProcessedBloc, ProcessedState>(
      listener: (context, state) {
        if (state.processResult != null) Navigator.of(context).pop("refresh");
      },
      builder: (context, state) {
        return Container(
          //  padding: EdgeInsets.only(left: 20, right: 20),
          margin: EdgeInsets.only(top: 10),
          child: Column(children: [
            if (state.isprocess ||
                state.processedItem["taskDefinitionKey"] == "Activity_0ossp3s")
              Container(
                width: 300,
                child: OutlineButton(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(state.processedItem["taskDefinitionKey"] ==
                          "Activity_0ossp3s"
                      ? "确定"
                      : "流程处理"),
                  textColor: Colors.blue,
                  highlightedBorderColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  borderSide: new BorderSide(color: Colors.lightBlue),
                  onPressed: () async {
                    // BlocProvider.of<ProcessedBloc>(context)
                    //     .add(ProcessedEvent.pushProcessed());

                    if ((state.processedData.length != 0 &&
                            state.processedData.containsKey("recognition") &&
                            (state.processedData["recognition"]["value"] ==
                                false) &&
                            (state.processedItem["taskDefinitionKey"] ==
                                    "Activity_0vv7s63" ||
                                state.processedItem["taskDefinitionKey"] ==
                                    "Activity_0qvod3g" ||
                                state.processedItem["taskDefinitionKey"] ==
                                    "Activity_0qk9snp" ||
                                state.processedItem["taskDefinitionKey"] ==
                                    "Activity_00h6h12")) ||
                        (state.processedData.length != 0 &&
                            state.processedData.containsKey("recognition") &&
                            (state.processedData["recognition"]["value"] ==
                                true) &&
                            (state.processedItem["taskDefinitionKey"] ==
                                    "Activity_0fcrae3" ||
                                state.processedItem["taskDefinitionKey"] ==
                                    "Activity_0ki46oj" ||
                                state.processedItem["taskDefinitionKey"] ==
                                    "Activity_0cy1bz9" ||
                                state.processedItem["taskDefinitionKey"] ==
                                    "Activity_1v8yzn1"))) {
                      if (state.endListData.length == 0) {
                        BotToast.showText(text: "请选择房源并确认");
                        return;
                      }
                    }
                    if (state.groupValue == 0 && state.checkRes.length > 0) {
                      BotToast.showText(text: _getText(state.checkRes));
                      return;
                    }
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return new AlertDialog(
                            title: Center(child: Text("温馨提示")),
                            content: new SingleChildScrollView(
                              child: new ListBody(
                                children: <Widget>[
                                  Text(
                                      // getPressedName(state.processedItem['taskDefinitionKey'])

                                      "您正在执行" +
                                          getPressedName(state.processedItem[
                                              'taskDefinitionKey']) +
                                          "流程，核对清楚后点确定"),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                child: new Text(
                                  "取消",
                                  style: TextStyle(color: Colors.blue[300]),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                              ),
                              FlatButton(
                                child: new Text("确定"),
                                onPressed: () {
                                  // BlocProvider.of<ProcessedBloc>(context)
                                  //     .add(ProcessedEvent.pushProcessed());
                                  Navigator.of(context).pop(true);

                                  // _editParentText();
                                },
                              ),
                            ],
                          );
                        }).then((value) {
                      if (value) {
                        BlocProvider.of<ProcessedBloc>(context)
                            .add(ProcessedEvent.pushProcessed("yes"));

                        // BlocProvider.of<MessagesBloc>(context)
                        //     .add(MessagesEvent.dosth());
                      }
                    });
                  },
                ),
              ),
            if (state.isUseDate)
              Container(
                width: 300,
                child: OutlineButton(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text("下次提醒"),
                  textColor: Colors.orange,
                  highlightedBorderColor: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  borderSide: new BorderSide(color: Colors.orange),
                  onPressed: () {
                    // BlocProvider.of<ProcessedBloc>(context)
                    //     .add(ProcessedEvent.pushProcessed());
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return new AlertDialog(
                            title: Center(child: Text("温馨提示")),
                            content: new SingleChildScrollView(
                              child: new ListBody(
                                children: <Widget>[
                                  Text(
                                      // getPressedName(state.processedItem['taskDefinitionKey'])

                                      "您选择执行下次提醒流程，核对清楚后点确定"),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                child: new Text("取消"),
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                              ),
                              FlatButton(
                                child: new Text("确定"),
                                onPressed: () {
                                  // BlocProvider.of<ProcessedBloc>(context)
                                  //     .add(ProcessedEvent.pushProcessed());
                                  Navigator.of(context).pop(true);

                                  // _editParentText();
                                },
                              ),
                            ],
                          );
                        }).then((value) {
                      if (value) {
                        BlocProvider.of<ProcessedBloc>(context)
                            .add(ProcessedEvent.pushProcessed("next"));

                        // BlocProvider.of<MessagesBloc>(context)
                        //     .add(MessagesEvent.dosth());
                      }
                    });
                  },
                ),
              ),
            if (state.rate == "D")
              Container(
                width: 300,
                child: OutlineButton(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text("D类评级结束流程"),
                  textColor: Colors.red[300],
                  highlightedBorderColor: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  borderSide: new BorderSide(color: Colors.redAccent),
                  onPressed: () {
                    // BlocProvider.of<ProcessedBloc>(context)
                    //     .add(ProcessedEvent.pushProcessed());
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return new AlertDialog(
                            title: Center(child: Text("温馨提示")),
                            content: new SingleChildScrollView(
                              child: new ListBody(
                                children: <Widget>[
                                  Text(
                                      // getPressedName(state.processedItem['taskDefinitionKey'])
                                      "您选择执行结束流程，核对清楚后点确定"),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                child: new Text("取消"),
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                              ),
                              FlatButton(
                                child: new Text("确定"),
                                onPressed: () {
                                  // BlocProvider.of<ProcessedBloc>(context)
                                  //     .add(ProcessedEvent.pushProcessed());
                                  Navigator.of(context).pop(true);

                                  // _editParentText();
                                },
                              ),
                            ],
                          );
                        }).then((value) {
                      if (value) {
                        BlocProvider.of<ProcessedBloc>(context)
                            .add(ProcessedEvent.pushProcessed("D"));

                        // BlocProvider.of<MessagesBloc>(context)
                        //     .add(MessagesEvent.dosth());
                      }
                    });
                  },
                ),
              ),
            if (state.followState)
              Container(
                width: 300,
                child: OutlineButton(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    "跟踪办理",
                    style: TextStyle(color: Colors.green),
                  ),
                  textColor: Colors.blue[300],
                  highlightedBorderColor: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  borderSide: new BorderSide(color: Colors.green),
                  onPressed: () {
                    // BlocProvider.of<ProcessedBloc>(context)
                    //     .add(ProcessedEvent.pushProcessed());
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return new AlertDialog(
                            title: Center(child: Text("温馨提示")),
                            content: new SingleChildScrollView(
                              child: new ListBody(
                                children: <Widget>[
                                  Text(
                                      // getPressedName(state.processedItem['taskDefinitionKey'])
                                      "您选择执行跟踪客户，核对清楚后点确定"),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                child: new Text("取消"),
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                              ),
                              FlatButton(
                                child: new Text("确定"),
                                onPressed: () {
                                  // BlocProvider.of<ProcessedBloc>(context)
                                  //     .add(ProcessedEvent.pushProcessed());
                                  Navigator.of(context).pop(true);

                                  // _editParentText();
                                },
                              ),
                            ],
                          );
                        }).then((value) {
                      if (value) {
                        BlocProvider.of<ProcessedBloc>(context)
                            .add(ProcessedEvent.pushProcessed("follow"));

                        // BlocProvider.of<MessagesBloc>(context)
                        //     .add(MessagesEvent.dosth());
                      }
                    });
                  },
                ),
              ),
          ]),
        );
      },
    );
  }

  String getPressedName(name) {
    String StrName = "";
    switch (name) {
      case "ManagerCheckGuest":
        StrName = "客户审核";
        break;
      case "ManagerAssigns":
        StrName = "分配客户";
        break;
      case "CategoryManagent":
        StrName = "邀约客户";
        break;
      case "Activity_0vv7s63":
        StrName = "认筹/下定提交审核";
        break;
      case "Activity_1atwvxw":
        StrName = "管理员审核";
        break;
      case "Activity_0fcrae3":
        StrName = "客户认筹/下定提交审核";
        break;
      case "Activity_1p4qp4l":
        StrName = "认筹/下定确认";
        break;
      case "Activity_10po9sk":
        StrName = "签订合同提交审核";
        break;
      case "Activity_0ar3k0c":
        StrName = "合同审核";
        break;
      case "Activity_1olkns4":
        StrName = "银行放款提交审核";
        break;
      case "Activity_0sjwc2q":
        StrName = "银行放款审核";
        break;

      //自有
      case "Activity_1h77h4t":
        StrName = "邀约";
        break;
      case "Activity_0qk9snp":
        StrName = "认筹/下定";
        break;
      case "Activity_0x97rbo":
        StrName = "认筹/下定审核";
        break;
      case "Activity_0cy1bz9":
        StrName = "转定";
        break;
      case "Activity_0zeqsng":
        StrName = "转定审核";
        break;
      case "Activity_00n2pwo":
        StrName = "签订合同";
        break;
      case "Activity_0kdzv8w":
        StrName = "合同审核";
        break;
      case "Activity_1cbo1ao":
        StrName = "银行放款";
        break;
      case "Activity_1u7ja7r":
        StrName = "经理分配";
        break;

      //隐号推荐
      case "Activity_060ppeg":
        StrName = "人员判客";
        break;
      case "Activity_0037lus":
        StrName = "客户来访调配";
        break;
      case "Activity_0qvod3g":
        StrName = "认筹/下定跟踪";
        break;
      case "Activity_1vkay0h":
        StrName = "认筹/下定审核";
        break;
      case "Activity_0ki46oj":
        StrName = "转定";
        break;
      case "Activity_1gaipmg":
        StrName = "转定审核";
        break;
      case "Activity_1otznpp":
        StrName = "签订合同";
        break;
      case "Activity_0lnm3vn":
        StrName = "合同审核";
        break;
      case "Activity_0yyexii":
        StrName = "银行放款";
        break;
      case "Activity_0tkddk1":
        StrName = "银行放款审核";
        break;

      //房源
      case "Activity_0fvuxs2":
        StrName = "房源审核";
        break;
      case "":
        StrName = "Activity_0ossp3s";
        break;
      case "房源审核结束":
        break;
      //平台流程
      case "Activity_0639vrl":
        StrName = "邀约客户";
        break;
      case "Activity_00h6h12":
        StrName = "认筹/下定跟踪办理";
        break;
      case "Activity_1f9gn7v":
        StrName = "管理员审核";
        break;
      case "Activity_1v8yzn1":
        StrName = "转定";
        break;
      case "Activity_0k719dd":
        StrName = "转定审核";
        break;
      case "Activity_0ndvcvv":
        StrName = "签订合同";
        break;
      case "Activity_1o336vo":
        StrName = "合同审核";
        break;
      case "Activity_1xgd1ne":
        StrName = "银行放款";
        break;
      case "Activity_19m52i0":
        StrName = "银行放款审核";
        break;
      case "Activity_0lpau4d":
        StrName = "客户分配";
        break;
    }
    return StrName;
  }
}
