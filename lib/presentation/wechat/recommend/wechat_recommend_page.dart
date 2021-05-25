import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/wxpage/recommend_buy_house/recommend_buy_house_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/components/chat/public.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WechatRecommendPage extends StatefulWidget {
  @override
  _WechatRecommendPageState createState() => _WechatRecommendPageState();
}

class _WechatRecommendPageState extends State<WechatRecommendPage> {
  bool isArrived = false;
  int groupValue = 0;
  bool valueb = true;
  String valueName = "";
  String phone = "";
  String remark = "";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RecommendBuyHouseBloc>()
        ..add(RecommendBuyHouseEvent.getTaills())
        ..add(RecommendBuyHouseEvent.getProcessDefinition()),
      child: BlocConsumer<RecommendBuyHouseBloc, RecommendBuyHouseState>(
        listener: (context, state) {
          if (state.repeatTip != "") {
            BotToast.showText(text: state.repeatTip);
            BlocProvider.of<RecommendBuyHouseBloc>(context)
              ..add(RecommendBuyHouseEvent.repeatTip());
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Listener(
              onPointerDown: (onPointerDown) {
                FocusScope.of(context).requestFocus(FocusNode());
                print('手指按下回调');
              },
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    // margin: EdgeInsets.fromLTRB(5.0, 0, 10.0, 0),
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://img.0728jh.com/staticImg/banner.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 150),
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // recommend(),
                        inputField("姓名", "请输入要推荐的姓名"),
                        _sexRadio(),
                        inputField("电话", "请输入要推荐的电话"),
                        inputField("意向", "请输入意向"),
                        // Expanded(child: SizedBox()),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Checkbox(
                                value: this.valueb,
                                onChanged: (bool value) {
                                  setState(() {
                                    this.valueb = value;
                                  });
                                },
                              ),
                              InkWell(
                                child: Container(
                                  child: Text(
                                    "同意用户协议",
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                onTap: () async {
                                  SharedPreferences _preferences =
                                      await SharedPreferences.getInstance();
                                  var tentant =
                                      await _preferences.get("ProjectTenant");
                                  // print(jsonDecode(tentant)["disclaimer"]);
                                  showDialog(
                                      barrierDismissible: true,
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text("用户协议"),
                                          content: Text(jsonDecode(
                                              tentant)["disclaimer"]),
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
                              // SizedBox(width: 3.0),
                              // InkWell(
                              //   child: Icon(Icons.info_outline,
                              //       size: 20, color: Colors.red),
                              //   onTap: () async {
                              //     SharedPreferences _preferences =
                              //         await SharedPreferences.getInstance();
                              //     var tentant =
                              //         await _preferences.get("ProjectTenant");
                              //     // print(jsonDecode(tentant)["disclaimer"]);
                              //     showDialog(
                              //         barrierDismissible: true,
                              //         context: context,
                              //         builder: (context) {
                              //           return AlertDialog(
                              //             title: Text("用户协议"),
                              //             content: Text(jsonDecode(
                              //                 tentant)["disclaimer"]),
                              //             actions: <Widget>[
                              //               FlatButton(
                              //                 child: Text("确定"),
                              //                 onPressed: () {
                              //                   Navigator.of(context).pop(true);
                              //                 },
                              //               )
                              //             ],
                              //           );
                              //         });
                              //   },
                              // ),
                              Expanded(child: SizedBox()),
                              InkWell(
                                child: Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child: Text(
                                    "佣金标准",
                                    style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                onTap: () async {
                                  SharedPreferences _preferences =
                                      await SharedPreferences.getInstance();
                                  var project =
                                      await _preferences.get("ProjectItem");
                                  // print(jsonDecode(project)["commission"]);
                                  showDialog(
                                      barrierDismissible: true,
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text("佣金标准"),
                                          content: Text(jsonDecode(
                                              project)["commission"]),
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
                            ],
                          ),
                        ),
                        valueb ? bottom(context) : SizedBox(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _sexRadio() {
    return Container(
      margin: EdgeInsets.only(top: 0),
      child: Row(
        children: <Widget>[
          Text(
            "性别",
            style: TextStyle(
                color: Colors.grey[700],
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(width: 15),
          Radio(
            value: 1,
            groupValue: groupValue,
            onChanged: (value) {
              setState(() {
                groupValue = value;
              });
            },
          ),
          Text("先生",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500,
                  fontSize: 16)),
          SizedBox(width: 30),
          Radio(
            value: 2,
            groupValue: groupValue,
            onChanged: (value) {
              setState(() {
                groupValue = value;
              });
            },
          ),
          Text("女士",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500,
                  fontSize: 16)),
        ],
      ),
    );
  }

  inputField(String name, String tips) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: name == "意向" ? 50 : 0),
            child: Text(
              name,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Container(
              height: name == "意向" ? 100 : 45,
              padding: EdgeInsets.only(left: 10, top: 5.0),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(5.0)),
              child: TextField(
                  maxLines: 4,
                  minLines: 1,
                  keyboardType:
                      name == "电话" ? TextInputType.number : TextInputType.text,
                  textInputAction: TextInputAction.go,
                  decoration: InputDecoration(
                    hintText: tips,
                    border: InputBorder.none,
                    isDense: true,
                    hintStyle: TextStyle(color: Colors.grey[400], fontSize: 16),
                  ),
                  onChanged: (val) {
                    switch (name) {
                      case "姓名":
                        setState(() {
                          valueName = val;
                        });
                        break;
                      case "电话":
                        setState(() {
                          phone = val;
                        });
                        break;
                      case "意向":
                        setState(() {
                          remark = val;
                        });
                        break;
                    }
                  }),
            ),
          )
        ],
      ),
    );
  }

  recommend() {
    return Container(
      child: Row(
        children: [
          Text(
            "推荐人",
            style: TextStyle(
                color: Colors.grey[700],
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Container(
                      width: 120,
                      height: 40,
                      // padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Center(
                        child: Text(
                          "推荐他人",
                          style: TextStyle(
                              color: isArrived ? Colors.grey : Colors.cyan,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                  onTap: () {
                    setState(() {
                      isArrived = !isArrived;
                    });
                  },
                ),
                InkWell(
                  child: Container(
                      width: 120,
                      height: 40,
                      // padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Center(
                        child: Text(
                          "推荐自己",
                          style: TextStyle(
                              color: isArrived ? Colors.cyan : Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                  onTap: () {
                    setState(() {
                      isArrived = !isArrived;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  bottom(context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
      width: 400,
      height: 50,
      child: RaisedButton(
        splashColor: Colors.lightBlueAccent,
        child: Text("提交", style: TextStyle(color: Colors.white, fontSize: 18)),
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
                      child:
                          Text("取消", style: TextStyle(color: Colors.blue[200])),
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
              }).then((value) async {
            if (value && value != null) {
              BlocProvider.of<RecommendBuyHouseBloc>(context)
                ..add(RecommendBuyHouseEvent.checkphonebyborker(phone))
                ..add(RecommendBuyHouseEvent.sendworkflow(
                    valueName, phone, remark, groupValue.toString()));
            }
          });
        },
        textColor: Colors.white,
        color: Colors.cyan,
        elevation: 2,
      ),
    );
  }
}
