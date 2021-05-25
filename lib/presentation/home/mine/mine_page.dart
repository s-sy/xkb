import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/mine/bloc/mine_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MinePage extends StatefulWidget {
  MinePage({Key key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

const HOUSESNAME = "HOUSESNAME";
const HOUSEID = "HOUSEID";
const HOUSESHORTCODE = "HOUSESHORTCODE";

class _MinePageState extends State<MinePage> {
  // List _listHouse = ["卓尔生活城", "华泰学府春天", "灌南汇侨城", "汉旺世纪城"];
  // String _projectHouse = "卓尔生活城";
  List _listHouse = [];
  List _listHouseId = [];
  List _listHouseShortCode = [];
  String _house = "";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            getIt<MineBloc>()..add(const MineEvent.handleProcess()),
        child:
            BlocConsumer<MineBloc, MineState>(listener: (context, state) async {
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          String affiliateds = sharedPreferences.get('AFFILIATEDS');
          List affidList = [];
          if (affiliateds != null) {
            affidList = jsonDecode(affiliateds);
          }
          for (int i = 0; i < affidList.length; i++) {
            _listHouse.add(affidList[i]["projectName"]);
            _listHouseId.add(affidList[i]["id"]);
            _listHouseShortCode.add(affidList[i]["affiliationCode"]);
          }
          String houseName = sharedPreferences.getString("HOUSESNAME");
          if (houseName == null) {
            sharedPreferences.setString(
                HOUSESNAME, affidList[0]["projectName"]);
            sharedPreferences.setString(HOUSEID, affidList[0]["id"]);
            sharedPreferences.setString(
                HOUSESHORTCODE, affidList[0]["affiliationCode"]);
            _house = affidList[0]["projectName"];
          } else {
            _house = houseName;
          }
        }, builder: (BuildContext context, state) {
          return Scaffold(
              appBar: AppBar(
                title: Text('我的'),
              ),
              backgroundColor: Colors.grey[300],
              body: ListView(
                children: <Widget>[
                  _topInfo(),
                  _otherInfoTab('切换项目', Icons.loop, 0),
                  SizedBox(
                    height: 10.0,
                  ),
                  _secondInfoTab('客户咨询', Icons.forum, 0),
                  SizedBox(
                    height: 1.0,
                  ),
                  _secondInfoTab('AI名片', Icons.account_box, 0),
                  _mainInfoTab('业绩', Icons.class_, 0),
                  _mainInfoTab('我的交易订单', Icons.payment, 0),
                  _mainInfoTab02('留客电话', Icons.settings_phone, 0),
                  _mainInfoTab('置业计划', Icons.library_books, 0),
                  SizedBox(
                    height: 10.0,
                  ),
                  _secondInfoTab('建议反馈', Icons.mail_outline, 0),
                  SizedBox(
                    height: 1.0,
                  ),
                  _secondInfoTab('在线客服', Icons.headset, 0),
                  SizedBox(height: 80)
                ],
              ));
        }));
  }

  _mainInfoTab(String title, IconData icon, int index) {
    return Column(
      children: [
        SizedBox(
          height: 10.0,
        ),
        InkWell(
          child: Container(
              height: 45.0,
              decoration: BoxDecoration(
                color: Colors.white60,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 15.0,
                  ),
                  Icon(
                    icon,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(title,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      )),
                ],
              )),
          onTap: () {
            if (title == "我的交易订单") {
              ExtendedNavigator.of(context).push(Routes.mineOrder);
            } else if (title == "置业计划") {
              ExtendedNavigator.of(context).push(Routes.ownershipSchemePage);
              // Navigator.push(
              //   context,
              //   new MaterialPageRoute(
              //       builder: (context) => new OwnershipSchemePage()),
              // );
            } else if (title == "业绩") {
              ExtendedNavigator.of(context).push(Routes.mineAchievement);
            }
          },
        )
      ],
    );
  }

  _mainInfoTab02(String title, IconData icon, int index) {
    return Column(
      children: [
        SizedBox(
          height: 10.0,
        ),
        InkWell(
          child: Container(
              height: 45.0,
              decoration: BoxDecoration(
                color: Colors.white60,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 15.0,
                  ),
                  Icon(
                    icon,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(title,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      )),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text(
                      "(18)",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              )),
          onTap: () {
            ExtendedNavigator.of(context).push(Routes.guestPhone);
          },
        )
      ],
    );
  }

  _secondInfoTab(String title, IconData icon, int index) {
    return InkWell(
      child: Container(
          height: 45.0,
          decoration: BoxDecoration(
            color: Colors.white60,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 15.0,
              ),
              Icon(
                icon,
                color: Colors.grey,
              ),
              SizedBox(
                width: 15.0,
              ),
              Text(title,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          )),
      onTap: () {
        if (title == "AI名片") {
          ExtendedNavigator.of(context).push(Routes.aiCard);
        } else if (title == "客户咨询") {
          showDialog(
              barrierDismissible: true,
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("提示"),
                  content: Text(
                    "咨询个啥啊～买就完事",
                    style: TextStyle(color: Colors.red),
                  ),
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
          // ExtendedNavigator.of(context).push(Routes.customerChat);
        } else if (title == "建议反馈") {
          ExtendedNavigator.of(context).push(Routes.suggestFeedback);
        } else if (title == "在线客服") {
          showDialog(
              barrierDismissible: true,
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("提示"),
                  content: Text(
                    "客服小姐姐正在赶来的路上～",
                    style: TextStyle(color: Colors.red),
                  ),
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
        }
      },
    );
  }

  _otherInfoTab(String title, IconData icon, int index) {
    return Column(
      children: [
        SizedBox(
          height: 10.0,
        ),
        InkWell(
          child: Container(
              height: 45.0,
              decoration: BoxDecoration(
                color: Colors.white60,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 15.0,
                      ),
                      Icon(
                        icon,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text(title,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Text(
                      "  " + _house + "  ",
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  )
                ],
              )),
          onTap: () {
            _openModalBottomSheetText();
          },
        )
      ],
    );
  }

  Future _openModalBottomSheetText() async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            children: <Widget>[
              Container(
                  height: 200.0,
                  child: ListView.builder(
                      itemCount: _listHouse.length,
                      itemBuilder: (context, i) => Container(
                          height: 50,
                          child: Center(
                            child: InkWell(
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  "  " + _listHouse[i] + "  ",
                                  // maxLines: 1,
                                  // overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              onTap: () async {
                                setState(() {
                                  _house = _listHouse[i];
                                });
                                SharedPreferences sharedPreferences =
                                    await SharedPreferences.getInstance();
                                sharedPreferences.setString(
                                    HOUSESNAME, _listHouse[i]);
                                sharedPreferences.setString(
                                    HOUSEID, _listHouseId[i]);
                                sharedPreferences.setString(
                                    HOUSESHORTCODE, _listHouseShortCode[i]);
                                Navigator.pop(context, _listHouse[i]);
                              },
                            ),
                          )))),
              ListTile(
                title: Text('新增',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue)),
                onTap: () {
                  showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("提示"),
                          content: TextField(
                            maxLines: 5,
                            minLines: 1,
                            textInputAction: TextInputAction.go,
                            decoration: InputDecoration(
                              hintText: '请输入内容(不能用新增吧)',
                              border: InputBorder.none,
                              isDense: true,
                              hintStyle: TextStyle(color: Colors.grey[400]),
                            ),
                          ),
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
                },
              ),
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
        });
    // print(option);
  }

  _topInfo() {
    return Container(
      height: 65.0,
      decoration: BoxDecoration(
        color: Colors.white60,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 15.0,
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              image: DecorationImage(
                  image: NetworkImage(
                      'https://www.itying.com/images/flutter/7.png'),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
          Text('刘聪',
              style: TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.w500,
              )),
          Expanded(child: Text("")),
          InkWell(
              child: Container(
                width: 100,
                height: 60,
                child: Icon(
                  Icons.settings,
                  color: Colors.grey,
                ),
              ),
              onTap: () {
                ExtendedNavigator.of(context).push(Routes.mineSettingPage);
                // Navigator.push(
                //   context,
                //   new MaterialPageRoute(
                //       builder: (context) => new MineSettingPage()),
                // );
              }),
        ],
      ),
    );
  }
}
