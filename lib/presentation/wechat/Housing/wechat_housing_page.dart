import 'dart:io';

import 'package:amap_search_fluttify/amap_search_fluttify.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_ui/presentation/components/chat/public.dart';
import 'package:flutter_ui/presentation/components/gtmaps.dart';
import 'package:flutter_ui/presentation/home/message/processed/processed_photo_view.dart';
import 'package:flutter_ui/presentation/home/message/processed/processed_photoshow_view.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';
import 'package:flutter_ui/application/wxpage/wechat_home_page/wechathomepage_bloc.dart';
import 'package:flutter_ui/presentation/wechat/Housing/wechat_news_information.dart';
import 'package:ota_update/generated/i18n.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class WechatHousingPage extends StatefulWidget {
  final Map<String, dynamic> affData;

  const WechatHousingPage({Key key, this.affData}) : super(key: key);

  @override
  _WechatHousingPageState createState() => _WechatHousingPageState();
}

const SALEMANONE = "SALEMANONE";

class _WechatHousingPageState extends State<WechatHousingPage>
    with AmapSearchDisposeMixin {
  String imgWhenNull =
      "https://img.0728jh.com/1332139872148000768/material/fb625605-48d3-4e89-b58e-cbda5b568beb.jpeg";
  // List listNews = [
  //   {
  //     "img":
  //         "https://image.kehuoa.com/1353183630993920000/material/93396471-5aac-496c-8892-437da2c8c770.jpg",
  //     "title": "波澜河景配大户型，盛世江尚给你五星级的居住体验",
  //     "tag": "置业导购",
  //     "time": "2021.04.01",
  //     "readNum": "15"
  //   },
  // ];
  // List listPic = [
  //   'https://www.itying.com/images/flutter/1.png',
  //   'https://www.itying.com/images/flutter/2.png',
  //   'https://www.itying.com/images/flutter/3.png',
  //   'https://www.itying.com/images/flutter/3.png',
  //   'https://www.itying.com/images/flutter/5.png',
  //   'https://www.itying.com/images/flutter/6.png',
  // ];
  bool isSalemanOne = false;
  SharedPreferences sharPre;
  @override
  void initState() {
    // AmapCore.init('7cf6ca84921fbeb6d6ed5641f0f877e0');
    super.initState();
    getSalemanOne();
  }

  Future<String> getSalemanOne() async {
    SharedPreferences sharPre = await SharedPreferences.getInstance();
    String salemanOne = sharPre.get("SALEMANONE");
    print(salemanOne);
    if (salemanOne != null) {
      isSalemanOne = true;
    } else {
      isSalemanOne = false;
    }
    return salemanOne;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WechathomepageBloc>()
        ..add(WechathomepageEvent.started(widget.affData))
        ..add(WechathomepageEvent.getNotice())
        ..add(WechathomepageEvent.getapartmentlayout())
        ..add(WechathomepageEvent.getAwesomeshooting())
        ..add(WechathomepageEvent.getreadingReviews())
        ..add(WechathomepageEvent.gettotalviews())
        ..add(WechathomepageEvent.getQuestionsPage())
        ..add(WechathomepageEvent.getNewsinformation())
        ..add(WechathomepageEvent.getTaills()),
      child:
          // BlocConsumer<WechathomepageBloc, WechathomepageState>(
          //   listener: (context, state) async {
          //     sharPre = await SharedPreferences.getInstance();
          //   },
          //   builder: (context, state) {
          Scaffold(
        appBar: AppBar(
            title: Text(
                // "新邦一号",
                widget.affData["projectName"] ?? "",
                style: TextStyle(color: Colors.grey[700])),
            // leading: IconButton(
            //     icon: Icon(Icons.home),
            //     onPressed: () {
            //       ExtendedNavigator.of(context).push(Routes.platformPage);
            //     }),
            centerTitle: false,
            elevation: 0.0,
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.grey[700])),
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Column(
            children: [
              BlocConsumer<WechathomepageBloc, WechathomepageState>(
                  listener: (context, state) async {
                sharPre = await SharedPreferences.getInstance();
              }, builder: (context, state) {
                return Column(
                  children: [
                    if (state.swiperList.length != 0)
                      Container(
                        width: MediaQuery.of(context).size.width * 1.0,
                        height: 170,
                        child: Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return Image.network(
                              state.swiperList[index]["url"],
                              //  "https://img.0728jh.com/1332139872148000768/material/27423068-a1b7-418c-9402-140a4f1220e4.jpg",
                              fit: BoxFit.fill,
                            );
                          },
                          itemCount: state.swiperList.length,
                          pagination: SwiperPagination(),
                          // control: SwiperControl(),
                        ),
                      ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                // "新邦一号",
                                widget.affData["projectName"] + " ",
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 0),
                              RatingBar.builder(
                                itemSize: 20,
                                initialRating: 3,
                                minRating: 2,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 0.0),
                                itemBuilder: (context, i) =>
                                    Icon(Icons.star, color: Colors.amber),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Row(
                              children: [
                                Text(
                                  "浏览量:" + widget.affData["views"].toString(),
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  state.totalviews.containsKey("data")
                                      ? "评论:" +
                                          state.totalviews["data"]
                                                  ["topicReplyCount"]
                                              .toString()
                                      : "评论:0",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
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
                                            : widget.affData["salesStatus"] ==
                                                    "1"
                                                ? Colors.green
                                                : widget.affData[
                                                            "salesStatus"] ==
                                                        "2"
                                                    ? Colors.orange
                                                    : Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(3.0)),
                                    child: Center(
                                      child: Text(
                                        widget.affData["salesStatus"] == "0"
                                            ? "热销"
                                            : widget.affData["salesStatus"] ==
                                                    "1"
                                                ? "即开"
                                                : widget.affData[
                                                            "salesStatus"] ==
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
                                      children: getTagList(widget.affData)
                                          .map((item) {
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
                          Container(
                            margin: EdgeInsets.only(top: 25),
                            height: 50.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                houseData(
                                    "参考均价", widget.affData["price"] + "元/m²"),
                                centerLine(),
                                houseData(
                                    "开盘时间", widget.affData["openingDate"]),
                                centerLine(),
                                houseData(
                                    "户型面积", widget.affData["floorage"] + "m²"),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Row(
                              children: [
                                Icon(Icons.pin_drop,
                                    color: Colors.cyan, size: 25),
                                SizedBox(width: 3),
                                Expanded(
                                  child: Text(
                                      // "天门市西湖南路与陆羽大道交汇处",
                                      widget.affData["address"],
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                      overflow: TextOverflow.ellipsis),
                                ),
                                Material(
                                    child: Ink(
                                  child: InkWell(
                                    splashColor: Colors.cyan[100],
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1.0,
                                              color: Colors.cyan[300]),
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      child: Text(
                                        "更多详情",
                                        style: TextStyle(
                                            color: Colors.cyan[300],
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    onTap: () {
                                      ExtendedNavigator.of(context).push(
                                          Routes.wechatHouseInfo,
                                          arguments: WechatHouseInfoArguments(
                                              affData: widget.affData));
                                    },
                                  ),
                                )),
                              ],
                            ),
                          ),
                          // Container(
                          //   margin: EdgeInsets.only(top: 15),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       remindTag("降价通知", Icons.trending_down),
                          //       remindTag("开盘提醒", Icons.alarm),
                          //     ],
                          //   ),
                          // ),
                          callPhone(),
                          title("推荐户型"),
                          if (state.apartmentlayout.length != 0)
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children:
                                      state.apartmentlayout.map<Widget>((item) {
                                    return houseType(
                                        item, Colors.red, Colors.purple[50]);
                                  }).toList()),
                            ),
                          title("置业顾问"),
                          if (state.salesman.length != 0)
                            isSalemanOne
                                ? salemanOne()
                                : salemans(state.salesman),
                          title("新闻动态"),
                          if (state.newsinformation.length != 0)
                            news(state.newsinformation),
                          title("楼盘点评"),
                          if (state.readingReviews.length != 0)
                            contentRemark(state.readingReviews),
                          submitButton("我要点评"),
                          title("楼盘问答"),
                          if (state.questionsPage.length != 0)
                            questions(state.questionsPage[0]),
                          title("楼盘炫拍"),
                          if (state.awesomeshooting.length != 0)
                            contentPicture(state.awesomeshooting[0]),
                          submitButton("我要发布"),
                          title("周边配套"),
                        ],
                      ),
                    ),
                  ],
                );
              }),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: GtMaps(widget.affData),
              )
            ],
          ),
        ),
      ),
      //   },
      // ),
    );
  }

  callPhone() {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(top: 5),
        width: MediaQuery.of(context).size.width,
        height: 105,
        padding: EdgeInsets.only(bottom: 18, right: 25),
        decoration: BoxDecoration(
          // color: Colors.yellow,
          borderRadius: BorderRadius.circular(5.0),
          image: DecorationImage(
              image: NetworkImage(
                  "https://img.0728jh.com/staticImg/b3d7a72cdde497d9ab42fc88956da66.png"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Text(
            widget.affData["premisesMobile"],
            // "15612345678",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      onTap: () {
        showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("提示"),
              content: Text("是否拨打电话:" + widget.affData["premisesMobile"]),
              actions: <Widget>[
                FlatButton(
                  child: Text("取消", style: TextStyle(color: Colors.blue[200])),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                FlatButton(
                  child: Text("确定"),
                  onPressed: () async {
                    String url = 'tel:' + widget.affData["premisesMobile"];
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
      },
    );
  }

  contentPicture(Map<String, dynamic> map) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 5.0),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // if (map["userInfo"] != null)
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.fromLTRB(5.0, 0, 10.0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    image: DecorationImage(
                        image: NetworkImage((map["userInfo"] != null &&
                                    map["userInfo"]["headimgUrl"] != null)
                                ? map["userInfo"]["headimgUrl"]
                                : imgWhenNull
                            // 'https://www.itying.com/images/flutter/4.png',
                            ),
                        fit: BoxFit.cover),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        (map["userInfo"] != null &&
                                map["userInfo"]["nickName"] != null)
                            ? map["userInfo"]["nickName"]
                            : "匿名用户",
                        // "谢永强",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                Expanded(child: SizedBox()),
                Container(
                  margin: EdgeInsets.only(right: 10.0),
                  child: Text(map["createTime"],
                      // "2021-04-14 18:09",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 10, 10.0, 0),
              child: Text(
                map["content"],
                // "新邦一号位于东湖边上，生活设施齐全，小区绿化面积非常高，附近中小学一应俱全，是非常不错的选择。",
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              height: getHeight(map["picUrls"]),
              width: 200,
              margin: EdgeInsets.fromLTRB(15, 10, 10, 10),
              child: girdView(map["picUrls"]),
            ),
            Row(
              children: [
                Expanded(child: SizedBox()),
                Icon(Icons.remove_red_eye_outlined,
                    size: 18, color: Colors.grey[400]),
                Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 15, 0),
                  child: Text(map["views"].toString(),
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                ),
                Icon(Icons.chat_outlined, size: 18, color: Colors.grey[400]),
                Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 15, 0),
                  child: Text(
                      getNumAnswer(map["listTopicReply"]).length.toString(),
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                ),
                Icon(Icons.thumb_up_outlined,
                    size: 18, color: Colors.grey[400]),
                Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 10, 0),
                  child: Text(map["likes"].toString(),
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                ),
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        ExtendedNavigator.of(context).push(Routes.wechatPictureDetails,
            arguments: WechatPictureDetailsArguments(
                map: map, affData: widget.affData));
      },
    );
  }

  List<String> getTagList(data) {
    List<String> kkk = data["keywords"].split(' ');
    return kkk;
  }

  getHeight(List list) {
    double height = 0.0;
    if (list.length <= 3) {
      height = 65.0;
    } else if (list.length > 3 && list.length <= 6) {
      height = 130.0;
    } else if (list.length > 6 && list.length <= 9) {
      height = 195.0;
    }
    return height;
  }

  girdView(List list) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 3,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) => InkWell(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            image: DecorationImage(
                image: NetworkImage(list[index]), fit: BoxFit.cover),
          ),
        ),
        onTap: () {
          _jumpToGallery(context, index, list);
        },
      ),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(1, index.isEven ? 1 : 1),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }

  _jumpToGallery(context, index, contextList) async {
    await Navigator.of(context).push(FadeRoute(
        page: PhotoViewGalleryScreen(
      images: contextList,
      index: index,
      heroTag: "ddd",
    )));
  }

  questions(Map<String, dynamic> map) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 15),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 24,
                        height: 24,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(3.0)),
                        child: Center(
                          child: Text(
                            "问",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                    Expanded(
                        child: Text(
                      map["content"],
                      // "东湖国际环境怎么样，小区绿化面积高吗？是否有湖景房？",
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ))
                  ],
                )),
            Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 24,
                        height: 24,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(3.0)),
                        child: Center(
                          child: Text(
                            "答",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                    Expanded(
                        child: Text(
                      questionName(map["listTopicReply"][0]) +
                          map["listTopicReply"][0]["details"],
                      // map["listTopicReply"][0]["userInfo"]["nickName"] +
                      //     map["listTopicReply"][0]["details"],
                      // "赵四:" + "环境不怎么样，不过有湖景房，小区绿化面积45%，可以在湖边散步。",
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ))
                  ],
                )),
            Container(
                margin: EdgeInsets.only(top: 10, left: 35),
                child: Row(
                  children: [
                    Text(
                      "全部" + map["listTopicReply"].length.toString() + "个回答 >",
                      style: TextStyle(
                          color: Colors.cyan,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    Expanded(child: SizedBox()),
                    Text(map["createTime"],
                        // "2021-04-16 16:38",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w500))
                  ],
                ))
          ],
        ),
      ),
      onTap: () {
        ExtendedNavigator.of(context).push(Routes.wechatQuestionsDetails,
            arguments: WechatQuestionsDetailsArguments(
                map: map, affData: widget.affData));
      },
    );
  }

  questionName(map) {
    String name = "";
    name = (map["userInfo"] != null && map["userInfo"]["nickName"] != null)
        ? map["userInfo"]["nickName"]
        : "匿名用户";
    return name;
  }

  contentRemark(List list) {
    return Container(
      width: MediaQuery.of(context).size.width * 1.0,
      height: 200,
      child: Swiper(
        itemBuilder: (BuildContext context, int i) {
          return InkWell(
              child: Container(
                margin: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
                padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 5.0),
                decoration: BoxDecoration(color: Colors.grey[50]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          margin: EdgeInsets.fromLTRB(5.0, 0, 10.0, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            image: DecorationImage(
                                image: NetworkImage(
                                    (list[i]["userInfo"] != null &&
                                            list[i]["userInfo"]["headimgUrl"] !=
                                                null)
                                        ? list[i]["userInfo"]["headimgUrl"]
                                        : imgWhenNull
                                    // list[i]["userInfo"]["headimgUrl"] != null
                                    //     ? list[i]["userInfo"]["headimgUrl"]
                                    //     : imgWhenNull
                                    // 'https://www.itying.com/images/flutter/3.png',
                                    ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                (list[i]["userInfo"] != null &&
                                        list[i]["userInfo"]["nickName"] != null)
                                    ? list[i]["userInfo"]["nickName"]
                                    : "匿名用户",
                                // "赵四",
                                // list[i]["userInfo"]["nickName"] ?? " ",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                            RatingBar.builder(
                              itemSize: 15,
                              initialRating: 3,
                              minRating: 2,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 0.0),
                              itemBuilder: (context, i) =>
                                  Icon(Icons.star, color: Colors.amber),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        Container(
                          margin: EdgeInsets.only(right: 10.0),
                          child: Text(list[i]["createTime"],
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10.0, 10, 10.0, 0),
                      child: Text(
                        list[i]["content"],
                        // "新邦一号位于东湖边上，生活设施齐全，小区绿化面积非常高，附近中小学一应俱全，是非常不错的选择。",
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(child: SizedBox()),
                        Icon(Icons.remove_red_eye_outlined,
                            size: 18, color: Colors.grey[400]),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 0, 15, 0),
                          child: Text(list[i]["views"].toString(),
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                        ),
                        Icon(Icons.chat_outlined,
                            size: 18, color: Colors.grey[400]),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 0, 15, 0),
                          child: Text(
                              list[i]["listTopicReply"].length.toString(),
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                        ),
                        Icon(Icons.thumb_up_outlined,
                            size: 18, color: Colors.grey[400]),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 0, 10, 0),
                          child: Text(list[i]["likes"].toString(),
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              onTap: () {
                ExtendedNavigator.of(context).push(Routes.wechatCommentDetails,
                    arguments: WechatCommentDetailsArguments(map: list[i]));
              });
        },
        itemCount: list.length,
        pagination: SwiperPagination(),
        // control: SwiperControl(),
      ),
    );
  }

  submitButton(String name) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      width: 400,
      height: 50,
      child: FlatButton(
        child: Text(name, style: TextStyle(color: Colors.cyan, fontSize: 18)),
        onPressed: () {
          if (name == "我要点评") {
            ExtendedNavigator.of(context).push(Routes.wechatSetcomment,
                arguments: WechatSetcommentArguments(affData: widget.affData));
          } else if (name == "我要发布") {
            ExtendedNavigator.of(context).push(Routes.wechatSetPicture);
          }
          // showDialog(
          //     barrierDismissible: true,
          //     context: context,
          //     builder: (context) {
          //       return AlertDialog(
          //         title: Text("提示"),
          //         content: Text("请确认是否提交"),
          //         actions: <Widget>[
          //           FlatButton(
          //             child:
          //                 Text("取消", style: TextStyle(color: Colors.blue[200])),
          //             onPressed: () {
          //               Navigator.of(context).pop(false);
          //             },
          //           ),
          //           FlatButton(
          //             child: Text("确定"),
          //             onPressed: () {
          //               Navigator.of(context).pop(true);
          //             },
          //           )
          //         ],
          //       );
          //     }).then((value) async {
          //   print("balabalabali");
          // });
        },
        // splashColor: Colors.cyan[200],
        textColor: Colors.cyan,
        color: Colors.grey[100],
        // elevation: 2,
      ),
    );
  }

  news(List list) {
    return Container(
      width: MediaQuery.of(context).size.width * 1.0,
      height: 150,
      child: Swiper(
        itemBuilder: (BuildContext context, int i) {
          return InkWell(
            child: Container(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
              height: 110,
              decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(5.0)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 90,
                    margin: EdgeInsets.fromLTRB(5, 10, 15, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      image: DecorationImage(
                          image: NetworkImage(list[i]["thumbnail"] != null
                              ? list[i]["thumbnail"]
                              : imgWhenNull),
                          fit: BoxFit.cover),
                    ),
                    child: SizedBox(),
                  ),
                  Expanded(
                    child: Container(
                      height: 110,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              list[i]["title"],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(color: Colors.grey[200]),
                            padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                            child: Text(
                                // list[0]["tag"],
                                newsTag(list[i]["category"]),
                                style: TextStyle(
                                    color: Colors.deepOrange, fontSize: 13)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                list[i]["createTime"].substring(0, 10),
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.remove_red_eye_outlined,
                                      size: 18, color: Colors.grey[400]),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(5, 0, 10, 0),
                                    child: Text(
                                      list[i]["views"].toString() + "次",
                                      style: TextStyle(
                                          color: Colors.grey[500],
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              // ExtendedNavigator.of(context).push(Routes.wechatNewsInformation,
              //     arguments: WechatNewsInformationArguments(
              //         url: list[i]["articleLink"]));
              if (Platform.isIOS) {
                print("IOS");
                _launchInWebViewOrVC(list[i]["articleLink"]);
                // _launchInWebViewOrVC("https://www.baidu.com/");
              } else if (Platform.isAndroid) {
                print("安卓");
                _launchInBrowser(list[i]["articleLink"]);
              }
            },
          );
        },
        itemCount: list.length,
        pagination: SwiperPagination(),
        // control: SwiperControl(),
      ),
    );
  }

  Future<void> _launchInWebViewOrVC(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      BotToast.showText(text: "链接异常，无法跳转新闻页面");
      // throw 'Could not launch $url';
    }
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      BotToast.showText(text: "链接异常，无法跳转新闻页面");
      print('Could not launch $url');
      // throw 'Could not launch $url';
    }
  }

  newsTag(String name) {
    String tag = "";
    switch (name) {
      case "1":
        tag = "最新优惠";
        break;
      case "2":
        tag = "楼盘活动";
        break;
      case "3":
        tag = "工程进度";
        break;
      case "4":
        tag = "置业导购";
        break;
    }
    return tag;
  }

  salemanOne() {
    String salemanOne = sharPre.get("SALEMANONE");
    Map<String, dynamic> item = jsonDecode(salemanOne);
    // print(item);
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(top: 15),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.fromLTRB(5.0, 0, 10.0, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                image: DecorationImage(
                    image: NetworkImage(item["headimgUrl"] != ""
                            ? item["headimgUrl"]
                            : imgWhenNull
                        // 'https://www.itying.com/images/flutter/2.png',
                        ),
                    fit: BoxFit.cover),
              ),
            ),
            Text(
              item["realName"] ?? "",
              // "赵四",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            Expanded(child: SizedBox()),
            Container(
              margin: EdgeInsets.only(right: 10),
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: Colors.grey[100]),
              child: Icon(
                Icons.chat,
                size: 22,
                color: Colors.cyan,
              ),
            )
          ],
        ),
      ),
      onTap: () {
        showDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("提示"),
                content: Text("是否解除该置业顾问？"),
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
            SharedPreferences sharPre = await SharedPreferences.getInstance();
            sharPre.remove("SALEMANONE");
            setState(() {
              isSalemanOne = false;
            });
          }
        });
      },
    );
  }

  salemans(List list) {
    return Column(
        children: list.map((item) {
      return InkWell(
        child: Container(
          margin: EdgeInsets.only(top: 15),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.fromLTRB(5.0, 0, 10.0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  image: DecorationImage(
                      image: NetworkImage(item["headimgUrl"] != ""
                              ? item["headimgUrl"]
                              : imgWhenNull
                          // 'https://www.itying.com/images/flutter/2.png',
                          ),
                      fit: BoxFit.cover),
                ),
              ),
              Text(
                item["realName"] ?? "",
                // "赵四",
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              Expanded(child: SizedBox()),
              Container(
                margin: EdgeInsets.only(right: 10),
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: Colors.grey[100]),
                child: Icon(
                  Icons.chat,
                  size: 22,
                  color: Colors.cyan,
                ),
              )
            ],
          ),
        ),
        onTap: () {
          showDialog(
              barrierDismissible: true,
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("提示"),
                  content: Text("是否绑定该置业顾问？"),
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
              SharedPreferences sharPre = await SharedPreferences.getInstance();
              sharPre.setString(SALEMANONE, jsonEncode(item));
              setState(() {
                isSalemanOne = true;
              });
            }
          });
        },
      );
    }).toList());
  }

  title(String name) {
    return Container(
      margin: EdgeInsets.only(top: name == "推荐户型" ? 10 : 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
                color: Colors.grey[700],
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          InkWell(
            child: Container(
                child: Text(
              name == "周边配套" ? "全屏地图 >" : "查看全部 >",
              style: TextStyle(
                  color: Colors.deepOrange[300],
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            )),
            onTap: () {
              if (name == "推荐户型") {
                ExtendedNavigator.of(context).push(Routes.wechatRecommHouse,
                    arguments:
                        WechatRecommHouseArguments(affData: widget.affData));
              } else if (name == "置业顾问") {
                ExtendedNavigator.of(context).push(Routes.wechatSalesman,
                    arguments:
                        WechatSalesmanArguments(affData: widget.affData));
                // ExtendedNavigator.of(context).push(Routes.wechatSalesman);
              } else if (name == "新闻动态") {
                ExtendedNavigator.of(context).push(Routes.wechatNews,
                    arguments: WechatNewsArguments(affData: widget.affData));
                // ExtendedNavigator.of(context).push(Routes.wechatNews);
              } else if (name == "楼盘点评") {
                ExtendedNavigator.of(context).push(Routes.wechatComment,
                    arguments: WechatCommentArguments(affData: widget.affData));
              } else if (name == "楼盘问答") {
                ExtendedNavigator.of(context).push(Routes.wechatQuestions,
                    arguments:
                        WechatQuestionsArguments(affData: widget.affData));
              } else if (name == "楼盘炫拍") {
                ExtendedNavigator.of(context).push(Routes.wechatPicture,
                    arguments: WechatPictureArguments(affData: widget.affData));
              } else if (name == "周边配套") {
                ExtendedNavigator.of(context).push(Routes.maps,
                    arguments: MapsArguments(affData: widget.affData));
              }
            },
          )
        ],
      ),
    );
  }

  houseType(Map<String, dynamic> map, Color color, Color bacColor) {
    return InkWell(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                    image: NetworkImage(
                        map["src"] != null ? map["src"] : imgWhenNull),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Text(
                    // "两室两厅一卫",
                    map["type"],
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(6.0, 1.0, 6.0, 1.0),
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: bacColor,
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Center(
                        child: Text(
                          map["salesStatus"] == "0"
                              ? "热销"
                              : map["salesStatus"] == "1"
                                  ? "即开"
                                  : map["salesStatus"] == "2"
                                      ? "售罄"
                                      : "暂无信息",
                          // "在售",
                          style: TextStyle(color: color, fontSize: 13),
                        ),
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 3),
              child: Text(
                map["name"] + " " + map["floorage"] + "m²",
                // "#EFC-12 188m²",
                style: TextStyle(color: Colors.grey[700], fontSize: 13),
              ),
            ),
            if (map.containsKey("price") && map.containsKey("floorage"))
              Container(
                margin: EdgeInsets.only(top: 3.0),
                child: Text(
                  "约" + totalPriceHouse(map) + "万/套",
                  style: TextStyle(
                      color: Colors.red[400],
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              )
          ],
        ),
      ),
      onTap: () {
        ExtendedNavigator.of(context).push(Routes.wechatHouseDetails,
            arguments:
                WechatHouseDetailsArguments(affData: widget.affData, map: map));
      },
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

  remindTag(String name, IconData icons) {
    return Container(
      width: 150,
      height: 45,
      decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.grey[200]),
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.blueGrey[50]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icons,
            color: Colors.cyan,
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              name,
              style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 16,
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

  getNumAnswer(List list) {
    List listPass = [];
    for (int i = 0; i < list.length; i++) {
      if (list[i]["auditStatus"] == "1") {
        listPass.add(list[i]);
      }
    }
    return listPass;
  }
}
