import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_ui/application/wxpage/choose_aff/chooseaff_bloc.dart';
import 'package:marquee_flutter/marquee_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WechatNoticePage extends StatefulWidget {
  final Map<String, Object> platData;
  WechatNoticePage(this.platData);
  @override
  _WechatNoticePageState createState() => _WechatNoticePageState();
}

class _WechatNoticePageState extends State<WechatNoticePage> {
  List _searchList = [];
  bool _isSearch = false;
  String _textFeid = "";
  List listArea = ["天门", "黄石", "襄阳", "仙桃", "潜江", "京山"];
  String area = "全国";
  List listImg = [
    "https://image.kehuoa.com/1353183630993920000/material/8a2d5f07-13c9-41e6-afbc-5c4b5b1f3a5f.png",
    "https://image.kehuoa.com/1353183630993920000/material/25dcb9fc-40cb-440e-a762-5e2fc779132c.jpg",
    "https://img.0728jh.com/1332139872148000768/material/27423068-a1b7-418c-9402-140a4f1220e4.jpg",
    "https://image.kehuoa.com/1353183630993920000/material/dfa940e5-ebb8-487e-b6de-1ccdd10b3528.jpg",
    "https://image.kehuoa.com/1353183630993920000/material/93396471-5aac-496c-8892-437da2c8c770.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChooseaffBloc>()
        ..add(ChooseaffEvent.started(widget.platData))
        ..add(ChooseaffEvent.savetendent(widget.platData)),
      child: BlocConsumer<ChooseaffBloc, ChooseaffState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                title: Text("首页", style: TextStyle(color: Colors.grey[700])),
                elevation: 0.0,
                brightness: Brightness.light,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.grey[700])),
            backgroundColor: Colors.blue[100],
            body: SingleChildScrollView(
              child: Listener(
                onPointerDown: (onPointerDown) {
                  FocusScope.of(context).requestFocus(FocusNode());
                  print('手指按下回调');
                },
                child: Stack(
                  children: [
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   height: MediaQuery.of(context).size.height,
                    //   decoration: BoxDecoration(color: Colors.blue[50]),
                    // ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0)),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://img.0728jh.com/staticImg/bannerbg.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          // Container(
                          //     margin: EdgeInsets.only(top: 10),
                          //     child: Center(
                          //       child: Text(
                          //         "首页",
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontSize: 20,
                          //             fontWeight: FontWeight.w400),
                          //       ),
                          //     )),
                          search(state.affList),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: 170,
                            child: Swiper(
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                        image: NetworkImage(listImg[index]),
                                        fit: BoxFit.cover),
                                  ),
                                );
                              },
                              itemCount: 5,
                              pagination: SwiperPagination(),
                              // control: SwiperControl(),
                            ),
                          ),
                          notice(),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(top: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10, top: 10),
                                  child: Text(
                                    "项目列表",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Column(
                                    children: (_isSearch
                                            ? _searchList
                                            : state.affList)
                                        .map((item) {
                                  return InkWell(
                                    onTap: () async {
                                      SharedPreferences sharedPreferences =
                                          await SharedPreferences.getInstance();
                                      sharedPreferences.setString(
                                          "ProjectItem", json.encode(item));
                                      ExtendedNavigator.of(context).push(
                                          Routes.wechatHomeScreen,
                                          arguments: WechatHomeScreenArguments(
                                            affData: item,
                                            msgPageTabIndex: 0,
                                          ));
                                    },
                                    child: content(item),
                                  );
                                }).toList()),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
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

  Widget content(obj) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 210,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
            image: NetworkImage(obj["firstFigure"]
                // "https://img.0728jh.com/1332139872148000768/material/27423068-a1b7-418c-9402-140a4f1220e4.jpg"
                ),
            fit: BoxFit.cover),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 210,
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 10.0),
                      padding: EdgeInsets.fromLTRB(8, 1, 8, 1),
                      decoration: BoxDecoration(
                          color: obj["salesStatus"] == "0"
                              ? Colors.red
                              : obj["salesStatus"] == "1"
                                  ? Colors.green
                                  : obj["salesStatus"] == "2"
                                      ? Colors.orange
                                      : Colors.white,
                          borderRadius: BorderRadius.circular(2.0)),
                      child: Center(
                        child: Text(
                          obj["salesStatus"] == "0"
                              ? "热销"
                              : obj["salesStatus"] == "1"
                                  ? "即开"
                                  : obj["salesStatus"] == "2"
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
                        children: getTagList(obj).map((item) {
                      return Container(
                        margin: EdgeInsets.only(left: 10, top: 10.0),
                        padding: EdgeInsets.fromLTRB(8, 1, 8, 1),
                        decoration: BoxDecoration(
                            color: Colors.grey[600],
                            borderRadius: BorderRadius.circular(2.0)),
                        child: Center(
                          child: Text(
                            " " + item + " ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      );
                    }).toList()),
                  ],
                ),
              ),
            ),
            Expanded(child: SizedBox()),
            Container(
              margin: EdgeInsets.only(left: 4),
              child: Text(
                " " + obj["projectName"] + " ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                "约${obj["price"]}元/平方米",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  // child: SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text(
                      " " + obj["address"] + " ",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  // ),
                ),
                Container(
                  width: 135,
                  // decoration:
                  //     BoxDecoration(color: Colors.yellow),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.whatshot,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5, right: 10),
                        child: Text(
                          obj["views"].toString() + "人想买",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  List<String> getTagList(data) {
    List<String> kkk = data["keywords"].split(' ');
    return kkk;
  }

  notice() {
    return Container(
      margin: EdgeInsets.only(top: 13),
      height: 45,
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, right: 10.0),
            height: 20,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(5.0)),
            child: Center(
              child: Text(
                "公告栏",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(right: 10),
            child: MarqueeWidget(
              text: "喜迎五一！楚天世纪城 “幸运大转盘”转起来了！",
              textStyle: TextStyle(color: Colors.grey[700], fontSize: 14),
              scrollAxis: Axis.horizontal,
            ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Text(
            //     "喜迎五一！楚天世纪城 “幸运大转盘”转起来了！",
            //     style: TextStyle(color: Colors.grey[700], fontSize: 14),
            //   ),
            // )
          ))
        ],
      ),
    );
  }

  search(List list) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        children: [
          InkWell(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.0, right: 0.0),
                  child: Text(
                    area,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  child: Icon(Icons.arrow_drop_down),
                ),
              ],
            ),
            onTap: () {
              _openModalBottomSheetText(getTag(list));
            },
          ),

          Container(
            height: 20,
            margin: EdgeInsets.only(left: 5.0, right: 5.0),
            decoration: BoxDecoration(
                border:
                    Border(left: BorderSide(width: 0.8, color: Colors.grey))),
          ),
          Icon(Icons.search, color: Colors.grey[400], size: 20),
          Expanded(
            child: TextField(
                maxLines: 1,
                textInputAction: TextInputAction.go,
                decoration: InputDecoration(
                  hintText: "请输入您要搜索的项目名称",
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey[400], fontSize: 16),
                ),
                // controller: TextEditingController.fromValue(
                //   TextEditingValue(
                //     text: _textFeid,
                //     selection:
                //         TextSelection.fromPosition(TextPosition(
                //       affinity: TextAffinity.downstream,
                //       offset: _textFeid.length,
                //     )),
                //   ),
                // ),
                onChanged: (val) {},
                onSubmitted: (val) {
                  _searchList = [];
                  if (val == "") {
                    setState(() {
                      _textFeid = val;
                      _isSearch = false;
                    });
                  } else {
                    print(list);
                    for (int i = 0; i < list.length; i++) {
                      if (list[i]['projectName'].indexOf(val) != -1) {
                        _searchList.add(list[i]);
                      }
                    }
                    setState(() {
                      _isSearch = true;
                      _textFeid = val;
                    });
                  }
                }),
          )

          // searchHeader(),
        ],
      ),
    );
  }

  getTag(List list) {
    List listTag = [];
    for (int i = 0; i < list.length; i++) {
      if (!listTag.contains(list[i]["region"])) {
        listTag.add(list[i]["region"]);
      }
    }
    return listTag;
  }

  Future _openModalBottomSheetText(List list) async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                  height: 240.0,
                  child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, i) => Container(
                          height: 50,
                          child: Center(
                            child: InkWell(
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  list[i],
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
                                  area = list[i];
                                });
                                Navigator.pop(context, true);
                              },
                            ),
                          )))),
              // ListTile(
              //   title: Text('新增',
              //       textAlign: TextAlign.center,
              //       style: TextStyle(color: Colors.blue)),
              //   onTap: () {
              //     showDialog(
              //         barrierDismissible: true,
              //         context: context,
              //         builder: (context) {
              //           return AlertDialog(
              //             title: Text("提示"),
              //             content: TextField(
              //               maxLines: 5,
              //               minLines: 1,
              //               textInputAction: TextInputAction.go,
              //               decoration: InputDecoration(
              //                 hintText: '请输入内容(不能用新增吧)',
              //                 border: InputBorder.none,
              //                 isDense: true,
              //                 hintStyle: TextStyle(color: Colors.grey[400]),
              //               ),
              //             ),
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
              ListTile(
                title: Text(
                  '取消',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue[200]),
                ),
                onTap: () {
                  Navigator.pop(context, '取消');
                },
              ),
            ],
          );
        });
    // print(option);
  }

  searchHeader() {
    return Container(
        height: 50,
        // decoration: BoxDecoration(color: Colors.white),
        child: Container(
          height: 40.0,
          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.grey[200]),
          child: TextField(
              maxLines: 1,
              textInputAction: TextInputAction.go,
              decoration: InputDecoration(
                hintText: "请输入您要搜索的项目名称",
                prefixIcon:
                    Icon(Icons.search, color: Colors.grey[400], size: 20),
                border: InputBorder.none,
                isDense: true,
                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 16),
              ),
              controller: TextEditingController.fromValue(
                TextEditingValue(
                  text: _textFeid,
                  selection: TextSelection.fromPosition(TextPosition(
                    affinity: TextAffinity.downstream,
                    offset: _textFeid.length,
                  )),
                ),
              ),
              onChanged: (val) {},
              onSubmitted: (val) {}),
        ));
  }
}
