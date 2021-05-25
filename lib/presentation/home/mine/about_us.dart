import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/mine/bloc/mine_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';
import 'package:ota_update/ota_update.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  // String version = "";
  // _getVersion() async {
  //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //   setState(() {
  //     version = packageInfo.version;
  //   });
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _getVersion();
  // }
  String vInfo = '';
  String progress = '';

  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // String version = packageInfo.version;
    // setState(() {
    //   vInfo = Platform.isIOS ? 'iOS_$version' : 'android_$version';
    // });
    setState(() {
      vInfo = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            getIt<MineBloc>()..add(MineEvent.testVersion(vInfo)),
        child: BlocConsumer<MineBloc, MineState>(
            listener: (context, state) async {},
            builder: (BuildContext context, state) {
              return Scaffold(
                  appBar: AppBar(title: Text("关于我们")),
                  backgroundColor: Colors.grey[200],
                  body: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 40, 0, 10),
                            child: Image(
                              image: AssetImage("assets/images/xkb.png"),
                              width: 50,
                            )),
                        Container(
                          child: Text(
                            "新客邦",
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          child: Text(
                            "$vInfo",
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        progress != ""
                            ? Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  progress,
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            : SizedBox(),
                        SizedBox(height: 30),
                        if (state.testVersion.containsKey("version"))
                          _contantOther("版本检测", context, state.testVersion),
                        _contant("联系我们", context, state),
                        _contant("关于我们", context, state),
                        Expanded(child: SizedBox()),
                        InkWell(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 7),
                            child: Text("新客邦软件许可及服务协议",
                                style: TextStyle(
                                    color: Colors.blue[400], fontSize: 13)),
                          ),
                          onTap: () {},
                        ),
                        Text("天门新客邦有限公司  版权所有",
                            style: TextStyle(color: Colors.grey, fontSize: 11)),
                        SizedBox(height: 2.0),
                        Text("Copyright @XKB Corparation All Rights Reserved",
                            style: TextStyle(color: Colors.grey, fontSize: 11)),
                        SizedBox(height: 10)
                      ],
                    ),
                  ));
            }));
  }

  _contant(String key, context, state) {
    return InkWell(
      child: Container(
        height: 45,
        margin: EdgeInsets.only(top: 1.0),
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                key,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.chevron_right,
                color: Colors.grey[500],
              ),
            )
          ],
        ),
      ),
      onTap: () {
        if (key == "联系我们") {
          showDialog(
              barrierDismissible: true,
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("提示"),
                  content: Text("电话:17362951060 邓先生"),
                  actions: <Widget>[
                    FlatButton(
                      child:
                          Text("取消", style: TextStyle(color: Colors.blue[200])),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                    FlatButton(
                      child: Text("确定"),
                      onPressed: () async {
                        String url = 'tel:17362951060';
                        //  'tel:13429824009';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                        Navigator.of(context).pop(true);
                      },
                    )
                  ],
                );
              });
        } else if (key == "关于我们") {
          ExtendedNavigator.of(context).push(Routes.aboutUsIntroduce);
        }
      },
    );
  }

  _contantOther(String key, context, Map testVersion) {
    return InkWell(
      child: Container(
        height: 45,
        margin: EdgeInsets.only(top: 1.0),
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                key,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            // version
            testVersion["version"] != vInfo
                ? Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Text(
                      testVersion["version"],
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  )
                : Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Text(
                      "目前已是最新版本",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  )
          ],
        ),
      ),
      onTap: () {
        if (testVersion["version"] != vInfo) {
          showDialog(
              barrierDismissible: true,
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("提示"),
                  content: Row(children: [
                    Text("检测到新版本，是否更新？"),
                  ]),
                  actions: <Widget>[
                    FlatButton(
                      child:
                          Text("取消", style: TextStyle(color: Colors.blue[200])),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                    FlatButton(
                      child: Text("确定"),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                    )
                  ],
                );
              }).then((value) async {
            if (value != null && value) {
              _updateVersion(testVersion);
            }
          });
        }
      },
    );
  }

  void _updateVersion(testVersion) async {
    if (Platform.isIOS) {
      String url = 'https://apps.apple.com/cn/app/testflight/id899247664';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
      // BotToast.showText(text: "请前往苹果商店下载testflight");
    } else if (Platform.isAndroid) {
      String url = testVersion["url"];
      // String url = 'https://image.kehuoa.com/app-release.apk';
      try {
        // destinationFilename 是对下载的apk进行重命名
        OtaUpdate().execute(url, destinationFilename: 'xkb.apk').listen(
          (OtaEvent event) {
            print('status:${event.status},value:${event.value}');
            switch (event.status) {
              case OtaStatus.DOWNLOADING: // 下载中
                setState(() {
                  progress = '下载进度:${event.value}%';
                });
                break;
              case OtaStatus.INSTALLING: //安装中
                break;
              case OtaStatus.PERMISSION_NOT_GRANTED_ERROR: // 权限错误
                print('更新失败，请稍后再试');
                break;
              default: // 其他问题
                break;
            }
          },
        );
      } catch (e) {
        print('更新失败，请稍后再试');
      }
    }
  }
}

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:ota_update/ota_update.dart';
// import 'package:package_info/package_info.dart';
// import 'package:url_launcher/url_launcher.dart';

// class AboutUs extends StatefulWidget {
//   @override
//   _AboutUsState createState() => _AboutUsState();
// }

// class _AboutUsState extends State<AboutUs> {
//   String vInfo = '';
//   String progress = '';

//   @override
//   void initState() {
//     super.initState();
//     _initData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('版本升级'),
//       ),
//       body: Container(
//         alignment: Alignment.center,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             FlatButton(
//                 color: Colors.black38,
//                 onPressed: _updateVersion,
//                 child: Text('版本升级')),
//             Container(
//               child: Text('$vInfo'),
//             ),
//             Container(
//               child: Text('$progress'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _initData() async {
//     PackageInfo packageInfo = await PackageInfo.fromPlatform();
//     String version = packageInfo.version;
//     setState(() {
//       vInfo = Platform.isIOS ? 'iOS_$version' : 'android_$version';
//     });
//   }

//   void _updateVersion() async {
//     if (Platform.isIOS) {
//       String url =
//           'itms-apps://itunes.apple.com/cn/app/id414478124?mt=8'; // 这是微信的地址，到时候换成自己的应用的地址
//       if (await canLaunch(url)) {
//         await launch(url);
//       } else {
//         throw 'Could not launch $url';
//       }
//     } else if (Platform.isAndroid) {
//       String url =
//           'https://image.kehuoa.com/app-release.apk'; // 网易新闻下载地址，地址可能失效，在测试时候可以先确认下下载地址是否是有效的
//       try {
//         // destinationFilename 是对下载的apk进行重命名
//         OtaUpdate().execute(url, destinationFilename: 'news.apk').listen(
//           (OtaEvent event) {
//             print('status:${event.status},value:${event.value}');
//             switch (event.status) {
//               case OtaStatus.DOWNLOADING: // 下载中
//                 setState(() {
//                   progress = '下载进度:${event.value}%';
//                 });
//                 break;
//               case OtaStatus.INSTALLING: //安装中
//                 break;
//               case OtaStatus.PERMISSION_NOT_GRANTED_ERROR: // 权限错误
//                 print('更新失败，请稍后再试');
//                 break;
//               default: // 其他问题
//                 break;
//             }
//           },
//         );
//       } catch (e) {
//         print('更新失败，请稍后再试');
//       }
//     }
//   }
// }
