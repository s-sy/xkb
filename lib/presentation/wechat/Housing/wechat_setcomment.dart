import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_ui/application/wxpage/comment/property_reviews_bloc.dart';
import 'package:flutter_ui/injection.dart';

class WechatSetcomment extends StatefulWidget {
  final Map<String, dynamic> affData;

  const WechatSetcomment({Key key, this.affData}) : super(key: key);
  @override
  _WechatSetcommentState createState() => _WechatSetcommentState();
}

class _WechatSetcommentState extends State<WechatSetcomment> {
  bool isArrived = false;
  // String rateNum = "3";
  String ratePrice = "3";
  String ratePlace = "3";
  String rateTraffic = "3";
  String rateMatching = "3";
  String rateEnvironment = "3";
  String remark = "";

  bool isCheck = false;
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
                      Text("发布点评", style: TextStyle(color: Colors.grey[700])),
                  elevation: 0.0,
                  brightness: Brightness.light,
                  backgroundColor: Colors.white,
                  iconTheme: IconThemeData(color: Colors.grey[700])),
              body: SingleChildScrollView(
                  child: Padding(
                padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 20.0),
                child: Column(
                  children: [
                    title(),
                    isArraied(),
                    rate("价格:", ratePrice),
                    rate("地段:", ratePlace),
                    rate("交通:", rateTraffic),
                    rate("配套:", rateMatching),
                    rate("环境:", rateEnvironment),
                    Container(
                      height: 120,
                      margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
                      padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0)),
                      child: TextField(
                          maxLines: 5,
                          minLines: 1,
                          textInputAction: TextInputAction.go,
                          decoration: InputDecoration(
                            hintText: "写下对新邦一号的意见",
                            border: InputBorder.none,
                            isDense: true,
                            hintStyle: TextStyle(
                                color: Colors.grey[400], fontSize: 16),
                          ),
                          onChanged: (val) {
                            setState(() {
                              remark = val;
                            });
                          }),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              "匿名评价",
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Switch(
                            value: isCheck,
                            activeColor: Colors.cyan,
                            onChanged: (bool val) {
                              setState(() {
                                isCheck = !isCheck;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    submit(context, state),
                  ],
                ),
              )),
            ),
          );
        },
      ),
    );
  }

  title() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 20, 0),
      height: 75,
      child: Row(
        children: [
          Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                  image: NetworkImage(
                      'https://www.itying.com/images/flutter/2.png'),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text("新邦一号",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
                  SizedBox(width: 8.0),
                  Text("4.7",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                ],
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
          )
        ],
      ),
    );
  }

  isArraied() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 15, 10, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("是否到访营销中心",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                  fontWeight: FontWeight.w500)),
          InkWell(
            child: Container(
                width: 90,
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10.0)),
                child: Center(
                  child: Text(
                    "已经到访",
                    style: TextStyle(
                        color: isArrived ? Colors.cyan : Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                )),
            onTap: () {
              setState(() {
                isArrived = !isArrived;
              });
            },
          ),
          InkWell(
            child: Container(
                width: 90,
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10.0)),
                child: Center(
                  child: Text(
                    "未到访",
                    style: TextStyle(
                        color: isArrived ? Colors.grey : Colors.cyan,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                )),
            onTap: () {
              setState(() {
                isArrived = !isArrived;
              });
            },
          )
        ],
      ),
    );
  }

  rate(String key, String rateNum) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 15, 0),
            child: Text(
              key,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
          RatingBar.builder(
            itemSize: 25,
            initialRating: 3,
            minRating: 2,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
            itemBuilder: (context, i) => Icon(Icons.star, color: Colors.amber),
            onRatingUpdate: (rating) {
              switch (key) {
                case "价格:":
                  setState(() {
                    ratePrice = rating.toString();
                  });
                  break;
                case "地段:":
                  setState(() {
                    ratePlace = rating.toString();
                  });
                  break;
                case "交通:":
                  setState(() {
                    rateTraffic = rating.toString();
                  });
                  break;
                case "配套:":
                  setState(() {
                    rateMatching = rating.toString();
                  });
                  break;
                case "环境:":
                  setState(() {
                    rateEnvironment = rating.toString();
                  });
                  break;
              }
            },
          ),
          Container(
            margin: EdgeInsets.only(left: 15, top: 2),
            child: Text(
              rateNum,
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }

  submit(context, state) {
    return Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
        height: 53,
        decoration: BoxDecoration(
            color: Colors.cyan, borderRadius: BorderRadius.circular(8.0)),
        child: InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "提交评论",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            onTap: () async {
              String arrived = "";
              String check = "";
              if (isArrived) {
                arrived = "0";
              } else {
                arrived = "1";
              }
              if (isCheck) {
                check = "0";
              } else {
                check = "1";
              }
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
                  BlocProvider.of<PropertyReviewsBloc>(context)
                    ..add(PropertyReviewsEvent.releasepreviews(
                        arrived,
                        ratePrice,
                        ratePlace,
                        rateTraffic,
                        rateMatching,
                        rateEnvironment,
                        remark,
                        check,
                        widget.affData["id"]));
                  // if (state.isComment) {
                  //   BotToast.showText(text: "评论成功");
                  // } else {
                  //   BotToast.showText(text: "评论失败");
                  // }
                  // BlocProvider.of<PropertyReviewsBloc>(context)
                  //   ..add(PropertyReviewsEvent.replace());
                }
              });
            }));
  }
}
