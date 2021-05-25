import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/wxpage/wechat_home_page/wechathomepage_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/components/chat/public.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class WechatHouseDetails extends StatefulWidget {
  final Map<String, dynamic> affData;
  final Map<String, dynamic> map;
  const WechatHouseDetails({Key key, this.affData, this.map}) : super(key: key);
  @override
  _WechatHouseDetailsState createState() => _WechatHouseDetailsState();
}

class _WechatHouseDetailsState extends State<WechatHouseDetails> {
  String imgWhenNull =
      "https://img.0728jh.com/1332139872148000768/material/fb625605-48d3-4e89-b58e-cbda5b568beb.jpeg";
  bool isFavorite = false;
  bool isComment = false;
  String comment = "";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WechathomepageBloc>()
        ..add(WechathomepageEvent.apartmentlayoutOne(widget.map)),
      // ..add(WechathomepageEvent.getTopicreply()),
      child: BlocConsumer<WechathomepageBloc, WechathomepageState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                title: Text("户型详情", style: TextStyle(color: Colors.grey[700])),
                elevation: 0.0,
                brightness: Brightness.light,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.grey[700])),
            backgroundColor: Colors.white,
            body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: SingleChildScrollView(
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.green[100],
                              image: DecorationImage(
                                  image: NetworkImage(widget.map["src"] != null
                                          ? widget.map["src"]
                                          : imgWhenNull
                                      // 'https://image.kehuoa.com/1353183630993920000/material/30300c6b-aaf3-4fd7-a4dd-93c40ddc7b87.jpg'
                                      ),
                                  // fit: BoxFit.cover
                                  fit: BoxFit.contain),
                            ),
                            child: SizedBox(),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              stackPart(context),
                              Container(
                                height: 50.0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    houseData("户型类型", widget.map["type"]
                                        // "3室2厅2卫"
                                        ),
                                    centerLine(),
                                    houseData(
                                        "面积", widget.map["floorage"] + "m²"
                                        // "137.05m²"
                                        ),
                                    centerLine(),
                                    houseData(
                                      "预估总价",
                                      "约" + totalPriceHouse(widget.map) + "万/套",
                                      //  "约76.75万/套"
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 30),
                                child: Row(
                                  children: <Widget>[
                                    if (state.apartmentlayoutOne.length != 0)
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(15, 0, 0, 0),
                                        child: Text(
                                          "用户点评(" +
                                              state
                                                  .apartmentlayoutOne[0]
                                                      ["listTopicReply"]
                                                  .length
                                                  .toString() +
                                              "条)",
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    Expanded(child: SizedBox()),
                                    Container(
                                      margin: EdgeInsets.only(right: 5),
                                      child: Icon(
                                        Icons.chat_outlined,
                                        size: 20,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                    InkWell(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            right: 15, bottom: 5),
                                        child: Text(
                                          "我要评论",
                                          style: TextStyle(
                                              color: Colors.cyan,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          isComment = !isComment;
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),
                              isComment ? toComment(context) : SizedBox(),
                              if (state.apartmentlayoutOne.length != 0)
                                Column(
                                  children: state.apartmentlayoutOne[0]
                                          ["listTopicReply"]
                                      .map<Widget>((item) {
                                    return reply(item);
                                  }).toList(),
                                ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  bottom(),
                ]),
          );
        },
      ),
    );
  }

  Widget reply(Map<String, dynamic> item) {
    print(item);
    if (item["auditStatus"] == "1") {
      return Container(
        margin: EdgeInsets.only(top: 10, left: 15, right: 15),
        padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(5.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  margin: EdgeInsets.fromLTRB(5.0, 0, 10.0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    image: DecorationImage(
                        image: NetworkImage(
                          item["vistorInfo"] != null
                              ? item["vistorInfo"]["headimgUrl"] != null
                                  ? item["vistorInfo"]["headimgUrl"]
                                  : imgWhenNull
                              : imgWhenNull,
                          // 'https://www.itying.com/images/flutter/2.png'
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
                // if (item["vistorInfo"] != null)
                Container(
                  child: Text(
                    //全部给匿名用户算了
                    item["vistorInfo"] != null
                        ? item["vistorInfo"]["nickName"] != null
                            ? item["vistorInfo"]["nickName"]
                            : "匿名用户"
                        : "匿名用户",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 5.0),
              child: Text(
                item["details"],
                // "刚刚去看了，环境确实不错，不过交通不是很便利，高峰期车辆比较拥堵，对上班有需求对需要考虑了。",
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10.0),
              child: Text(item["createTime"],
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
            )
          ],
        ),
      );
    } else {
      return SizedBox();
    }
  }

  toComment(context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            padding: EdgeInsets.only(left: 7, top: 2.0),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(5.0)),
            child: TextField(
                maxLines: 4,
                minLines: 1,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.go,
                decoration: InputDecoration(
                  hintText: "请输入您点评的内容",
                  border: InputBorder.none,
                  isDense: true,
                  hintStyle: TextStyle(color: Colors.grey[400], fontSize: 16),
                ),
                onChanged: (val) {
                  setState(() {
                    comment = val;
                  });
                }),
          ),
          SizedBox(height: 3.0),
          Row(
            children: [
              RaisedButton(
                child: Text("确定",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                onPressed: () {
                  print(widget.map);
                  BlocProvider.of<WechathomepageBloc>(context)
                    ..add(WechathomepageEvent.commentpreviews(
                        comment,
                        widget.map["affiliationId"],
                        widget.map["id"],
                        3,
                        widget.map["createId"] ?? " "))
                    ..add(WechathomepageEvent.apartmentlayoutOne(widget.map));
                  setState(() {
                    comment = "";
                    isComment = false;
                  });
                },
                textColor: Colors.white,
                color: Colors.cyan,
                elevation: 2,
              ),
              Expanded(child: SizedBox()),
              InkWell(
                child: Text(
                  "取消",
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  setState(() {
                    comment = "";
                    isComment = false;
                  });
                },
              )
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  totalPriceHouse(Map<String, dynamic> map) {
    String finalPrice = "";
    // print(map);
    // print(widget.affData["price"]);
    try {
      if (map["price"] != "") {
        double price = 0.0;
        price =
            double.parse(map["price"]) * double.parse(map["floorage"]) / 10000;
        finalPrice = price.toStringAsFixed(2);
      } else {
        if (widget.affData["price"] != "" && widget.affData["price"] != null) {
          double price = 0.0;
          price = double.parse(widget.affData["price"]) *
              double.parse(map["floorage"]) /
              10000;
          finalPrice = price.toStringAsFixed(2);
        } else {
          finalPrice = "价格待定";
        }
      }
    } on FormatException catch (e) {
      print('出现FormatException: $e');
    } on Exception catch (e) {
      print('Exception: $e');
    }
    return finalPrice;
  }

  houseData(String key, String name) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name,
            style: TextStyle(
                color: Colors.red, fontSize: 16, fontWeight: FontWeight.w500)),
        Text(key,
            style: TextStyle(
                color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500))
      ],
    );
  }

  centerLine() {
    return Container(
      height: 40.0,
      decoration: BoxDecoration(
        border: Border(left: BorderSide(width: 0.8, color: Colors.grey[300])),
      ),
      child: SizedBox(),
    );
  }

  stackPart(context) {
    return Container(
        margin: EdgeInsets.only(top: 140),
        padding: EdgeInsets.only(top: 25),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0), color: Colors.white),
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15.0),
                  child: Text(
                    // "B",
                    widget.map["name"],
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.fromLTRB(0, 6.0, 10.0, 0),
                //   child: Row(
                //     children: [
                //       InkWell(
                //         child: Row(
                //           children: [
                //             Icon(
                //               isFavorite
                //                   ? Icons.favorite
                //                   : Icons.favorite_border,
                //               size: 17,
                //               color: isFavorite ? Colors.red : Colors.grey[400],
                //             ),
                //             Text(
                //               "关注",
                //               style: TextStyle(
                //                   color: Colors.grey[600], fontSize: 13),
                //             )
                //           ],
                //         ),
                //         onTap: () {
                //           setState(() {
                //             isFavorite = !isFavorite;
                //           });
                //           if (isFavorite) {
                //             BotToast.showText(text: "关注成功");
                //             BlocProvider.of<WechathomepageBloc>(context)
                //               ..add(WechathomepageEvent.goconcern(widget.map));
                //           } else {
                //             BlocProvider.of<WechathomepageBloc>(context)
                //               ..add(
                //                   WechathomepageEvent.apartmentConcerncennel());
                //             BotToast.showText(text: "取消关注");
                //           }
                //         },
                //       ),
                //       SizedBox(width: 10),
                //       InkWell(
                //         child: Row(
                //           children: [
                //             Icon(
                //               Icons.calculate,
                //               size: 18,
                //               color: Colors.cyan[400],
                //             ),
                //             Text(
                //               "房贷计算器 ",
                //               style: TextStyle(
                //                   color: Colors.grey[600], fontSize: 13),
                //             )
                //           ],
                //         ),
                //         onTap: () {
                //           BotToast.showText(text: "房贷计算器 ");
                //         },
                //       ),
                //     ],
                //   ),
                // )
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 15.0),
                    padding: EdgeInsets.fromLTRB(7, 2, 7, 2),
                    decoration: BoxDecoration(
                        color: Colors.pink[100],
                        borderRadius: BorderRadius.circular(3.0)),
                    child: Center(
                      child: Text(
                        widget.map["salesStatus"] == "0"
                            ? "热销"
                            : widget.map["salesStatus"] == "1"
                                ? "即开"
                                : widget.map["salesStatus"] == "2"
                                    ? "售罄"
                                    : "暂无信息",
                        // "热销",
                        style: TextStyle(color: Colors.grey[700], fontSize: 13),
                      ),
                    )),
                // InkWell(
                //   child: Container(
                //     child: Row(
                //       children: <Widget>[
                //         Container(
                //           width: 18.0,
                //           height: 18.0,
                //           decoration: BoxDecoration(
                //               color: Colors.pink[100],
                //               borderRadius: BorderRadius.circular(5.0)),
                //           child: Icon(Icons.share, size: 15, color: Colors.red),
                //         ),
                //         Container(
                //           margin: EdgeInsets.fromLTRB(3.0, 0, 20.0, 0),
                //           child: Text(
                //             "分享",
                //             style: TextStyle(
                //                 color: Colors.grey[700],
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w500),
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                //   onTap: () {
                //     BotToast.showText(text: "分享");
                //   },
                // )
              ],
            )
          ],
        ));
  }

  bottom() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.grey[300])),
      child: Row(
        children: [
          InkWell(
              child: Container(
                margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone,
                      size: 25,
                      color: Colors.green,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "电话",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
              onTap: () async {
                SharedPreferences sharPre =
                    await SharedPreferences.getInstance();
                String salemanOne = sharPre.get("SALEMANONE");
                print(salemanOne);
                if (salemanOne != null) {
                  showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("提示"),
                        content:
                            Text("是否拨打电话:" + jsonDecode(salemanOne)["phone"]),
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
                              String url =
                                  'tel:' + jsonDecode(salemanOne)["phone"];
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
                    },
                  );
                  // isSalemanOne = true;
                } else {
                  BotToast.showText(text: "请先绑定置业顾问");
                }
              }),
          Expanded(child: SizedBox()),
          InkWell(
            child: Container(
                margin: EdgeInsets.only(right: 20),
                width: 120,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.deepOrange[300],
                    borderRadius: BorderRadius.circular(5.0)),
                child: Center(
                  child: Text(
                    "我要购买",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                )),
            onTap: () {
              ExtendedNavigator.of(context).replace(Routes.wechatHomeScreen,
                  arguments: WechatHomeScreenArguments(
                    affData: widget.affData,
                    msgPageTabIndex: 1,
                  ));
              // BotToast.showText(text: "我要购买");
            },
          ),
          InkWell(
            child: Container(
                margin: EdgeInsets.only(right: 20),
                width: 120,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.cyan[300],
                    borderRadius: BorderRadius.circular(5.0)),
                child: Center(
                  child: Text(
                    "立即推荐",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                )),
            onTap: () {
              ExtendedNavigator.of(context).replace(Routes.wechatHomeScreen,
                  arguments: WechatHomeScreenArguments(
                    affData: widget.affData,
                    msgPageTabIndex: 2,
                  ));
              // BotToast.showText(text: "立即推荐");
            },
          )
        ],
      ),
    );
  }
}
