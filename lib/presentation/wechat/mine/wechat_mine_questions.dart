import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/wxpage/wechat_mine/wechat_mine_bloc.dart';
import 'package:flutter_ui/injection.dart';

class WechatMineQuestions extends StatefulWidget {
  @override
  _WechatMineQuestionsState createState() => _WechatMineQuestionsState();
}

class _WechatMineQuestionsState extends State<WechatMineQuestions> {
  String imgWhenNull =
      "https://img.0728jh.com/1332139872148000768/material/fb625605-48d3-4e89-b58e-cbda5b568beb.jpeg";
  bool isTap = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<WechatMineBloc>()
          ..add(WechatMineEvent.getQuestionsPage())
          ..add(WechatMineEvent.getTopicreply("4")),
        child: BlocConsumer<WechatMineBloc, WechatMineState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                    title:
                        Text("我的问答", style: TextStyle(color: Colors.grey[700])),
                    elevation: 0.0,
                    brightness: Brightness.light,
                    backgroundColor: Colors.white,
                    iconTheme: IconThemeData(color: Colors.grey[700])),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        title(),
                        SizedBox(height: 15),
                        if (isTap && state.questions.length != 0)
                          Column(
                            children: state.questions.map<Widget>((item) {
                              return questions(item, state);
                            }).toList(),
                          ),
                        if (!isTap && state.reply.length != 0)
                          Column(
                            children: state.reply.map<Widget>((item) {
                              return answers(item, state);
                            }).toList(),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            }));
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

  answers(item, state) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(top: 10, bottom: 15),
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
                    item["askQuestions"]["content"],
                    // "东湖国际环境怎么样，小区绿化面积高吗？是否有湖景房？",
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )),
                ],
              )),
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
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500)),
          )
        ],
      ),
    );
  }

  questions(Map<String, dynamic> item, state) {
    print(item);
    return Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(color: Colors.white),
        height: 120,
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              margin: EdgeInsets.only(left: 10, right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                    image: NetworkImage(state.userInfo["headimgUrl"] != null
                            ? state.userInfo["headimgUrl"]
                            : imgWhenNull
                        // 'https://image.kehuoa.com/1353183630993920000/material/8a2d5f07-13c9-41e6-afbc-5c4b5b1f3a5f.png'
                        ),
                    fit: BoxFit.cover),
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Text(
                    item["content"],
                    // "东湖国际环境怎么样，小区绿化面积高吗？是否有湖景房？",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Expanded(child: SizedBox()),
                    // Icon(Icons.chat_outlined,
                    //     size: 18, color: Colors.grey[400]),
                    // Container(
                    //   margin: EdgeInsets.fromLTRB(5, 0, 15, 0),
                    //   child: Text("3",
                    //       style: TextStyle(
                    //           color: Colors.grey,
                    //           fontSize: 14,
                    //           fontWeight: FontWeight.w500)),
                    // ),
                    Text(item["createTime"],
                        // "2021-04-16 16:38",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w500)),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Text(
                          "共有" +
                              item["listTopicReply"].length.toString() +
                              "个回答",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w500)),
                    )
                  ],
                )
              ],
            ))
          ],
        ));
  }
}
