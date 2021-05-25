import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/wxpage/wechat_home_page/wechathomepage_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:url_launcher/url_launcher.dart';

class WechatNewsDetails extends StatefulWidget {
  final Map<String, dynamic> affData;
  final String titleKey;

  const WechatNewsDetails({Key key, this.affData, this.titleKey})
      : super(key: key);

  @override
  _WechatNewsDetailsState createState() => _WechatNewsDetailsState();
}

class _WechatNewsDetailsState extends State<WechatNewsDetails> {
  // List list = [
  //   {
  //     "img":
  //         "https://image.kehuoa.com/1353183630993920000/material/8a2d5f07-13c9-41e6-afbc-5c4b5b1f3a5f.png",
  //     "title": "买房人过来看啦！陆羽小学对面现房开售啦，全城热销中！还不快来看看！",
  //     "tag": "置业导购",
  //     "time": "2021.03.03",
  //     "readNum": "26"
  //   },
  //   {
  //     "img":
  //         "https://image.kehuoa.com/1353183630993920000/material/25dcb9fc-40cb-440e-a762-5e2fc779132c.jpg",
  //     "title": "风景商业学区房我全部都要！盛世江尚实景现房开售！",
  //     "tag": "置业导购",
  //     "time": "2021.03.25",
  //     "readNum": "35"
  //   },
  //   {
  //     "img":
  //         "https://image.kehuoa.com/1353183630993920000/material/dfa940e5-ebb8-487e-b6de-1ccdd10b3528.jpg",
  //     "title": "春风又绿江南岸，盛世江尚邀您把家还！一线江景房样板间照片流出，这份指南让你更懂盛世江尚",
  //     "tag": "置业导购",
  //     "time": "2021.04.12",
  //     "readNum": "42"
  //   },
  //   {
  //     "img":
  //         "https://image.kehuoa.com/1353183630993920000/material/93396471-5aac-496c-8892-437da2c8c770.jpg",
  //     "title": "波澜河景配大户型，盛世江尚给你五星级的居住体验",
  //     "tag": "置业导购",
  //     "time": "2021.04.01",
  //     "readNum": "15"
  //   },
  // ];
  String imgWhenNull =
      "https://img.0728jh.com/1332139872148000768/material/fb625605-48d3-4e89-b58e-cbda5b568beb.jpeg";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<WechathomepageBloc>()
          ..add(WechathomepageEvent.getNewsinformationAll(
              widget.affData, widget.titleKey)),
        child: BlocConsumer<WechathomepageBloc, WechathomepageState>(
            listener: (context, state) {},
            builder: (context, state) {
              return ListView.builder(
                itemCount: state.newsData.length,
                itemBuilder: (context, i) => InkWell(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
                      height: 110,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 90,
                            margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      // list[i]["img"]
                                      state.newsData[i]["thumbnail"] != null
                                          ? state.newsData[i]["thumbnail"]
                                          : imgWhenNull),
                                  fit: BoxFit.cover),
                            ),
                            child: SizedBox(),
                          ),
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  state.newsData[i]["title"],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Container(
                                decoration:
                                    BoxDecoration(color: Colors.grey[200]),
                                padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                                child: Text(
                                    newsTag(state.newsData[i]["category"]),
                                    // list[i]["tag"],
                                    style: TextStyle(
                                        color: Colors.deepOrange,
                                        fontSize: 13)),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    state.newsData[i]["createTime"]
                                        .substring(0, 10),
                                    // list[i]["time"],
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
                                        margin:
                                            EdgeInsets.fromLTRB(5, 0, 10, 0),
                                        child: Text(
                                          state.newsData[i]["views"]
                                                  .toString() +
                                              "次",
                                          // list[i]["readNum"] + "次",
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
                          ))
                        ],
                      ),
                    ),
                    onTap: () {
                      if (Platform.isIOS) {
                        print("IOS");
                        _launchInWebViewOrVC(state.newsData[i]["articleLink"]);
                        // _launchInWebViewOrVC("https://www.baidu.com/");
                      } else if (Platform.isAndroid) {
                        print("安卓");
                        _launchInBrowser(state.newsData[i]["articleLink"]);
                      }
                    }),
              );
            }));
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
}
