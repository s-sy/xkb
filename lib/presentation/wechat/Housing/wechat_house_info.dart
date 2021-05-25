import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_ui/application/wxpage/wechat_home_page/wechathomepage_bloc.dart';
import 'package:flutter_ui/injection.dart';

class WechatHouseInfo extends StatefulWidget {
  final Map<String, dynamic> affData;

  const WechatHouseInfo({Key key, this.affData}) : super(key: key);
  @override
  _WechatHouseInfoState createState() => _WechatHouseInfoState();
}

class _WechatHouseInfoState extends State<WechatHouseInfo> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WechathomepageBloc>()
        ..add(WechathomepageEvent.houseInfo(widget.affData)),
      child: BlocConsumer<WechathomepageBloc, WechathomepageState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                title: Text("楼盘详情", style: TextStyle(color: Colors.grey[700])),
                elevation: 0.0,
                brightness: Brightness.light,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.grey[700])),
            body: Padding(
              padding: EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text(widget.affData["projectName"] + " ",
                              // "学府春天",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500)),
                        ),
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
                        //           child: Icon(Icons.share,
                        //               size: 15, color: Colors.red),
                        //         ),
                        //         SizedBox(width: 3),
                        //         Text(
                        //           "分享",
                        //           style: TextStyle(
                        //               color: Colors.grey[700],
                        //               fontSize: 14,
                        //               fontWeight: FontWeight.w500),
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        //   onTap: () {
                        //     BotToast.showText(text: "分享");
                        //   },
                        // )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding:
                                      EdgeInsets.fromLTRB(6.0, 1.0, 6.0, 1.0),
                                  margin: EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                      color: widget.affData["salesStatus"] ==
                                              "0"
                                          ? Colors.red
                                          : widget.affData["salesStatus"] == "1"
                                              ? Colors.green
                                              : widget.affData["salesStatus"] ==
                                                      "2"
                                                  ? Colors.orange
                                                  : Colors.white,
                                      borderRadius: BorderRadius.circular(3.0)),
                                  child: Center(
                                    child: Text(
                                      widget.affData["salesStatus"] == "0"
                                          ? "热销"
                                          : widget.affData["salesStatus"] == "1"
                                              ? "即开"
                                              : widget.affData["salesStatus"] ==
                                                      "2"
                                                  ? "售罄"
                                                  : "暂无信息",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                                Row(
                                    children:
                                        getTagList(widget.affData).map((item) {
                                  return Container(
                                      padding: EdgeInsets.fromLTRB(
                                          8.0, 1.0, 4.0, 1.0),
                                      margin: EdgeInsets.only(right: 15),
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(3.0)),
                                      child: Center(
                                        child: Text(
                                          item + " ",
                                          style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 13),
                                        ),
                                      ));
                                }).toList()),
                              ],
                            ),
                          ),
                        ),
                        // Container(
                        //     padding: EdgeInsets.fromLTRB(6.0, 1.0, 6.0, 1.0),
                        //     margin: EdgeInsets.only(right: 15),
                        //     decoration: BoxDecoration(
                        //         color: Colors.cyan[100],
                        //         borderRadius: BorderRadius.circular(5.0)),
                        //     child: Center(
                        //       child: Text(
                        //         "热销",
                        //         style:
                        //             TextStyle(color: Colors.red, fontSize: 13),
                        //       ),
                        //     )),
                        // houseTag("低总价"),
                        // houseTag("高档小区"),
                      ],
                    ),
                    if (state.houseInfo.length != 0)
                      Column(
                        children: [
                          houseState(
                              "销售状态:",
                              widget.affData["salesStatus"] == "0"
                                  ? "热销"
                                  : widget.affData["salesStatus"] == "1"
                                      ? "即开"
                                      : widget.affData["salesStatus"] == "2"
                                          ? "售罄"
                                          : "暂无信息"),
                          houseState("所属区域:", widget.affData["region"]),
                          houseState("最新开盘:", widget.affData["openingDate"]),
                          houseState("交房时间:",
                              state.houseInfo["projectSchedule"] ?? ""),
                          houseState("项目地址:", state.houseInfo["salesAddress"]),
                          houseState("开发商:", state.houseInfo["developers"]),
                          title("建筑规划"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              houseData(
                                  "规划面积:",
                                  (double.parse(state.houseInfo["coverArea"]) /
                                              10000)
                                          .toStringAsFixed(2) +
                                      "万m²"),
                              houseData(
                                  "建筑面积:",
                                  (double.parse(state.houseInfo["floorArea"]) /
                                              10000)
                                          .toStringAsFixed(2) +
                                      "万m²")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              houseData(
                                  "规划总户:",
                                  (state.houseInfo["planningUser"] ?? "") +
                                      "户"),
                              houseData(
                                  "车位数:",
                                  (state.houseInfo["parkingNumber"] ?? "") +
                                      "个")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              houseData("装修标准:",
                                  state.houseInfo["decorationStandard"] ?? ""),
                              houseData(
                                  "绿化率:",
                                  (state.houseInfo["greeningRate"].toString() ??
                                          "") +
                                      "%")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              houseData("建筑结构:",
                                  state.houseInfo["architecturalTypes"] ?? ""),
                              houseData(
                                  "车位配比:",
                                  state.houseInfo["parkingRatio"].toString() ??
                                      "")
                            ],
                          ),
                          title("周边配套"),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: state
                                .houseInfo["detailsInfoSurroundingList"]
                                .map<Widget>((item) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item["name"] + ": ",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    item["content"],
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              );
                            }).toList(),
                          ),
                          title("项目简介"),
                          htmlValue(state.houseInfo["description"]),
                          // Container(
                          //   margin: EdgeInsets.only(top: 10),
                          //   child: Text(state.houseInfo["description"],

                          //       // "盛世江尚地处天门市核心位置，由天门市江尚置业有限公司开发，项目位于天门河以北，人民大道以南，西临状元路，东接西湖路，周边交通发达，门口有1路、7路公交车，出行方便。项目与新城ＣＢＤ一桥之隔，尽享沃尔玛、星星影城、国贸大厦、苏宁电器等集休闲购物餐饮于一体的商业配套，让每一位业主体验到一站式购物的乐趣。周边学区有天门市新星幼儿园，天门市一小，天门市实验初中，天门高中等重点名校，还有各类培训班都在周边，让我们的小业主0到18岁教育无忧。项目紧邻天门河景观带，是市政府正在斥巨资进行改造的项目，未来将成为天门市靓丽的风景线，也是居住在沿河两岸居民的休闲步道。天门河流经本项目门前，开发商在政府建设的基础上进行第二次改造，打造成临水花园，成为业主的私家花园。",
                          //       style: TextStyle(
                          //           fontWeight: FontWeight.w500, fontSize: 13)),
                          // )
                        ],
                      )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  htmlValue(String value) {
    Widget html = Html(
      data: "" + value + "",
    );
    return html;
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

  List<String> getTagList(data) {
    List<String> kkk = data["keywords"].split(' ');
    return kkk;
  }

  title(String name) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Text(name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
    );
  }

  houseData(String title, String name) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Row(
        children: <Widget>[
          Container(
            width: 80,
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            width: 90,
            child: Text(
              name,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }

  houseTag(String name) {
    return Container(
        padding: EdgeInsets.fromLTRB(6.0, 1.0, 6.0, 1.0),
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(5.0)),
        child: Center(
          child: Text(
            name,
            style: TextStyle(color: Colors.grey[700], fontSize: 12),
          ),
        ));
  }

  houseState(String title, String name) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      child: Row(
        children: <Widget>[
          Container(
            width: 100,
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    name,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.grey[700]),
                  )))
        ],
      ),
    );
  }
}
