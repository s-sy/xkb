import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/auth/auth_bloc.dart';
import 'package:flutter_ui/application/mine/bloc/mine_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MineSettingPage extends StatefulWidget {
  MineSettingPage({Key key}) : super(key: key);

  @override
  _MineSettingPageState createState() => _MineSettingPageState();
}

class _MineSettingPageState extends State<MineSettingPage> {
  List _listImg = [];
  String _networkImage = "https://www.itying.com/images/flutter/7.png";
  bool _isFileImg = false;
  String _nameFeid = "刘聪";
  String _cachedSignInUser = "";
  String _textFeid = "";

  _getValue() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _cachedSignInUser = sharedPreferences.get('CACHED_SIGN_IN_USER');
    setState(() {
      _cachedSignInUser;
    });
  }

  @override
  void initState() {
    _getValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (BuildContext context) => getIt<AuthBloc>(),
          ),
          BlocProvider<MineBloc>(
            create: (BuildContext context) => getIt<MineBloc>(),
          ),
        ],
        child: BlocConsumer<AuthBloc, AuthBlocState>(
            listener: (context, state) async {},
            builder: (context, state) {
              return Listener(
                  onPointerDown: (onPointerDown) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    print('手指按下回调');
                  },
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text('设置'),
                      // actions: [
                      //   Center(
                      //       child: Container(
                      //           margin: EdgeInsets.only(right: 20),
                      //           child: InkWell(
                      //             child: Text(
                      //               "分享",
                      //               style: TextStyle(
                      //                   color: Colors.white,
                      //                   fontSize: 15,
                      //                   fontWeight: FontWeight.w500),
                      //             ),
                      //             onTap: () {
                      //               // BlocProvider.of<ProcessBloc>(context)
                      //               //     .add(ProcessEvent.shareCode());
                      //             },
                      //           )))
                      // ],
                    ),
                    body: SingleChildScrollView(
                        child: Column(
                      children: <Widget>[
                        _headImage(),
                        _mainInfoTab("昵称", "请输入昵称"),
                        _submitButton(context),
                        // SizedBox(height: 50),
                        _loginOut(),
                      ],
                    )),
                  ));
            }));
  }

  _headImage() {
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
              if (_cachedSignInUser != "")
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
                            : NetworkImage(
                                jsonDecode(_cachedSignInUser)['headimgUrl']),
                        //NetworkImage(_networkImage),
                      ),
                    ),
                  ),
                  onTap: () {
                    if (_isFileImg) {
                      ExtendedNavigator.of(context)
                          .push(Routes.uploadImgPreview,
                              arguments: UploadImgPreviewArguments(
                                img: _listImg[0],
                              ));
                    } else {
                      ExtendedNavigator.of(context).push(
                          Routes.uploadNetImgPreview,
                          arguments: UploadNetImgPreviewArguments(
                              img: jsonDecode(_cachedSignInUser)['headimgUrl']
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

  _mainInfoTab(String keyName, String tipsName) {
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
          if (_cachedSignInUser != "")
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
                          : jsonDecode(_cachedSignInUser)['nickName'],
                      // 保持光标在最后
                      selection: TextSelection.fromPosition(TextPosition(
                        affinity: TextAffinity.downstream,
                        offset: _textFeid != ""
                            ? _textFeid.length
                            : jsonDecode(_cachedSignInUser)['nickName'].length,
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

  _submitButton(context) {
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
              }).then((value) {
            if (value) {
              String image;
              String nickName;
              if (_listImg.length != 0) {
                image = _listImg[0].path;
              } else {
                image = jsonDecode(_cachedSignInUser)['headimgUrl'];
              }
              if (_textFeid != "") {
                nickName = _textFeid;
              } else {
                nickName = jsonDecode(_cachedSignInUser)['nickName'];
              }
              // print(image);
              // print(nickName);
              BlocProvider.of<MineBloc>(context)
                  .add(MineEvent.submitInfo(image, nickName));
            }
          });
        },
        textColor: Colors.white,
        color: Colors.blue[500],
        elevation: 2,
      ),
    );
  }

  _loginOut() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
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
              }).then((value) {
            // print("balabalabali");
            if (value) {
              BlocProvider.of<AuthBloc>(context).add(AuthBlocEvent.signedOut());
              // Navigator.of(context).pop(true);
              // loginScreen
              ExtendedNavigator.of(context).replace(Routes.loginScreen);
            }
          });
        },
        textColor: Colors.white,
        color: Colors.blue[500],
        elevation: 2,
      ),
    );

    // return GestureDetector(
    //   child: Container(
    //       height: 50.0,
    //       width: 90,
    //       margin: EdgeInsets.only(left: 10.0),
    //       decoration: BoxDecoration(
    //           color: Colors.blue, borderRadius: BorderRadius.circular(5.0)),
    //       child: Center(
    //         child: Text('退出登陆',
    //             style: TextStyle(
    //                 color: Colors.white,
    //                 fontSize: 15.0,
    //                 fontWeight: FontWeight.w500)),
    //       )),
    //   onTap: () {
    //     print('点击了退出登陆');
    //     // context.bloc<AuthBloc>().add(
    //     //       const AuthBlocEvent.signedOut(),
    //     //     );
    //     // ExtendedNavigator.of(context).replace(Routes.signInPage);
    //   },
    // );
  }
}
