import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/presentation/core/app_widget.dart';
import 'package:flutter_ui/presentation/home/customer/customer_page.dart';
import 'package:flutter_ui/presentation/home/message/message_list.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';

class FollowUp extends StatefulWidget {
  FollowUp({Key key}) : super(key: key);

  @override
  _MessageListViewState createState() => _MessageListViewState();
}

class _MessageListViewState extends State<FollowUp> {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.only(top: 0), children: <Widget>[
      // listTitleMine('今日待回访', '崔倩倩 赵四 小李子 阿凡达 谢永强 李老四 张大妈 刘大能',
      //     'https://www.itying.com/images/flutter/2.png', '2'),
      // listTitleMine('逾期未跟进', '崔倩倩 赵四 小李子 阿凡达 谢永强 ',
      //     'https://www.itying.com/images/flutter/5.png', '15'),
      // listTitleMine(
      //     '三日将逾期', '副标题3', 'https://www.itying.com/images/flutter/3.png', '0'),
      MessageList(),
      SizedBox(height: 80)
    ]);
  }

  listTitleMine(String mineTitle, String mineSubtitle, String mineImage,
      String trailing) {
    return InkWell(
      child: Container(
          height: 60,
          padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 0.5, color: Color(0xffe5e5e5))),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: Container(
              width: 43,
              height: 43,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: NetworkImage(mineImage), fit: BoxFit.cover),
              ),
            ),
            title: Text(
              mineTitle,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            subtitle: Container(
              child: Text(
                mineSubtitle,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
            trailing: Container(
                width: 25,
                height: 15,
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                decoration: BoxDecoration(
                    color: trailing != '0' ? Colors.red : Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    trailing,
                    style: TextStyle(fontSize: 11, color: Colors.white),
                  ),
                )),
          )),
      onTap: () {
        if (mineTitle == "今日待回访") {
          ExtendedNavigator.of(context).push(Routes.toFollowToday);
        } else if (mineTitle == "逾期未跟进") {
          ExtendedNavigator.of(context).push(Routes.notFollowUp);
        } else if (mineTitle == "三日将逾期") {
          ExtendedNavigator.of(context).push(Routes.overdueInThreeDays);
        }
      },
    );
  }
}
