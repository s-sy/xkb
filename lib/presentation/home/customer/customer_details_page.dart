import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/coustomer/coustomer_bloc.dart';
import 'package:flutter_ui/application/message/bloc/web_scoket_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/home/customer/data_information_page.dart';
import 'package:flutter_ui/presentation/home/customer/follow_up_record_page.dart';
import 'package:flutter_ui/presentation/home/customer/house_intention.dart';
import 'package:flutter_ui/presentation/home/customer/referral_way_page.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerDetails extends StatefulWidget {
  final Map<String, dynamic> listData;

  const CustomerDetails({Key key, this.listData}) : super(key: key);
  @override
  _CustomerDetailsState createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  String _addValue01 = "";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<CoustomerBloc>()
          ..add(CoustomerEvent.saveCustomerItem(widget.listData))
          ..add(CoustomerEvent.gethistorydata(widget.listData["instanceId"]))
          ..add(
              CoustomerEvent.getSalesmanLists(widget.listData["affiliationId"]))
          ..add(CoustomerEvent.gethistory(widget.listData["instanceId"]))
          ..add(CoustomerEvent.getContacts()),
        child: BlocConsumer<CoustomerBloc, CoustomerState>(
            listener: (context, state) {
          // print(state.history);
          // print(state.historyVariable);
          print(state.history);
          // _listData = state.coustomData;
        }, builder: (context, state) {
          return WillPopScope(
              onWillPop: () {
                Navigator.of(context).pop("refresh");
                return;
              },
              child: DefaultTabController(
                length: 3,
                child: Scaffold(
                  appBar: AppBar(
                    elevation: 0.1,
                    backgroundColor: Colors.blue[300],
                    title: Center(
                      child: Text('????????????'),
                    ),
                    actions: <Widget>[
                      new PopupMenuButton<String>(
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuItem<String>>[
                          if (widget.listData["workflowStatus"] == "2")
                            _selectView(Icons.lock_open, '????????????', 'A'),
                          if (widget.listData["workflowStatus"] == "3")
                            _selectView(Icons.alarm_on, '????????????', 'B'),
                        ],
                        onSelected: (String action) {
                          switch (action) {
                            case 'A':
                              BlocProvider.of<CoustomerBloc>(context)
                                ..add(CoustomerEvent.unFreezedCustomer(
                                    widget.listData["instanceId"]));
                              BotToast.showText(text: '???????????????');
                              break;
                            case 'B':
                              BlocProvider.of<CoustomerBloc>(context)
                                ..add(CoustomerEvent.executionWithoutdelay(
                                    widget.listData['instanceId']));
                              BotToast.showText(text: '???????????????');
                              break;
                          }
                        },
                      ),
                    ],
                    toolbarHeight: 180.0,
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(48),
                      child: Container(
                          height: 120,
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 80.0,
                                decoration: BoxDecoration(
                                  color: Colors.blue[300],
                                  // border: Border.all(width: 1.0)
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    customerImg(),
                                    Expanded(
                                        child: customerInfo(context, state)),
                                    // Expanded(child: Text("")),
                                    customerIcons(context, state),
                                  ],
                                ),
                              ),
                              Container(
                                height: 40.0,
                                decoration: BoxDecoration(color: Colors.white),
                                child: TabBar(
                                  unselectedLabelColor: Colors.black,
                                  indicatorColor: Colors.blue,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  labelColor: Colors.blue,
                                  indicatorWeight: 2.0,
                                  tabs: <Widget>[
                                    mainTabBar('????????????'),
                                    mainTabBar('????????????'),
                                    mainTabBar('????????????'),
                                    // main_tabBar('????????????'),
                                  ],
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                  body: TabBarView(
                    children: <Widget>[
                      state.history.length > 0
                          ? FollowUpRecord(listData: widget.listData)
                          : SizedBox(),
                      HouseIntention(listData: widget.listData),
                      state.history.length > 0
                          ? CustomerInformation(listData: widget.listData)
                          : SizedBox(),
                      // ReferralWay(listData: listData),
                    ],
                  ),
                ),
              ));
        }));
  }

  _selectView(IconData icon, String text, String id) {
    return PopupMenuItem<String>(
      value: id,
      // child: InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(icon, color: Colors.blue),
          Text(text),
        ],
      ),
      // onTap: () {
      //   if (id == 'A') {
      //     BotToast.showText(text: '???????????????');
      //   } else if (id == 'B') {
      //     BotToast.showText(text: '???????????????');
      //   }
      // },
      // )
    );
  }

  //??????????????????
  customerImg() {
    return Container(
      width: 60,
      height: 60,
      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        image: DecorationImage(
            image: NetworkImage('https://www.itying.com/images/flutter/7.png'),
            fit: BoxFit.cover),
      ),
    );
  }

  //??????????????????
  customerInfo(context, state) {
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: ScrollController(),
        child: Container(
          margin: EdgeInsets.fromLTRB(25, 0, 0, 0),
          // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          // decoration: BoxDecoration(border: Border.all(width: 1.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                        child: Text(
                      // '?????????',
                      _addValue01 != ""
                          ? _addValue01
                          : widget.listData['customerName'] + " ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500),
                    )),
                    if (state.history.length != 0 &&
                        state.history[0]['processDefinitionKey'] ==
                            'acquisition')
                      InkWell(
                        child: Icon(
                          Icons.create,
                          color: Colors.white,
                          size: 14,
                        ),
                        onTap: () {
                          _updateName(context);
                        },
                      ),
                    if (widget.listData["grade"] != null &&
                        widget.listData["grade"] != "")
                      Container(
                        margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
                        padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.0, color: Colors.white),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Text(
                          // '??????',
                          widget.listData['grade'],
                          style: TextStyle(color: Colors.white, fontSize: 10.0),
                        ),
                      ),
                    if (widget.listData["workflowStatus"] == "1")
                      Container(
                        margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
                        padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.0, color: Colors.white),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Text(
                          '?????????',
                          style: TextStyle(color: Colors.white, fontSize: 10.0),
                        ),
                      ),
                    if (widget.listData["workflowStatus"] == "2")
                      Container(
                        margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
                        padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.0, color: Colors.white),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Text(
                          '?????????',
                          style: TextStyle(color: Colors.white, fontSize: 10.0),
                        ),
                      ),
                    if (widget.listData["workflowStatus"] == "3")
                      Container(
                        margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
                        padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.0, color: Colors.white),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Text(
                          '?????????',
                          style: TextStyle(color: Colors.white, fontSize: 10.0),
                        ),
                      ),
                    if (widget.listData["workflowStatus"] == "4")
                      Container(
                        margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
                        padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.0, color: Colors.white),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Text(
                          '????????????',
                          style: TextStyle(color: Colors.white, fontSize: 10.0),
                        ),
                      )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 3, 0, 0),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        // '13425487110',
                        widget.listData["phone"],
                        style: TextStyle(color: Colors.white, fontSize: 13.0),
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Container(
                        child: InkWell(
                      child: Icon(
                        Icons.content_copy,
                        color: Colors.white,
                        size: 14,
                      ),
                      onTap: () async {
                        BotToast.showText(text: '??????????????? ');
                        Clipboard.setData(
                            ClipboardData(text: widget.listData["phone"]));
                        // var clipboardData =
                        //     await Clipboard.getData(Clipboard.kTextPlain);
                        // if (clipboardData != null) {
                        //   print(clipboardData.text);
                        // }
                      },
                    ))
                  ],
                ),
              ),
              Container(
                child: Text(
                  '??????????????????70%',
                  style: TextStyle(color: Colors.white, fontSize: 11.0),
                ),
              )
            ],
          ),
        ));
  }

  _updateName(context) {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("????????????"),
            content: StatefulBuilder(builder: (context, StateSetter setState) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _dialogContant("??????:", "??????????????????"),
                  ],
                ),
              );
            }),
            actions: <Widget>[
              FlatButton(
                child: Text("??????", style: TextStyle(color: Colors.blue[200])),
                onPressed: () {
                  Navigator.of(context).pop(false);
                  // setState(() {
                  //   _addValue01 = '';
                  // });
                },
              ),
              FlatButton(
                child: Text("??????"),
                onPressed: () {
                  if (_addValue01 != "") {
                    Navigator.of(context).pop(true);
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
                                        "?????????????????????",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  )),
                            )),
                        duration: Duration(seconds: 2),
                        target: Offset(520, 520));
                  } else {
                    BotToast.showText(text: '??????????????? ');
                    Navigator.of(context).pop(false);
                    // setState(() {
                    //   _addValue01 = '';
                    // });
                  }
                },
              ),
            ],
          );
        }).then(
      (value) {
        if (value != null) {
          if (value) {
            if (_addValue01 != '') {
              BlocProvider.of<CoustomerBloc>(context)
                ..add(CoustomerEvent.updateCustomerName(
                    widget.listData['id'], _addValue01));
            }
            // setState(() {
            //   _addValue01 = '';
            // });
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
                      text: _addValue01 != ""
                          ? _addValue01
                          : widget.listData['customerName'] + " ",
                      // ?????????????????????
                      selection: TextSelection.fromPosition(TextPosition(
                        affinity: TextAffinity.downstream,
                        offset: _addValue01 != ""
                            ? _addValue01.length
                            : widget.listData['customerName'].length,
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
  // TextField(
  //                 textInputAction: TextInputAction.go,
  //                 decoration: InputDecoration(
  //                   hintText: tipsName,
  //                   border: InputBorder.none,
  //                   isDense: true,
  //                   hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
  //                 ),
  //                 textAlign: TextAlign.start,
  //                 controller: TextEditingController.fromValue(
  //                   TextEditingValue(
  //                     text: _textFeid != ""
  //                         ? _textFeid
  //                         : jsonDecode(_cachedSignInUser)['nickName'],
  //                     // ?????????????????????
  //                     selection: TextSelection.fromPosition(TextPosition(
  //                       affinity: TextAffinity.downstream,
  //                       offset: _textFeid != ""
  //                           ? _textFeid.length
  //                           : jsonDecode(_cachedSignInUser)['nickName'].length,
  //                     )),
  //                   ),
  //                 ),
  //                 onChanged: (val) {
  //                   _textFeid = val;
  //                 }),

  //??????????????????
  customerIcons(context, state) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 15, 5, 0),
      width: 100,
      height: 60,
      // decoration: BoxDecoration(border: Border.all(width: 1.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          InkWell(
            child: Icon(Icons.message, color: Colors.white),
            onTap: () {
              showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("??????"),
                      content: Text("????????????????????????????????????"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("??????",
                              style: TextStyle(color: Colors.blue[200])),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                        FlatButton(
                          child: Text("??????"),
                          onPressed: () async {
                            List getContactsList = [];
                            if (state.getContactsList != null) {
                              getContactsList = state.getContactsList;
                            }
                            String contactId = '';
                            String contactAvatar = '';
                            String contactName = '';
                            for (int i = 0; i < getContactsList.length; i++) {
                              if (getContactsList[i]['phone'] ==
                                  widget.listData['brokerPhone']) {
                                contactId = getContactsList[i]['contactId'];
                                contactAvatar =
                                    getContactsList[i]['contactAvatar'];
                                contactName = getContactsList[i]['contactName'];
                              }
                            }
                            if (contactId != '' &&
                                contactAvatar != '' &&
                                contactName != '') {
                              ExtendedNavigator.of(context)
                                  .replace(Routes.messageChat,
                                      arguments: MessageChatArguments(
                                        contactId: contactId,
                                        headImg: contactAvatar,
                                        contactName: contactName,
                                      ));
                            } else {
                              BotToast.showText(text: '??????????????? ');
                              Navigator.of(context).pop(false);
                              // BotToast.showAttachedWidget(
                              //     attachedBuilder: (_) => Center(
                              //             child: Card(
                              //           child: Container(
                              //               width: 150,
                              //               height: 80,
                              //               child: Column(
                              //                 mainAxisAlignment:
                              //                     MainAxisAlignment.spaceEvenly,
                              //                 children: <Widget>[
                              //                   Icon(
                              //                     Icons.error,
                              //                     color: Colors.redAccent,
                              //                   ),
                              //                   Text(
                              //                     "??????????????????????????????????????????",
                              //                     style: TextStyle(
                              //                         color: Colors.redAccent),
                              //                   )
                              //                 ],
                              //               )),
                              //         )),
                              //     duration: Duration(seconds: 2),
                              //     target: Offset(520, 520));
                            }
                          },
                        )
                      ],
                    );
                  });
            },
          ),
        ],
      ),
    );
  }

  //tab?????????
  mainTabBar(String tab_name) {
    return Tab(
      child: Text(
        tab_name,
        style: TextStyle(fontSize: 14.0, color: Colors.black54),
      ),
    );
  }
}

// class CustomerDetails extends StatelessWidget {
//   final Map<String, dynamic> listData;

//   const CustomerDetails({Key key, this.listData}) : super(key: key);

//   SelectView(IconData icon, String text, String id) {
//     return PopupMenuItem<String>(
//         value: id,
//         child: InkWell(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Icon(icon, color: Colors.blue),
//               Text(text),
//             ],
//           ),
//           onTap: () {
//             if (id == 'A') {
//               BotToast.showText(text: '???????????????');
//             } else if (id == 'B') {
//               BotToast.showText(text: '???????????????');
//             }
//           },
//         ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     // return MultiBlocProvider(
//     //     providers: [
//     //       BlocProvider(
//     //         create: (context) => getIt<CoustomerBloc>()
//     //           ..add(CoustomerEvent.gethistorydata(listData["instanceId"]))
//     //           ..add(CoustomerEvent.getSalesmanLists(listData["affiliationId"]))
//     //           ..add(CoustomerEvent.gethistory(listData["instanceId"]))
//     //           ..add(CoustomerEvent.getContacts()),
//     //       ),
//     //       BlocProvider<WebScoketBloc>(
//     //         create: (BuildContext context) =>
//     //             getIt<WebScoketBloc>()..add(WebScoketEvent.getContacts()),
//     //       ),
//     //     ],
//     return BlocProvider(
//         create: (context) => getIt<CoustomerBloc>()
//           ..add(CoustomerEvent.gethistorydata(listData["instanceId"]))
//           ..add(CoustomerEvent.getSalesmanLists(listData["affiliationId"]))
//           ..add(CoustomerEvent.gethistory(listData["instanceId"]))
//           ..add(CoustomerEvent.getContacts()),
//         child: BlocConsumer<CoustomerBloc, CoustomerState>(
//             listener: (context, state) {
//           // print(state.history);
//           print(listData);
//           // _listData = state.coustomData;
//         }, builder: (context, state) {
//           return DefaultTabController(
//             length: 3,
//             child: Scaffold(
//               appBar: AppBar(
//                 elevation: 0.1,
//                 backgroundColor: Colors.blue[300],
//                 title: Center(
//                   child: Text('????????????'),
//                 ),
//                 // actions: <Widget>[
//                 //   IconButton(
//                 //     icon: Icon(Icons.menu),
//                 //     tooltip: 'More',
//                 //     onPressed: () => debugPrint('More button is pressed'),
//                 //   )
//                 // ],
//                 actions: <Widget>[
//                   new PopupMenuButton<String>(
//                     itemBuilder: (BuildContext context) =>
//                         <PopupMenuItem<String>>[
//                       if (listData["workflowStatus"] == "2")
//                         this.SelectView(Icons.lock_open, '????????????', 'A'),
//                       if (listData["workflowStatus"] == "3")
//                         this.SelectView(Icons.alarm_on, '????????????', 'B'),
//                     ],
//                     onSelected: (String action) {
//                       switch (action) {
//                         case 'A':
//                           BlocProvider.of<CoustomerBloc>(context)
//                             ..add(CoustomerEvent.unFreezedCustomer(
//                                 listData["instanceId"]));
//                           break;
//                         case 'B':
//                           BlocProvider.of<CoustomerBloc>(context)
//                             ..add(CoustomerEvent.executionWithoutdelay(
//                                 listData['instanceId']));
//                           break;
//                       }
//                     },
//                   ),
//                 ],
//                 toolbarHeight: 180.0,
//                 bottom: PreferredSize(
//                   preferredSize: Size.fromHeight(48),
//                   child: Container(
//                       height: 120,
//                       child: Column(
//                         children: <Widget>[
//                           Container(
//                             height: 80.0,
//                             decoration: BoxDecoration(
//                               color: Colors.blue[300],
//                               // border: Border.all(width: 1.0)
//                             ),
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 customer_img(),
//                                 customer_info(),
//                                 Expanded(child: Text("")),
//                                 customer_icons(context, state),
//                               ],
//                             ),
//                           ),
//                           Container(
//                             height: 40.0,
//                             decoration: BoxDecoration(color: Colors.white),
//                             child: TabBar(
//                               unselectedLabelColor: Colors.black,
//                               indicatorColor: Colors.blue,
//                               indicatorSize: TabBarIndicatorSize.label,
//                               labelColor: Colors.blue,
//                               indicatorWeight: 2.0,
//                               tabs: <Widget>[
//                                 main_tabBar('????????????'),
//                                 main_tabBar('????????????'),
//                                 main_tabBar('????????????'),
//                                 // main_tabBar('????????????'),
//                               ],
//                             ),
//                           )
//                         ],
//                       )),
//                 ),
//               ),
//               body: TabBarView(
//                 children: <Widget>[
//                   state.history.length > 0
//                       ? FollowUpRecord(listData: listData)
//                       : SizedBox(),
//                   HouseIntention(listData: listData),
//                   state.history.length > 0
//                       ? CustomerInformation(listData: listData)
//                       : SizedBox(),
//                   // ReferralWay(listData: listData),
//                 ],
//               ),
//             ),
//           );
//         }));
//   }

//   //??????????????????
//   customer_img() {
//     return Container(
//       width: 60,
//       height: 60,
//       margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(50.0),
//         image: DecorationImage(
//             image: NetworkImage('https://www.itying.com/images/flutter/7.png'),
//             fit: BoxFit.cover),
//       ),
//     );
//   }

//   //??????????????????
//   customer_info() {
//     return Container(
//       margin: EdgeInsets.fromLTRB(25, 0, 0, 0),
//       // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//       // decoration: BoxDecoration(border: Border.all(width: 1.0)),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Container(
//             child: Row(
//               children: <Widget>[
//                 Container(
//                     child: Text(
//                   // '?????????',
//                   listData['customerName'] + " ",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 14.0,
//                       fontWeight: FontWeight.w500),
//                 )),
//                 InkWell(
//                   child: Icon(
//                     Icons.create,
//                     color: Colors.white,
//                     size: 14,
//                   ),
//                   onTap: () {},
//                 ),
//                 if (listData["grade"] != null && listData["grade"] != "")
//                   Container(
//                     margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
//                     padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
//                     decoration: BoxDecoration(
//                         border: Border.all(width: 1.0, color: Colors.white),
//                         borderRadius: BorderRadius.circular(5.0)),
//                     child: Text(
//                       // '??????',
//                       listData['grade'],
//                       style: TextStyle(color: Colors.white, fontSize: 10.0),
//                     ),
//                   ),
//                 if (listData["workflowStatus"] == "1")
//                   Container(
//                     margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
//                     padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
//                     decoration: BoxDecoration(
//                         border: Border.all(width: 1.0, color: Colors.white),
//                         borderRadius: BorderRadius.circular(5.0)),
//                     child: Text(
//                       '?????????',
//                       style: TextStyle(color: Colors.white, fontSize: 10.0),
//                     ),
//                   ),
//                 if (listData["workflowStatus"] == "2")
//                   Container(
//                     margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
//                     padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
//                     decoration: BoxDecoration(
//                         border: Border.all(width: 1.0, color: Colors.white),
//                         borderRadius: BorderRadius.circular(5.0)),
//                     child: Text(
//                       '?????????',
//                       style: TextStyle(color: Colors.white, fontSize: 10.0),
//                     ),
//                   ),
//                 if (listData["workflowStatus"] == "3")
//                   Container(
//                     margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
//                     padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
//                     decoration: BoxDecoration(
//                         border: Border.all(width: 1.0, color: Colors.white),
//                         borderRadius: BorderRadius.circular(5.0)),
//                     child: Text(
//                       '?????????',
//                       style: TextStyle(color: Colors.white, fontSize: 10.0),
//                     ),
//                   ),
//                 if (listData["workflowStatus"] == "4")
//                   Container(
//                     margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
//                     padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
//                     decoration: BoxDecoration(
//                         border: Border.all(width: 1.0, color: Colors.white),
//                         borderRadius: BorderRadius.circular(5.0)),
//                     child: Text(
//                       '????????????',
//                       style: TextStyle(color: Colors.white, fontSize: 10.0),
//                     ),
//                   )
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.fromLTRB(0, 3, 0, 0),
//             child: Row(
//               children: <Widget>[
//                 Container(
//                   child: Text(
//                     // '13425487110',
//                     listData["phone"],
//                     style: TextStyle(color: Colors.white, fontSize: 13.0),
//                   ),
//                 ),
//                 SizedBox(width: 5.0),
//                 Container(
//                   child: Icon(
//                     Icons.content_copy,
//                     color: Colors.white,
//                     size: 14,
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Container(
//             child: Text(
//               '??????????????????70%',
//               style: TextStyle(color: Colors.white, fontSize: 11.0),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   // _updateName(context) {
//   //   return showDialog(
//   //       barrierDismissible: true,
//   //       context: context,
//   //       builder: (context) {
//   //         return AlertDialog(
//   //           title: Text("??????????????????"),
//   //           content: StatefulBuilder(builder: (context, StateSetter setState) {
//   //             return SingleChildScrollView(
//   //               child: Column(
//   //                 crossAxisAlignment: CrossAxisAlignment.start,
//   //                 children: <Widget>[
//   //                   _dialogContant("??????:", "???????????????"),
//   //                 ],
//   //               ),
//   //             );
//   //           }),
//   //           actions: <Widget>[
//   //             FlatButton(
//   //               child: Text("??????", style: TextStyle(color: Colors.blue[200])),
//   //               onPressed: () {
//   //                 Navigator.of(context).pop(false);
//   //               },
//   //             ),
//   //             Tooltip(
//   //                 message: '?????????????????????',
//   //                 child: FlatButton(
//   //                   child: Text("??????"),
//   //                   onPressed: () {
//   //                     if (_addValue01 != "") {
//   //                       Navigator.of(context).pop(true);
//   //                       BotToast.showAttachedWidget(
//   //                           attachedBuilder: (_) => Center(
//   //                                   child: Card(
//   //                                 child: Container(
//   //                                     width: 150,
//   //                                     height: 80,
//   //                                     // padding:
//   //                                     //     const EdgeInsets.all(8.0),
//   //                                     child: Column(
//   //                                       mainAxisAlignment:
//   //                                           MainAxisAlignment.spaceEvenly,
//   //                                       children: <Widget>[
//   //                                         Icon(
//   //                                           Icons.done,
//   //                                           color: Colors.blue,
//   //                                         ),
//   //                                         Text(
//   //                                           "?????????????????????",
//   //                                           style: TextStyle(
//   //                                               color: Colors.blue,
//   //                                               fontWeight: FontWeight.w500),
//   //                                         )
//   //                                       ],
//   //                                     )),
//   //                               )),
//   //                           duration: Duration(seconds: 2),
//   //                           target: Offset(520, 520));
//   //                     } else {
//   //                       BotToast.showText(text: '????????????');
//   //                     }
//   //                   },
//   //                 )),
//   //           ],
//   //         );
//   //       }).then((value) {
//   //     if (value != null) {
//   //       if (value) {
//   //         BlocProvider.of<CoustomerBloc>(context)
//   //           ..add(CoustomerEvent.getProcessDefinition(
//   //               _addValue01, _addValue02, groupValue.toString(), _addValue03));
//   //         setState(() {
//   //           _addValue01 = '';
//   //         });
//   //       }
//   //     }
//   //   });
//   // }

//   // _dfawe(){
//   //   return Container(
//   //                   margin: EdgeInsets.fromLTRB(10, 0, 30, 0),
//   //                   child: Row(
//   //                     // crossAxisAlignment: CrossAxisAlignment.end,
//   //                     children: <Widget>[
//   //                       Text("????????????:",
//   //                           style: TextStyle(
//   //                             fontFamily: FitnessAppTheme.fontName,
//   //                             fontWeight: FontWeight.w500,
//   //                             fontSize: 16,
//   //                             letterSpacing: 0.5,
//   //                             color: Colors.grey[700],
//   //                             // fontSize: 16, fontWeight: FontWeight.w500
//   //                           )),
//   //                       Container(
//   //                         margin: EdgeInsets.only(left: 10),
//   //                         width: 90,
//   //                         decoration: BoxDecoration(
//   //                           border: Border(
//   //                               bottom: BorderSide(
//   //                                   width: 1.0, color: Colors.grey[400])),
//   //                         ),
//   //                         child: TextField(
//   //                             textInputAction: TextInputAction.go,
//   //                             decoration: InputDecoration(
//   //                               hintText: '??????????????????',
//   //                               border: InputBorder.none,
//   //                               isDense: true,
//   //                               hintStyle: TextStyle(
//   //                                   color: Colors.grey[400], fontSize: 14),
//   //                             ),
//   //                             textAlign: TextAlign.start,
//   //                             controller: TextEditingController.fromValue(
//   //                               TextEditingValue(
//   //                                 text: _textFeid != "" ? _textFeid : '',
//   //                                 // ?????????????????????
//   //                                 selection:
//   //                                     TextSelection.fromPosition(TextPosition(
//   //                                   affinity: TextAffinity.downstream,
//   //                                   offset:
//   //                                       _textFeid != "" ? _textFeid.length : 0,
//   //                                 )),
//   //                               ),
//   //                             ),
//   //                             // onChanged: (val) {
//   //                             //   _textFeid = val;
//   //                             // }
//   //                             onSubmitted: (val) {
//   //                               showDialog(
//   //                                   barrierDismissible: true,
//   //                                   context: context,
//   //                                   builder: (context) {
//   //                                     return AlertDialog(
//   //                                       title: Text("??????"),
//   //                                       content: StatefulBuilder(builder:
//   //                                           (context, StateSetter setState) {
//   //                                         return SingleChildScrollView(
//   //                                           child: Column(
//   //                                             crossAxisAlignment:
//   //                                                 CrossAxisAlignment.start,
//   //                                             children: <Widget>[
//   //                                               Text('??????????????????')
//   //                                             ],
//   //                                           ),
//   //                                         );
//   //                                       }),
//   //                                       actions: <Widget>[
//   //                                         FlatButton(
//   //                                           child: Text("??????",
//   //                                               style: TextStyle(
//   //                                                   color: Colors.blue[200])),
//   //                                           onPressed: () {
//   //                                             Navigator.of(context).pop(false);
//   //                                           },
//   //                                         ),
//   //                                         FlatButton(
//   //                                           child: Text("??????"),
//   //                                           onPressed: () {
//   //                                             Navigator.of(context).pop(true);
//   //                                           },
//   //                                         )
//   //                                       ],
//   //                                     );
//   //                                   }).then((value) {
//   //                                 if (value != null) {
//   //                                   if (value) {
//   //                                     if (_textFeid != '') {
//   //                                       // widget.listData['id']
//   //                                       BlocProvider.of<ProcessedBloc>(context)
//   //                                         ..add(ProcessedEvent.updateRemarks(
//   //                                             'dddd', _textFeid));
//   //                                     }
//   //                                     BotToast.showAttachedWidget(
//   //                                         attachedBuilder: (_) => Center(
//   //                                                 child: Card(
//   //                                               child: Container(
//   //                                                   width: 150,
//   //                                                   height: 80,
//   //                                                   // padding:
//   //                                                   //     const EdgeInsets.all(8.0),
//   //                                                   child: Column(
//   //                                                     mainAxisAlignment:
//   //                                                         MainAxisAlignment
//   //                                                             .spaceEvenly,
//   //                                                     children: <Widget>[
//   //                                                       Icon(
//   //                                                         Icons.done,
//   //                                                         color: Colors.blue,
//   //                                                       ),
//   //                                                       Text(
//   //                                                         "?????????????????????",
//   //                                                         style: TextStyle(
//   //                                                             color:
//   //                                                                 Colors.blue,
//   //                                                             fontWeight:
//   //                                                                 FontWeight
//   //                                                                     .w500),
//   //                                                       )
//   //                                                     ],
//   //                                                   )),
//   //                                             )),
//   //                                         duration: Duration(seconds: 2),
//   //                                         target: Offset(520, 520));
//   //                                   }
//   //                                 }
//   //                               });
//   //                               _textFeid = val;
//   //                             }),
//   //                       )
//   //                     ],
//   //                   ),
//   //                 );
//   // }

//   //??????????????????
//   customer_icons(context, state) {
//     return Container(
//       margin: EdgeInsets.fromLTRB(0, 15, 5, 0),
//       width: 100,
//       height: 60,
//       // decoration: BoxDecoration(border: Border.all(width: 1.0)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: <Widget>[
//           InkWell(
//             child: Icon(Icons.message, color: Colors.white),
//             onTap: () {
//               showDialog(
//                   barrierDismissible: true,
//                   context: context,
//                   builder: (context) {
//                     return AlertDialog(
//                       title: Text("??????"),
//                       content: Text("???????????????????????????"),
//                       actions: <Widget>[
//                         FlatButton(
//                           child: Text("??????",
//                               style: TextStyle(color: Colors.blue[200])),
//                           onPressed: () {
//                             Navigator.of(context).pop(false);
//                           },
//                         ),
//                         FlatButton(
//                           child: Text("??????"),
//                           onPressed: () async {
//                             // BlocProvider.of<WebScoketBloc>(context)
//                             //     .add(WebScoketEvent.getContacts());
//                             List getContactsList = [];
//                             if (state.getContactsList != null) {
//                               getContactsList = state.getContactsList;
//                             }
//                             String contactId = '';
//                             String contactAvatar = '';
//                             String contactName = '';
//                             for (int i = 0; i < getContactsList.length; i++) {
//                               if (getContactsList[i]['phone'] ==
//                                   listData['brokerPhone']) {
//                                 contactId = getContactsList[i]['contactId'];
//                                 contactAvatar =
//                                     getContactsList[i]['contactAvatar'];
//                                 contactName = getContactsList[i]['contactName'];
//                               }
//                             }
//                             if (contactId != '' &&
//                                 contactAvatar != '' &&
//                                 contactName != '') {
//                               ExtendedNavigator.of(context)
//                                   .replace(Routes.messageChat,
//                                       arguments: MessageChatArguments(
//                                         contactId: contactId,
//                                         headImg: contactAvatar,
//                                         contactName: contactName,
//                                       ));
//                             } else {
//                               BotToast.showAttachedWidget(
//                                   attachedBuilder: (_) => Center(
//                                           child: Card(
//                                         child: Container(
//                                             width: 150,
//                                             height: 80,
//                                             child: Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceEvenly,
//                                               children: <Widget>[
//                                                 Icon(
//                                                   Icons.error,
//                                                   color: Colors.redAccent,
//                                                 ),
//                                                 Text(
//                                                   "??????????????????????????????????????????",
//                                                   style: TextStyle(
//                                                       color: Colors.redAccent),
//                                                 )
//                                               ],
//                                             )),
//                                       )),
//                                   duration: Duration(seconds: 2),
//                                   target: Offset(520, 520));
//                             }
//                           },
//                         )
//                       ],
//                     );
//                   });
//             },
//           ),
//           // if (!listData["phone"].toString().contains('**'))
//           //   Container(
//           //     width: 1,
//           //     height: 20,
//           //     decoration: BoxDecoration(color: Colors.white),
//           //   ),
//           // if (!listData["phone"].toString().contains('**'))
//           //   InkWell(
//           //     child: Icon(Icons.phone, color: Colors.white),
//           //     onTap: () {
//           //       showDialog(
//           //           barrierDismissible: true,
//           //           context: context,
//           //           builder: (context) {
//           //             return AlertDialog(
//           //               title: Text("??????"),
//           //               content: Text("??????????????????????????????"),
//           //               actions: <Widget>[
//           //                 FlatButton(
//           //                   child: Text("??????",
//           //                       style: TextStyle(color: Colors.blue[200])),
//           //                   onPressed: () {
//           //                     Navigator.of(context).pop(false);
//           //                   },
//           //                 ),
//           //                 FlatButton(
//           //                   child: Text("??????"),
//           //                   onPressed: () async {
//           //                     // launch("https://www.baidu.com");
//           //                     String url =
//           //                         'tel:' + listData["phone"].toString();
//           //                     //  'tel:13429824009';
//           //                     if (await canLaunch(url)) {
//           //                       await launch(url);
//           //                     } else {
//           //                       throw 'Could not launch $url';
//           //                     }
//           //                     Navigator.of(context).pop(true);
//           //                   },
//           //                 )
//           //               ],
//           //             );
//           //           });
//           //     },
//           //   )
//         ],
//       ),
//     );
//   }

//   //tab?????????
//   main_tabBar(String tab_name) {
//     return Tab(
//       child: Text(
//         tab_name,
//         style: TextStyle(fontSize: 14.0, color: Colors.black54),
//       ),
//     );
//   }
// }
