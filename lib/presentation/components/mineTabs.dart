import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';

class MineTabs extends StatelessWidget {
  final String title;
  final IconData icon;
  MineTabs({this.title, this.icon});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          height: 45.0,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 15.0),
              Icon(icon, color: Colors.grey),
              SizedBox(width: 15.0),
              Text(title,
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700])),
            ],
          )),
      onTap: () {
        if (title == "客户咨询") {
          _customerConsultation(context);
        } else if (title == "AI名片") {
          ExtendedNavigator.of(context).push(Routes.aiCard);
        } else if (title == "业绩") {
          ExtendedNavigator.of(context).push(Routes.mineAchievement);
        } else if (title == "我的交易订单") {
          ExtendedNavigator.of(context).push(Routes.mineOrder);
        } else if (title == "置业计划") {
          ExtendedNavigator.of(context).push(Routes.ownershipSchemePage);
        } else if (title == "建议反馈") {
          ExtendedNavigator.of(context).push(Routes.suggestFeedback);
        } else if (title == "在线客服") {
          _onlineService(context);
        } else if (title == "关于我们") {
          ExtendedNavigator.of(context).push(Routes.aboutUs);
        } else if (title == "微信小程序页面") {
          ExtendedNavigator.of(context).push(Routes.wechatPage);
        } else if (title == "微信小程序选楼盘页") {
          ExtendedNavigator.of(context).push(Routes.wechatNoticePage);
        } else if (title == "微信小程序首页") {
          ExtendedNavigator.of(context).push(Routes.wechatHomeScreen);
        }
      },
    );
  }

  _customerConsultation(context) {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Text(
              "咨询个啥啊～买就完事",
              style: TextStyle(color: Colors.red),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("确定"),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              )
            ],
          );
        });
  }

  _onlineService(context) {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Text(
              "客服小姐姐正在赶来的路上～",
              style: TextStyle(color: Colors.red),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("确定"),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              )
            ],
          );
        });
  }
}
