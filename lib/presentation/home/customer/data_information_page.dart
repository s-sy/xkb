import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/coustomer/coustomer_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/home/customer/bottom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerInformation extends StatefulWidget {
  final Map<String, dynamic> listData;
  CustomerInformation({Key key, this.listData}) : super(key: key);

  @override
  _CustomerInformationState createState() => _CustomerInformationState();
}

class _CustomerInformationState extends State<CustomerInformation> {
  String _textFeid = "";
  String _addValue01 = "";
  bool isNewPhone = false;

  @override
  void initState() {
    BlocProvider.of<CoustomerBloc>(context)
      ..add(CoustomerEvent.gethistory(widget.listData["instanceId"]));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //     create: (context) => getIt<CoustomerBloc>()
    //       ..add(CoustomerEvent.gethistory(widget.listData["instanceId"])),
    //     child: BlocConsumer<CoustomerBloc, CoustomerState>(
    //         listener: (context, state) async {},
    //         builder: (context, state) {
    return BlocBuilder<CoustomerBloc, CoustomerState>(
        builder: (context, state) {
      return Scaffold(body:
          BlocBuilder<CoustomerBloc, CoustomerState>(builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // customer_title(),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: 20),
                  _details('客      户', widget.listData['customerName']),
                  _detailsKehuPhone('电      话', widget.listData['phone']),
                  _detailsComeFrom('客户来源', widget.listData['origin']),
                  _detailsLevels('意向等级', widget.listData['grade']),
                  _details('推荐时间', widget.listData['createTime']),
                  _detailsFrom('更新时间', widget.listData['updateTime']),
                  _details('经 纪 人', widget.listData['brokerName']),
                  _detailsPhone('联系方式', widget.listData['brokerPhone']),
                  _details('当前流程', widget.listData['currentHandler']),
                  _detailsOther('备      注', widget.listData['description'],
                      state.history, context),
                ],
              ),
            ),
            // BottomButton(),
          ],
        );
      }));
    });
  }

  //资料信息标题
  customer_title() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
      padding: EdgeInsets.fromLTRB(15, 0, 0, 5),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Color(0xffe5e5e5)))),
      child: Text(
        '客户意向',
        style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
      ),
    );
  }

  //资料信息内容
  _details(String infoKey, String infoValue) {
    return Container(
      height: 30.0,
      // decoration:
      //     BoxDecoration(border: Border.all(width: 1.0, color: Colors.grey)),
      // decoration: BoxDecoration(
      //   border:
      //       Border(bottom: BorderSide(width: 1.0, color: Color(0xffe5e5e5))),
      // ),
      child: Row(
        children: <Widget>[
          Container(
            width: 150.0,
            padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
            // decoration: BoxDecoration(
            //     border: Border.all(width: 1.0, color: Colors.grey[300])),
            child: Text(infoKey + ':',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500)),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            // decoration: BoxDecoration(
            //     border: Border.all(width: 1.0, color: Colors.grey[300])),
            child: Text(infoValue != null ? infoValue : '无',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600])),
          ))
        ],
      ),
    );
  }

  _detailsKehuPhone(String infoKey, String infoValue) {
    return Container(
      height: 30.0,
      // decoration:
      //     BoxDecoration(border: Border.all(width: 1.0, color: Colors.blue)),
      child: Row(
        children: <Widget>[
          Container(
            width: 150.0,
            padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
            // decoration: BoxDecoration(
            //     border: Border.all(width: 1.0, color: Colors.grey[300])),
            child: Text(infoKey + ':',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500)),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            // decoration: BoxDecoration(
            //     border: Border.all(width: 1.0, color: Colors.grey[300])),
            child: Text(
                isNewPhone
                    ? _addValue01
                    : infoValue != null
                        ? infoValue
                        : '无',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600])),
          )),
          if (infoValue.contains('**'))
            InkWell(
              child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 50, 0),
                  child: Icon(Icons.create, color: Colors.blue)),
              onTap: () {
                _updateName(context);
              },
            ),
          if (!infoValue.contains('**'))
            InkWell(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 50, 0),
                  child: Icon(Icons.phone, color: Colors.green),
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
                                  style: TextStyle(color: Colors.blue[200])),
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                            ),
                            FlatButton(
                              child: Text("确定"),
                              onPressed: () async {
                                // launch("https://www.baidu.com");
                                String url = 'tel:' + infoValue;
                                //  'tel:13429824009';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                                Navigator.of(context).pop(true);
                              },
                            )
                          ],
                        );
                      });
                })

          // InkWell(
          //     child: Container(
          //       margin: EdgeInsets.fromLTRB(0, 0, 50, 0),
          //       child: Icon(Icons.phone, color: Colors.green),
          //     ),
          //     onTap: () {
          //       showDialog(
          //           barrierDismissible: true,
          //           context: context,
          //           builder: (context) {
          //             return AlertDialog(
          //               title: Text("提示"),
          //               content: Text("请确认是否要拨打电话"),
          //               actions: <Widget>[
          //                 FlatButton(
          //                   child: Text("取消",
          //                       style: TextStyle(color: Colors.blue[200])),
          //                   onPressed: () {
          //                     Navigator.of(context).pop(false);
          //                   },
          //                 ),
          //                 FlatButton(
          //                   child: Text("确定"),
          //                   onPressed: () async {
          //                     // launch("https://www.baidu.com");
          //                     String url = 'tel:' + infoValue;
          //                     //  'tel:13429824009';
          //                     if (await canLaunch(url)) {
          //                       await launch(url);
          //                     } else {
          //                       throw 'Could not launch $url';
          //                     }
          //                     Navigator.of(context).pop(true);
          //                   },
          //                 )
          //               ],
          //             );
          //           });
          //     }),
        ],
      ),
    );
  }

  _updateName(context) {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("客户信息"),
            content: StatefulBuilder(builder: (context, StateSetter setState) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _dialogContant("电话:", "修改电话"),
                  ],
                ),
              );
            }),
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
                  if (_addValue01 != "" && _addValue01.length == 11) {
                    Navigator.of(context).pop(true);
                    BotToast.showText(text: '电话号码修改成功');
                  } else {
                    BotToast.showText(text: '请输入正确电话号码');
                    Navigator.of(context).pop(false);
                  }
                },
              ),
            ],
          );
        }).then(
      (value) {
        if (value != null) {
          if (value) {
            setState(() {
              isNewPhone = true;
            });
            BlocProvider.of<CoustomerBloc>(context)
              ..add(CoustomerEvent.updateCustomerPhone(
                  widget.listData['id'], _addValue01));
          }
        }
      },
    );
  }

  _dialogContant(String key, String name) {
    return Container(
        height: 50,
        child: Row(
          children: <Widget>[
            Container(
              child: Text(
                key,
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              width: 140,
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1.0, color: Color(0xffe5e5e5))),
              ),
              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: TextField(
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  textInputAction: TextInputAction.go,
                  decoration: InputDecoration(
                    hintText: name,
                    border: InputBorder.none,
                    isDense: true,
                    hintStyle: TextStyle(color: Colors.grey[400], fontSize: 15),
                  ),
                  controller: TextEditingController.fromValue(
                    TextEditingValue(
                      text: _addValue01 != "" ? _addValue01 : "",
                      // 保持光标在最后
                      selection: TextSelection.fromPosition(TextPosition(
                        affinity: TextAffinity.downstream,
                        offset: _addValue01.length,
                      )),
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      _addValue01 = val;
                    });
                  }),
            ),
          ],
        ));
  }

  _detailsFrom(String infoKey, String infoValue) {
    return Column(
      children: <Widget>[
        Container(
          // padding: EdgeInsets.only(bottom: 0),
          height: 30.0,
          // decoration:
          //     BoxDecoration(border: Border.all(width: 1.0, color: Colors.grey)),

          child: Row(
            children: <Widget>[
              Container(
                width: 150.0,
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                // decoration: BoxDecoration(
                //     border: Border.all(width: 1.0, color: Colors.grey[300])),
                child: Text(infoKey + ':',
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500)),
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                // decoration: BoxDecoration(
                //     border: Border.all(width: 1.0, color: Colors.grey[300])),
                child: Text(infoValue != null ? infoValue : '无',
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600])),
              ))
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.fromLTRB(30, 0, 40, 10),
          decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1.0, color: Colors.grey[400])),
          ),
        )
      ],
    );
  }

  _detailsComeFrom(String infoKey, String infoValue) {
    return Column(
      children: <Widget>[
        Container(
          // padding: EdgeInsets.only(bottom: 0),
          height: 30.0,
          // decoration:
          //     BoxDecoration(border: Border.all(width: 1.0, color: Colors.grey)),
          child: Row(
            children: <Widget>[
              Container(
                width: 150.0,
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                // decoration: BoxDecoration(
                //     border: Border.all(width: 1.0, color: Colors.grey[300])),
                child: Text(infoKey + ':',
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500)),
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                // decoration: BoxDecoration(
                //     border: Border.all(width: 1.0, color: Colors.grey[300])),
                child: Text(
                    // infoValue != null ? infoValue : '无',
                    _customerFrom(infoValue),
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600])),
              ))
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.fromLTRB(30, 0, 40, 10),
          decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1.0, color: Colors.grey[400])),
          ),
        )
      ],
    );
  }

  String _customerFrom(String infoValue) {
    String name = '';
    if (infoValue == '0') {
      name = '推荐获取';
    } else if (infoValue == '1') {
      name = '分享获取';
    } else if (infoValue == '2') {
      name = '经理分配';
    } else {
      name = '无';
    }
    return name;
  }

  _detailsLevels(String infoKey, String infoValue) {
    return Container(
      height: 30.0,
      // decoration:
      //     BoxDecoration(border: Border.all(width: 1.0, color: Colors.blue)),
      child: Row(
        children: <Widget>[
          Container(
            width: 150.0,
            padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
            // decoration: BoxDecoration(
            //     border: Border.all(width: 1.0, color: Colors.grey[300])),
            child: Text(infoKey + ':',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500)),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            // decoration: BoxDecoration(
            //     border: Border.all(width: 1.0, color: Colors.grey[300])),
            child: Text(
                infoValue != null
                    ? infoValue != ''
                        ? infoValue
                        : '暂无意向'
                    : '暂无意向',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600])),
          ))
        ],
      ),
    );
  }

  _detailsPhone(String infoKey, String infoValue) {
    return Container(
      height: 30.0,
      // decoration:
      //     BoxDecoration(border: Border.all(width: 1.0, color: Colors.blue)),
      child: Row(
        children: <Widget>[
          Container(
            width: 150.0,
            padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
            // decoration: BoxDecoration(
            //     border: Border.all(width: 1.0, color: Colors.grey[300])),
            child: Text(infoKey + ':',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500)),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            // decoration: BoxDecoration(
            //     border: Border.all(width: 1.0, color: Colors.grey[300])),
            child: Text(infoValue != null ? infoValue : '无',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600])),
          )),
          InkWell(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 50, 0),
                child: Icon(Icons.phone, color: Colors.green),
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
                                style: TextStyle(color: Colors.blue[200])),
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                          ),
                          FlatButton(
                            child: Text("确定"),
                            onPressed: () async {
                              if (infoValue != null) {
                                // launch("https://www.baidu.com");
                                String url = 'tel:' + infoValue;
                                //  'tel:13429824009';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              } else {
                                BotToast.showText(text: '暂无数据');
                              }
                              Navigator.of(context).pop(true);
                            },
                          )
                        ],
                      );
                    });
              }),
        ],
      ),
    );
  }

  _detailsOther(String infoKey, String infoValue, List list, context) {
    return Container(
      height: 70.0,
      // decoration:
      //     BoxDecoration(border: Border.all(width: 1.0, color: Colors.blue)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 150.0,
            padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
            // decoration: BoxDecoration(
            //     border: Border.all(width: 1.0, color: Colors.grey[300])),
            child: Text(infoKey + ':',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500)),
          ),
          if (list.length > 0)
            Expanded(
                child: Container(
              // decoration: BoxDecoration(color: Colors.yellow),
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              // decoration: BoxDecoration(
              //     border: Border.all(width: 1.0, color: Colors.grey[300])),
              child: list[0]['processDefinitionKey'] != 'acquisition'
                  ? Text(
                      infoValue != null
                          ? infoValue != ""
                              ? infoValue
                              : "无"
                          : '无',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600]))
                  : _textfildRemarks(infoValue, context),
            ))
        ],
      ),
    );
  }

  _textfildRemarks(String infoValue, context) {
    return Container(
      // width: 200,
      margin: EdgeInsets.fromLTRB(0, 0, 40, 0),
      decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(width: 1.0, color: Color(0xffe5e5e5))),
      ),
      child: TextField(
          textInputAction: TextInputAction.go,
          decoration: InputDecoration(
            // hintText: '修改备注',
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.pink)),
            isDense: true,
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
          ),
          maxLines: 4,
          textAlign: TextAlign.start,
          controller: TextEditingController.fromValue(
            TextEditingValue(
              text: _textFeid != ""
                  ? _textFeid
                  : infoValue != null
                      ? infoValue
                      : "",
              // 保持光标在最后
              selection: TextSelection.fromPosition(TextPosition(
                affinity: TextAffinity.downstream,
                offset: _textFeid != ""
                    ? _textFeid.length
                    : infoValue != null
                        ? infoValue.length
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
                    BlocProvider.of<CoustomerBloc>(context)
                      ..add(CoustomerEvent.updateRemarks(
                          widget.listData['id'], _textFeid));
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
