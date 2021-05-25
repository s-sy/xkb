import 'package:flutter/material.dart';
import 'package:flutter_ui/presentation/wechat/Housing/wechat_comment.dart';
import 'package:flutter_ui/presentation/wechat/Housing/wechat_house_info.dart';
import 'package:flutter_ui/presentation/wechat/Housing/wechat_picture.dart';
import 'package:flutter_ui/presentation/wechat/Housing/wechat_questions.dart';
import 'package:flutter_ui/presentation/wechat/Housing/wechat_recomm_house.dart';
import 'package:flutter_ui/presentation/wechat/Housing/wechat_set_picture.dart';
import 'package:flutter_ui/presentation/wechat/Housing/wechat_setcomment.dart';

class WechatPage extends StatefulWidget {
  @override
  _WechatPageState createState() => _WechatPageState();
}

class _WechatPageState extends State<WechatPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: Colors.blue[400],
          title: Text('小程序页面'),
          toolbarHeight: 100.0,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(48),
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(color: Colors.white),
                child: TabBar(
                  unselectedLabelColor: Colors.black,
                  indicatorColor: Colors.blue,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: Colors.blue,
                  indicatorWeight: 2.0,
                  isScrollable: true,
                  tabs: <Widget>[
                    mainTabBar('更多详情'),
                    mainTabBar('推荐户型'),
                    mainTabBar('楼盘点评'),
                    mainTabBar('发布点评'),
                    mainTabBar('楼盘问答'),
                    mainTabBar('炫拍列表'),
                    mainTabBar('发布炫拍'),
                  ],
                ),
              )),
        ),
        body: TabBarView(
          children: <Widget>[
            WechatHouseInfo(),
            WechatRecommHouse(),
            WechatComment(),
            WechatSetcomment(),
            WechatQuestions(),
            WechatPicture(),
            WechatSetPicture(),
          ],
        ),
      ),
    );
  }

  mainTabBar(String tabName) {
    return Tab(
      child: Text(
        tabName,
        style: TextStyle(fontSize: 14.0, color: Colors.black54),
      ),
    );
  }
}
