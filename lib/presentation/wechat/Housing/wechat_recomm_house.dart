import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/wxpage/wechat_home_page/wechathomepage_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';

class WechatRecommHouse extends StatefulWidget {
  final Map<String, dynamic> affData;

  const WechatRecommHouse({Key key, this.affData}) : super(key: key);
  @override
  _WechatRecommHouseState createState() => _WechatRecommHouseState();
}

class _WechatRecommHouseState extends State<WechatRecommHouse> {
  String imgWhenNull =
      "https://img.0728jh.com/1332139872148000768/material/fb625605-48d3-4e89-b58e-cbda5b568beb.jpeg";
  bool isSelectAll = true;
  List listTag = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WechathomepageBloc>()
        ..add(WechathomepageEvent.apartmentlayoutList(widget.affData)),
      child: BlocConsumer<WechathomepageBloc, WechathomepageState>(
        listener: (context, state) {
          setState(() {
            listTag = state.listTag;
          });
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                title: Text("户型列表", style: TextStyle(color: Colors.grey[700])),
                elevation: 0.0,
                brightness: Brightness.light,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.grey[700])),
            body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              if (state.apartmentlayoutAll.length != 0)
                                Container(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        RaisedButton(
                                          child: Text("全部"),
                                          color: isSelectAll
                                              ? Colors.blue
                                              : Colors.white,
                                          textColor: isSelectAll
                                              ? Colors.white
                                              : Colors.grey,
                                          splashColor: Colors.lightBlueAccent,
                                          onPressed: () {
                                            setState(() {
                                              isSelectAll = true;
                                              listTag.forEach((item) {
                                                item["isSelect"] = false;
                                              });
                                            });
                                          },
                                        ),
                                        SizedBox(width: 10),
                                        houseTag(state),
                                      ],
                                    ),
                                  ),
                                ),
                              if (state.apartmentlayoutAll.length != 0)
                                Column(
                                    children:
                                        showList(state).map<Widget>((item) {
                                  return content(item, state);
                                }).toList()),
                            ]),
                      ),
                    ),
                  ),
                  // bottom(),
                ]),
          );
        },
      ),
    );
  }

  showList(state) {
    List list = [];
    if (isSelectAll) {
      list = state.apartmentlayoutAll;
    } else {
      for (int j = 0; j < listTag.length; j++) {
        for (int i = 0; i < state.apartmentlayoutAll.length; i++) {
          if (listTag[j]["isSelect"] &&
              listTag[j]["category"] ==
                  state.apartmentlayoutAll[i]["category"]) {
            list.add(state.apartmentlayoutAll[i]);
          }
        }
      }
    }
    // print(list);
    return list;
  }

  houseTag(state) {
    return Row(
        children: listTag.map<Widget>((item) {
      return Container(
        margin: EdgeInsets.only(right: 10),
        child: RaisedButton(
          child: Text(item["category"] + "(" + item["num"].toString() + ")"),
          color: item["isSelect"] ? Colors.blue : Colors.white,
          textColor: item["isSelect"] ? Colors.white : Colors.grey,
          splashColor: Colors.lightBlueAccent,
          onPressed: () {
            // tagNumber(state);
            setState(() {
              isSelectAll = false;
              item["isSelect"] = !item["isSelect"];
            });
          },
        ),
      );
    }).toList());
  }

  tagNum(state) {
    List listAll = state.apartmentlayoutAll;
    List list = [];
    // print(listAll);
    for (int i = 0; i < listAll.length; i++) {
      if (!list.contains(listAll[i]["category"])) {
        list.add(listAll[i]["category"]);
      }
    }
    // print(list);
    List listNum = [];
    Map<String, dynamic> maps = {"category": "", "num": 0, "isSelect": false};
    for (int i = 0; i < list.length; i++) {
      int num = 0;
      for (int j = 0; j < listAll.length; j++) {
        if (list[i] == listAll[j]["category"]) {
          num++;
        }
      }
      maps = {"category": list[i], "num": num, "isSelect": false};
      listNum.add(maps);
    }
    // print(listNum);
    // listTag = listNum;
    return listNum;
  }

  Widget content(Map<String, dynamic> map, state) {
    return Container(
      height: 120,
      margin: EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.fromLTRB(7.0, 10.0, 7.0, 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      map["src"] != null ? map["src"] : imgWhenNull
                      // 'https://image.kehuoa.com/1353183630993920000/material/30300c6b-aaf3-4fd7-a4dd-93c40ddc7b87.jpg'
                      ),
                  fit: BoxFit.cover),
            ),
            child: SizedBox(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    // "3室2厅2卫",
                    map["type"],
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5.0),
                    padding: EdgeInsets.fromLTRB(4, 0, 4, 1),
                    decoration: BoxDecoration(
                        color: Colors.pink[100],
                        borderRadius: BorderRadius.circular(3.0)),
                    child: Text(
                      map["salesStatus"] == "0"
                          ? "热销"
                          : map["salesStatus"] == "1"
                              ? "即开"
                              : map["salesStatus"] == "2"
                                  ? "售罄"
                                  : "暂无信息",
                      // "在售",
                      style: TextStyle(color: Colors.red, fontSize: 11),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    map["name"] + " " + map["floorage"] + "m²",
                    // "A",
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  // SizedBox(width: 10),
                  // Text(
                  //   "137.05m²",
                  //   style: TextStyle(
                  //       color: Colors.grey[600],
                  //       fontSize: 13,
                  //       fontWeight: FontWeight.w500),
                  // )
                ],
              ),
              Text(
                "约" + totalPriceHouse(map) + "万/套",
                // "总价待定",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          InkWell(
            child: Container(
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
              decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.grey[400]),
                  borderRadius: BorderRadius.circular(15.0)),
              child: Text("查看更多",
                  style: TextStyle(color: Colors.grey[500], fontSize: 14)),
            ),
            onTap: () {
              // ExtendedNavigator.of(context).push(Routes.wechatRecommHouse,
              //       arguments:
              //           WechatRecommHouseArguments(affData: widget.affData));
              ExtendedNavigator.of(context).push(Routes.wechatHouseDetails,
                  arguments: WechatHouseDetailsArguments(
                      affData: widget.affData, map: map));
            },
          )
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

  bottom() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          border: Border.all(width: 1.3, color: Colors.grey[300])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            child: Container(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 18.0,
                    height: 18.0,
                    decoration: BoxDecoration(
                        color: Colors.pink[100],
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Icon(Icons.share, size: 15, color: Colors.red),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(3.0, 0, 20.0, 0),
                    child: Text(
                      "分享",
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
            onTap: () {
              BotToast.showText(text: "分享");
            },
          )
        ],
      ),
    );
  }
}
