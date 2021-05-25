import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/wxpage/wechat_mine/wechat_mine_bloc.dart';
import 'package:flutter_ui/injection.dart';

class WechatFollowHouse extends StatefulWidget {
  @override
  _WechatFollowHouseState createState() => _WechatFollowHouseState();
}

class _WechatFollowHouseState extends State<WechatFollowHouse> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<WechatMineBloc>()..add(WechatMineEvent.getApartmentConcern()),
      child: BlocConsumer<WechatMineBloc, WechatMineState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                title: Text("关注户型", style: TextStyle(color: Colors.grey[700])),
                elevation: 0.0,
                brightness: Brightness.light,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.grey[700])),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    // Container(
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Container(
                    //         decoration: BoxDecoration(
                    //           border: Border(
                    //               bottom: BorderSide(
                    //                   width: 0.8, color: Colors.grey[200])),
                    //         ),
                    //         child: Text("新邦一号" + "三室两厅两卫"),
                    //       ),
                    //       Row(
                    //         children: [],
                    //       )
                    //     ],
                    //   ),
                    // ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(color: Colors.white),
                      // height: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(3, 8, 0, 8),
                            child: Text(
                              "新邦一号" + "三室两厅两卫" + " ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 8),
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 0.8, color: Colors.grey[200])),
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  width: 120,
                                  height: 100,
                                  margin: EdgeInsets.only(left: 2, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://image.kehuoa.com/1353183630993920000/material/8a2d5f07-13c9-41e6-afbc-5c4b5b1f3a5f.png'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Expanded(
                                    child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        Text("188m",
                                            style: TextStyle(
                                                color: Colors.grey[500],
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500)),
                                        SizedBox(width: 20),
                                        Text("EFC-12",
                                            style: TextStyle(
                                                color: Colors.grey[500],
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 8, bottom: 0),
                                      child: Text("天门市西湖南路与路遇大道交汇处",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          // "约" + totalPriceHouse(map) + "万/套",
                                          "约" + "118.44" + "万/套",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(width: 15),
                                        RaisedButton(
                                            color: Colors.blue,
                                            textColor: Colors.white,
                                            splashColor: Colors.lightBlueAccent,
                                            child: Text("联系我们"),
                                            onPressed: () {})
                                      ],
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          )
                        ],
                      ),
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

  isEmptyData() {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          // margin: EdgeInsets.fromLTRB(5.0, 0, 10.0, 0),
          decoration: BoxDecoration(
            // border: Border.all(width: 1.0, color: Colors.grey[300]),
            image: DecorationImage(
                image: NetworkImage(
                    'https://img.0728jh.com/staticImg/konghu_gz.png'),
                fit: BoxFit.cover),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Text(
            "暂时没有关注户型",
            style: TextStyle(
                color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 40, 0, 20),
          width: 200,
          height: 50,
          child: RaisedButton(
            splashColor: Colors.lightBlueAccent,
            child: Text("去关注",
                style: TextStyle(color: Colors.white, fontSize: 18)),
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
                  }).then((value) async {
                print("balabalabali");
              });
            },
            textColor: Colors.white,
            color: Colors.cyan,
            elevation: 2,
          ),
        )
      ],
    );
  }

  //   totalPriceHouse(Map<String, dynamic> map) {
  //   String finalPrice = "";
  //   // print(map);
  //   // print(widget.affData["price"]);
  //   try {
  //     if (map["price"] != "") {
  //       double price = 0.0;
  //       price =
  //           double.parse(map["price"]) * double.parse(map["floorage"]) / 10000;
  //       finalPrice = price.toStringAsFixed(2);
  //     } else {
  //       if (widget.affData["price"] != "" && widget.affData["price"] != null) {
  //         double price = 0.0;
  //         price = double.parse(widget.affData["price"]) *
  //             double.parse(map["floorage"]) /
  //             10000;
  //         finalPrice = price.toStringAsFixed(2);
  //       } else {
  //         finalPrice = "价格待定";
  //       }
  //     }
  //   } on FormatException catch (e) {
  //     print('出现FormatException: $e');
  //   } on Exception catch (e) {
  //     print('Exception: $e');
  //   }
  //   return finalPrice;
  // }
}
