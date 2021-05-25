import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/message/bloc/web_scoket_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/components/chat/public.dart';
import 'package:im_stepper/stepper.dart';

class RemindDetailsView extends StatefulWidget {
  final String phone;
  final String tenantId;

  const RemindDetailsView({Key key, this.phone, this.tenantId})
      : super(key: key);

  @override
  _RemindDetailsViewState createState() => _RemindDetailsViewState();
}

class _RemindDetailsViewState extends State<RemindDetailsView> {
  Map<String, dynamic> map = {};
  String matchingNumber = "";
  int activeStep = 0;
  int upperBound = 0;
  List<int> listStepper = [];
  List list;
  bool _hasRecommend = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<WebScoketBloc>()
          ..add(WebScoketEvent.managerRemindDetails(
              widget.phone, widget.tenantId))
          ..add(WebScoketEvent.getSalesmanLists()),
        child: BlocConsumer<WebScoketBloc, WebScoketState>(
            listener: (context, state) async {
          // state.salesman 所有人(销秘，经理，置业顾问等)
          //state.salesmanList 所有置业顾问
          if (state.managerRemindDetails != null) {
            print(state.managerRemindDetails);
            //注意！！这边历史list，电话list，用最后一个渲染历史，我不是通过隐号查找的，但是还是得到电话list，这里有可能出错
            String recordslast = state.managerRemindDetails['recordslast'].last;
            // print(recordslast);
            BlocProvider.of<WebScoketBloc>(context)
                .add(WebScoketEvent.gethistory(recordslast));
            for (int i = 0; i < state.history.length; i++) {
              listStepper.add(i);
            }
            // print(state.history);
            setState(() {
              map = state.managerRemindDetails;
            });
            // _stepperNum(state);
            print(map["matchingNumber"]);
            // map.forEach((key, value) {
            //   if (key == 'matchingNumber') {
            //     print(value);
            //   }
            // });
          }
        }, builder: (context, state) {
          return Scaffold(
              appBar: AppBar(title: Text("详情")),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: ListView(
                      children: [
                        customer_title("流程详情"),
                        // _customer_information_details(
                        //     '号码', "${map["matchingNumber"]}"),
                        _customer_details_num(
                            '号码', widget.phone, state, context),
                        // _customer_details_num(
                        //     '号码',
                        //     map["matchingNumber"] != null
                        //         ? map["matchingNumber"]
                        //         : ["电话号码异常"],
                        //     state),
                        customer_details_status(
                            '当前状态', "${map["workflowStatus"]}"),
                        _customer_information_details(
                            '推荐次数', "${map["recommendTimes"]}"),
                        _customer_information_details(
                            '被多少人推荐', "${map["recommendPeople"]}"),
                        // customer_details_total(
                        //     '', "${map["acquisitionCount"]}"),
                        _customer_information_details(
                            '最早被推荐时间', "${map["earliestTime"]}"),
                        _customer_information_details(
                            '最晚被推荐时间', "${map["latestTime"]}"),
                        customer_title("历史流程"),
                        // _customer_information_details(
                        //     'lisi', "${map["recordslast"]}"),
                        if (listStepper.length != 0) _steeper(state),
                        if (state.history != null && listStepper.length != 0)
                          _history(state.history, activeStep, state),
                      ],
                    ),
                  ),
                  // SizedBox(height: 80),
                ],
              ));
        }));
  }

  _steeper(state) {
    return NumberStepper(
      numbers:
          // _stepperNum(state),
          // listStepper,
          listStepper,
      // [1, 2, 3, 4],
      // icons: [
      //   Icon(Icons.filter),
      //   Icon(Icons.filter_1),
      //   Icon(Icons.filter_2),
      //   Icon(Icons.filter_3),
      //   Icon(Icons.filter_4),
      //   Icon(Icons.filter_5),
      //   Icon(Icons.filter_6),
      //   Icon(Icons.filter_7),
      //   Icon(Icons.filter_8),
      //   Icon(Icons.filter_9),
      //   Icon(Icons.filter_1),
      //   Icon(Icons.filter_2),
      //   Icon(Icons.filter_3),
      // ],
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
    );
  }

  _history(List list, int activeStep, state) {
    return Padding(
        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: InkWell(
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
                            list[activeStep]['name'] + " ",
                            // '${list[activeStep]}',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          Text("")
                          // Icon(
                          //   Icons.navigate_next,
                          //   color: Colors.blue[300],
                          // ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: Text('跟进人'),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 30.0),
                          child: Text('客户'),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 40.0),
                          child: Text('发起时间'),
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
                              // list[activeStep]['assignee'],
                              _getRealName(list, activeStep, state),
                              style: TextStyle(color: Colors.grey[700])),
                        ),
                        Container(
                          // margin: EdgeInsets.only(right: 0.0),
                          child: Text(
                            // '销秘审核',
                            _getCustomerName(state),
                            // headerText(),
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 15),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10.0),
                          child: Text(
                            list[activeStep]['startTime']
                                .toString()
                                .substring(0, 19)
                                .replaceAll('T', ' '),
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 12),
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
        ));
  }

  String _getRealName(List list, int activeStep, state) {
    String realName = '';
    // for (int i = 0; i < list.length; i++) {
    for (int j = 0; j < state.salesman.length; j++) {
      if (list[activeStep]['assignee'] == state.salesman[j]['id']) {
        // state.history[i]['assignee'] = state.salesman[j]['realName'];
        realName = state.salesman[j]['realName'];
      }
    }
    if (realName == '' || realName == null) {
      realName = '参数错误';
    }
    // print(realName);
    return realName + " ";
    // }
  }

  String _getCustomerName(state) {
    String name = '';
    for (int i = 0; i < state.historyVariable.length; i++) {
      // if (list[activeStep]['assignee'] == state.salesman[j]['id']) {
      //   // state.history[i]['assignee'] = state.salesman[j]['realName'];
      //   realName = state.salesman[j]['realName'];
      // }
      if (state.historyVariable[i]['customerName'] != null) {
        name = state.historyVariable[i]['customerName'];
      }
    }
    return name + " ";
  }

  //资料信息标题
  customer_title(String tittle) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.fromLTRB(10, 30, 0, 8),
      // padding: EdgeInsets.fromLTRB(15, 0, 0, 5),
      // decoration: BoxDecoration(
      //     border:
      //         Border(bottom: BorderSide(width: 1, color: Color(0xffe5e5e5)))),
      child: Text(
        tittle,
        style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700]),
      ),
    );
  }

  //资料信息内容
  _customer_information_details(String infoKey, String infoValue) {
    return Container(
      height: 30.0,
      // decoration:
      //     BoxDecoration(border: Border.all(width: 1.0, color: Colors.blue)),
      child: Row(
        children: <Widget>[
          Container(
            width: 150.0,
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            // decoration: BoxDecoration(
            //     border: Border.all(width: 1.0, color: Colors.grey[300])),
            child: Text(infoKey + ':',
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500)),
          ),
          Expanded(
              child: Container(
            // padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            // decoration: BoxDecoration(
            //     border: Border.all(width: 1.0, color: Colors.grey[300])),
            child: Text(infoValue != 'null' ? infoValue : '数据异常',
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w500)),
          ))
        ],
      ),
    );
  }

  _customer_details_num(String infoKey, String infoValue, state, context) {
    return Container(
      height: 30.0,
      // child: SingleChildScrollView(
      //   physics: BouncingScrollPhysics(),
      //   scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Container(
            width: 150.0,
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            // decoration: BoxDecoration(
            //     border: Border.all(width: 1.0, color: Colors.grey[300])),
            child: Text(infoKey + ':',
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500)),
          ),
          Expanded(
            child: Text(infoValue,
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w500)),
          ),
          // Expanded(
          //     child: ListView.builder(
          //   padding: EdgeInsets.only(top: 0),
          //   scrollDirection: Axis.vertical,
          //   reverse: false,
          //   primary: true,
          //   shrinkWrap: true,
          //   itemCount: infoValue.length,
          //   physics:
          //       BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          //   itemBuilder: (context, i) => Container(
          //     child: Text(infoValue[i],
          //         style: TextStyle(
          //             fontSize: 15.0,
          //             color: Colors.grey[500],
          //             fontWeight: FontWeight.w500)),
          //   ),
          // )),
          if (map["workflowStatus"] == '4' &&
              state.managerRemindDetails['recordslast'].length == 1 &&
              !_hasRecommend)
            InkWell(
              child: Container(
                padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Text(
                  '激活号码',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              splashColor: Colors.lightBlueAccent,
              onTap: () {
                _openModalBottomSheetText(state, context);
              },
            ),
          if (map["workflowStatus"] == '4' &&
              state.managerRemindDetails['recordslast'].length != 1)
            InkWell(
              child: Container(
                padding: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.blue),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Text(
                  '号码已激活' + ' ',
                  style: TextStyle(color: Colors.blue, fontSize: 10),
                ),
              ),
              splashColor: Colors.lightBlueAccent,
              // onTap: () {
              //   _openModalBottomSheetText(state, context);
              // },
            ),
          SizedBox(width: 25)
        ],
      ),
      // )
    );
  }

  Future _openModalBottomSheetText(state, context) async {
    bool isrecommend = false;
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            children: <Widget>[
              Container(
                  height: 250.0,
                  child: ListView.builder(
                      itemCount: state.salesmanList.length,
                      itemBuilder: (context, i) => InkWell(
                            splashColor: Colors.lightBlueAccent,
                            child: Container(
                              height: 50,
                              child: Center(
                                child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    state.salesmanList[i]['realName'] + " ",
                                    // maxLines: 1,
                                    // overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () async {
                              // _activePhone(
                              //     state.salesmanList[i]['id'], context);
                              await showDialog(
                                  barrierDismissible: true,
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("提示信息"),
                                      content: Text("请确认是否推荐给该置业顾问"),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("取消",
                                              style: TextStyle(
                                                  color: Colors.blue[200])),
                                          onPressed: () {
                                            Navigator.of(context).pop(false);
                                          },
                                        ),
                                        FlatButton(
                                          child: Text("确定"),
                                          onPressed: () {
                                            isrecommend = true;
                                            Navigator.of(context).pop(true);
                                          },
                                        )
                                      ],
                                    );
                                  });
                              Navigator.of(context)
                                  .pop(state.salesmanList[i]['id']);
                            },
                          ))),
              ListTile(
                title: Text('取消',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue[200])),
                onTap: () {
                  Navigator.pop(context, '取消');
                },
              ),
            ],
          );
        }).then((value) {
      // print(value);
      // print(isrecommend);
      if (isrecommend) {
        BlocProvider.of<WebScoketBloc>(context)
          ..add(WebScoketEvent.getProcessDefinition(widget.phone, value));
        setState(() {
          _hasRecommend = true;
        });
        _showToast();
      }
    });
    // print(option);
  }

  _showToast() {
    return BotToast.showAttachedWidget(
        attachedBuilder: (_) => Center(
                child: Card(
              child: Container(
                  width: 150,
                  height: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(Icons.done, color: Colors.blue),
                      Text(
                        "客户添加成功！",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.w500),
                      )
                    ],
                  )),
            )),
        duration: Duration(seconds: 2),
        target: Offset(520, 520));
  }

  _activePhone(String id, context) {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示信息"),
            content: Text("请确认是否推荐给该置业顾问"),
            actions: <Widget>[
              FlatButton(
                child: Text("取消", style: TextStyle(color: Colors.blue[200])),
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
        BlocProvider.of<WebScoketBloc>(context)
            .add(WebScoketEvent.getProcessDefinition(widget.phone, id));
        setState(() {
          _hasRecommend = true;
        });
        Navigator.of(context).pop(true);
      }
    });
  }

  customer_details_total(String infoKey, String infoValue) {
    return Container(
      height: 30.0,
      // decoration:
      //     BoxDecoration(border: Border.all(width: 1.0, color: Colors.blue)),
      child: Row(
        children: <Widget>[
          Container(
            width: 150.0,
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            // decoration: BoxDecoration(
            //     border: Border.all(width: 1.0, color: Colors.grey[300])),
            child: Text(infoKey + ':',
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500)),
          ),
          Expanded(
              child: Container(
            // padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            // decoration: BoxDecoration(
            //     border: Border.all(width: 1.0, color: Colors.grey[300])),
            child: Text(infoValue != 'null' ? infoValue : '0',
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w500)),
          ))
        ],
      ),
    );
  }

  customer_details_status(String infoKey, String infoValue) {
    return Container(
      height: 30.0,
      // decoration:
      //     BoxDecoration(border: Border.all(width: 1.0, color: Colors.blue)),
      child: Row(
        children: <Widget>[
          Container(
            width: 150.0,
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            // decoration: BoxDecoration(
            //     border: Border.all(width: 1.0, color: Colors.grey[300])),
            child: Text(infoKey + ':',
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500)),
          ),
          Expanded(
              child: Container(
            // padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            // decoration: BoxDecoration(
            //     border: Border.all(width: 1.0, color: Colors.grey[300])),
            child: Text(
                infoValue == '0'
                    ? '活跃'
                    : infoValue == '1'
                        ? '完结'
                        : infoValue == '2'
                            ? '挂起'
                            : infoValue == '3'
                                ? '延期'
                                : infoValue == '4'
                                    ? '结束'
                                    : "状态异常",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w500)),
          ))
        ],
      ),
    );
  }
}
