import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_ui/application/wxpage/wechat_home_page/wechathomepage_bloc.dart';
// import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/wechat/Housing/wechat_news_details.dart';

class WechatNews extends StatefulWidget {
  final Map<String, dynamic> affData;

  const WechatNews({Key key, this.affData}) : super(key: key);
  @override
  _WechatNewsState createState() => _WechatNewsState();
}

class _WechatNewsState extends State<WechatNews> {
  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //     create: (context) => getIt<WechathomepageBloc>()
    //       ..add(
    //           WechathomepageEvent.getNewsinformationAll(widget.affData, "qb")),
    //     child: BlocConsumer<WechathomepageBloc, WechathomepageState>(
    //         listener: (context, state) {},
    //         builder: (context, state) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text("新闻动态", style: TextStyle(color: Colors.grey[700])),
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey[700]),
          elevation: 0.1,
          toolbarHeight: 100.0,
          bottom: TabBar(
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.blue,
            indicatorWeight: 2.0,
            isScrollable: true,
            tabs: <Widget>[
              mainTabBar('全部'),
              mainTabBar('最新优惠'),
              mainTabBar('楼盘活动'),
              mainTabBar('工程进度'),
              mainTabBar('置业导购'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            WechatNewsDetails(affData: widget.affData, titleKey: "qb"),
            WechatNewsDetails(affData: widget.affData, titleKey: "yh"),
            WechatNewsDetails(affData: widget.affData, titleKey: "hd"),
            WechatNewsDetails(affData: widget.affData, titleKey: "jd"),
            WechatNewsDetails(affData: widget.affData, titleKey: "dg"),
          ],
        ),
      ),
    );
    // }));
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
