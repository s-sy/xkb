import 'package:flutter/material.dart';
import 'package:flutter_ui/presentation/wechat/content_pager.dart';

class WechatHomeScreen extends StatefulWidget {
  final Map<String, dynamic> affData;
  final int msgPageTabIndex;

  const WechatHomeScreen({Key key, this.affData, this.msgPageTabIndex})
      : super(key: key);
  @override
  _WechatHomeScreenState createState() => _WechatHomeScreenState();
}

class _WechatHomeScreenState extends State<WechatHomeScreen> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  ContentPagerController _contentPagerController;
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.msgPageTabIndex;
    _contentPagerController = ContentPagerController(widget.msgPageTabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xffedeef0),
            Color(0xffe6e7e9),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: ContentPager(
          contentPagerController: _contentPagerController,
          affData: widget.affData,
          onPageChanged: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            _contentPagerController.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            _bottomItem('首页', Icons.home, 0),
            _bottomItem('我要购房', Icons.local_phone, 1),
            _bottomItem('推荐购房', Icons.thumb_up_alt_rounded, 2),
            // _bottomItem('分享', Icons.share, 3),
            _bottomItem('我的', Icons.person, 4),
          ]),
    );
  }

  //封装底部Tab
  _bottomItem(String title, IconData icon, int index) {
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
          color: _defaultColor,
        ),
        activeIcon: Icon(
          icon,
          color: _activeColor,
        ),
        title: Text(
          title,
          style: TextStyle(
              color: _currentIndex != index ? _defaultColor : _activeColor),
        ));
  }
}
