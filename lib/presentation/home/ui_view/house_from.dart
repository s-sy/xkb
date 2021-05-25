// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_ui/application/house/house_control_bloc/house_control_bloc.dart';
// import 'package:bot_toast/bot_toast.dart';

// class FromdataView extends StatefulWidget {
//   @override
//   _FromdataViewState createState() => _FromdataViewState();
// }

// class _FromdataViewState extends State<FromdataView> {
//   String name = "";
//   String phone = "";
//   // 0：待售；1：认购 2：签约 3：销控 4: 管理销控
//   List lis = [];
//   List list = [];
//   List lists = [];
//   List listss = [];
//   List listsss = [];
//   List listReleaseControl = [];
//   int groupValue = 10;
//   void updateGroupValue(int v) {
//     setState(() {
//       groupValue = v;
//     });
//     BlocProvider.of<HouseControlBloc>(context)
//       ..add(HouseControlEvent.getgroupValue(v));
//   }

//   Widget listitem(context, value) {
//     // var deviceSize = MediaQuery.of(context).size;
//     print(value['type']);
//     return Container(
//       margin: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
//       child: groupValue == value['type']
//           ? RaisedButton(
//               color: Colors.blue,
//               onPressed: () {
//                 print('切换${value}');
//                 updateGroupValue(value['type']);
//               },
//               child: Text(
//                 value['title'],
//                 style: TextStyle(color: Colors.white),
//               ),
//             )
//           : OutlineButton(
//               onPressed: () {
//                 print('切换${value}');
//                 updateGroupValue(value['type']);
//               },
//               child: Text(value['title']),
//             ),
//     );
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     lis = [
//       {"title": "待售", "type": 0},
//       {"title": "认购", "type": 1},
//       {"title": "签约", "type": 2},
//       {"title": "销控", "type": 3},
//       {"title": "管理销控", "type": 4}
//     ];
//     list = [
//       // {"title": "待售", "type": 0},
//       // {"title": "认购", "type": 1},
//       // {"title": "签约", "type": 2},
//       // {"title": "销控", "type": 3},
//       {"title": "管理销控", "type": 4}
//     ];
//     lists = [
//       // {"title": "待售", "type": 0},
//       {"title": "认购", "type": 1},
//       {"title": "签约", "type": 2},
//       {"title": "销控", "type": 3},
//       // {"title": "管理销控", "type": 4}
//     ];
//     listss = [
//       // {"title": "待售", "type": 0},

//       {"title": "签约", "type": 2},
//       {"title": "销控", "type": 3},
//       // {"title": "管理销控", "type": 4}
//     ];
//     listsss = [
//       // {"title": "待售", "type": 0},
//       {"title": "认购", "type": 1},
//       {"title": "签约", "type": 2},
//       {"title": "销控", "type": 3},
//       {"title": "管理销控", "type": 4}
//     ];
//     listReleaseControl = [
//       {"title": "解控", "type": 5},
//     ];
//     groupValue = 10;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HouseControlBloc, HouseControlState>(
//         builder: (context, state) {
//       return Container(
//         child: Column(
//           children: [
//             if (state.itemHouse['state'] == '0' &&
//                 state.userInfo["userRole"] == 'salesman')
//               Row(
//                 children: [
//                   Container(
//                     margin: EdgeInsets.only(left: 20.0, top: 20),
//                     child: Text(
//                       "购房人",
//                       style: TextStyle(
//                           fontSize: 18.0, fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                 ],
//               ),
//             if (state.itemHouse['state'] == '0' &&
//                 state.userInfo["userRole"] == 'salesman')
//               Container(
//                 margin: EdgeInsets.only(left: 20, right: 40, top: 10),
//                 child: TextField(
//                   decoration: InputDecoration(
//                       labelText: '姓名',
//                       border: OutlineInputBorder(),
//                       isDense: true,
//                       labelStyle: TextStyle(
//                         color: Colors.blue,
//                         fontSize: 12,
//                       )),
//                   onChanged: (value) {
//                     BlocProvider.of<HouseControlBloc>(context)
//                       ..add(HouseControlEvent.saveName(value));
//                   },
//                 ),
//               ),
//             if (state.itemHouse['state'] == '0' &&
//                 state.userInfo["userRole"] == 'salesman')
//               Container(
//                 margin:
//                     EdgeInsets.only(left: 20, right: 40, top: 10, bottom: 0),
//                 child: TextField(
//                   decoration: InputDecoration(
//                       labelText: '电话',
//                       border: OutlineInputBorder(),
//                       isDense: true,
//                       labelStyle: TextStyle(
//                         color: Colors.blue,
//                         fontSize: 12,
//                       )),
//                   onChanged: (value) {
//                     BlocProvider.of<HouseControlBloc>(context)
//                       ..add(HouseControlEvent.savePhone(value));
//                   },
//                 ),
//               ),
//             if (state.itemHouse['state'] == '0' &&
//                 state.userInfo["userRole"] == 'salesman')
//               Container(
//                 margin:
//                     EdgeInsets.only(left: 20, right: 40, top: 10, bottom: 10),
//                 child: TextField(
//                   decoration: InputDecoration(
//                       labelText: '签约总价',
//                       border: OutlineInputBorder(),
//                       isDense: true,
//                       labelStyle: TextStyle(
//                         color: Colors.blue,
//                         fontSize: 12,
//                       )),
//                   onChanged: (value) {
//                     BlocProvider.of<HouseControlBloc>(context)
//                       ..add(HouseControlEvent.savePrice(value));
//                   },
//                 ),
//               ),
//             if ((state.userInfo["userRole"] == 'salesman' &&
//                     (state.itemHouse['state'] == '0' ||
//                         state.itemHouse['state'] == '1')) ||
//                 (state.userInfo["userRole"] == 'manager' &&
//                     (state.itemHouse['state'] == '0' ||
//                         state.itemHouse['state'] == '3' ||
//                         state.itemHouse['state'] == '4')) ||
//                 (state.userInfo["userRole"] == 'director' &&
//                     (state.itemHouse['state'] == '2' ||
//                         state.itemHouse['state'] == '3' ||
//                         state.itemHouse['state'] == '4')))
//               Row(
//                 children: [
//                   Container(
//                     margin: EdgeInsets.only(left: 20.0, top: 20),
//                     child: Text(
//                       "销控状态",
//                       style: TextStyle(
//                           fontSize: 18.0, fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                 ],
//               ),
//             if (state.userInfo["userRole"] == 'salesman' &&
//                 state.itemHouse['state'] == '0')
//               Container(
//                   margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
//                   child: SingleChildScrollView(
//                     physics: BouncingScrollPhysics(),
//                     scrollDirection: Axis.horizontal,
//                     // controller: ScrollController(),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         new Wrap(
//                           direction: Axis.horizontal,
//                           children: lists.map((value) {
//                             return listitem(context, value);
//                           }).toList(),
//                         )
//                       ],
//                     ),
//                   )),
//             if (state.userInfo["userRole"] == 'salesman' &&
//                 state.itemHouse['state'] == '1')
//               Container(
//                   margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
//                   child: SingleChildScrollView(
//                     physics: BouncingScrollPhysics(),
//                     scrollDirection: Axis.horizontal,
//                     // controller: ScrollController(),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         new Wrap(
//                           direction: Axis.horizontal,
//                           children: listss.map((value) {
//                             return listitem(context, value);
//                           }).toList(),
//                         )
//                       ],
//                     ),
//                   )),

//             if (state.userInfo["userRole"] == 'director' &&
//                 state.itemHouse['state'] == '1')
//               Container(
//                   margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
//                   child: SingleChildScrollView(
//                     physics: BouncingScrollPhysics(),
//                     scrollDirection: Axis.horizontal,
//                     // controller: ScrollController(),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         new Wrap(
//                           direction: Axis.horizontal,
//                           children: listss.map((value) {
//                             return listitem(context, value);
//                           }).toList(),
//                         )
//                       ],
//                     ),
//                   )),

//             if (state.userInfo["userRole"] == 'director' &&
//                 (state.itemHouse['state'] == '1' ||
//                     state.itemHouse['state'] == '2' ||
//                     state.itemHouse['state'] == '3' ||
//                     state.itemHouse['state'] == '4'))
//               Container(
//                 child: Text("总监换房"),
//               ),

//             if (state.userInfo["userRole"] == 'salesman' &&
//                 (state.itemHouse['state'] == '1' ||
//                     state.itemHouse['state'] == '0'))
//               Container(
//                 //  padding: EdgeInsets.only(left: 20, right: 20),
//                 width: 500,
//                 margin:
//                     EdgeInsets.only(top: 30, right: 20, bottom: 20, left: 20),
//                 child: OutlineButton(
//                   padding: EdgeInsets.only(top: 10, bottom: 10),
//                   child: Text("申请销控"),
//                   textColor: Colors.blue,
//                   highlightedBorderColor: Colors.deepOrange,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20.0)),
//                   borderSide: new BorderSide(color: Colors.blueAccent),
//                   onPressed: () async {
//                     if (state.state == '10') {
//                       BotToast.showText(text: '请选择销控状态');
//                       return;
//                     }
//                     await showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return new AlertDialog(
//                             title: Center(child: Text("温馨提示")),
//                             content: new SingleChildScrollView(
//                               child: new ListBody(
//                                 children: <Widget>[
//                                   Column(
//                                     children: [
//                                       new Text("正在销控该房源，请填写完整后确定"),
//                                     ],
//                                   )
//                                   // Row(children: [
//                                   //   TextField(),
//                                   // ]),
//                                 ],
//                               ),
//                             ),
//                             actions: <Widget>[
//                               FlatButton(
//                                 child: new Text("取消"),
//                                 onPressed: () {
//                                   Navigator.of(context).pop(false);
//                                 },
//                               ),
//                               FlatButton(
//                                 child: new Text("确定"),
//                                 onPressed: () {
//                                   // BlocProvider.of<ProcessedBloc>(context)
//                                   //     .add(ProcessedEvent.pushProcessed());

//                                   Navigator.of(context).pop(true);
//                                   // _editParentText();
//                                 },
//                               ),
//                             ],
//                           );
//                         }).then((value) {
//                       if (value) {
//                         BlocProvider.of<HouseControlBloc>(context)
//                           ..add(HouseControlEvent.controlPrecess());
//                       }
//                     });
//                     Navigator.pop(context);
//                   },
//                 ),
//               ),

//             if (state.userInfo["userRole"] == 'director' &&
//                 (state.itemHouse['state'] == '3' ||
//                     state.itemHouse['state'] == '4'))
//               Container(
//                 width: 500,
//                 margin:
//                     EdgeInsets.only(top: 30, right: 20, bottom: 20, left: 20),
//                 child: OutlineButton(
//                   padding: EdgeInsets.only(top: 10, bottom: 10),
//                   child: Text("申请解控"),
//                   textColor: Colors.blue,
//                   highlightedBorderColor: Colors.deepOrange,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20.0)),
//                   borderSide: new BorderSide(color: Colors.blueAccent),
//                   onPressed: () async {
//                     await showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return new AlertDialog(
//                             title: Center(child: Text("温馨提示")),
//                             content: new SingleChildScrollView(
//                               child: new ListBody(
//                                 children: <Widget>[
//                                   Column(
//                                     children: [
//                                       new Text("正在解除控制该房源，请核对后确定"),
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                             actions: <Widget>[
//                               FlatButton(
//                                 child: new Text("取消"),
//                                 onPressed: () {
//                                   Navigator.of(context).pop(false);
//                                 },
//                               ),
//                               FlatButton(
//                                 child: new Text("确定"),
//                                 onPressed: () {
//                                   Navigator.of(context).pop(true);
//                                 },
//                               ),
//                             ],
//                           );
//                         }).then((value) {
//                       if (value) {
//                         BlocProvider.of<HouseControlBloc>(context)
//                           ..add(HouseControlEvent.releaseControlPrecess());
//                       }
//                     });
//                     Navigator.pop(context);
//                   },
//                 ),
//               ),

//             // if (state.userInfo["userRole"] == 'director' &&
//             //     (state.itemHouse['state'] == '2' ||
//             //         state.itemHouse['state'] == '3' ||
//             //         state.itemHouse['state'] == '4'))
//             //   Container(
//             //     //  padding: EdgeInsets.only(left: 20, right: 20),
//             //     width: 500,
//             //     margin:
//             //         EdgeInsets.only(top: 30, right: 20, bottom: 20, left: 20),
//             //     child: OutlineButton(
//             //       padding: EdgeInsets.only(top: 10, bottom: 10),
//             //       child: Text("销控"),
//             //       textColor: Colors.blue,
//             //       highlightedBorderColor: Colors.deepOrange,
//             //       shape: RoundedRectangleBorder(
//             //           borderRadius: BorderRadius.circular(20.0)),
//             //       borderSide: new BorderSide(color: Colors.blueAccent),
//             //       onPressed: () async {
//             //         if (state.state == '10') {
//             //           BotToast.showText(text: '请选择销控状态');
//             //           return;
//             //         }
//             //         await showDialog(
//             //             context: context,
//             //             builder: (BuildContext context) {
//             //               return new AlertDialog(
//             //                 title: Center(child: Text("温馨提示")),
//             //                 content: new SingleChildScrollView(
//             //                   child: new ListBody(
//             //                     children: <Widget>[
//             //                       Column(
//             //                         children: [
//             //                           new Text("正在修改该房源状态，请查看清楚后确定"),
//             //                         ],
//             //                       )
//             //                       // Row(children: [
//             //                       //   TextField(),
//             //                       // ]),
//             //                     ],
//             //                   ),
//             //                 ),
//             //                 actions: <Widget>[
//             //                   FlatButton(
//             //                     child: new Text("取消"),
//             //                     onPressed: () {
//             //                       Navigator.of(context).pop(false);
//             //                     },
//             //                   ),
//             //                   FlatButton(
//             //                     child: new Text("确定"),
//             //                     onPressed: () {
//             //                       // BlocProvider.of<ProcessedBloc>(context)
//             //                       //     .add(ProcessedEvent.pushProcessed());
//             //                       Navigator.of(context).pop(true);
//             //                       // _editParentText();
//             //                     },
//             //                   ),
//             //                 ],
//             //               );
//             //             }).then((value) => {
//             //               if (value)
//             //                 {
//             //                   BlocProvider.of<HouseControlBloc>(context)
//             //                     ..add(HouseControlEvent.controlPrecess())
//             //                 }
//             //             });
//             //         Navigator.pop(context);
//             //       },
//             //     ),
//             //   )
//           ],
//         ),
//       );
//     });
//   }
// }

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/house/house_control_bloc/house_control_bloc.dart';

class FromdataView extends StatefulWidget {
  final List<dynamic> buildingList;
  final List<dynamic> housList;
  final List<dynamic> entranceList;
  final List<dynamic> buildEntranceList;
  final Map<String, dynamic> data;

  const FromdataView(
      {Key key,
      this.buildingList,
      this.housList,
      this.entranceList,
      this.buildEntranceList,
      this.data})
      : super(key: key);
  @override
  _FromdataViewState createState() => _FromdataViewState();
}

class _FromdataViewState extends State<FromdataView> {
  List statusList = [];
  String firstValue = '';
  bool isHouseState = false;
  bool isSelect01 = false;
  bool isSelect02 = false;
  bool isSelect03 = false;
  bool isSelect04 = false;
  String selectName01 = '';
  String selectName02 = '';
  String selectName03 = '';
  String selectName04 = '';
  bool isSalemanSelect = false;
  String salemanSelectName = '';
  String selectNameId04 = "";
  bool isSelect05 = false;
  String selectName05 = "";

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HouseControlBloc>(context)
      ..add(HouseControlEvent.getStateValues(widget.data));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HouseControlBloc, HouseControlState>(
        listener: (context, state) async {
      setState(() {
        statusList = state.stateValues;
      });
      if (state.isBottomSheet02) {
        _openModalBottomSheetText(state.housList, "02");
      }
      if (state.isBottomSheet03) {
        _openModalBottomSheetText(state.entranceList, "03");
      }
      if (state.isBottomSheet04) {
        _openModalBottomHouseId(state.houseUnitId);
      }
    }, builder: (BuildContext context, state) {
      // return BlocBuilder<HouseControlBloc, HouseControlState>(
      //     builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (state.itemHouse['state'] == '0' &&
              state.userInfo["userRole"] == 'salesman')
            _houseBuyerInfo(state),
          _controlStatus(state),
          isHouseState ? _changeHouseState(state) : SizedBox(),
          isSalemanSelect ? _stateIntroduce() : SizedBox(),
          isRemarks() ? remarks() : SizedBox(),
          // if(state.userInfo['id'] == state.itemHouse['createId']  && state.itemHouse['state'] != '0')
          if (state.userInfo["userRole"] == 'salesman' ||
              state.userInfo["userRole"] == 'director')
            _submitButton(state),
        ],
      );
    });
  }

  isRemarks() {
    bool isSelect = false;
    for (int i = 0; i < statusList.length; i++) {
      if (statusList[i]["title"] == "销控") {
        isSelect = statusList[i]["isSelect"];
      }
    }
    return isSelect;
  }

  _houseBuyerInfo(state) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20.0, top: 20),
            child: Text(
              "购房人",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
      Container(
        margin: EdgeInsets.only(left: 20, right: 40, top: 10),
        child: TextField(
          decoration: InputDecoration(
              labelText: '姓名',
              border: OutlineInputBorder(),
              isDense: true,
              labelStyle: TextStyle(
                color: Colors.blue,
                fontSize: 12,
              )),
          onChanged: (value) {
            BlocProvider.of<HouseControlBloc>(context)
              ..add(HouseControlEvent.saveName(value));
          },
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 20, right: 40, top: 10, bottom: 0),
        child: TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: '电话',
              border: OutlineInputBorder(),
              isDense: true,
              labelStyle: TextStyle(
                color: Colors.blue,
                fontSize: 12,
              )),
          onChanged: (value) {
            BlocProvider.of<HouseControlBloc>(context)
              ..add(HouseControlEvent.savePhone(value));
          },
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 20, right: 40, top: 10, bottom: 10),
        child: TextField(
          // inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: '签约总价',
              border: OutlineInputBorder(),
              isDense: true,
              labelStyle: TextStyle(
                color: Colors.blue,
                fontSize: 12,
              )),
          onChanged: (value) {
            // print(value);
            BlocProvider.of<HouseControlBloc>(context)
              ..add(HouseControlEvent.savePrice(value));
          },
        ),
      ),
      if (state.price != "")
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            "单价约为: " + getPrice(state.price).toString() + "/m²",
            style: TextStyle(
                color: Colors.red, fontSize: 14, fontWeight: FontWeight.w500),
          ),
        )
    ]);
  }

  getPrice(price) {
    int pic = double.parse(price).round();
    int ace = double.parse(widget.data["floorage"]).floor();
    int unitPic = pic ~/ ace;
    return unitPic;
  }

  remarks() {
    return Container(
      height: 100,
      margin: EdgeInsets.fromLTRB(20, 20, 30, 0),
      padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
      child: TextField(
          maxLines: 3,
          minLines: 1,
          textInputAction: TextInputAction.go,
          decoration: InputDecoration(
            hintText: "为锁定房源添加备注",
            border: InputBorder.none,
            isDense: true,
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 16),
          ),
          onChanged: (value) {
            BlocProvider.of<HouseControlBloc>(context)
              ..add(HouseControlEvent.saveRemark(value));
          }),
    );
  }

  _controlStatus(state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // if (state.userInfo["userRole"] != 'manager')
        if (statusList.length != 0)
          Container(
            margin: EdgeInsets.only(left: 20.0, top: 20),
            child: Text(
              "销控状态",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
          ),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          controller: ScrollController(),
          child: Row(
            children: statusList.map<Widget>((value) {
              return InkWell(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  margin: EdgeInsets.fromLTRB(20.0, 10.0, 5.0, 0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1.0,
                          color: value['isSelect']
                              ? Colors.blue
                              : (value['title'] == "改状态" &&
                                      isSelect05 &&
                                      value['isSelect'])
                                  ? Colors.blue
                                  : Colors.grey),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Text(
                    (value['title'] == "改状态" && isSelect05 && value['isSelect'])
                        ? selectName05
                        : value['title'],
                    style: TextStyle(
                      color: value['isSelect']
                          ? Colors.blue
                          : (value['title'] == "改状态" &&
                                  isSelect05 &&
                                  value['isSelect'])
                              ? Colors.blue
                              : Colors.grey,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                onTap: () {
                  print(value);
                  if (state.userInfo["userRole"] != 'director') {
                    List list = statusList;
                    bool isState = false;
                    for (int i = 0; i < list.length; i++) {
                      if (list[i]['isSelect']) {
                        isState = true;
                      }
                    }
                    for (int i = 0; i < list.length; i++) {
                      if (firstValue != value['title']) {
                        list[i]['isSelect'] = false;
                      }
                    }
                    for (int i = 0; i < list.length; i++) {
                      if (value['title'] == list[i]['title']) {
                        list[i]['isSelect'] = !list[i]['isSelect'];
                      }
                    }
                    setState(() {
                      statusList = list;
                      firstValue = value['title'];
                      if (isState) {
                        if (salemanSelectName == value['title']) {
                          isSalemanSelect = !isSalemanSelect;
                        } else {
                          salemanSelectName = value['title'];
                        }
                      } else {
                        isSalemanSelect = !isSalemanSelect;
                        salemanSelectName = value['title'];
                      }
                    });
                  }
                  if (state.userInfo["userRole"] == 'director' &&
                      value['title'] == '解控') {
                    List list = statusList;
                    for (int i = 0; i < list.length; i++) {
                      if (list[i]['title'] == "解控") {
                        list[i]['isSelect'] = !list[i]['isSelect'];
                      }
                    }
                    setState(() {
                      statusList = list;
                    });
                  }
                  if (state.userInfo["userRole"] == 'director' &&
                      value['title'] == '改状态') {
                    if (!value['isSelect']) {
                      _openModalBottomSheetText(stateList, "05");
                    }
                    setState(() {
                      value['isSelect'] = !value['isSelect'];
                    });
                  }
                  if (state.userInfo["userRole"] == 'director' &&
                      value['title'] == '换房') {
                    setState(() {
                      value['isSelect'] = !value['isSelect'];
                      isHouseState = !isHouseState;
                      if (value['isSelect']) {
                        isSelect01 = false;
                        isSelect02 = false;
                        isSelect03 = false;
                        isSelect04 = false;
                        selectName01 = '';
                        selectName02 = '';
                        selectName03 = '';
                        selectName04 = '';
                      }
                    });
                  }
                },
              );
            }).toList(),
          ),
        )
      ],
    );
  }

  _stateIntroduce() {
    String value = "";
    switch (salemanSelectName) {
      case '认购':
        value = "提示:客户下定金，锁定房源";
        break;
      case '签约':
        value = "提示:签订买卖合同";
        break;
      case '销控':
        value = "提示:临时锁定该房源";
        break;
    }
    return Container(
      width: 200,
      margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
      child: Text(
        value,
        style: TextStyle(color: Colors.red, fontSize: 16),
      ),
    );
  }

  _changeHouseState(state) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              InkWell(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  margin: EdgeInsets.fromLTRB(20.0, 10.0, 5.0, 0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1.0,
                          color: isSelect01 ? Colors.blue : Colors.grey),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Text(
                    selectName01 != '' ? selectName01 : '期数',
                    style: TextStyle(
                      color: isSelect01 ? Colors.blue : Colors.grey,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                onTap: () {
                  _openModalBottomSheetText(widget.buildingList, "01");
                },
              ),
              InkWell(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  margin: EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1.0,
                          color: isSelect02 ? Colors.blue : Colors.grey),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Text(
                    selectName02 != '' ? selectName02 : '栋数',
                    style: TextStyle(
                      color: isSelect02 ? Colors.blue : Colors.grey,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                onTap: () {
                  if (isSelect01) {
                    BlocProvider.of<HouseControlBloc>(context)
                      ..add(HouseControlEvent.getListData(
                          selectName01, selectName02, selectName03));
                    BlocProvider.of<HouseControlBloc>(context)
                      ..add(HouseControlEvent.isHouseUnit("02"));
                  } else {
                    BotToast.showText(text: '请先选择期数');
                  }
                },
              ),
              InkWell(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  margin: EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1.0,
                          color: isSelect03 ? Colors.blue : Colors.grey),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Text(
                    selectName03 != '' ? selectName03 : '单元',
                    style: TextStyle(
                      color: isSelect03 ? Colors.blue : Colors.grey,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                onTap: () {
                  if (isSelect02) {
                    BlocProvider.of<HouseControlBloc>(context)
                      ..add(HouseControlEvent.getListData(
                          selectName01, selectName02, selectName03));
                    BlocProvider.of<HouseControlBloc>(context)
                      ..add(HouseControlEvent.isHouseUnit("03"));
                  } else {
                    BotToast.showText(text: '请先选择栋数');
                  }
                },
              ),
              InkWell(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  margin: EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1.0,
                          color: isSelect04 ? Colors.blue : Colors.grey),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Text(
                    selectName04 != '' ? selectName04 : '楼号',
                    style: TextStyle(
                      color: isSelect04 ? Colors.blue : Colors.grey,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                onTap: () {
                  if (isSelect03) {
                    BlocProvider.of<HouseControlBloc>(context)
                      ..add(HouseControlEvent.getListData(
                          selectName01, selectName02, selectName03));
                    BlocProvider.of<HouseControlBloc>(context)
                      ..add(HouseControlEvent.isHouseUnit('04'));
                  } else {
                    BotToast.showText(text: '请先选择单元');
                  }
                },
              )
            ],
          ),
        ));
  }

  List stateList = ['待售', '认购', '签约', '销控'];

  Future _openModalBottomSheetText(List list, String key) async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                  height: 240.0,
                  child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, i) => InkWell(
                            child: Container(
                              height: 50,
                              child: Center(
                                child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    list[i],
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                if (key == "01") {
                                  selectName01 = list[i];
                                  isSelect01 = true;
                                  selectName02 = '';
                                  selectName03 = '';
                                  selectName04 = '';
                                  isSelect02 = false;
                                  isSelect03 = false;
                                  isSelect04 = false;
                                } else if (key == "02") {
                                  selectName02 = list[i];
                                  isSelect02 = true;
                                  selectName03 = '';
                                  selectName04 = '';
                                  isSelect03 = false;
                                  isSelect04 = false;
                                } else if (key == "03") {
                                  selectName03 = list[i];
                                  selectName04 = '';
                                  isSelect04 = false;
                                  isSelect03 = true;
                                } else if (key == "05") {
                                  setState(() {
                                    selectName05 = stateList[i];
                                    isSelect05 = true;
                                  });
                                }
                              });
                              Navigator.pop(context, true);
                            },
                          ))),
              ListTile(
                title: Text('取消',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue[200])),
                onTap: () {
                  Navigator.pop(context, false);
                },
              ),
              SizedBox(height: 40)
            ],
          );
        });
    if (key == "02") {
      BlocProvider.of<HouseControlBloc>(context)
        ..add(HouseControlEvent.offHouseState('02'));
    } else if (key == "03") {
      BlocProvider.of<HouseControlBloc>(context)
        ..add(HouseControlEvent.offHouseState('03'));
    }
    // else if (key == "05") {
    //   if (selectName05 == "") {
    //     setState(() {
    //       isSelect05 = false;
    //     });
    //   }
    // }
  }

  Future _openModalBottomHouseId(List list) async {
    List listFinal = [];
    for (int i = 0; i < list.length; i++) {
      if (list[i]['state'] == '0') {
        listFinal.add(list[i]);
      }
    }
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                  height: 240.0,
                  child: ListView.builder(
                      itemCount: listFinal.length,
                      itemBuilder: (context, i) => InkWell(
                            child: Container(
                              height: 50,
                              child: Center(
                                child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    listFinal[i]['serialNumber'],
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                selectName04 = listFinal[i]['serialNumber'];
                                isSelect04 = true;
                                selectNameId04 = listFinal[i]['id'];
                              });
                              Navigator.pop(context, true);
                            },
                          ))),
              ListTile(
                title: Text('取消',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue[200])),
                onTap: () {
                  Navigator.pop(context, false);
                },
              ),
              SizedBox(height: 40)
            ],
          );
        });
    BlocProvider.of<HouseControlBloc>(context)
      ..add(HouseControlEvent.offHouseState('04'));
  }

  _submitButton(state) {
    if (statusList.length != 0) {
      return Container(
        margin: EdgeInsets.fromLTRB(20, 50, 20, 10),
        width: 400,
        height: 50,
        child: RaisedButton(
          splashColor: Colors.lightBlueAccent,
          child:
              Text("提交", style: TextStyle(color: Colors.white, fontSize: 18)),
          onPressed: () {
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
                String stateName = "";
                int count = 0;
                for (int i = 0; i < statusList.length; i++) {
                  if (statusList[i]['isSelect']) {
                    stateName = statusList[i]['title'];
                    count = count + 1;
                  }
                }
                // print(count);
                // print(stateName);

                if (count == 0) {
                  BotToast.showText(text: "请先选择状态");
                } else if (state.phone == "" ||
                    state.name == "" ||
                    state.price == "") {
                  BotToast.showText(text: "数据不全，请先完善信息");
                } else if (count == 2) {
                  BotToast.showText(text: "状态太多，只能选择一个");
                } else if (count == 1) {
                  if (stateName == "换房") {
                    if (selectNameId04 == "") {
                      BotToast.showText(text: "房号数据不全，请重选后提交");
                    } else {
                      BlocProvider.of<HouseControlBloc>(context)
                        ..add(HouseControlEvent.changeHouse(
                            widget.data['id'], selectNameId04));
                      BotToast.showText(text: "已为改用户切换房源到" + selectName04);
                      setState(() {
                        if (statusList[0]['title'] == "换房") {
                          statusList[0]['isSelect'] = false;
                        }
                        isHouseState = false;
                        isSelect01 = false;
                        isSelect02 = false;
                        isSelect03 = false;
                        isSelect04 = false;
                        selectName01 = '';
                        selectName02 = '';
                        selectName03 = '';
                        selectName04 = '';
                      });
                    }
                  } else if (stateName == "改状态") {
                    String stateKey = "";
                    switch (selectName05) {
                      case '待售':
                        stateKey = '0';
                        break;
                      case '认购':
                        stateKey = '1';
                        break;
                      case '签约':
                        stateKey = '2';
                        break;
                      case '销控':
                        stateKey = '4';
                        break;
                    }
                    if (selectName05 == "") {
                      BotToast.showText(text: "请先选择状态");
                    } else {
                      BlocProvider.of<HouseControlBloc>(context)
                        ..add(HouseControlEvent.controlPrecess(stateKey));
                      BotToast.showText(text: "状态修改成功为" + selectName05);
                      Navigator.of(context).pop(true);
                    }
                  } else if (stateName == "解控") {
                    BlocProvider.of<HouseControlBloc>(context)
                      ..add(HouseControlEvent.controlPrecess('0'));
                    BotToast.showText(text: "已成功解控为待售");
                    Navigator.of(context).pop(true);
                  } else {
                    switch (stateName) {
                      case '认购':
                        stateName = '1';
                        break;
                      case '签约':
                        stateName = '2';
                        break;
                      case '销控':
                        stateName = '3';
                        break;
                    }
                    BlocProvider.of<HouseControlBloc>(context)
                      ..add(HouseControlEvent.controlPrecess(stateName));
                    BotToast.showText(text: "已发经理审核，请注意短信通知");
                    Navigator.of(context).pop(true);
                  }
                }

                // if (stateName != "") {
                //   if (stateName == "换房") {
                //     BlocProvider.of<HouseControlBloc>(context)
                //       ..add(HouseControlEvent.changeHouse(
                //           widget.data['id'], selectNameId04));
                //     BotToast.showText(text: "已为改用户切换房源到" + selectName04);
                //     setState(() {
                //       if (statusList[0]['title'] == "换房") {
                //         statusList[0]['isSelect'] = false;
                //       }
                //       isHouseState = false;
                //       isSelect01 = false;
                //       isSelect02 = false;
                //       isSelect03 = false;
                //       isSelect04 = false;
                //       selectName01 = '';
                //       selectName02 = '';
                //       selectName03 = '';
                //       selectName04 = '';
                //     });
                //   } else if (stateName == "改状态") {
                //   } else if (stateName == "解控") {
                //   } else {
                //     switch (stateName) {
                //       case '认购':
                //         stateName = '1';
                //         break;
                //       case '签约':
                //         stateName = '2';
                //         break;
                //       case '销控':
                //         stateName = '3';
                //         break;
                //     }
                //     BlocProvider.of<HouseControlBloc>(context)
                //       ..add(HouseControlEvent.controlPrecess(stateName));
                //     BotToast.showText(text: "已发经理审核，请注意短信通知");
                //   }
                // } else {
                //   BotToast.showText(text: "请先选择状态");
                // }
              }
            });
          },
          textColor: Colors.white,
          color: Colors.blue[500],
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
      );
    } else {
      return SizedBox();
    }
  }

  // _listFloor(List list) {
  //   return ListView.builder(
  //     padding: EdgeInsets.only(top: 0),
  //     scrollDirection: Axis.vertical,
  //     reverse: false,
  //     primary: true,
  //     shrinkWrap: true,
  //     itemCount: list.length,
  //     physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
  //     itemBuilder: (context, i) => InkWell(
  //       child: Container(
  //         padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
  //         margin: EdgeInsets.fromLTRB(20.0, 10.0, 5.0, 0),
  //         decoration: BoxDecoration(
  //             border: Border.all(width: 1.0, color: Colors.grey),
  //             borderRadius: BorderRadius.circular(5.0)),
  //         child: Text(
  //           statusList[i],
  //           style: TextStyle(
  //             color: Colors.grey,
  //             fontSize: 16.0,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
  // Future _openModalBottomSheetHouse(state) async {
  //   final option = await showModalBottomSheet(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return Stack(
  //           children: [
  //             Container(
  //               margin: EdgeInsets.fromLTRB(0, 100, 0, 200),
  //               width: 500,
  //               height: 40,
  //               decoration: BoxDecoration(color: Colors.grey[300]),
  //               child: Text(''),
  //             ),
  //             Column(
  //               mainAxisAlignment: MainAxisAlignment.end,
  //               children: <Widget>[
  //                 Container(
  //                     height: 220,
  //                     child: SingleChildScrollView(
  //                       physics: BouncingScrollPhysics(),
  //                       scrollDirection: Axis.horizontal,
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: <Widget>[
  //                           _changeHouse(widget.buildingList),
  //                           _changeHouse(widget.housList),
  //                           _changeHouse(widget.entranceList),
  //                           Container(
  //                               width: 120,
  //                               child: SingleChildScrollView(
  //                                   physics: BouncingScrollPhysics(),
  //                                   child: Column(
  //                                     children: <Widget>[
  //                                       SizedBox(height: 100),
  //                                       Column(
  //                                           children: widget.buildEntranceList
  //                                               .map<Widget>((vlaue) {
  //                                         return InkWell(
  //                                             child: Container(
  //                                                 width: 80,
  //                                                 height: 40,
  //                                                 child: Center(
  //                                                   child: Text(
  //                                                     vlaue['serialNumber'],
  //                                                     style: TextStyle(
  //                                                         fontSize: 17,
  //                                                         color:
  //                                                             Colors.grey[700]),
  //                                                   ),
  //                                                 )));
  //                                       }).toList()),
  //                                       SizedBox(height: 100),
  //                                     ],
  //                                   ))),
  //                         ],
  //                       ),
  //                     )),
  //                 SizedBox(height: 20),
  //                 ListTile(
  //                   title: Text('确定',
  //                       textAlign: TextAlign.center,
  //                       style: TextStyle(color: Colors.blue)),
  //                   onTap: () {
  //                     Navigator.pop(context, '确定');
  //                   },
  //                 ),
  //                 ListTile(
  //                   title: Text('取消',
  //                       textAlign: TextAlign.center,
  //                       style: TextStyle(color: Colors.blue[200])),
  //                   onTap: () {
  //                     Navigator.pop(context, '取消');
  //                   },
  //                 ),
  //                 SizedBox(height: 20)
  //               ],
  //             ),
  //           ],
  //         );
  //       });
  // }

  // _changeHouse(List list) {
  //   return Container(
  //       width: 80,
  //       child: SingleChildScrollView(
  //           physics: BouncingScrollPhysics(),
  //           child: Column(
  //             children: <Widget>[
  //               // if (list.length % 2 == 0) SizedBox(height: 40),
  //               SizedBox(height: 100),
  //               Column(
  //                   children: list.map<Widget>((vlaue) {
  //                 return InkWell(
  //                   child: Container(
  //                     width: 80,
  //                     height: 40,
  //                     // decoration: BoxDecoration(
  //                     //     color: _getCenterValue(list) == vlaue
  //                     //         ? Colors.grey[300]
  //                     //         : Colors.white10),
  //                     child: Center(
  //                       child: Text(
  //                         vlaue,
  //                         style:
  //                             TextStyle(fontSize: 17, color: Colors.grey[700]),
  //                       ),
  //                     ),
  //                   ),
  //                   onTap: () {},
  //                 );
  //               }).toList()),
  //               SizedBox(height: 100),
  //             ],
  //           )));
  // }

  // _getCenterValue(List list) {
  //   if (list.length == 0) {
  //     return "空的";
  //   } else if (list.length == 1) {
  //     return list[0];
  //   } else if (list.length % 2 != 0) {
  //     return list[list.length % 2 + 1];
  //   } else {
  //     // list.add(" ");
  //     return list[list.length % 2];
  //   }
  // }

  // Container(
  //   decoration: BoxDecoration(color: Colors.yellow[100]),
  //   width: 80,
  //   child: ListView.builder(
  //       itemCount: widget.buildingList.length,
  //       itemBuilder: (context, i) => Container(
  //             alignment: Alignment.center,
  //             child: Text(widget.buildingList[i]),
  //           )),
  // ),

  // _stateValues(state) {
  //   List list = [];
  //   if (state.userInfo["userRole"] == 'salesman') {
  //     if (state.itemHouse['state'] == '0') {
  //       list = [
  //         {'title': '认购', 'isSelect': false},
  //         {'title': '签约', 'isSelect': false},
  //         {'title': '销控', 'isSelect': false},
  //       ];
  //     } else if (state.itemHouse['state'] == '1') {
  //       list = [
  //         {'title': '签约', 'isSelect': false},
  //         {'title': '销控', 'isSelect': false},
  //       ];
  //     }
  //   }
  //   if (state.userInfo["userRole"] == 'director') {
  //     if (state.itemHouse['state'] == '1') {
  //       list = [
  //         {'title': '换房', 'isSelect': false}
  //       ];
  //     } else if (state.itemHouse['state'] == '2') {
  //       list = [
  //         {'title': '换房', 'isSelect': false}
  //       ];
  //     } else if (state.itemHouse['state'] == '3') {
  //       list = [
  //         {'title': '换房', 'isSelect': false},
  //         {'title': '解控', 'isSelect': false}
  //       ];
  //     } else if (state.itemHouse['state'] == '4') {
  //       list = [
  //         {'title': '换房', 'isSelect': false},
  //         {'title': '解控', 'isSelect': false}
  //       ];
  //     }
  //   }
  //   return list;
  // }
}
