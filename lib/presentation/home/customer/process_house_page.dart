import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/coustomer/coustomer_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/home/customer/follow_up_record_page.dart';

class ProcessHousePage extends StatefulWidget {
  final Map<String, dynamic> listData;

  const ProcessHousePage({Key key, this.listData}) : super(key: key);
  @override
  _ProcessHousePageState createState() => _ProcessHousePageState();
}

class _ProcessHousePageState extends State<ProcessHousePage> {
  int _currentStep = 0;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<CoustomerBloc>()
          ..add(CoustomerEvent.gethistorydata(widget.listData["instanceId"]))
          ..add(
              CoustomerEvent.getSalesmanLists(widget.listData["affiliationId"]))
          ..add(CoustomerEvent.gethistory(widget.listData["instanceId"])),
        child: BlocConsumer<CoustomerBloc, CoustomerState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(title: Text("跟进记录")),
                body: state.history.length > 0
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          //头部，记录/来电/来访
                          step_head(state.history),
                          //主体内容
                          Expanded(
                            child: Container(
                              // decoration: BoxDecoration(color: Colors.green[100]),
                              child: Theme(
                                data: Theme.of(context)
                                    .copyWith(primaryColor: Colors.blue[400]),
                                child: Stepper(
                                    currentStep: _currentStep,
                                    onStepTapped: (int value) {
                                      // 点击步骤的序号触发的方法
                                      setState(() {
                                        _currentStep = value;
                                      });
                                    },
                                    // onStepContinue: () {
                                    //   // 点击继续触发的方法
                                    //   setState(() {
                                    //     _currentStep < 2 ? _currentStep += 1 : _currentStep = 0;
                                    //   });
                                    // },
                                    // onStepCancel: () {
                                    //   // 点击取消触发的方法
                                    //   setState(() {
                                    //     _currentStep > 0 ? _currentStep -= 1 : _currentStep = 0;
                                    //   });
                                    // },
                                    //修改确认和取消的按钮
                                    controlsBuilder: (BuildContext context,
                                        {VoidCallback onStepContinue,
                                        VoidCallback onStepCancel}) {
                                      return Row(
                                        children: <Widget>[
                                          // FlatButton(
                                          //   child: Text('下一步'),
                                          //   onPressed: onStepContinue,
                                          // ),
                                          // FlatButton(
                                          //   child: Text('上一步'),
                                          //   onPressed: onStepCancel,
                                          // ),
                                        ],
                                      );
                                    },
                                    steps: _stepList(state.history,
                                        state.historyVariable, state.salesman)
                                    // state.history.map((item) {
                                    //         return Step(
                                    //             title: step_title(item["startTime"], '去电',
                                    //                 '0', item["name"]),
                                    //             subtitle: Text('跟进人 刘聪'),
                                    //             content: step_content('预约9月3号盛世江尚看房'),
                                    //             isActive: _currentStep ==
                                    //                );
                                    //       }).toList()

                                    //     [
                                    //   Step(
                                    //       title: step_title(
                                    //           '2020-09-07 10:35', '去电', '0', '约访'),
                                    //       subtitle: Text('跟进人 刘聪'),
                                    //       content: step_content('预约9月3号盛世江尚看房'),
                                    //       isActive: _currentStep == 0),
                                    //   Step(
                                    //     title:
                                    //         step_title('2020-08-28 15:05', '去电', '0', '无'),
                                    //     subtitle: Text('跟进人 刘聪'),
                                    //     content: step_content('预定下次看房时间'),
                                    //     // isActive: _currentStep == 1
                                    //   ),
                                    //   Step(
                                    //     title:
                                    //         step_title('2020-08-15 09:14', '去电', '0', '无'),
                                    //     subtitle: Text('跟进人 刘聪'),
                                    //     content: step_content('对盛世江尚感兴趣'),
                                    //     // isActive: _currentStep == 2
                                    //   ),
                                    // ]
                                    ),
                              ),
                            ),
                          ),
                          //底部按钮部分
                          // BottomButton(),
                        ],
                      )
                    : SizedBox(),
              );
            }));
  }

  String getsalseman(id, list) {
    String name = "";
    for (var j = 0; j < list.length; j++) {
      if (list[j]["id"] == id) {
        name = list[j]["realName"];
      }
    }
    if (name == "") {
      name = "楼盘经理";
    }

    return name;
  }

  String getTime(dataTime) {
    var nowTime = DateTime.parse(dataTime).toLocal().toString();
    print(nowTime);
    return nowTime.substring(0, 19);
  }

  List<Widget> getcontent(listdata, variable) {
    List<Widget> res = [];

    for (var j = 0; j < variable.length; j++) {
      String keyss = listdata["taskDefinitionKey"];
      variable[j].forEach((key, value) {
        // print(key);
        // String defKey = "";
        // if (key.length > 16) defKey = (key ?? "").substring(0, 16);
        // print(defKey);
        if (key == keyss + "_imgData") {
          //variable[j]
          res.add(Row(
            children: value.map<Widget>((item) {
              return Image.network(
                item,
                height: 150,
              );
            }).toList(),
          ));
        }
        if (key == keyss + "_requestData") {
          res.add(Container(
            child: Text(value + " "),
          ));
        }
        if (key == keyss + "_managerDeration") {
          res.add(Container(
            child: Text(value),
          ));
        }
      });

      // if (variable[j]["executionId"] == listdata["executionId"]) {
      //   res.add(variable[j]);
      // }
    }
    // variable.map((item) {
    //   if (item["executionId"] == listdata["executionId"]) {
    //     res.add(item);
    //   }
    // });

    return res;
  }

  List<Step> _stepList(list, variable, salesman) {
    List<Step> lis = [];
    for (var i = 0; i < list.length; i++) {
      // print(variable);

      lis.add(Step(
          title: step_title(
              getTime(list[i]['startTime']), "", '0', list[i]["name"]),
          subtitle: Text('跟进人 :' + getsalseman(list[i]["assignee"], salesman)),
          content: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: getcontent(list[i], variable),
            ),
          ),
          isActive: list.length - 1 == i));
    }

    if (lis.length == 0) {
      lis.add(Step(
          title: step_title('2020-09-07 10:35', '去电', '0', "wu"),
          subtitle: Text('跟进人 刘聪'),
          content: Container(
            child: SizedBox(),
          ),
          isActive: this._currentStep == 0));
    }
    return lis;
  }

  //头部（跟进记录页面），记录/来电/来访
  step_head(list) {
    return Container(
      height: 30.0,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      decoration: BoxDecoration(
        // color: Colors.grey[300],
        border: Border(bottom: BorderSide(width: 1, color: Color(0xffe5e5e5))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text('记录(' + list.length.toString() + ')',
                  style:
                      TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500))),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Row(
              children: <Widget>[
                Container(
                    child: Text('来电:0', style: TextStyle(fontSize: 13.0))),
                SizedBox(width: 5.0),
                Container(
                    child: Text('来访:0', style: TextStyle(fontSize: 13.0))),
              ],
            ),
          )
        ],
      ),
    );
  }

  //进度的标题栏
  step_title(String time, String state, String remarks_num, String result) {
    return Container(
      // decoration:
      //     BoxDecoration(border: Border.all(width: 1.0)),
      //获取屏幕宽度
      width: MediaQuery.of(context).size.width - 90,
      padding: EdgeInsets.fromLTRB(0, 15.0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              // decoration: BoxDecoration(
              //     border: Border.all(width: 1.0)),
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  // padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Row(
                children: <Widget>[
                  Text(time),
                  SizedBox(width: 5),
                  Text(state),
                ],
              )),
              Container(
                  // padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Row(
                children: <Widget>[
                  Icon(
                    Icons.comment,
                    color: Colors.blue[200],
                    size: 17.0,
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    remarks_num,
                    style: TextStyle(color: Colors.grey[400]),
                  )
                ],
              )),
            ],
          )),
          Container(
            padding: EdgeInsets.only(top: 0),
            child: Text(result,
                style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400)),
          )
        ],
      ),
    );
  }
}
