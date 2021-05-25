import 'package:flutter/material.dart';
import 'package:flutter_ui/presentation/wechat/Housing/wechat_housing_page.dart';
import 'package:flutter_ui/presentation/wechat/contact/wechat_contact_page.dart';
import 'package:flutter_ui/presentation/wechat/mine/wechat_mine_page.dart';
import 'package:flutter_ui/presentation/wechat/recommend/wechat_recommend_page.dart';

class ContentPager extends StatefulWidget {
  final ValueChanged<int> onPageChanged;
  final ContentPagerController contentPagerController;
  final Map<String, dynamic> affData;
  const ContentPager(
      {Key key, this.onPageChanged, this.contentPagerController, this.affData})
      : super(key: key);
  @override
  _ContentPagerState createState() => _ContentPagerState();
}

class _ContentPagerState extends State<ContentPager> {
  PageController _pageController = PageController(

      /* 视窗比例 */
      viewportFraction: 1.0);
  @override
  void initState() {
    _pageController = PageController(
        initialPage: widget.contentPagerController.msgPageTabIndex);
    // print(_pageController);
    if (widget.contentPagerController != null) {
      widget.contentPagerController._pageController = _pageController;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // CustonAppBar(),
        //appBar
        Expanded(
            child: PageView(
          onPageChanged: widget.onPageChanged,
          controller: _pageController,
          // physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            WechatHousingPage(affData: widget.affData),
            WechatContactPage(affData: widget.affData),
            WechatRecommendPage(),
            // WechatSharePage(),
            WechatMinePage(affData: widget.affData),
          ],
        ))
      ],
    );
  }
}

//内容区域的控制器
class ContentPagerController {
  final int msgPageTabIndex;
  ContentPagerController(this.msgPageTabIndex);
  PageController _pageController;
  void jumpToPage(int page) {
    //dart 编程技巧：安全的调用?.防止因为空而导致的异常
    _pageController?.jumpToPage(page);
  }
}
