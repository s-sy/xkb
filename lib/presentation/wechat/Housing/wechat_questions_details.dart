import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/wxpage/questions/real_estate_bloc.dart';
import 'package:flutter_ui/injection.dart';

class WechatQuestionsDetails extends StatefulWidget {
  final Map<String, dynamic> map;
  final Map<String, dynamic> affData;

  const WechatQuestionsDetails({Key key, this.map, this.affData})
      : super(key: key);
  @override
  _WechatQuestionsDetailsState createState() => _WechatQuestionsDetailsState();
}

class _WechatQuestionsDetailsState extends State<WechatQuestionsDetails> {
  String imgWhenNull =
      "https://img.0728jh.com/1332139872148000768/material/fb625605-48d3-4e89-b58e-cbda5b568beb.jpeg";
  String value = "";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<RealEstateBloc>()..add(RealEstateEvent.started(widget.affData)),
      child: BlocConsumer<RealEstateBloc, RealEstateState>(
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
                      Text("问答详情", style: TextStyle(color: Colors.grey[700])),
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
                        padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            title(widget.affData),
                            bottomLine(),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
                              child: Text(widget.map["content"],
                                  // "东湖国际环境怎么样，小区绿化面积高吗？是否有湖景房？",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                            ),
                            questions(),
                            Container(
                              margin: EdgeInsets.only(top: 35, left: 10),
                              child: Text(
                                "共" +
                                    getNumAnswer(widget.map["listTopicReply"])
                                        .length
                                        .toString() +
                                    "条回答",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Column(
                                children: widget.map["listTopicReply"]
                                    .map<Widget>((item) {
                              if (item["auditStatus"] == "1") {
                                return Container(
                                  margin: EdgeInsets.only(top: 10, bottom: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: [
                                          Container(
                                            width: 30,
                                            height: 30,
                                            margin: EdgeInsets.fromLTRB(
                                                15.0, 0, 8.0, 0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      item["userInfo"] != null
                                                          ? item["userInfo"][
                                                                      "headimgUrl"] !=
                                                                  null
                                                              ? item["userInfo"]
                                                                  ["headimgUrl"]
                                                              : imgWhenNull
                                                          : imgWhenNull
                                                      // 'https://www.itying.com/images/flutter/3.png'
                                                      ),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              item["userInfo"] != null
                                                  ? item["userInfo"]
                                                              ["nickName"] !=
                                                          null
                                                      ? item["userInfo"]
                                                          ["nickName"]
                                                      : "匿名用户"
                                                  : "匿名用户",
                                              // "刘英",
                                              style: TextStyle(
                                                  color: Colors.grey[500],
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(50, 0, 10, 0),
                                        child: Text(item["details"],
                                            // "环境不怎么样，不过有湖景房，小区绿化面积45%，可以在湖边散步。",
                                            style: TextStyle(
                                                color: Colors.grey[700],
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(50, 5, 0, 0),
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
                              // return answer(
                              //     'https://www.itying.com/images/flutter/3.png', "刘英");
                            }).toList()),
                            // answer('https://www.itying.com/images/flutter/4.png', "谢永强"),
                            // answer('https://www.itying.com/images/flutter/5.png', "刘能"),
                          ],
                        ),
                      )),
                    ),
                    bottom(context),
                  ]),
            ),
          );
        },
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

  answer() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                margin: EdgeInsets.fromLTRB(15.0, 0, 8.0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://www.itying.com/images/flutter/3.png'),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                child: Text(
                  "刘英",
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

  questions() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            margin: EdgeInsets.fromLTRB(15.0, 0, 8.0, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              image: DecorationImage(
                  image: NetworkImage(
                    widget.map["userInfo"]["headimgUrl"],
                    // 'https://www.itying.com/images/flutter/2.png'
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            child: Text(
              widget.map["userInfo"]["nickName"],
              // "赵四",
              style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(child: SizedBox()),
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Text(
              "提问时间:" + widget.map["createTime"].substring(0, 10),
              style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }

  bottomLine() {
    return Container(
        margin: EdgeInsets.fromLTRB(15, 20, 20, 0),
        decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 0.7, color: Colors.grey[300])),
        ),
        child: Row(
          children: [SizedBox()],
        ));
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
                          "条回答",
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
                          hintText: "回复@" + widget.map["userInfo"]["nickName"],
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
                "回答",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            onTap: () {
              BlocProvider.of<RealEstateBloc>(context)
                ..add(RealEstateEvent.commentrealestate(value, widget.map));
            },
          )
        ],
      ),
    );
  }
}
