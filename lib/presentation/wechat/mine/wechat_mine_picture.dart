import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_ui/application/wxpage/wechat_mine/wechat_mine_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/home/message/processed/processed_photo_view.dart';
import 'package:flutter_ui/presentation/home/message/processed/processed_photoshow_view.dart';

class WechatMinePicture extends StatefulWidget {
  @override
  _WechatMinePhoneState createState() => _WechatMinePhoneState();
}

class _WechatMinePhoneState extends State<WechatMinePicture> {
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
  bool isTap = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<WechatMineBloc>()
          ..add(WechatMineEvent.getAwesomeshooting())
          ..add(WechatMineEvent.getTopicreply("1")),
        child: BlocConsumer<WechatMineBloc, WechatMineState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                    title:
                        Text("楼盘炫拍", style: TextStyle(color: Colors.grey[700])),
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
                        if (isTap && state.picture.length != 0)
                          Column(
                            children: state.picture.map<Widget>((item) {
                              return content(item);
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

  answers(item, state) {
    print(item);
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
      padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 5.0),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(10.0, 10, 10.0, 0),
            child: Text(
              item["awesomeShooting"]["content"],
              // "新邦一号位于东湖边上，生活设施齐全，小区绿化面积非常高，附近中小学一应俱全，是非常不错的选择。",
              style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          // Container(
          //   height: getHeight(),
          //   width: 200,
          //   margin: EdgeInsets.fromLTRB(15, 10, 10, 15),
          //   child: girdView(),
          // ),
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

  content(map) {
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
                      (map["userInfo"] != null && map["userInfo"]["nickName"])
                          ? map["userInfo"]["nickName"]
                          : "匿名用户",
                      // "谢永强",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Expanded(child: SizedBox()),
              Container(
                margin: EdgeInsets.only(right: 5.0),
                child: Text(map["createTime"],
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
              ),
              Icon(Icons.delete_rounded, size: 20, color: Colors.grey[400]),
              SizedBox(width: 5.0),
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

  _jumpToGallery(context, index, contextList) async {
    await Navigator.of(context).push(FadeRoute(
        page: PhotoViewGalleryScreen(
      images: contextList,
      index: index,
      heroTag: "ddd",
    )));
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
                  "楼盘炫拍",
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
}
