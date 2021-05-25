import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_ui/application/auth/auth_bloc.dart';
import 'package:flutter_ui/application/autoenter/autoenter_bloc.dart';
import 'package:flutter_ui/application/wxpage/wechat_mine/wechat_mine_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WechatAddInformation extends StatefulWidget {
  @override
  _WechatAddInformationState createState() => _WechatAddInformationState();
}

class _WechatAddInformationState extends State<WechatAddInformation> {
  String imgWhenNull =
      "https://img.0728jh.com/1332139872148000768/material/fb625605-48d3-4e89-b58e-cbda5b568beb.jpeg";
  bool _isFileImg = false;
  List _listImg = [];
  String _textFeid = "";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            getIt<WechatMineBloc>()..add(WechatMineEvent.isLogin()),
        child: BlocConsumer<WechatMineBloc, WechatMineState>(
            listener: (context, state) {},
            builder: (context, state) {
              return WillPopScope(
                  onWillPop: () {
                    Navigator.of(context).pop("refresh");
                    return;
                  },
                  child: Listener(
                    onPointerDown: (onPointerDown) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      print('手指按下回调');
                    },
                    child: Scaffold(
                      appBar: AppBar(
                          title: Text("完善信息",
                              style: TextStyle(color: Colors.grey[700])),
                          elevation: 0.0,
                          brightness: Brightness.light,
                          backgroundColor: Colors.white,
                          iconTheme: IconThemeData(color: Colors.grey[700])),
                      body: SingleChildScrollView(
                        child: Column(
                          children: [
                            _headImage(state),
                            _mainInfoTab("昵称", "暂无姓名", state),
                            _showPhone(state),
                            _submitButton(context, state),
                            _resetButton(context, state),
                            // _loginOutButton(context, state),
                          ],
                        ),
                      ),
                    ),
                  ));
            }));
  }

  _headImage(state) {
    return InkWell(
      child: Container(
          height: 70,
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 0.5, color: Color(0xffe5e5e5))),
          ),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  "头像",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black54),
                ),
              ),
              Expanded(child: Text("")),
              InkWell(
                child: Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: _isFileImg
                          ? FileImage(_listImg[0])
                          : NetworkImage(state.userInfo["headimgUrl"] != null
                              ? state.userInfo["headimgUrl"]
                              : imgWhenNull),
                      //NetworkImage(_networkImage),
                    ),
                  ),
                ),
                onTap: () {
                  if (_isFileImg) {
                    ExtendedNavigator.of(context).push(Routes.uploadImgPreview,
                        arguments: UploadImgPreviewArguments(
                          img: _listImg[0],
                        ));
                  } else {
                    ExtendedNavigator.of(context).push(
                        Routes.uploadNetImgPreview,
                        arguments: UploadNetImgPreviewArguments(
                            img: state.userInfo["headimgUrl"] != null
                                ? state.userInfo["headimgUrl"]
                                : imgWhenNull
                            //  _networkImage,
                            ));
                  }
                },
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Icon(Icons.navigate_next, color: Colors.grey))
            ],
          )),
      onTap: () {
        _openModalBottomSheet();
      },
    );
  }

  //添加图片下拉弹窗
  Future _openModalBottomSheet() async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200.0,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('拍照', textAlign: TextAlign.center),
                  onTap: () {
                    _getImageFromCamera();
                    Navigator.pop(context, '拍照');
                  },
                ),
                ListTile(
                  title: Text('从相册选择', textAlign: TextAlign.center),
                  onTap: () {
                    _getImageFromGallery();
                    Navigator.pop(context, '从相册选择');
                  },
                ),
                ListTile(
                  title: Text('取消', textAlign: TextAlign.center),
                  onTap: () {
                    Navigator.pop(context, '取消');
                  },
                ),
              ],
            ),
          );
        });
    print(option);
  }

  //相册选择
  Future _getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        File image = File(pickedFile.path);
        if (_listImg.length == 0) {
          _listImg.add(image);
        } else {
          for (int i = 0; i < _listImg.length; i++) {
            _listImg.remove(_listImg[i]);
          }
          _listImg.add(image);
        }
        _isFileImg = true;
      } else {
        print('No image selected.');
      }
    });
  }

  //拍照
  Future _getImageFromCamera() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.camera, maxWidth: 400);
    setState(() {
      if (pickedFile != null) {
        File image = File(pickedFile.path);
        if (_listImg.length == 0) {
          _listImg.add(image);
        } else {
          for (int i = 0; i < _listImg.length; i++) {
            _listImg.remove(_listImg[i]);
          }
          _listImg.add(image);
        }
        _isFileImg = true;
      } else {
        print('No image selected.');
      }
    });
  }

  _showPhone(state) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(width: 0.5, color: Color(0xffe5e5e5))),
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "电话",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              state.userInfo["registeredPhone"] != null
                  ? state.userInfo["registeredPhone"]
                  : "暂无电话",
              style: TextStyle(color: Colors.grey[700]),
            ),
          )
        ],
      ),
    );
  }

  _mainInfoTab(String keyName, String tipsName, state) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(width: 0.5, color: Color(0xffe5e5e5))),
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              keyName,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            width: 200,
            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: TextField(
                textInputAction: TextInputAction.go,
                decoration: InputDecoration(
                  hintText: tipsName,
                  border: InputBorder.none,
                  isDense: true,
                  hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                ),
                textAlign: TextAlign.start,
                controller: TextEditingController.fromValue(
                  TextEditingValue(
                    text: _textFeid != ""
                        ? _textFeid
                        : state.userInfo["nickName"] != null
                            ? state.userInfo["nickName"]
                            : "",
                    // 保持光标在最后
                    selection: TextSelection.fromPosition(TextPosition(
                      affinity: TextAffinity.downstream,
                      offset: _textFeid != ""
                          ? _textFeid.length
                          : state.userInfo["nickName"] != null
                              ? state.userInfo["nickName"].length
                              : 0,
                    )),
                  ),
                ),
                onChanged: (val) {
                  _textFeid = val;
                }),
          ),
        ],
      ),
    );
  }

  _resetButton(context, state) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 50, 10, 0),
      width: 350,
      height: 50,
      child: RaisedButton(
        splashColor: Colors.lightBlueAccent,
        child:
            Text("退出登陆", style: TextStyle(color: Colors.white, fontSize: 18)),
        onPressed: () {
          showDialog(
              barrierDismissible: true,
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("提示"),
                  content: Text("请确认是否提交"),
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
            // if (value && value != null) {
            //   BlocProvider.of<WechatMineBloc>(context)
            //     ..add(WechatMineEvent.loginOut());
            //   ExtendedNavigator.of(context).replace(Routes.autoenter,
            //       arguments: AutoenterArguments(refresh: "refresh"));
            // }

            if (value && value != null) {
              BlocProvider.of<WechatMineBloc>(context)
                ..add(WechatMineEvent.loginOut());
              BlocProvider.of<AutoenterBloc>(context)
                ..add(AutoenterEvent.relogin());
              BlocProvider.of<AuthBloc>(context)..add(AuthBlocEvent.relogin());
              // ExtendedNavigator.of(context).replace(
              //   Routes.autoenter,
              // );
              SharedPreferences _preferences =
                  await SharedPreferences.getInstance();
              var project = await _preferences.get("ProjectItem");
              ExtendedNavigator.of(context).replace(Routes.wechatHomeScreen,
                  arguments: WechatHomeScreenArguments(
                    affData: jsonDecode(project),
                    msgPageTabIndex: 0,
                  ));
            }
          });
        },
        textColor: Colors.white,
        color: Colors.deepOrange[300],
        elevation: 2,
      ),
    );
  }

  _loginOutButton(context, state) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 50, 10, 0),
      width: 350,
      height: 50,
      child: RaisedButton(
        splashColor: Colors.lightBlueAccent,
        child:
            Text("退出登陆", style: TextStyle(color: Colors.white, fontSize: 18)),
        onPressed: () {
          showDialog(
              barrierDismissible: true,
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("提示"),
                  content: Text("请确认是否退出"),
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
            if (value && value != null) {
              exit(0);
              // if (Navigator.canPop(context)) {
              //   Navigator.pop(context);
              // } else {
              //   exit(0);
              // }
            }
          });
        },
        textColor: Colors.white,
        color: Colors.blue[500],
        elevation: 2,
      ),
    );
  }

  _submitButton(context, state) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 50, 10, 0),
      width: 350,
      height: 50,
      child: RaisedButton(
        splashColor: Colors.lightBlueAccent,
        child: Text("提交", style: TextStyle(color: Colors.white, fontSize: 18)),
        onPressed: () {
          showDialog(
              barrierDismissible: true,
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("提示"),
                  content: Text("请确认是否提交"),
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
            if (value && value != null) {
              String image;
              String nickName;
              if (_listImg.length != 0) {
                var compressResult = await imageCompressAndGetFile(_listImg[0]);
                image = compressResult.path;
              } else {
                image = state.userInfo["headimgUrl"] != null
                    ? state.userInfo["headimgUrl"]
                    : imgWhenNull;
              }
              if (_textFeid != "") {
                nickName = _textFeid;
              } else {
                nickName = state.userInfo["nickName"] != null
                    ? state.userInfo["nickName"]
                    : "";
              }
              print(image);
              print(nickName);
              BlocProvider.of<WechatMineBloc>(context)
                ..add(WechatMineEvent.updatevistorInfo(image, nickName));
            }
          });
        },
        textColor: Colors.white,
        color: Colors.cyan,
        elevation: 2,
      ),
    );
  }

  /** 压缩图片*/
  Future<File> imageCompressAndGetFile(File file) async {
    if (file.lengthSync() < 200 * 1024) {
      return file;
    }
    var quality = 100;
    if (file.lengthSync() > 4 * 1024 * 1024) {
      quality = 50;
    } else if (file.lengthSync() > 2 * 1024 * 1024) {
      quality = 60;
    } else if (file.lengthSync() > 1 * 1024 * 1024) {
      quality = 70;
    } else if (file.lengthSync() > 0.5 * 1024 * 1024) {
      quality = 80;
    } else if (file.lengthSync() > 0.25 * 1024 * 1024) {
      quality = 90;
    }
    var dir = await getTemporaryDirectory();
    var targetPath = dir.absolute.path +
        "/" +
        DateTime.now().millisecondsSinceEpoch.toString() +
        ".jpg";

    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      minWidth: 600,
      quality: quality,
      rotate: 0,
    );

    print("压缩前：${file.lengthSync() / 1024}");

    print("压缩后：${result.lengthSync() / 1024}");

    return result;
  }
}
