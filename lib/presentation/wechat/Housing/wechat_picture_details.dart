import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_ui/application/wxpage/picture/dazzle_the_real_estate_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/home/message/processed/processed_photo_view.dart';
import 'package:flutter_ui/presentation/home/message/processed/processed_photoshow_view.dart';

class WechatPictureDetails extends StatefulWidget {
  final Map<String, dynamic> map;
  final Map<String, dynamic> affData;

  const WechatPictureDetails({Key key, this.map, this.affData})
      : super(key: key);
  @override
  _WechatPictureDetailsState createState() => _WechatPictureDetailsState();
}

class _WechatPictureDetailsState extends State<WechatPictureDetails> {
  String imgWhenNull =
      "https://img.0728jh.com/1332139872148000768/material/fb625605-48d3-4e89-b58e-cbda5b568beb.jpeg";
  List list = [
    'https://www.itying.com/images/flutter/1.png',
    'https://www.itying.com/images/flutter/2.png',
    'https://www.itying.com/images/flutter/3.png',
    'https://www.itying.com/images/flutter/4.png',
    'https://www.itying.com/images/flutter/5.png',
    'https://www.itying.com/images/flutter/6.png',
  ];
  String value = "";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DazzleTheRealEstateBloc>()
        ..add(DazzleTheRealEstateEvent.started(widget.affData)),
      child: BlocConsumer<DazzleTheRealEstateBloc, DazzleTheRealEstateState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Listener(
            onPointerDown: (onPointerDown) {
              FocusScope.of(context).requestFocus(FocusNode());
              print('手指按下回调');
            },
            child: Scaffold(
              appBar: AppBar(
                  title:
                      Text("炫拍详情", style: TextStyle(color: Colors.grey[700])),
                  elevation: 0.0,
                  brightness: Brightness.light,
                  backgroundColor: Colors.white,
                  iconTheme: IconThemeData(color: Colors.grey[700])),
              body: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 20.0),
                        child: Column(
                          children: [
                            title(widget.affData),
                            content(widget.map),

                            // _showImage(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  bottom(context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  answer(String img, String name) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                margin: EdgeInsets.fromLTRB(15.0, 0, 8.0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  image: DecorationImage(
                      image: NetworkImage(img), fit: BoxFit.cover),
                ),
              ),
              Container(
                child: Text(
                  name,
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(50, 0, 10, 0),
            child: Text("环境不怎么样，不过有湖景房，小区绿化面积45%，可以在湖边散步。",
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15,
                    fontWeight: FontWeight.w500)),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(50, 5, 0, 0),
            child: Text(
              "2021-04-14",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }

  bottom(context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          border: Border.all(width: 1.3, color: Colors.grey[300])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              child: Container(
                  height: 45,
                  width: 200,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Center(
                    child: TextField(
                        maxLines: 1,
                        minLines: 1,
                        textInputAction: TextInputAction.go,
                        decoration: InputDecoration(
                          hintText: "写下你的评论",
                          border: InputBorder.none,
                          isDense: true,
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        onChanged: (val) {
                          setState(() {
                            value = val;
                          });
                        }),
                  ))),
          InkWell(
            child: Container(
              margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.fromLTRB(17, 7, 17, 7),
              decoration: BoxDecoration(
                  color: Colors.cyan, borderRadius: BorderRadius.circular(5.0)),
              child: Text(
                "评论",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            onTap: () {
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
                if (value && value != null) {
                  BlocProvider.of<DazzleTheRealEstateBloc>(context)
                    ..add(DazzleTheRealEstateEvent.commentdazzle(
                        value, widget.map));
                }
              });
            },
          )
        ],
      ),
    );
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

  content(Map<String, dynamic> map) {
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
      padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 5.0),
      decoration: BoxDecoration(color: Colors.white),
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
                      image: NetworkImage((map["userInfo"] != null &&
                                  map["userInfo"]["headimgUrl"] != null)
                              ? map["userInfo"]["headimgUrl"]
                              : imgWhenNull
                          // map["userInfo"]["headimgUrl"]
                          // 'https://www.itying.com/images/flutter/2.png'
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
                      // map["userInfo"]["nickName"],
                      // "谢永强",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
              Icon(Icons.thumb_up_outlined, size: 18, color: Colors.grey[400]),
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
          Column(
              children: map["listTopicReply"].map<Widget>((item) {
            if (item["auditStatus"] == "1") {
              return Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          margin: EdgeInsets.fromLTRB(15.0, 0, 8.0, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            image: DecorationImage(
                                image: NetworkImage(item["userInfo"] != null
                                    ? item["userInfo"]["headimgUrl"] != null
                                        ? item["userInfo"]["headimgUrl"]
                                        : imgWhenNull
                                    : imgWhenNull),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          child: Text(
                            item["userInfo"] != null
                                ? item["userInfo"]["nickName"] != null
                                    ? item["userInfo"]["nickName"]
                                    : "匿名用户"
                                : "匿名用户",
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(50, 0, 10, 0),
                      child: Text(item["details"],
                          // "环境不怎么样，不过有湖景房，小区绿化面积45%，可以在湖边散步。",
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(50, 5, 0, 0),
                      child: Text(
                        item["createTime"],
                        // "2021-04-14",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return SizedBox();
            }
          }).toList()),
          // answer('https://www.itying.com/images/flutter/3.png', "刘英"),
          // answer('https://www.itying.com/images/flutter/4.png', "谢永强"),
          // answer('https://www.itying.com/images/flutter/5.png', "刘能"),
        ],
      ),
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

  title(Map<String, dynamic> map) {
    return Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        height: 75,
        child: Row(
          children: [
            Container(
              width: 75,
              height: 75,
              margin: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: NetworkImage(map["firstFigure"]
                        // 'https://image.kehuoa.com/1353183630993920000/material/8a2d5f07-13c9-41e6-afbc-5c4b5b1f3a5f.png'
                        ),
                    fit: BoxFit.cover),
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Text(
                    map["projectName"] + "位于" + map["address"],
                    // "新邦一号位于天门市西湖路工人文化宫，这里环境优美，生活设施便利，是家居生活不错的选择。",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "共" +
                          widget.map["listTopicReply"].length.toString() +
                          "个炫拍回答",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Expanded(child: SizedBox()),
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
                    //         ),
                    //         SizedBox(width: 10.0)
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
            ))
          ],
        ));
  }

  _showImage() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      // controller: ScrollController(),
      child: Row(
        children: <Widget>[
          Container(
            height: list.length != 0 ? 120 : 0.0,
            margin: EdgeInsets.fromLTRB(83, 10, 0, 0),
            child: ListView.builder(
                itemCount: list.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Image.network(list[index]),
                    ),
                    onTap: () {
                      _jumpToGallery(context, index, list);
                    })),
          ),
          SizedBox(width: 15),
        ],
      ),
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
}
