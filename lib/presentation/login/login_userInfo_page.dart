import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/message/bloc/web_scoket_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';
import 'package:image_picker/image_picker.dart';

class LoginUserInfoPage extends StatefulWidget {
  @override
  _LoginUserInfoPageState createState() => _LoginUserInfoPageState();
}

class _LoginUserInfoPageState extends State<LoginUserInfoPage> {
  List _listImg = [];
  String _networkImage = "https://www.itying.com/images/flutter/2.png";
  bool _isFileImg = false;
  String _textFeidName = "";
  String _textFeidNickname = "";
  List _listRole = ["销秘", "置业顾问", "经理", "总监"];
  bool _isExpanded = false;
  int _indexOfRole = 0;
  int groupValue = 1;
  List houseList = ["汉旺世纪城", "学府春天", "卓尔生活城"];
  List listSelectHouse = [];
  List listSelectHouseId = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<WebScoketBloc>()
          ..add(WebScoketEvent.getRoles())
          ..add(WebScoketEvent.getAffiliated()),
        child: BlocConsumer<WebScoketBloc, WebScoketState>(
            listener: (context, state) async {
          if (state.isReset) {
            ExtendedNavigator.of(context).replace(Routes.fitnessAppHomeScreen);
          }
        }, builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: Text("完善信息"),
                automaticallyImplyLeading: false,
              ),
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                controller: ScrollController(),
                child: Column(
                  children: <Widget>[
                    _headImage(),
                    _mainInfoTab("姓名", "请输入姓名", "01"),
                    _mainInfoTab("昵称", "请输入昵称", "02"),
                    _sexRadio(),
                    // _gradeCustomer("性别", _listHouse, _indexOfHouse),
                    // _gradeCustomer("楼盘", _listRole, _indexOfRole),
                    _gradeCustomer("角色", state.listRoles, _indexOfRole),
                    _houseList("楼盘", state),
                    _submitButton(context, state),
                  ],
                ),
              ));
        }));
  }

  _houseList(String key, state) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            key,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
            child: Column(
          children: listSelectHouse.map<Widget>((value) {
            return Container(
              child: Text(value),
            );
          }).toList(),
        )),
        // Expanded(
        //     child: SingleChildScrollView(
        //         physics: BouncingScrollPhysics(),
        //         scrollDirection: Axis.horizontal,
        //         controller: ScrollController(),
        //         child:
        // ListView.builder(
        //   itemCount: state.listAffiliated.length,
        //               itemBuilder: (context, i)=> InkWell(
        //       child: Container(
        //         padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
        //         margin: EdgeInsets.fromLTRB(20.0, 10.0, 5.0, 0),
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(5.0),
        //           border: Border.all(width: 1.0, color: Colors.grey),
        //         ),
        //         child: Text(state.listAffiliated[['projectName'] + " "),
        //       ),
        //       onTap: () {
        //         setState(() {
        //           listSelectHouse.add(value['projectName']);
        //         });
        //       },
        //     ))
        Column(
          children: state.listAffiliated.map<Widget>((value) {
            return InkWell(
              child: Container(
                padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                margin: EdgeInsets.fromLTRB(20.0, 10.0, 5.0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(width: 1.0, color: Colors.grey),
                ),
                child: Text(value['projectName'] + " "),
              ),
              onTap: () {
                bool isRepeat = false;
                for (int i = 0; i < listSelectHouse.length; i++) {
                  if (listSelectHouse[i] == value['projectName']) {
                    isRepeat = true;
                  }
                }
                if (!isRepeat) {
                  setState(() {
                    listSelectHouse.add(value['projectName']);
                    listSelectHouseId.add(value['id']);
                  });
                }
                // _changeListAffid(state);这里可以优化，加个判断就好做点击效果了，但是现在不用这一块了，先不管了
              },
            );
          }).toList(),
        ),
        SizedBox(width: 20)
        // ))
      ],
    );
  }

  _changeListAffid(state) {
    List list = [];
    for (int i = 0; i < state.listAffiliated.length; i++) {
      Map<String, dynamic> map = {
        "key": false,
        "name": state.listAffiliated["projectName"]
      };
      list.add(map);
    }
    return list;
  }

  _sexRadio() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            "性别",
            style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(child: SizedBox()),
        Text("男",
            style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
                fontSize: 16)),
        Radio(
          value: 1,
          groupValue: groupValue,
          onChanged: (value) {
            setState(() {
              groupValue = value;
            });
          },
        ),
        SizedBox(width: 20),
        Text("女",
            style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
                fontSize: 16)),
        Radio(
          value: 2,
          groupValue: groupValue,
          onChanged: (value) {
            setState(() {
              groupValue = value;
            });
          },
        ),
        SizedBox(width: 10),
      ],
    );
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
              // if (_cachedSignInUser != "")
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
                          : NetworkImage(_networkImage),
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
                    ExtendedNavigator.of(context)
                        .push(Routes.uploadNetImgPreview,
                            arguments: UploadNetImgPreviewArguments(
                              img:
                                  // jsonDecode(_cachedSignInUser)['headimgUrl']
                                  _networkImage,
                            ));
                  }
                },
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 30, 0),
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

  _mainInfoTab(String keyName, String tipsName, String key) {
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
          Expanded(child: SizedBox()),
          // if (_cachedSignInUser != "")
          Container(
            width: 160,
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
                // controller: TextEditingController.fromValue(
                //   TextEditingValue(
                //     text: _textFeid,
                //     // 保持光标在最后
                //     selection: TextSelection.fromPosition(TextPosition(
                //       affinity: TextAffinity.downstream,
                //       offset: _textFeid.length,
                //     )),
                //   ),
                // ),
                onChanged: (val) {
                  if (key == "01") {
                    _textFeidName = val;
                  } else if (key == "02") {
                    _textFeidNickname = val;
                  }
                }),
          ),
        ],
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
              }).then((value) {
            if (value) {
              String image;
              if (_listImg.length != 0) {
                image = _listImg[0].path;
              } else {
                image = _networkImage;
              }
              // print(state.listRoles[_indexOfRole]['roleCode']);
              // print(listSelectHouseId); // id
              //性别 1男 2女
              if (_textFeidName == "") {
                BotToast.showText(text: "姓名不能为空!");
              } else if (listSelectHouseId.length == 0) {
                BotToast.showText(text: "楼盘不能为空！");
              } else {
                BlocProvider.of<WebScoketBloc>(context).add(
                    WebScoketEvent.submitTestUserInfo(
                        image,
                        _textFeidName,
                        _textFeidNickname,
                        groupValue.toString(),
                        state.listRoles[_indexOfRole]['roleCode'],
                        listSelectHouseId));
              }
            }
          });
        },
        textColor: Colors.white,
        color: Colors.blue[500],
        elevation: 2,
      ),
    );
  }

  //折叠栏01
  _gradeCustomer(String dataKey, List dataValue, int index) {
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        margin: EdgeInsets.only(bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  // "客户等级",
                  dataKey,
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                )),
            if (dataValue.length != 0)
              Container(
                  width: 170,
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: ExpansionPanelList(
                    elevation: 0,
                    expansionCallback: (int panelIndex, bool isExpanded) {
                      setState(() {
                        _isExpanded = !isExpanded;
                      });
                    },
                    children: [
                      ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return Center(
                            child: Text(
                                // '${level[_levelIndex]}',
                                dataValue[index]['roleName'],
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.blue[300],
                                    fontWeight: FontWeight.w500)),
                          );
                        },
                        body: Container(
                          height: 140,
                          child: Scrollbar(
                            child: ListView.builder(
                              reverse: false,
                              itemBuilder: (BuildContext context, int i) {
                                return Card(
                                    margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                                    color: Colors.blue[300],
                                    child: InkWell(
                                      child: Container(
                                        height: 45,
                                        alignment: Alignment.center,
                                        child: Text(
                                          // '${level[index]}',
                                          dataValue[i]['roleName'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          _indexOfRole = i;
                                          _isExpanded = false;
                                        });
                                      },
                                    ));
                              },
                              itemCount: dataValue.length,
                            ),
                          ),
                        ),
                        isExpanded: _isExpanded,
                      ),
                    ],
                  )),
          ],
        ));
  }
}
