import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/process/bloc/process_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/bean/consultant_bean.dart';
import 'package:flutter_ui/presentation/bean/process_bean.dart';
import 'package:flutter_ui/presentation/components/chat/public.dart';

class SalesmanDetails extends StatefulWidget {
  final ProcessBean processBean;

  const SalesmanDetails({Key key, this.processBean}) : super(key: key);
  @override
  _ProcessDetailsState createState() => _ProcessDetailsState();
}

class _ProcessDetailsState extends State<SalesmanDetails> {
  GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();
  TextEditingController _controller2;
  String _valueChanged2 = '';
  String _valueToValidate2 = '';
  String _valueSaved2 = '';
  List level = ["A", "B", "C", "无用客户"];
  bool _isExpanded = false;
  int _levelIndex = 0;
  List listTime = [];
  DateTime dueDate01 = DateTime(2000);
  DateTime dueDate02 = DateTime(2000);
  DateTime dueDate03 = DateTime(2000);
  DateTime createTime;
  bool _isRemind = false;
  bool _isTimeChanged = false;
  String nextRemindTime;

  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = 'pt_BR';
    _controller2 = TextEditingController(text: DateTime.now().toString());
    // _getValue();
  }

  // Future<void> _getValue() async {
  //   await Future.delayed(const Duration(seconds: 3), () {
  //     setState(() {
  //       _controller2.text = DateTime.now().toString().substring(0, 19);
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('${widget.processBean.name}'),
        ),
        body: BlocProvider(
            create: (context) => getIt<ProcessBloc>()
              ..add(ProcessEvent.nextRemind(
                  '${widget.processBean.processInstanceId}')),
            child: BlocConsumer<ProcessBloc, ProcessState>(
                listener: (context, state) async {
              if (state.nextRemind.length != 0) {
                for (int i = 0; i < state.nextRemind.length; i++) {
                  var dueDate =
                      DateTime.parse(state.nextRemind[i]["dueDate"]).toLocal();
                  createTime = DateTime.parse(state.nextRemind[0]["createTime"])
                      .toLocal();
                  listTime.add(dueDate);
                }
                listTime.sort((a, b) => (b).compareTo(a));
                //这里是置业顾问跟踪办理才有的（如果别的流程也想要这个页面，那就要做判断）
                dueDate01 = listTime[0];
                dueDate02 = listTime[1];
                dueDate03 = listTime[2];
              }
            }, builder: (context, state) {
              return Column(
                children: <Widget>[
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 10),
                          _getHeader("客户信息"),
                          _getDetail(
                              "客户:", "${widget.processBean.customerName}"),
                          _getDetail("电话:", "${widget.processBean.phone}"),
                          SizedBox(height: 10.0),
                          _getHeader("经纪人信息"),
                          _getDetail("用户:", "${widget.processBean.brokerName}"),
                          _getDetail(
                              "电话:", "${widget.processBean.brokerPhone}"),
                          _getDetail(
                              "意向:", "${widget.processBean.introduction}"),
                          _gradeCustomer(),
                          _nextRemind(),
                          // SelectableText(_valueChanged2 ?? ''),
                          _freezingCustomers(),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                    width: 300,
                    height: 50,
                    child: RaisedButton(
                      splashColor: Colors.lightBlueAccent,
                      child: Text("处理"),
                      onPressed: () {
                        // print(widget.processBean.id);
                        // print(widget.processBean.taskDefinitionKey);
                        // print(level[_levelIndex]);
                        // print(_valueChanged2);
                        if (_isRemind) {
                          showDialog(
                              barrierDismissible: true,
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("提醒"),
                                  content: Text("超出规定时间，请重新设置"),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text("确定"),
                                      onPressed: () {
                                        Navigator.of(context).pop(true);
                                      },
                                    )
                                  ],
                                );
                              });
                        } else {
                          showDialog(
                              barrierDismissible: true,
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("提示"),
                                  content: Text("请确认是否提交"),
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
                                        Navigator.of(context).pop(true);
                                      },
                                    )
                                  ],
                                );
                              }).then((value) {
                            if (value) {
                              //冻结 无效用户
                              if (_valueChanged2 != "" ||
                                  level[_levelIndex] == "无用客户") {
                                BlocProvider.of<ProcessBloc>(context).add(
                                    ProcessEvent.handleByConsultant(
                                        ConsultantBean(
                                  id: widget.processBean.id,
                                  taskDefinitionKey:
                                      widget.processBean.taskDefinitionKey,
                                  nextRemindTime: nextRemindTime,
                                  customerLevel: level[_levelIndex],
                                )));
                                Navigator.of(context).pop("refresh");
                              } else {
                                BlocProvider.of<ProcessBloc>(context).add(
                                    ProcessEvent.dealWithProcess(
                                        widget.processBean.id,
                                        widget.processBean.taskDefinitionKey));
                                Navigator.of(context).pop("refresh");
                              }
                            }
                          });
                        }
                      },
                      textColor: Colors.white,
                      color: Colors.blue[500],
                      elevation: 2,
                    ),
                  ),
                ],
              );
            })));
  }

  // Container(
  //   height: 55,
  //   width: 100,
  //   margin: EdgeInsets.only(right: 10),
  //   decoration: BoxDecoration(color: Colors.grey[200]),
  //   child: Scrollbar(
  //     child: ListView.builder(
  //       reverse: false,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Card(
  //             // margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
  //             child: InkWell(
  //           child: Container(
  //             height: 40,
  //             alignment: Alignment.center,
  //             child: Text('${level[index]}'),
  //           ),
  //           onTap: () {
  //             print('---');
  //           },
  //         ));
  //       },
  //       itemCount: 6,
  //     ),
  //   ),
  // ),

  _freezingCustomers() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
            margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
            child: Text(
              "冻结",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500),
            )),
        Container(
          margin: EdgeInsets.only(right: 20),
          child: RaisedButton(
            child: Text('冻结'),
            onPressed: () {},
            textColor: Colors.white,
            color: Colors.blue[300],
          ),
        ),
      ],
    );
  }

  _nextRemind() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Text(
              "下次提醒",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500),
            )),
        Row(
          children: <Widget>[
            Container(
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: _isRemind
                    ? Icon(Icons.error_outline, color: Colors.red)
                    : Text("")),
            Container(
              width: 130,
              margin: EdgeInsets.only(right: 20),
              child: DateTimePicker(
                decoration: InputDecoration(border: InputBorder.none),
                type: DateTimePickerType.dateTime,
                style: TextStyle(
                    color: _isTimeChanged ? Colors.blue : Colors.grey[300]),
                dateMask: 'yyyy-MM-dd HH:mm',
                controller: _controller2,
                firstDate: DateTime.parse(DateTime.now().toString()).toLocal(),
                lastDate: dueDate01,
                use24HourFormat: true,
                locale: Locale('zh', 'CH'),
                onChanged: (val) {
                  DateTime changeTime = DateTime.parse(val).toLocal();
                  DateTime nowTime = DateTime.now();
                  Duration _limitTime = dueDate03.difference(createTime);
                  Duration _firstRemind = changeTime.difference(nowTime);
                  Duration _secondRemind = changeTime.difference(dueDate02);
                  nextRemindTime = _firstRemind.inMinutes.toString();
                  if (_firstRemind.inSeconds > _limitTime.inSeconds ||
                      _secondRemind.inSeconds > 0 ||
                      _firstRemind.inSeconds < 0) {
                    showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("提示信息"),
                            content: Text("超出规定时间，请重新设置"),
                            actions: <Widget>[
                              FlatButton(
                                child: Text("确定"),
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                              )
                            ],
                          );
                        });
                    setState(() {
                      _isRemind = true;
                    });
                  } else {
                    setState(() {
                      _isRemind = false;
                    });
                  }
                  setState(() {
                    _valueChanged2 = val;
                    _isTimeChanged = true;
                  });
                },
                validator: (val) {
                  setState(() => _valueToValidate2 = val);
                  return null;
                },
                onSaved: (val) => setState(() => _valueSaved2 = val),
              ),
            )
          ],
        ),
      ],
    );
  }

  _getHeader(String value) {
    return Container(
        // height: 30,
        width: 100,
        margin: EdgeInsets.fromLTRB(10, 10, 0, 5),
        child: Text(value,
            style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
                fontWeight: FontWeight.w500)));
  }

  _getDetail(String key, String value) {
    return Container(
      height: 25,
      // decoration: BoxDecoration(
      //     border:
      //         Border(bottom: BorderSide(width: 0.5, color: Color(0xffe5e5e5)))),
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
            width: 200,
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

  //折叠栏
  _gradeCustomer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Text(
              "客户等级",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500),
            )),
        Container(
            width: 130,
            margin: EdgeInsets.fromLTRB(20, 10, 10, 0),
            child: ExpansionPanelList(
              elevation: 0,
              expansionCallback: (int panelIndex, bool isExpanded) {
                setState(() {
                  _isExpanded = !isExpanded;
                });
              },
              children: [
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Center(
                      child: Text('${level[_levelIndex]}',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.blue,
                              fontWeight: FontWeight.w500)),
                    );
                  },
                  body: Container(
                    height: 140,
                    child: Scrollbar(
                      child: ListView.builder(
                        reverse: false,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              color: Colors.grey[200],
                              child: InkWell(
                                child: Container(
                                  height: 40,
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${level[index]}',
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    _levelIndex = index;
                                    _isExpanded = false;
                                  });
                                },
                              ));
                        },
                        itemCount: 4,
                      ),
                    ),
                  ),
                  isExpanded: _isExpanded, // 设置面板的状态，true展开，false折叠
                ),
              ],
            )),
      ],
    );
  }

  // _submitButton() {
  //   return Container(
  //     margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
  //     width: 300,
  //     height: 50,
  //     child: RaisedButton(
  //       splashColor: Colors.lightBlueAccent,
  //       child: Text("处理"),
  //       onPressed: () {
  //         // print(widget.processBean.id);
  //         // print(widget.processBean.taskDefinitionKey);
  //         // print(level[_levelIndex]);
  //         // print(_valueChanged2);
  //         if (_isRemind) {
  //           showDialog(
  //               barrierDismissible: true,
  //               context: context,
  //               builder: (context) {
  //                 return AlertDialog(
  //                   title: Text("提醒"),
  //                   content: Text("超出规定时间，请重新设置"),
  //                   actions: <Widget>[
  //                     FlatButton(
  //                       child: Text("确定"),
  //                       onPressed: () {
  //                         Navigator.of(context).pop(true);
  //                       },
  //                     )
  //                   ],
  //                 );
  //               });
  //         } else {
  //           showDialog(
  //               barrierDismissible: true,
  //               context: context,
  //               builder: (context) {
  //                 return AlertDialog(
  //                   title: Text("提示"),
  //                   content: Text("请确认是否提交"),
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
  //               //冻结 无效用户
  //               if (_valueChanged2 != "") {
  //                 BlocProvider.of<ProcessBloc>(context)
  //                     .add(ProcessEvent.handleByConsultant(ConsultantBean(
  //                   id: widget.processBean.id,
  //                   taskDefinitionKey: widget.processBean.taskDefinitionKey,
  //                   nextRemindTime: nextRemindTime,
  //                   customerLevel: level[_levelIndex],
  //                 )));
  //                 Navigator.of(context).pop("refresh");
  //               } else {
  //                 BlocProvider.of<ProcessBloc>(context).add(
  //                     ProcessEvent.dealWithProcess(widget.processBean.id,
  //                         widget.processBean.taskDefinitionKey));
  //                 Navigator.of(context).pop("refresh");
  //               }
  //             }
  //           });
  //         }
  //       },
  //       textColor: Colors.white,
  //       color: Colors.blue[500],
  //       elevation: 2,
  //     ),
  //   );
  // }
}
