import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/process/bloc/process_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/bean/process_bean.dart';
import 'package:flutter_ui/presentation/components/chat/public.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';
import 'package:im_stepper/stepper.dart';

// import 'stepper.dart';

class IconStepperDemo extends StatefulWidget {
  @override
  _IconStepperDemo createState() => _IconStepperDemo();
}

class _IconStepperDemo extends State<IconStepperDemo> {
  bool _isExpanded = false;
  int upperBound = 0;
  int activeStep = 0;
  List level = ["A", "B", "C", "D", "E", "F"];
  // List processList = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('IconStepper Example'),
          ),
          backgroundColor: Colors.grey[200],
          body: BlocProvider(
              create: (context) =>
                  getIt<ProcessBloc>()..add(const ProcessEvent.handleProcess()),
              child: BlocConsumer<ProcessBloc, ProcessState>(
                  listener: (context, state) async {
                state.processFailureOrSuccessOption.fold(() {}, (a) {});
                if (state.processList.length != 0) {
                  activeStep = newStep(state.processList[0].taskDefinitionKey);
                  // processList = state.processList; 好像写在这里成功率更高
                }
              }, builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      IconStepper(
                        icons: [
                          Icon(Icons.filter),
                          Icon(Icons.filter_1),
                          Icon(Icons.filter_2),
                          Icon(Icons.filter_3),
                          Icon(Icons.filter_4),
                          Icon(Icons.filter_5),
                          Icon(Icons.filter_6),
                          Icon(Icons.filter_7),
                          Icon(Icons.filter_8),
                          Icon(Icons.filter_9),
                          Icon(Icons.filter_1),
                          Icon(Icons.filter_2),
                          Icon(Icons.filter_3),
                        ],
                        activeStep: activeStep,
                        upperBound: (bound) => upperBound = bound,
                        onStepReached: (index) {
                          // Future.delayed(Duration(seconds: 1), () {
                          setState(() {
                            activeStep = index;
                          });
                          // });
                        },
                        stepColor: Colors.grey[400],
                        activeStepColor: Colors.blue,
                      ),
                      header(),
                      // Expanded(
                      //   child:
                      // FittedBox(
                      //   child: Center(
                      //     child: Text(
                      //       '$activeStep',
                      //       style: TextStyle(fontSize: 40),
                      //     ),
                      //   ),
                      // ),
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     previousButton(),
                      //     nextButton(),
                      //   ],
                      // ),
                      // RaisedButton(
                      //   color: Colors.blue,
                      //   textColor: Colors.white,
                      //   child: new Text('测试'),
                      //   onPressed: () async {
                      //     BlocProvider.of<ProcessBloc>(context).add(
                      //             ProcessEvent.dealWithProcess(id));
                      //     // for (int i = 0; i < processList.length; i++) {
                      //     //   print(processList[i].name);
                      //     // }
                      //   },
                      // ),
                      // RaisedButton(
                      //   color: Colors.blue,
                      //   textColor: Colors.white,
                      //   child: new Text('获取数据'),
                      //   onPressed: () async {
                      //     SharedPreferences prefs =
                      //         await SharedPreferences.getInstance();
                      //     var sessionkey = prefs.get('CACHED_SESSION_KEY');
                      //     Scaffold.of(context).showSnackBar(SnackBar(
                      //         content: Text("数据获取成功：$sessionkey")));
                      //     print(sessionkey);
                      //   },
                      // ),
                      stepperContent(state.processList),
                    ],
                  ),
                );
              }))),
    );
  }

  // /// Returns the next button.
  // Widget nextButton() {
  //   return ElevatedButton(
  //     onPressed: () {
  //       // Increment activeStep, when the next button is tapped. However, check for upper bound.
  //       if (activeStep < upperBound) {
  //         setState(() {
  //           activeStep++;
  //         });
  //       }
  //     },
  //     child: Text('Next'),
  //   );
  // }

  // /// Returns the previous button.
  // Widget previousButton() {
  //   return ElevatedButton(
  //     onPressed: () {
  //       // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
  //       if (activeStep > 0) {
  //         setState(() {
  //           activeStep--;
  //         });
  //       }
  //     },
  //     child: Text('Prev'),
  //   );
  // }

  /// Returns the header wrapping the header text.
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

  handleType(List list) {
    return Container(
      child: Text("要处理的widget"),
    );
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
                        child: Text('${processList[i].brokerName}',
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
        onTap: () {
          if (processKey == "3" || processKey == "4") {
            ExtendedNavigator.of(context)
                .push(Routes.salesmanDetails,
                    arguments: SalesmanDetailsArguments(
                      processBean: processList[i],
                    ))
                .then((value) {
              if (value == 'refresh') {
                BlocProvider.of<ProcessBloc>(context)
                    .add(const ProcessEvent.handleProcess());
              }
            });
          } else if (processKey == "5") {
            ExtendedNavigator.of(context)
                .push(Routes.managerDetails,
                    arguments: ManagerDetailsArguments(
                      processBean: processList[i],
                    ))
                .then((value) {
              if (value == 'refresh') {
                BlocProvider.of<ProcessBloc>(context)
                    .add(const ProcessEvent.handleProcess());
              }
            });
          } else {
            showDialog(
                barrierDismissible: true,
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("提示信息"),
                    content: Container(
                      height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _getHeader("客户信息"),
                          _getDetail("客户:", "${processList[i].customerName}"),
                          _getDetail("电话:", "${processList[i].phone}"),
                          SizedBox(height: 10.0),
                          _getHeader("经纪人信息"),
                          _getDetail("用户:", "${processList[i].brokerName}"),
                          _getDetail("电话:", "${processList[i].brokerPhone}"),
                          _getDetail("意向:", "${processList[i].introduction}"),
                        ],
                      ),
                    ),
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
              if (value) {
                BlocProvider.of<ProcessBloc>(context)
                  ..add(ProcessEvent.dealWithProcess("${processList[i].id}",
                      "${processList[i].taskDefinitionKey}"))
                  ..add(const ProcessEvent.handleProcess());
              }
            });
          }
        },
      ),
    );
  }

  //付款方式折叠栏
  _payWay() {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: SingleChildScrollView(
          child: ExpansionPanelList(
            expansionCallback: (int panelIndex, bool isExpanded) {
              setState(() {
                _isExpanded = !isExpanded;
              });
            },
            children: [
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(12, 10, 0, 0),
                    child: Text('付款方式',
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500)),
                  );
                },
                body: Row(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.fromLTRB(12, 0, 0, 20),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1.1, color: Colors.blue[300]),
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.blue[100]),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Text('商业付款',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.blue)),
                        )),
                  ],
                ),
                isExpanded: _isExpanded, // 设置面板的状态，true展开，false折叠
              ),
            ],
          ),
        ));
  }

  _getHeader(String value) {
    return Container(
        child: Text(value,
            style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
                fontWeight: FontWeight.w500)));
  }

  _getDetail(String key, String value) {
    return Container(
      height: 25,
      child: Row(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                key,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500),
              )),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              value,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
