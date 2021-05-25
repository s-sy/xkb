import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/messages/messages_bloc.dart';
import 'package:flutter_ui/application/process/bloc/process_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/home/ui_view/message_dosth.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';
import 'package:im_stepper/stepper.dart';

class NeedToDeal extends StatefulWidget {
  List<dynamic> listData;
  String type;
  String mineTitle;
  Map<String, dynamic> jumpProcessed;

  NeedToDeal(
      {Key key, this.listData, this.type, this.mineTitle, this.jumpProcessed})
      : super(key: key);
  // const NeedToDeal(
  //     {Key key, this.listData, this.type, this.mineTitle, this.jumpProcessed})
  //     : super(key: key);
  @override
  _NeedToDealState createState() => _NeedToDealState();
}

class _NeedToDealState extends State<NeedToDeal> {
  int upperBound = 0;
  int activeStep = 0;
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => getIt<MessagesBloc>()
          ..add(MessagesEvent.dosth())
          ..add(MessagesEvent.getProcessDefinition())
          ..add(MessagesEvent.getNewCoustomer()),
        child: BlocConsumer<MessagesBloc, MessagesState>(
            listener: (context, state) async {
          print(state);
          if (widget.jumpProcessed != null) {
            // for (var i = 0; i < state.oneDayList.length; i++) {}
            // for (var i = 0; i < state.thirdDayList.length; i++) {}
            // for (var i = 0; i < state.waitWorkList.length; i++) {}
            // for (var i = 0; i < state.newCousterList.length; i++) {}
            for (var i = 0; i < state.doSth.length; i++) {
              if (state.doSth[i]["id"] == widget.jumpProcessed["id"]) {
                widget.jumpProcessed = null;
                ExtendedNavigator.of(context)
                    .push(Routes.processedScreen, arguments: {
                  "processInstanceId": state.doSth[i]["processInstanceId"],
                  "id": state.doSth[i]["id"],
                  "taskDefinitionKey": state.doSth[i]["taskDefinitionKey"],
                  "tenantName":
                      getName(state.doSth[i]["tenantId"], state.projectList),
                }).then((value) {
                  print(value);
                  ExtendedNavigator.of(context).pop("refresh");
                });
                return;
              }
            }
          }
        }, builder: (BuildContext context, state) {
          return WillPopScope(
              onWillPop: () {
                Navigator.of(context).pop("refresh");
                return;
              },
              child: Scaffold(
                  appBar: AppBar(
                      title: Text(
                          widget.mineTitle != null ? widget.mineTitle : "")),
                  body: BlocBuilder<MessagesBloc, MessagesState>(
                      builder: (context, state) {
                    return ListView.builder(
                      padding: EdgeInsets.only(
                        bottom: 150 + MediaQuery.of(context).padding.bottom,
                      ),
                      itemCount: widget.type == '1'
                          ? state.oneDayList.length
                          : widget.type == '3'
                              ? state.thirdDayList.length
                              : widget.type == '5'
                                  ? state.waitWorkList.length
                                  : widget.type == '7'
                                      ? state.newCousterList.length
                                      : 0,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        // print(state.doSth[index]);
                        // return MessageDoSth(state.doSth[index]);
                        return state.doSth[index]["suspended"]
                            ? Center(
                                child: SizedBox(
                                  height: 10,
                                ),
                              )
                            : (widget.type == '1'
                                ? MessageDoSth(
                                    state.oneDayList[index], state.projectList)
                                : widget.type == '3'
                                    ? MessageDoSth(state.thirdDayList[index],
                                        state.projectList)
                                    : widget.type == '5'
                                        ? MessageDoSth(
                                            state.waitWorkList[index],
                                            state.projectList)
                                        : widget.type == '7'
                                            ? MessageDoSth(
                                                state.newCousterList[index],
                                                state.projectList)
                                            : SizedBox(
                                                height: 10,
                                              ));
                      },
                    );
                  })));
        }));
  }
  //   return BlocProvider(
  //       create: (BuildContext context) =>
  //           getIt<ProcessBloc>()..add(const ProcessEvent.handleProcess()),
  //       // getIt<MessagesBloc>()..add(MessagesEvent.dosth()),
  //       child: BlocConsumer<ProcessBloc, ProcessState>(
  //           listener: (context, state) async {
  //         if (state.processList.length != 0) {
  //           // activeStep = newStep(state.processList[0].taskDefinitionKey);
  //           // processList = state.processList; 好像写在这里成功率更高
  //         }
  //       }, builder: (BuildContext context, state) {
  //         return ListView.builder(
  //           padding: EdgeInsets.only(
  //             bottom: 150 + MediaQuery.of(context).padding.bottom,
  //           ),
  //           itemCount: state.processList.length,
  //           scrollDirection: Axis.vertical,
  //           shrinkWrap: true,
  //           itemBuilder: (BuildContext context, int index) {
  //             print(state.processList[index]);
  //             return MessageDoSth(state.processList[index]);
  //           },
  //         );

  //         // return Padding(
  //         //   padding: const EdgeInsets.all(8.0),
  //         //   child: Column(
  //         //     children: [
  //         //       IconStepper(
  //         //         icons: [
  //         //           Icon(Icons.filter),
  //         //           Icon(Icons.filter_1),
  //         //           Icon(Icons.filter_2),
  //         //           Icon(Icons.filter_3),
  //         //           Icon(Icons.filter_4),
  //         //           Icon(Icons.filter_5),
  //         //           Icon(Icons.filter_6),
  //         //           Icon(Icons.filter_7),
  //         //           Icon(Icons.filter_8),
  //         //           Icon(Icons.filter_9),
  //         //           Icon(Icons.filter_1),
  //         //           Icon(Icons.filter_2),
  //         //           Icon(Icons.filter_3),
  //         //         ],
  //         //         activeStep: activeStep,
  //         //         upperBound: (bound) => upperBound = bound,
  //         //         onStepReached: (index) {
  //         //           // Future.delayed(Duration(seconds: 1), () {
  //         //           setState(() {
  //         //             activeStep = index;
  //         //           });
  //         //           // });
  //         //         },
  //         //         stepColor: Colors.grey[400],
  //         //         activeStepColor: Colors.blue,
  //         //       ),
  //         //       header(),
  //         //       stepperContent(state.processList),
  //         //     ],
  //         //   ),
  //         // );
  //       }));
  // }

  Widget header() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              headerText(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  int newStep(String taskDefinitionKey) {
    switch (taskDefinitionKey) {
      case 'ManagerCheckGuest':
        return 1;

      case 'ManagerAssigns':
        return 2;

      case 'CategoryManagent':
        return 3;

      case 'Activity_0vv7s63':
        return 4;

      case 'Activity_1atwvxw':
        return 5;

      case 'Activity_0fcrae3':
        return 6;

      case 'Activity_1p4qp4l':
        return 7;

      case 'Activity_10po9sk':
        return 8;

      case 'Activity_0ar3k0c':
        return 9;

      case 'Activity_1olkns4':
        return 10;

      case 'Activity_0sjwc2q':
        return 11;

      case 'Activity_07a78ln':
        return 12;
    }
  }

  // Returns the header text based on the activeStep.
  String headerText() {
    switch (activeStep) {
      case 1:
        return '人员判客';

      case 2:
        return '分配客户';

      case 3:
        return '置业顾问跟踪办理（邀约）';

      case 4:
        return '置业顾问跟踪办理（认筹/下定）';

      case 5:
        return '管理员审核';

      case 6:
        return '转定';

      case 7:
        return '转定审核';

      case 8:
        return '签订合同';

      case 9:
        return '合同审核';

      case 10:
        return '银行房贷';

      case 11:
        return '银行房贷审核';

      case 12:
        return '财务结佣';

      default:
        return 'Introduction';
    }
  }

  List getNewList(List oldList, String taskKey) {
    List list = [];
    for (int i = 0; i < oldList.length; i++) {
      String taskDefinitionKey = oldList[i].taskDefinitionKey;
      if (taskDefinitionKey == taskKey) {
        list.add(oldList[i]);
      }
    }
    return list;
  }

  Widget stepperContent(List list) {
    switch (activeStep) {
      case 1:
        return justOnTap(getNewList(list, "ManagerCheckGuest"), "1");
      case 2:
        return justOnTap(getNewList(list, "ManagerAssigns"), "2");
      case 3:
        return justOnTap(getNewList(list, "CategoryManagent"), "3");
      case 4:
        return justOnTap(getNewList(list, "Activity_0vv7s63"), "4");
      case 5:
        return justOnTap(getNewList(list, "Activity_1atwvxw"), "5");
      case 6:
        return justOnTap(getNewList(list, "Activity_0fcrae3"), "6");
      case 7:
        return justOnTap(getNewList(list, "Activity_1p4qp4l"), "7");
      case 8:
        return justOnTap(getNewList(list, "Activity_10po9sk"), "8");
      case 9:
        return justOnTap(getNewList(list, "Activity_0ar3k0c"), "9");
      case 10:
        return justOnTap(getNewList(list, "Activity_1olkns4"), "10");
      case 11:
        return justOnTap(getNewList(list, "Activity_0sjwc2q"), "11");
      case 12:
        return justOnTap(getNewList(list, "Activity_07a78ln"), "12");
      default:
        return emptyPage();
    }
  }

  emptyPage() {
    return Container(
      child: Text("首页widget，什么都没有"),
    );
  }

  justOnTap(List processList, String processKey) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      scrollDirection: Axis.vertical,
      reverse: false,
      primary: true,
      shrinkWrap: true,
      itemCount: processList.length,
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemBuilder: (context, i) => InkWell(
        child: Container(
          height: 100,
          margin: EdgeInsets.only(top: 10.0),
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
                          '${processList[i].name}',
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
                        margin: EdgeInsets.only(left: 10.0),
                        child: Text('发起人'),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: Text('发起时间'),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 30.0),
                        child: Text('当前状态'),
                      ),
                    ],
                  ),
                  SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: Text(
                            // '${processList[i].brokerName}',
                            '${processList[i].executionId}',
                            style: TextStyle(color: Colors.grey[700])),
                      ),
                      Container(
                        child: Text(
                          '${processList[i].created}',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 30.0),
                        child: Text(
                          '销秘审核',
                          // headerText(),
                          style: TextStyle(color: Colors.blue, fontSize: 15),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
