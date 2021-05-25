import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_ui/application/wxpage/comment/property_reviews_bloc.dart';
import 'package:flutter_ui/injection.dart';

class WechatCommentDetails extends StatefulWidget {
  final Map<String, dynamic> map;

  const WechatCommentDetails({Key key, this.map}) : super(key: key);
  @override
  _WechatCommentDetailsState createState() => _WechatCommentDetailsState();
}

class _WechatCommentDetailsState extends State<WechatCommentDetails> {
  String imgWhenNull =
      "https://img.0728jh.com/1332139872148000768/material/fb625605-48d3-4e89-b58e-cbda5b568beb.jpeg";
  String replyValue = "";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PropertyReviewsBloc>(),
      child: BlocConsumer<PropertyReviewsBloc, PropertyReviewsState>(
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
                      Text("点评详情", style: TextStyle(color: Colors.grey[700])),
                  elevation: 0.0,
                  brightness: Brightness.light,
                  backgroundColor: Colors.white,
                  iconTheme: IconThemeData(color: Colors.grey[700])),
              body: Padding(
                padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 20.0),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    title(),
                    content(state.commentOne.length != 0
                        ? state.commentOne[0]
                        : widget.map),
                    submitButton(context),
                  ],
                )),
              ),
            ),
          );
        },
      ),
    );
  }

  submitButton(context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 50, 10, 0),
      width: 400,
      height: 50,
      child: RaisedButton(
        splashColor: Colors.lightBlueAccent,
        child:
            Text("提交评论", style: TextStyle(color: Colors.white, fontSize: 18)),
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
              print(widget.map);
              if (replyValue == "") {
                BotToast.showText(text: "请输入点评内容");
                return;
              }
              BlocProvider.of<PropertyReviewsBloc>(context)
                ..add(PropertyReviewsEvent.commentpreviews(
                    replyValue,
                    widget.map["affiliationId"],
                    widget.map["id"],
                    2,
                    widget.map["createId"] ?? " "))
                ..add(PropertyReviewsEvent.commentOne(widget.map));
            }
          });
        },
        textColor: Colors.white,
        color: Colors.cyan,
        elevation: 2,
      ),
    );
  }

  title() {
    return Container(
      height: 120,
      margin: EdgeInsets.fromLTRB(5.0, 3.0, 5.0, 0.0),
      padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Text("新邦一号",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              SizedBox(width: 5.0),
              Text("5.0",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.w500))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  RatingBar.builder(
                    itemSize: 20,
                    initialRating: 3,
                    minRating: 2,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                    itemBuilder: (context, i) =>
                        Icon(Icons.star, color: Colors.amber),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5.0),
                    child: Text(
                      widget.map["listTopicReply"].length.toString() + "条评论",
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
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
              //           child: Icon(Icons.share, size: 15, color: Colors.red),
              //         ),
              //         SizedBox(width: 3),
              //         Text(
              //           "分享",
              //           style: TextStyle(
              //               color: Colors.grey[700],
              //               fontSize: 14,
              //               fontWeight: FontWeight.w500),
              //         ),
              //         SizedBox(width: 5.0)
              //       ],
              //     ),
              //   ),
              //   onTap: () {
              //     BotToast.showText(text: "分享");
              //   },
              // )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              rate("价格", "5.0"),
              rate("地段", "5.0"),
              rate("交通", "5.0"),
              rate("配套", "5.0"),
              rate("环境", "5.0"),
            ],
          )
        ],
      ),
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  RatingBar.builder(
                    itemSize: 15,
                    initialRating: 3,
                    minRating: 2,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
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
                child: Text(map["createTime"],
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
                child: Text(map["listTopicReply"].length.toString(),
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
          Container(
            margin: EdgeInsets.only(left: 5.0),
            child: Text(
              "网友回复:",
              style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Column(
              children: map["listTopicReply"].map<Widget>((item) {
            if (item["auditStatus"] == "1") {
              return Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 0.8, color: Colors.grey[200])),
                ),
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
                                  item["userInfo"] != null
                                      ? item["userInfo"]["headimgUrl"] != null
                                          ? item["userInfo"]["headimgUrl"]
                                          : imgWhenNull
                                      : imgWhenNull,

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
                                item["userInfo"] != null
                                    ? item["userInfo"]["nickName"] != null
                                        ? item["userInfo"]["nickName"]
                                        : "匿名用户"
                                    : "匿名用户",

                                // "谢永强",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 10.0),
                              child: Text(item["createTime"],
                                  // "2021-04-14 18:09",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 5.0),
                      child: Text(
                        item["details"] + " ",
                        // "刚刚去看了，环境确实不错，不过交通不是很便利，高峰期车辆比较拥堵，对上班有需求对需要考虑了。",
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 15,
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
          Container(
            height: 150,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
            child: TextField(
                maxLines: 5,
                minLines: 1,
                textInputAction: TextInputAction.go,
                decoration: InputDecoration(
                  hintText: " 请输入您点评内容",
                  border: InputBorder.none,
                  isDense: true,
                  hintStyle: TextStyle(color: Colors.grey[400], fontSize: 16),
                ),
                // controller: TextEditingController.fromValue(
                //   TextEditingValue(
                //     text: replyValue,
                //     // 保持光标在最后
                //     selection: TextSelection.fromPosition(TextPosition(
                //       affinity: TextAffinity.downstream,
                //       offset: replyValue.length,
                //     )),
                //   ),
                // ),
                onChanged: (val) {
                  setState(() {
                    replyValue = val;
                  });
                }),
          ),

          // Container(
          //   margin: EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 5.0),
          //   child: Text(
          //     "赵四: " + "刚刚去看了，环境确实不错，不过交通不是很便利，高峰期车辆比较拥堵，对上班有需求对需要考虑了。",
          //     style: TextStyle(
          //         color: Colors.grey[500],
          //         fontSize: 15,
          //         fontWeight: FontWeight.w500),
          //   ),
          // ),
          // Container(
          //   margin: EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 5.0),
          //   child: Text(
          //     "长贵: " + "湖景房空气很好，下楼就是公园非常适合散步。",
          //     style: TextStyle(
          //         color: Colors.grey[500],
          //         fontSize: 15,
          //         fontWeight: FontWeight.w500),
          //   ),
          // ),
          // InkWell(
          //   child: Container(
          //     margin: EdgeInsets.fromLTRB(5.0, 10.0, 0, 20.0),
          //     child: Text(
          //       "查看更多评论 >",
          //       style: TextStyle(
          //           color: Colors.grey,
          //           fontSize: 15,
          //           fontWeight: FontWeight.w500),
          //     ),
          //   ),
          //   onTap: () {},
          // )
        ],
      ),
    );
  }

  reply() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.8, color: Colors.grey[200])),
      ),
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
                          // map["userInfo"]["headimgUrl"]
                          'https://www.itying.com/images/flutter/2.png'),
                      fit: BoxFit.cover),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      // map["userInfo"]["nickName"],
                      "谢永强",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10.0),
                    child: Text(
                        // map["createTime"],
                        "2021-04-14 18:09",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 5.0),
            child: Text(
              // map["details"],
              "刚刚去看了，环境确实不错，不过交通不是很便利，高峰期车辆比较拥堵，对上班有需求对需要考虑了。",
              style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }

  rate(String key, String value) {
    return Container(
      child: Text(
        key + value,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w500, color: Colors.grey[600]),
      ),
    );
  }
}
