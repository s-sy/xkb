import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/wxpage/questions/real_estate_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';

class WechatQuestions extends StatefulWidget {
  final Map<String, dynamic> affData;

  const WechatQuestions({Key key, this.affData}) : super(key: key);
  @override
  _WechatQuestionsState createState() => _WechatQuestionsState();
}

class _WechatQuestionsState extends State<WechatQuestions> {
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
                        Text("问大家", style: TextStyle(color: Colors.grey[700])),
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
                            children: [
                              title(widget.affData, state),
                              if (state.questionsPageAll.length != 0)
                                Column(
                                    children: state.questionsPageAll
                                        .map<Widget>((item) {
                                  return questions(item);
                                }).toList()),
                            ],
                          ),
                        )),
                      ),
                      bottom(context),
                    ]),
              ));
        },
      ),
    );
  }

  title(Map<String, dynamic> map, state) {
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
                      "共" + state.questionsPageAll.length.toString() + "个问题",
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
                      map["listTopicReply"][0]["userInfo"]["nickName"] +
                          map["listTopicReply"][0]["details"],
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
                      "全部" +
                          getNumAnswer(map["listTopicReply"])
                              .length
                              .toString() +
                          "个回答 >",
                      // "全部1个回答 >",
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

  getNumAnswer(List list) {
    List listPass = [];
    for (int i = 0; i < list.length; i++) {
      if (list[i]["auditStatus"] == "1") {
        listPass.add(list[i]);
      }
    }
    return listPass;
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
                          hintText: "向买过的人提问",
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
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(5.0)),
              child: Text(
                "提问",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            onTap: () {
              BlocProvider.of<RealEstateBloc>(context)
                ..add(RealEstateEvent.releaseprealestate(value));
            },
          )
        ],
      ),
    );
  }
}
