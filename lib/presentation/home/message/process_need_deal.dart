import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/messages/messages_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/components/chat/public.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProcessNeedDeal extends StatefulWidget {
  @override
  _ProcessNeedDealState createState() => _ProcessNeedDealState();
}

class _ProcessNeedDealState extends State<ProcessNeedDeal> {
  String userRole = "";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => getIt<MessagesBloc>()
          ..add(MessagesEvent.dosth())
          ..add(MessagesEvent.getProcessDefinition())
          ..add(MessagesEvent.getNewCoustomer())
          ..add(MessagesEvent.getNewCoustomerNames()),
        child: BlocConsumer<MessagesBloc, MessagesState>(
            listener: (context, state) async {
          //这里没有名字
          print(state.oneDayList);
          print(state.thirdDayList);
          print(state.waitWorkList);
          print(state.newCousterList);
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          String cachedSignInUser =
              sharedPreferences.get('CACHED_SIGN_IN_USER');
          if (cachedSignInUser != null) {
            setState(() {
              userRole = jsonDecode(cachedSignInUser)['userRole'];
            });
          }
        }, builder: (BuildContext context, state) {
          return ListView(padding: EdgeInsets.only(top: 0), children: <Widget>[
            if (userRole != "secretary" && userRole != "manager")
              listTitleMine(
                  '今日待回访',
                  // '崔倩倩 赵四 小李子 阿凡达 谢永强 李老四 张大妈 刘大能',
                  getName(state.oneDayNameList),
                  // 'https://www.itying.com/images/flutter/2.png',
                  "assets/images/daiban01.png",
                  state.oneDayList.length.toString(),
                  state.oneDayList,
                  context),
            if (userRole != "secretary" && userRole != "manager")
              listTitleMine(
                  '三日将逾期',
                  // '副标题3',
                  getName(state.thirdDayNameList),
                  // 'https://www.itying.com/images/flutter/3.png',
                  "assets/images/daiban02.png",
                  state.thirdDayList.length.toString(),
                  state.thirdDayList,
                  context),
            listTitleMine(
                '待办的客户',
                // '崔倩倩 赵四 小李子 阿凡达 谢永强 ',
                getName(state.waitWorkNameList),
                // 'https://www.itying.com/images/flutter/5.png',
                "assets/images/daiban03.png",
                state.waitWorkList.length.toString(),
                state.waitWorkList,
                context),
            if (userRole != "secretary" && userRole != "manager")
              listTitleMine(
                  '新推荐客户',
                  // '李老四 张大妈 刘大能 小李子 阿凡达 谢永强',
                  getName(state.newCousterNameList),
                  // 'https://www.itying.com/images/flutter/3.png',
                  "assets/images/daiban04.png",
                  state.newCousterList.length.toString(),
                  state.newCousterList,
                  context),
            // MessageList(),
            SizedBox(height: 80)
          ]);
        }));
  }

  String getName(list) {
    String str = "";
    print(list);
    for (var i = 0; i < list.length; i++) {
      if (i == list.length - 1) {
        str = str + list[i]["value"];
      } else {
        str = str + list[i]["value"] + " ";
      }
    }
    return str;
  }

  // listTitleMine(String mineTitle, String mineSubtitle, String mineImage,
  //     String trailing) {
  //   return InkWell(
  //     child: Container(
  //         height: 60,
  //         padding: EdgeInsets.only(left: 10),
  //         decoration: BoxDecoration(
  //           border: Border(
  //               bottom: BorderSide(width: 0.5, color: Color(0xffe5e5e5))),
  //         ),
  //         child: ListTile(
  //           contentPadding: EdgeInsets.all(0),
  //           leading: Container(
  //             width: 43,
  //             height: 43,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(10.0),
  //               image: DecorationImage(
  //                   image: NetworkImage(mineImage), fit: BoxFit.cover),
  //             ),
  //           ),
  //           title: Text(
  //             mineTitle,
  //             style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
  //           ),
  //           subtitle: Container(
  //             child: Text(
  //               mineSubtitle,
  //               overflow: TextOverflow.ellipsis,
  //               style: TextStyle(fontSize: 12, color: Colors.grey),
  //             ),
  //           ),
  //           trailing: Container(
  //               width: 25,
  //               height: 15,
  //               margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
  //               decoration: BoxDecoration(
  //                   color: trailing != '0' ? Colors.red : Colors.white,
  //                   borderRadius: BorderRadius.circular(8)),
  //               child: Center(
  //                 child: Text(
  //                   trailing,
  //                   style: TextStyle(fontSize: 11, color: Colors.white),
  //                 ),
  //               )),
  //         )),
  //     onTap: () {
  //       if (mineTitle == "今日待回访") {
  //         // ExtendedNavigator.of(context).push(Routes.toFollowToday);
  //         ExtendedNavigator.of(context).push(Routes.needToDeal);
  //       } else if (mineTitle == "逾期未跟进") {
  //         // ExtendedNavigator.of(context).push(Routes.notFollowUp);
  //         ExtendedNavigator.of(context).push(Routes.needToDeal);
  //       } else if (mineTitle == "三日将逾期") {
  //         // ExtendedNavigator.of(context).push(Routes.overdueInThreeDays);
  //         ExtendedNavigator.of(context).push(Routes.needToDeal);
  //       }
  //     },
  //   );
  // }
  listTitleMine(String mineTitle, String mineSubtitle, String mineImage,
      String trailing, list, context) {
    return InkWell(
      child: Container(
          height: 60,
          padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 0.5, color: Color(0xffe5e5e5))),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            leading: Container(
              margin: EdgeInsets.only(bottom: 10),
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: AssetImage(mineImage), fit: BoxFit.cover),
                //  DecorationImage(
                //     image: NetworkImage(mineImage), fit: BoxFit.cover),
              ),
            ),
            title: Container(
              child: Text(
                mineTitle,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
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
          // ExtendedNavigator.of(context).push(Routes.toFollowToday);
          // ExtendedNavigator.of(context).push(Routes.needToDeal, arguments: );
          ExtendedNavigator.of(context)
              .push(Routes.needToDeal,
                  arguments: NeedToDealArguments(
                      listData: list, type: '1', mineTitle: mineTitle))
              .then((value) {
            if (value == 'refresh') {
              BlocProvider.of<MessagesBloc>(context)
                ..add(MessagesEvent.dosth())
                ..add(MessagesEvent.getProcessDefinition())
                ..add(MessagesEvent.getNewCoustomer())
                ..add(MessagesEvent.getNewCoustomerNames());
            }
          });
        } else if (mineTitle == "三日将逾期") {
          ExtendedNavigator.of(context)
              .push(Routes.needToDeal,
                  arguments: NeedToDealArguments(
                      listData: list, type: '3', mineTitle: mineTitle))
              .then((value) {
            if (value == 'refresh') {
              BlocProvider.of<MessagesBloc>(context)
                ..add(MessagesEvent.dosth())
                ..add(MessagesEvent.getProcessDefinition())
                ..add(MessagesEvent.getNewCoustomer())
                ..add(MessagesEvent.getNewCoustomerNames());
            }
          });
        } else if (mineTitle == "待办的客户") {
          ExtendedNavigator.of(context)
              .push(Routes.needToDeal,
                  arguments: NeedToDealArguments(
                      listData: list, type: '5', mineTitle: mineTitle))
              .then((value) {
            if (value == 'refresh') {
              print("==============");
              BlocProvider.of<MessagesBloc>(context)
                ..add(MessagesEvent.dosth())
                ..add(MessagesEvent.getProcessDefinition())
                ..add(MessagesEvent.getNewCoustomer())
                ..add(MessagesEvent.getNewCoustomerNames());
            }
          });
        } else if (mineTitle == "新推荐客户") {
          ExtendedNavigator.of(context)
              .push(Routes.needToDeal,
                  arguments: NeedToDealArguments(
                      listData: list, type: '7', mineTitle: mineTitle))
              .then((value) {
            if (value == 'refresh') {
              BlocProvider.of<MessagesBloc>(context)
                ..add(MessagesEvent.dosth())
                ..add(MessagesEvent.getProcessDefinition())
                ..add(MessagesEvent.getNewCoustomer())
                ..add(MessagesEvent.getNewCoustomerNames());
            }
          });
        }
      },
    );
  }
}
