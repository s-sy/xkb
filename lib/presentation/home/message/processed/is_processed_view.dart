import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/messages/messages_bloc.dart';
import 'package:flutter_ui/application/messages/processed/processed_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/core/fintness_app_theme.dart';

class IsProcessedView extends StatefulWidget {
  @override
  _IsProcessedViewState createState() => _IsProcessedViewState();
}

class _IsProcessedViewState extends State<IsProcessedView> {
  bool valueb = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    valueb = false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProcessedBloc, ProcessedState>(
      listener: (context, state) {
        // if (state.processedItem["taskDefinitionKey"] == "Activity_0ossp3s") {
        // BlocProvider.of<ProcessedBloc>(context)
        //     .add(ProcessedEvent.isPressed());
        // }
      },
      builder: (context, state) {
        return Container(
            //  padding: EdgeInsets.only(left: 20, right: 20),
            // margin: EdgeInsets.only(top: 30, right: 20, bottom: 20, left: 20),
            child: Column(
          children: <Widget>[
            state.processedItem["taskDefinitionKey"] == "Activity_0ossp3s"
                ? SizedBox()
                : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      "是否执行",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700]),
                    ),
                    Container(
                      // margin: EdgeInsets.only(left: 60.0),
                      child: Text(
                        getPressedName(
                                state.processedItem['taskDefinitionKey']) +
                            " ",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: FitnessAppTheme.lightText),
                      ),
                    ),

                    Checkbox(
                      value: this.valueb,
                      onChanged: (bool value) {
                        setState(() {
                          this.valueb = value;
                        });
                        BlocProvider.of<ProcessedBloc>(context)
                            .add(ProcessedEvent.isPressed());
                        if ((state.processedData.containsKey("recognition") &&
                                state.processedData["recognition"]["value"] ==
                                    false &&
                                (state.processedItem["taskDefinitionKey"] ==
                                        "Activity_1atwvxw" ||
                                    state.processedItem["taskDefinitionKey"] ==
                                        "Activity_1vkay0h" ||
                                    state.processedItem["taskDefinitionKey"] ==
                                        "Activity_0x97rbo" ||
                                    state.processedItem["taskDefinitionKey"] ==
                                        "Activity_1f9gn7v")) ||
                            (state.processedData.containsKey("recognition") &&
                                state.processedData["recognition"]["value"] ==
                                    true &&
                                (state.processedItem["taskDefinitionKey"] ==
                                        "Activity_1p4qp4l" ||
                                    state.processedItem["taskDefinitionKey"] ==
                                        "Activity_1gaipmg" ||
                                    state.processedItem["taskDefinitionKey"] ==
                                        "Activity_0zeqsng" ||
                                    state.processedItem["taskDefinitionKey"] ==
                                        "Activity_0k719dd")) ||
                            state.processedItem["taskDefinitionKey"] ==
                                "Activity_0fvuxs2") {
                          BlocProvider.of<ProcessedBloc>(context)
                            ..add(ProcessedEvent.checkHouse());
                        }
                      },
                    )
                    // if (state.isprocess)
                    //   Container(
                    //     width: 300,
                    //     child: OutlineButton(
                    //       padding: EdgeInsets.only(top: 10, bottom: 10),
                    //       child: Text("流程处理"),
                    //       textColor: Colors.blue,
                    //       highlightedBorderColor: Colors.deepOrange,
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(20.0)),
                    //       borderSide: new BorderSide(color: Colors.blueAccent),
                    //       onPressed: () {
                    //         // BlocProvider.of<ProcessedBloc>(context)
                    //         //     .add(ProcessedEvent.pushProcessed());
                    //         showDialog(
                    //             context: context,
                    //             builder: (BuildContext context) {
                    //               return new AlertDialog(
                    //                 title: Center(child: Text("温馨提示")),
                    //                 content: new SingleChildScrollView(
                    //                   child: new ListBody(
                    //                     children: <Widget>[
                    //                       Text(
                    //                           // getPressedName(state.processedItem['taskDefinitionKey'])

                    //                           "您正在执行" +
                    //                               getPressedName(state.processedItem[
                    //                                   'taskDefinitionKey']) +
                    //                               "流程，核对清楚后点确定"),
                    //                     ],
                    //                   ),
                    //                 ),
                    //                 actions: <Widget>[
                    //                   FlatButton(
                    //                     child: new Text("取消"),
                    //                     onPressed: () {
                    //                       Navigator.of(context).pop(false);
                    //                     },
                    //                   ),
                    //                   FlatButton(
                    //                     child: new Text("确定"),
                    //                     onPressed: () {
                    //                       // BlocProvider.of<ProcessedBloc>(context)
                    //                       //     .add(ProcessedEvent.pushProcessed());
                    //                       Navigator.of(context).pop(true);

                    //                       // _editParentText();
                    //                     },
                    //                   ),
                    //                 ],
                    //               );
                    //             }).then((value) {
                    //           if (value) {
                    //             BlocProvider.of<ProcessedBloc>(context)
                    //                 .add(ProcessedEvent.pushProcessed());

                    //             // BlocProvider.of<MessagesBloc>(context)
                    //             //     .add(MessagesEvent.dosth());
                    //           }
                    //         });
                    //       },
                    //     ),
                    //   ),
                  ]),
            if (this.valueb &&
                (state.processedItem["taskDefinitionKey"] ==
                        "Activity_1h77h4t" ||
                    state.processedItem["taskDefinitionKey"] ==
                        "CategoryManagent" ||
                    state.processedItem["taskDefinitionKey"] ==
                        "Activity_0639vrl"))
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "先确认客户已到访",
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                ],
              )
          ],
        ));
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
