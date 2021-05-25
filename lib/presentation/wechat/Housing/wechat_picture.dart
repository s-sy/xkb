import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_ui/application/wxpage/wechat_home_page/wechathomepage_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/home/message/processed/processed_photo_view.dart';
import 'package:flutter_ui/presentation/home/message/processed/processed_photoshow_view.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';

class WechatPicture extends StatefulWidget {
  final Map<String, dynamic> affData;

  const WechatPicture({Key key, this.affData}) : super(key: key);
  @override
  _WechatUpPictureState createState() => _WechatUpPictureState();
}

class _WechatUpPictureState extends State<WechatPicture> {
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
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WechathomepageBloc>()
        ..add(WechathomepageEvent.getAwesomeshootingAll(widget.affData)),
      child: BlocConsumer<WechathomepageBloc, WechathomepageState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                title: Text("炫拍列表", style: TextStyle(color: Colors.grey[700])),
                elevation: 0.0,
                brightness: Brightness.light,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.grey[700])),
            body: SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 20.0),
              child: Column(
                children: [
                  title(widget.affData, state),
                  if (state.awesomeshootingAll.length != 0)
                    Column(
                        children: state.awesomeshootingAll.map<Widget>((item) {
                      return content(item);
                    }).toList()),
                  // InkWell(
                  //   child: content(),
                  //   onTap: () {
                  //     ExtendedNavigator.of(context)
                  //         .push(Routes.wechatPictureDetails);
                  //   },
                  // ),

                  // content(),
                ],
              ),
            )),
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
    return InkWell(
      child: Container(
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
                      "共" + state.awesomeshootingAll.length.toString() + "个炫拍",
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
