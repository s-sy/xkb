import 'dart:async';
// import 'dart:io';
import 'dart:convert';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:amap_flutter_location/amap_flutter_location.dart';
// import 'package:amap_flutter_location/amap_location_option.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_ui/application/wxpage/choose_tented/choosetented_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:amap_location_fluttify/amap_location_fluttify.dart';

class PlatformPage extends StatefulWidget {
  @override
  _PlatformPageState createState() => _PlatformPageState();
}

class _PlatformPageState extends State<PlatformPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ChoosetentedBloc, ChoosetentedState>(
      listener: (context, state) {},
      child: ChooseTented(),
    );
  }
}

class ChooseTented extends StatefulWidget {
  @override
  _ChooseTentedState createState() => _ChooseTentedState();
}

class _ChooseTentedState extends State<ChooseTented> {
  GestureRecognizer _recognizer;
  String _textFeid = "";
  Location _location;
  bool _isSearch = false;
  List _searchList = [];

  @override
  void dispose() {
    super.dispose();
    _recognizer.dispose();
    _recognizer = null;
  }

  @override
  void initState() {
    super.initState();
    getLoation();
    _recognizer = ImmediateMultiDragGestureRecognizer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChoosetentedBloc, ChoosetentedState>(
      listener: (context, state) {},
      // child: BlocBuilder<ChoosetentedBloc, ChoosetentedState>(
      builder: (context, state) {
        return Listener(
          onPointerDown: (PointerEvent event) {
            _recognizer.addPointer(event);
            FocusScope.of(context).requestFocus(FocusNode());
            print('手指按下回调');
          },
          child: Scaffold(
            appBar: AppBar(
                title: Text("平台选择", style: TextStyle(color: Colors.grey[700])),
                elevation: 0.0,
                brightness: Brightness.light,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.grey[700])),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    searchHeader(state.platList),
                    if (_location != null)
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Text(
                          "当前定位城市",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    if (_location != null)
                      Container(
                        margin: EdgeInsets.only(left: 0, top: 5),
                        child: Text(
                          _location.district,
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    Container(
                      margin: EdgeInsets.only(left: 0, top: 5),
                      width: 500,
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 0.8, color: Colors.grey[200])),
                      ),
                      child: SizedBox(),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Text(
                        "热门城市",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    if (state.hotcity.length != 0)
                      hotCity(state.hotcity, context),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Text(
                        "手动选择",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    if (state.pacd.length != 0)
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                child: Text(
                                  "省",
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              OutlineButton(
                                child: Text(state.platformProvince),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                textColor: state.platformProvince == "选择"
                                    ? Colors.grey[600]
                                    : Colors.blue,
                                borderSide: BorderSide(
                                    color: state.platformProvince == "选择"
                                        ? Colors.grey
                                        : Colors.blue),
                                onPressed: () async {
                                  await _openModalBottomSheetText(
                                      state.pacd, "A");
                                },
                              ),
                            ],
                          ),
                          if (state.provinceIndex >= 0 &&
                              state.pacd[state.provinceIndex]["cityList"]
                                      .length >
                                  0)
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  child: Text(
                                    "市",
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                OutlineButton(
                                  child: Text(state.platformCity),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  textColor: state.platformCity == "选择"
                                      ? Colors.grey[600]
                                      : Colors.blue,
                                  borderSide: BorderSide(
                                      color: state.platformCity == "选择"
                                          ? Colors.grey
                                          : Colors.blue),
                                  onPressed: () async {
                                    _openModalBottomSheetText(
                                        state.pacd[state.provinceIndex]
                                            ["cityList"],
                                        "B");
                                  },
                                ),
                              ],
                            ),
                          if (state.provinceIndex >= 0 &&
                              state.cityIndex >= 0 &&
                              state
                                      .pacd[state.provinceIndex]["cityList"]
                                          [state.cityIndex]["areaList"]
                                      .length >
                                  0)
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  child: Text(
                                    "区",
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                OutlineButton(
                                  child: Text(state.platformCountry),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  textColor: state.platformCountry == "选择"
                                      ? Colors.grey[600]
                                      : Colors.blue,
                                  borderSide: BorderSide(
                                      color: state.platformCountry == "选择"
                                          ? Colors.grey
                                          : Colors.blue),
                                  onPressed: () async {
                                    await _openModalBottomSheetText(
                                        state.pacd[state.provinceIndex]
                                                ["cityList"][state.cityIndex]
                                            ["areaList"],
                                        "C");
                                  },
                                ),
                              ],
                            ),
                        ],
                      ),
                    // if (state.pacd.length != 0)
                    // Column(
                    //   children: [
                    //     selectPlatform("省", state.pacd),
                    //     if (state.provinceIndex >= 0 &&
                    //         state.pacd[state.provinceIndex]["cityList"].length >
                    //             0)
                    //       selectPlatform(
                    //           "市", state.pacd[state.provinceIndex]["cityList"]),
                    //     if (state.provinceIndex >= 0 &&
                    //         state.cityIndex >= 0 &&
                    //         state
                    //                 .pacd[state.provinceIndex]["cityList"]
                    //                     [state.cityIndex]["areaList"]
                    //                 .length >
                    //             0)
                    //       selectPlatform(
                    //           "区",
                    //           state.pacd[state.provinceIndex]["cityList"]
                    //               [state.cityIndex]["areaList"]),
                    //   ],
                    // ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Text(
                        "城市平台选择列表",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Wrap(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          (_isSearch ? _searchList : state.showPat).map((item) {
                        // return Container(
                        //   child: Row(
                        //     children: [],
                        //   ),
                        // );
                        return InkWell(
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 12, right: 8, top: 5, bottom: 5),
                            margin: EdgeInsets.only(top: 10, right: 10.0),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1.0, color: Colors.blue),
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Text(
                              item["platformName"] + " ",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          onTap: () async {
                            print(item);
                            SharedPreferences sharedPreferences =
                                await SharedPreferences.getInstance();
                            sharedPreferences.setString(
                                "ProjectTenant", json.encode(item));
                            ExtendedNavigator.of(context)
                                .push(Routes.wechatNoticePage,
                                    arguments: WechatNoticePageArguments(
                                      platData: item,
                                    ));
                          },
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      // )
    );
  }

  Future<bool> requestPermission() async {
    final permissions = await Permission.locationWhenInUse.request();

    if (permissions.isGranted) {
      return true;
    } else {
      BotToast.showText(text: '需要定位权限!');
      return false;
    }
  }

  getLoation() async {
    if (await requestPermission()) {
      final location = await AmapLocation.instance.fetchLocation();
      print(location);
      setState(() => _location = location);
    }
  }

  searchHeader(List list) {
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
                hintText: "搜索客户",
                prefixIcon:
                    Icon(Icons.search, color: Colors.grey[400], size: 20),
                border: InputBorder.none,
                isDense: true,
                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 16),
              ),
              controller: TextEditingController.fromValue(
                TextEditingValue(
                  text: _textFeid,
                  // 保持光标在最后
                  selection: TextSelection.fromPosition(TextPosition(
                    affinity: TextAffinity.downstream,
                    offset: _textFeid.length,
                  )),
                ),
              ),
              onChanged: (val) {
                //一般是点击确定才出来，可能邓总要加的
              },
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
                    if (list[i]['platformName'].indexOf(val) != -1) {
                      _searchList.add(list[i]);
                    }
                  }
                  setState(() {
                    _isSearch = true;
                    _textFeid = val;
                  });
                  if (_searchList.length == 0) {
                    BotToast.showText(text: "暂无此楼盘哦");
                  }
                }
                BlocProvider.of<ChoosetentedBloc>(context)
                    .add(ChoosetentedEvent.resetSearch());
              }),
        ));
  }

  hotCity(List list, context) {
    return list.length > 0
        ? Container(
            margin: EdgeInsets.only(left: 10),
            child: Wrap(
              spacing: 20,
              runSpacing: 0,
              children: list.map((item) {
                return OutlineButton(
                  // padding: EdgeInsets.only(left: 25, right: 5),
                  child: Text(
                    item["name"],
                    style: TextStyle(
                        color: item["states"] ? Colors.blue : Colors.grey[600]),
                  ),
                  borderSide: BorderSide(
                      color: item["states"] ? Colors.blue : Colors.grey),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () {
                    setState(() {
                      _isSearch = false;
                      _textFeid = "";
                    });
                    BlocProvider.of<ChoosetentedBloc>(context)
                        .add(ChoosetentedEvent.changhotcity(item));
                  },
                );
              }).toList(),
            ),
          )
        : SizedBox();
  }

  selectPlatform(String place, List list) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Text(
              place,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: list.map((item) {
                  return InkWell(
                    child: Container(
                      margin: EdgeInsets.only(right: 15.0),
                      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.0, color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Text(
                        item["name"],
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    onTap: () {},
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future _openModalBottomSheetText(list, type) async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 230.0,
                margin: EdgeInsets.only(top: 20),
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
                            "  " + list[i]["name"] + "  ",
                            // maxLines: 1,
                            // overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        onTap: () async {
                          print(list[i]["name"]);
                          Navigator.of(context).pop(list[i]);
                          // Navigator.of(context).pop(true);
                          setState(() {
                            _isSearch = false;
                            _textFeid = "";
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: Text('取消',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.blue[200])),
                ),
                onTap: () {
                  Navigator.pop(context, '取消');
                },
              ),
            ],
          );
        }).then((value) {
      if (value == null || value == "取消") {
        return;
      }
      BlocProvider.of<ChoosetentedBloc>(context)
          .add(ChoosetentedEvent.chahgeShowPlat(type, value));
    });
  }
}
