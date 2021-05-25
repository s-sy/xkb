import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_ui/application/wxpage/wechat_mine/wechat_mine_bloc.dart';
import 'package:flutter_ui/injection.dart';

class WechatMineComment extends StatefulWidget {
  @override
  _WechatMineCommentState createState() => _WechatMineCommentState();
}

class _WechatMineCommentState extends State<WechatMineComment> {
  String imgWhenNull =
      "https://img.0728jh.com/1332139872148000768/material/fb625605-48d3-4e89-b58e-cbda5b568beb.jpeg";
  bool isTap = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WechatMineBloc>()
        ..add(WechatMineEvent.getreadingReviews())
        ..add(WechatMineEvent.getTopicreply("2")),
      child: BlocConsumer<WechatMineBloc, WechatMineState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                title: Text("我的点评", style: TextStyle(color: Colors.grey[700])),
                elevation: 0.0,
                brightness: Brightness.light,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.grey[700])),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    title(),
                    SizedBox(height: 15),
                    if (isTap && state.comment.length != 0)
                      Column(
                        children: state.comment.map<Widget>((item) {
                          return questions(item);
                        }).toList(),
                      ),
                    if (!isTap && state.reply.length != 0)
                      Column(
                        children: state.reply.map<Widget>((item) {
                          return answer(item, state);
                        }).toList(),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  answer(Map<String, dynamic> item, state) {
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
      padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 5.0),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 15),
            child: Text(
              item["reviews"]["content"],
              // "新邦一号位于东湖边上，生活设施齐全，小区绿化面积非常高，附近中小学一应俱全，是非常不错的选择。",
              style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                margin: EdgeInsets.fromLTRB(5.0, 0, 10.0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  image: DecorationImage(
                      image: NetworkImage(state.userInfo["headimgUrl"] != null
                              ? state.userInfo["headimgUrl"]
                              : imgWhenNull
                          // 'https://www.itying.com/images/flutter/2.png'
                          ),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                child: Text(
                  state.userInfo["nickName"] != null
                      ? state.userInfo["nickName"]
                      : "匿名用户",
                  // "谢永强",
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
                  color: Colors.grey[500],
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
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
          )
        ],
      ),
    );
  }

  title() {
    return Row(
      children: [
        InkWell(
          child: Container(
            margin: EdgeInsets.only(left: 0, right: 20),
            child: Column(
              children: [
                Text(
                  "我提的问",
                  style: TextStyle(
                      color: isTap ? Colors.deepOrange[400] : Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  width: 65,
                  decoration: isTap
                      ? BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                            width: 2.0,
                            color: Colors.deepOrange[400],
                          )),
                        )
                      : BoxDecoration(),
                )
              ],
            ),
          ),
          onTap: () {
            setState(() {
              isTap = !isTap;
            });
          },
        ),
        InkWell(
          child: Container(
            child: Column(
              children: [
                Text(
                  "我回答的",
                  style: TextStyle(
                      color: isTap ? Colors.grey : Colors.deepOrange[400],
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  width: 65,
                  decoration: isTap
                      ? BoxDecoration()
                      : BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                            width: 2.0,
                            color: Colors.deepOrange[400],
                          )),
                        ),
                )
              ],
            ),
          ),
          onTap: () {
            setState(() {
              isTap = !isTap;
            });
          },
        ),
      ],
    );
  }

  questions(Map<String, dynamic> item) {
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
                      image: NetworkImage((item["userInfo"] != null &&
                                  item["userInfo"]["headimgUrl"] != null)
                              ? item["userInfo"]["headimgUrl"]
                              : imgWhenNull
                          // 'https://www.itying.com/images/flutter/3.png'
                          ),
                      fit: BoxFit.cover),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      (item["userInfo"] != null && item["userInfo"]["nickName"])
                          ? item["userInfo"]["nickName"]
                          : "匿名用户",
                      // "谢永强",
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
                child: Text(item["createTime"],
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
              item["content"],
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
                child: Text(item["views"].toString(),
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
              ),
              Icon(Icons.chat_outlined, size: 18, color: Colors.grey[400]),
              Container(
                margin: EdgeInsets.fromLTRB(5, 0, 15, 0),
                child: Text(item["listTopicReply"].length.toString(),
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
              ),
              Icon(Icons.thumb_up_outlined, size: 18, color: Colors.grey[400]),
              Container(
                margin: EdgeInsets.fromLTRB(5, 0, 10, 0),
                child: Text(item["likes"].toString(),
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
