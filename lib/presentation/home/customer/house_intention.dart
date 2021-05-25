import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/presentation/bean/house_intention_bean.dart';
import 'package:flutter_ui/presentation/home/customer/bottom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/coustomer/coustomer_bloc.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';

class HouseIntention extends StatefulWidget {
  final Map<String, dynamic> listData;

  const HouseIntention({Key key, this.listData}) : super(key: key);
  @override
  _HouseIntentionState createState() => _HouseIntentionState();
}

class _HouseIntentionState extends State<HouseIntention> {
  List<HouseIntentionBean> _listBean = [];
  String _addValue01 = "";
  String _addValue02 = "";
  String _addValue03 = "";
  String _addValue04 = "";
  // bool _isTrue = true;

  @override
  void initState() {
    // _listBean.add(HouseIntentionBean(
    //     name: "卓尔生活城", place: "城西", state: "期房", intention: "A"));
    // _listBean.add(HouseIntentionBean(
    //     name: "学府春天", place: "城南", state: "现房", intention: "B"));
    // _listBean.add(HouseIntentionBean(
    //     name: "壹号院子", place: "城东", state: "二手房", intention: "C"));
    BlocProvider.of<CoustomerBloc>(context)
      ..add(CoustomerEvent.buyinghouse(widget.listData));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoustomerBloc, CoustomerState>(
      builder: (context, state) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                // _addIntention(),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 0),
                    scrollDirection: Axis.vertical,
                    reverse: false,
                    primary: true,
                    shrinkWrap: true,
                    itemCount: state.buyingList.length,
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
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
                                  margin: EdgeInsets.fromLTRB(8, 10, 10, 7),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        getName(state.buyingList[i],
                                                state.affList, "projectName") +
                                            " ",
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      // Icon(
                                      //   Icons.navigate_next,
                                      //   color: Colors.blue[300],
                                      // ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(left: 10.0),
                                      child: Text('楼盘地段'),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 40.0),
                                      child: Text('跟办置业'),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 40.0),
                                      child: Text('流程'),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 7),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(left: 20.0),
                                      child: Text(
                                          getName(state.buyingList[i],
                                              state.affList, "region"),
                                          style: TextStyle(
                                              color: Colors.grey[700])),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 0.0),
                                      child: Text(
                                        (state.buyingList[i].containsKey(
                                                    "brokerName") &&
                                                state.buyingList[i]
                                                        ["brokerName"] !=
                                                    null)
                                            ? state.buyingList[i]["brokerName"]
                                            : "无",
                                        style:
                                            TextStyle(color: Colors.grey[700]),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 10.0),
                                      child: Text(
                                        state.buyingList[i]["currentHandler"] +
                                            " ",
                                        // headerText(),
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 15),
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
                        ExtendedNavigator.of(context).push(
                            Routes.processHousePage,
                            arguments: ProcessHousePageArguments(
                                listData: widget.listData));
                      },
                      // onLongPress: () {
                      //   showDialog(
                      //       barrierDismissible: true,
                      //       context: context,
                      //       builder: (context) {
                      //         return AlertDialog(
                      //           title: Text("提示"),
                      //           content: Text("删除不可恢复，确定要删除吗？"),
                      //           actions: <Widget>[
                      //             FlatButton(
                      //               child: Text("确定"),
                      //               onPressed: () {
                      //                 setState(() {
                      //                   _listBean.remove(_listBean[i]);
                      //                 });
                      //                 Navigator.of(context).pop(true);
                      //               },
                      //             )
                      //           ],
                      //         );
                      //       });
                      // },
                    ),
                  ),
                ),
                // BottomButton()
              ],
            ));
        ;
      },
    );
  }

  String getName(item, list, inputname) {
    String name = "";
    for (var i = 0; i < list.length; i++) {
      if (list[i]["id"] == item["affiliationId"]) {
        name = list[i][inputname];
      }
    }

    return name;
  }

  _addIntention() {
    return InkWell(
      child: Icon(Icons.add, color: Colors.grey, size: 30),
      onTap: () {
        print("123");
        // showDialog(
        //     barrierDismissible: true,
        //     context: context,
        //     builder: (context) {
        //       return AlertDialog(
        //         title: Text("添加购房意向"),
        //         content: SingleChildScrollView(
        //           child: Column(
        //             children: <Widget>[
        //               _dialogContant("楼盘名称", "请输入名称"),
        //               _dialogContant("楼盘地段", "请输入地段"),
        //               _dialogContant("楼盘状态", "请输入状态"),
        //               _dialogContant("意向级别", "请输入意向"),
        //               // _isTrue
        //               //     ? Text("")
        //               //     : Icon(Icons.error, color: Colors.red),
        //               // _isTrue ? Text("") : Text("数据不全！"),
        //             ],
        //           ),
        //         ),
        //         actions: <Widget>[
        //           FlatButton(
        //             child:
        //                 Text("取消", style: TextStyle(color: Colors.blue[200])),
        //             onPressed: () {
        //               Navigator.of(context).pop(false);
        //             },
        //           ),
        //           Tooltip(
        //               message: '提示：无法操作',
        //               child: FlatButton(
        //                 child: Text("确定"),
        //                 onPressed: () {
        //                   if (_addValue01 != "" &&
        //                       _addValue02 != "" &&
        //                       _addValue03 != "" &&
        //                       _addValue04 != "") {
        //                     setState(() {
        //                       _listBean.add(HouseIntentionBean(
        //                           name: _addValue01,
        //                           place: _addValue02,
        //                           state: _addValue03,
        //                           intention: _addValue04));
        //                     });
        //                     Navigator.of(context).pop(true);
        //                   } else {
        //                     BotToast.showAttachedWidget(
        //                         attachedBuilder: (_) => Center(
        //                                 child: Card(
        //                               child: Container(
        //                                   width: 150,
        //                                   height: 80,
        //                                   // padding:
        //                                   //     const EdgeInsets.all(8.0),
        //                                   child: Column(
        //                                     mainAxisAlignment:
        //                                         MainAxisAlignment.spaceEvenly,
        //                                     children: <Widget>[
        //                                       Icon(
        //                                         Icons.error,
        //                                         color: Colors.redAccent,
        //                                       ),
        //                                       Text(
        //                                         "数据不全,请重新提交！",
        //                                         style: TextStyle(
        //                                             color: Colors.redAccent),
        //                                       )
        //                                     ],
        //                                   )),
        //                             )),
        //                         duration: Duration(seconds: 2),
        //                         target: Offset(520, 520));
        //                     print("object");
        //                   }
        //                 },
        //               )),
        //         ],
        //       );
        //     });
      },
    );
  }

  _dialogContant(String key, String name) {
    return Row(
      children: <Widget>[
        Container(
          child: Text(
            key,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          width: 150,
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 1.0, color: Color(0xffe5e5e5))),
          ),
          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: TextField(
              maxLines: 5,
              minLines: 1,
              textInputAction: TextInputAction.go,
              decoration: InputDecoration(
                hintText: name,
                border: InputBorder.none,
                isDense: true,
                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
              ),
              onChanged: (val) {
                if (key == "楼盘名称") {
                  _addValue01 = val;
                } else if (key == "楼盘地段") {
                  _addValue02 = val;
                } else if (key == "楼盘状态") {
                  _addValue03 = val;
                } else if (key == "意向级别") {
                  _addValue04 = val;
                }
              }),
        ),
      ],
    );
  }
}
