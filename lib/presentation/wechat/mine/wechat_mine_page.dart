import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/wxpage/wechat_mine/wechat_mine_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';

class WechatMinePage extends StatefulWidget {
  final Map<String, dynamic> affData;

  const WechatMinePage({Key key, this.affData}) : super(key: key);
  @override
  _WechatMinePageState createState() => _WechatMinePageState();
}

class _WechatMinePageState extends State<WechatMinePage> {
  String imgWhenNull =
      "https://img.0728jh.com/1332139872148000768/material/4d6f63b2-a275-41cf-a5c7-68e836f8cf5f.jpeg";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            getIt<WechatMineBloc>()..add(WechatMineEvent.isLogin()),
        child: BlocConsumer<WechatMineBloc, WechatMineState>(
            listener: (context, state) {},
            builder: (context, state) {
              return SingleChildScrollView(
                child: Listener(
                  onPointerDown: (onPointerDown) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    print('手指按下回调');
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 130,
                        // margin: EdgeInsets.fromLTRB(5.0, 0, 10.0, 0),
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://img.0728jh.com/staticImg/bannerbg.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 50),
                              width: MediaQuery.of(context).size.width,
                              height: 110,
                              decoration: BoxDecoration(
                                  color: Colors.grey[50],
                                  borderRadius: BorderRadius.circular(8.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 2.0,
                                    ),
                                  ]),
                              child: Row(
                                children: [
                                  InkWell(
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      margin:
                                          EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                state.userInfo.length != 0
                                                    ? state.userInfo[
                                                                "headimgUrl"] !=
                                                            null
                                                        ? state.userInfo[
                                                            "headimgUrl"]
                                                        : imgWhenNull
                                                    : imgWhenNull
                                                // 'https://www.itying.com/images/flutter/5.png'
                                                ),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    onTap: () {
                                      ExtendedNavigator.of(context).push(
                                          Routes.uploadNetImgPreview,
                                          arguments:
                                              UploadNetImgPreviewArguments(
                                                  img: state.userInfo[
                                                              "headimgUrl"] !=
                                                          null
                                                      ? state.userInfo[
                                                          "headimgUrl"]
                                                      : imgWhenNull
                                                  //  _networkImage,
                                                  ));
                                    },
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 20, 0, 5),
                                              child: Text(
                                                (state.userInfo.length != 0
                                                        ? state.userInfo[
                                                                    "nickName"] !=
                                                                null
                                                            ? state.userInfo[
                                                                "nickName"]
                                                            : "暂无姓名"
                                                        : "暂无姓名") +
                                                    " ",
                                                // "谢永强",
                                                style: TextStyle(
                                                    color: Colors.grey[700],
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            // Container(
                                            //   child: Text(
                                            //     "内部员工(销售岗)",
                                            //     style: TextStyle(
                                            //         color: Colors.grey[500],
                                            //         fontSize: 13),
                                            //   ),
                                            // ),
                                            Container(
                                              child: Text(
                                                "欢迎您进入" +
                                                        widget.affData[
                                                            "projectName"] ??
                                                    "",
                                                style: TextStyle(
                                                    color: Colors.grey[500],
                                                    fontSize: 13),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Expanded(child: SizedBox()),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 10, right: 15, top: 10),
                                    child: RaisedButton(
                                      onPressed: () {
                                        state.isLogin
                                            ? ExtendedNavigator.of(context)
                                                .push(
                                                    Routes.wechatAddInformation)
                                                .then((value) => {
                                                      if (value == "refresh")
                                                        {
                                                          BlocProvider.of<
                                                                  WechatMineBloc>(
                                                              context)
                                                            ..add(
                                                                WechatMineEvent
                                                                    .isLogin()),
                                                        }
                                                    })
                                            : ExtendedNavigator.of(context)
                                                .replace(Routes.splashPage);
                                      },
                                      child: Text(
                                        state.isLogin ? "更新信息" : "登陆",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      textColor: Colors.white,
                                      color: Colors.cyan,
                                      elevation: 2,
                                    ),
                                  ),
                                  // InkWell(
                                  //   child: Container(
                                  //       margin:
                                  //           EdgeInsets.only(top: 25, right: 30),
                                  //       height: 30,
                                  //       width: 75,
                                  //       decoration: BoxDecoration(
                                  //           border: Border.all(
                                  //               width: 1.0, color: Colors.grey),
                                  //           borderRadius:
                                  //               BorderRadius.circular(10.0)),
                                  //       child: Center(
                                  //         child: Text(
                                  //           state.isLogin ? "更新信息" : "登陆/注册",
                                  //           style: TextStyle(
                                  //               color: Colors.grey,
                                  //               fontSize: 14,
                                  //               fontWeight: FontWeight.w400),
                                  //         ),
                                  //       )),
                                  //   onTap: () async {
                                  //     state.isLogin
                                  //         ? ExtendedNavigator.of(context)
                                  //             .push(Routes.wechatAddInformation)
                                  //             .then((value) => {
                                  //                   if (value == "refresh")
                                  //                     {
                                  //                       BlocProvider.of<
                                  //                               WechatMineBloc>(
                                  //                           context)
                                  //                         ..add(WechatMineEvent
                                  //                             .isLogin()),
                                  //                     }
                                  //                 })
                                  //         : ExtendedNavigator.of(context)
                                  //             .replace(Routes.splashPage);
                                  //   },
                                  // )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              width: MediaQuery.of(context).size.width,
                              // height: 350,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 1.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  // tag("关注户型", Icons.apartment, Colors.deepOrange[400]),
                                  tag("我的点评", Icons.edit_outlined, Colors.cyan),
                                  tag("我的问答", Icons.edit_outlined,
                                      Colors.orange),
                                  tag("楼盘炫拍", Icons.party_mode,
                                      Colors.deepOrange[400]),
                                  tag("我的客户", Icons.people, Colors.cyan),
                                  // tag("裂变客户", Icons.accessibility, Colors.orange),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }));
  }

  tag(String name, IconData icons, Color color) {
    return InkWell(
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 0.8, color: Colors.grey[200])),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Icon(
                icons,
                size: 25,
                color: color,
              ),
            ),
            Text(
              name,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
            Expanded(child: SizedBox()),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20,
                color: Colors.orange[200],
              ),
            )
          ],
        ),
      ),
      onTap: () {
        switch (name) {
          case "关注户型":
            ExtendedNavigator.of(context).push(Routes.wechatFollowHouse);
            break;
          case "我的点评":
            ExtendedNavigator.of(context).push(Routes.wechatMineComment);
            break;
          case "我的问答":
            ExtendedNavigator.of(context).push(Routes.wechatMineQuestions);
            break;
          case "楼盘炫拍":
            ExtendedNavigator.of(context).push(Routes.wechatMinePicture);
            break;
          case "我的客户":
            ExtendedNavigator.of(context).push(Routes.wechatMineCustomer);
            break;
          case "裂变客户":
            ExtendedNavigator.of(context).push(Routes.wechatFissionCustomer);
            break;
        }
      },
    );
  }
}
