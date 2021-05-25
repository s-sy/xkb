import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/presentation/components/border_dotted_line.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';
import 'package:image_picker/image_picker.dart';

class NewFollowUp extends StatefulWidget {
  NewFollowUp({Key key}) : super(key: key);

  @override
  _NewFollowUpState createState() => _NewFollowUpState();
}

class _NewFollowUpState extends State<NewFollowUp> {
  bool isSelect01 = false;
  bool isSelect02 = false;
  bool isSelect03 = false;
  bool isSelect04 = false;
  bool isSelect05 = false;
  bool isSelect06 = false;
  bool isSelect07 = false;
  bool isSelect08 = false;
  bool isSelect09 = false;
  bool isSelect10 = false;
  bool isSelect11 = false;
  List _listImg = [];
  List _listComment = [
    "客户兴趣不大，没有目标性",
    "客户在外地，节假日才能回来",
    "天气不好，取消看房",
    "珍爱生命，远离臭嘴客户",
    "风太大，下次吧",
    "夺命电话阔，加微信加微信加微信加微信加微信加微信"
  ];
  String _textFeid = "";
  String _addComment = "";
  String _updateComment = "";
  bool _isStart = false;
  // TextEditingController _controller;
  TextEditingController _controller2;
  String _valueChanged2 = '';
  bool _isRemind = false;
  bool _isTimeChanged = false;

  @override
  void initState() {
    // _controller = new TextEditingController(text: _textFeid);
    _controller2 = TextEditingController(text: DateTime.now().toString());
    super.initState();
  }

  // @override
  // void dispose() {
  //   isSelect01 = false;
  //   isSelect02 = false;
  //   isSelect03 = false;
  //   isSelect04 = false;
  //   isSelect05 = false;
  //   isSelect06 = false;
  //   isSelect07 = false;
  //   isSelect08 = false;
  //   isSelect09 = false;
  //   isSelect10 = false;
  //   isSelect11 = false;
  //   _textFeid = "";
  //   _listImg = [];
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Listener(
        onPointerDown: (onPointerDown) {
          FocusScope.of(context).requestFocus(FocusNode());
          print('手指按下回调');
        },
        // onPointerMove: (onPointerMove) {
        //   // 触摸收起键盘
        //   FocusScope.of(context).requestFocus(FocusNode());
        //   print('手指移动回调');
        // },
        // onPointerUp: (onPointerUp) {
        //   FocusScope.of(context).requestFocus(FocusNode());
        //   print('手指抬起回调');
        // },
        child: Scaffold(
            appBar: AppBar(
              title: Text('新增记录'),
            ),
            backgroundColor: Colors.grey[200],
            // body: Container(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // follow_up_tag01(
                          //     '跟进方式', '来电', '去电', '主动拜访', '其他', '微信'),
                          // follow_up_tag02(
                          //     '意向级别', 'A', 'B', 'C', 'D', 'E', '已验资'),
                          tag_head('跟进方式'),
                          //目前先用这种方式，点击事件还没有做，上面tag方式自带点击效果的
                          Container(
                            margin: EdgeInsets.fromLTRB(12, 0, 0, 0),
                            child: Wrap(
                              spacing: 7.0,
                              runSpacing: 8.0,
                              children: <Widget>[
                                followUp_tag('来电', 23, isSelect01),
                                followUp_tag('去电', 23, isSelect02),
                                followUp_tag('主动拜访', 23, isSelect03),
                                followUp_tag('其他', 23, isSelect04),
                                followUp_tag('微信', 23, isSelect05),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          tag_head('意向级别'),
                          Container(
                            margin: EdgeInsets.fromLTRB(12, 0, 0, 0),
                            child: Wrap(
                              spacing: 7.0,
                              runSpacing: 8.0,
                              children: <Widget>[
                                followUp_tag('A', 35, isSelect06),
                                followUp_tag('B', 35, isSelect07),
                                followUp_tag('C', 35, isSelect08),
                                followUp_tag('D', 35, isSelect09),
                                followUp_tag('E', 35, isSelect10),
                                followUp_tag('已验资', 22, isSelect11),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          tag_head('跟进内容'),
                          follow_up_content(),
                          Container(
                              height: 120.0,
                              width: 300,
                              child: Row(children: <Widget>[
                                add_to_content(Icons.image, '添加图片'),
                                add_to_content(Icons.text_fields, '添加常用语')
                              ])),
                          Center(
                              child: _listImg.length == 0
                                  ? Text("")
                                  : _showImage()),

                          next_follow(),
                        ],
                      ),
                    ),
                  ),
                ),
                _bottom(),
              ],
            )));
  }

  followUp_tag(String tag, double num, bool istap) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.fromLTRB(num, 5, num, 5),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                width: 1.0, color: istap ? Colors.blue[300] : Colors.grey[300]),
            borderRadius: BorderRadius.circular(5.0)),
        child: Text(tag,
            style: TextStyle(
                fontSize: 14.0, color: istap ? Colors.blue : Colors.grey)),
      ),
      onTap: () {
        setState(() {
          _getOnTap(tag);
        });
      },
    );
  }

  //标题头
  tag_head(String title) {
    return Container(
      margin: EdgeInsets.fromLTRB(12, 10, 0, 5),
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black54),
          ),
          Container(
            padding: EdgeInsets.only(top: 5.0),
            child: Text(
              '*',
              style: TextStyle(
                  color: Colors.red, fontSize: 17, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }

  //跟进内容
  follow_up_content() {
    return Container(
      height: 100.0,
      margin: EdgeInsets.fromLTRB(12, 0, 20, 0),
      child: TextField(
          maxLines: 5,
          minLines: 1,
          textInputAction: TextInputAction.go,
          decoration: InputDecoration(
            hintText: '请输入内容',
            border: InputBorder.none,
            isDense: true,
            hintStyle: TextStyle(color: Colors.grey[400]),
          ),
          controller: TextEditingController(text: _textFeid),
          onChanged: (val) {
            _textFeid = val;
          }),
    );
  }

  //添加图片，添加内容模版
  add_to_content(IconData icon, String title) {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            height: 90.0,
            child:
                DashedRect(color: Colors.grey[400], strokeWidth: 1.0, gap: 3.0),
          ),
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0, 19, 0, 0),
                width: 80.0,
                child: DashedRect(
                    color: Colors.grey[400], strokeWidth: 1.0, gap: 3.0),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Icon(icon, color: Colors.grey, size: 32)),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(title,
                      style: TextStyle(color: Colors.grey, fontSize: 12.0))),
              Container(
                margin: EdgeInsets.fromLTRB(0, 14, 0, 0),
                width: 80.0,
                child: DashedRect(
                    color: Colors.grey[400], strokeWidth: 1.0, gap: 3.0),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(1, 0, 0, 0),
            height: 90.0,
            child:
                DashedRect(color: Colors.grey[400], strokeWidth: 1.0, gap: 3.0),
          )
        ],
      ),
      onTap: () {
        if (title == "添加图片") {
          _openModalBottomSheet();
        } else if (title == "添加常用语") {
          _openModalBottomSheetText();
        }
      },
    );
  }

  //添加常用语下拉弹窗
  Future _openModalBottomSheetText() async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            children: <Widget>[
              Container(
                  height: 200.0,
                  child: ListView.builder(
                      itemCount: _listComment.length,
                      itemBuilder: (context, i) => Container(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              InkWell(
                                child: Container(
                                  width: 50,
                                  child: Icon(
                                    Icons.border_color,
                                    color: Colors.grey[400],
                                  ),
                                ),
                                onTap: () {
                                  showDialog(
                                      barrierDismissible: true,
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text("提示"),
                                          content: TextField(
                                              maxLines: 5,
                                              minLines: 1,
                                              textInputAction:
                                                  TextInputAction.go,
                                              decoration: InputDecoration(
                                                hintText: '请输入内容',
                                                border: InputBorder.none,
                                                isDense: true,
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[400]),
                                              ),
                                              controller: TextEditingController(
                                                  text: _listComment[i]),
                                              // _textFeid
                                              onChanged: (val) {
                                                _updateComment = val;
                                              }),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text("确定"),
                                              onPressed: () {
                                                setState(() {
                                                  _listComment[i] =
                                                      _updateComment;
                                                });
                                                Navigator.of(context).pop(true);
                                                // Navigator.pop(context, true);
                                              },
                                            )
                                          ],
                                        );
                                      });
                                },
                              ),
                              Expanded(
                                  child: InkWell(
                                child: Center(
                                    child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    _listComment[i],
                                    maxLines: 1,
                                    // overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )),
                                onTap: () {
                                  setState(() {
                                    _textFeid = _listComment[i];
                                  });
                                  Navigator.pop(context, _listComment[i]);
                                },
                              )),
                              InkWell(
                                child: Container(
                                  width: 60,
                                  child: Icon(Icons.remove_circle_outline,
                                      color: Colors.grey[400], size: 30),
                                ),
                                onTap: () {
                                  showDialog(
                                      barrierDismissible: true,
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text("提示"),
                                          content: Text("删除不可恢复，确定要删除吗？"),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text("确定"),
                                              onPressed: () {
                                                setState(() {
                                                  _listComment
                                                      .remove(_listComment[i]);
                                                });
                                                Navigator.of(context).pop(true);
                                                Navigator.pop(context, true);
                                              },
                                            )
                                          ],
                                        );
                                      });
                                },
                              ),
                            ],
                          )))),
              ListTile(
                title: Text('新增',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue)),
                onTap: () {
                  showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("提示"),
                          content: TextField(
                              maxLines: 5,
                              minLines: 1,
                              textInputAction: TextInputAction.go,
                              decoration: InputDecoration(
                                hintText: '请输入内容',
                                border: InputBorder.none,
                                isDense: true,
                                hintStyle: TextStyle(color: Colors.grey[400]),
                              ),
                              onChanged: (val) {
                                _addComment = val;
                              }),
                          actions: <Widget>[
                            FlatButton(
                              child: Text("确定"),
                              onPressed: () {
                                if (_addComment != "") {
                                  setState(() {
                                    _listComment.add(_addComment);
                                  });
                                  _addComment = "";
                                }

                                Navigator.of(context).pop(true);
                                // Navigator.pop(context, true);
                              },
                            )
                          ],
                        );
                      });
                  // Navigator.pop(context, '新增');
                },
              ),
              ListTile(
                title: Text('取消',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue[200])),
                onTap: () {
                  Navigator.pop(context, '取消');
                },
              ),
            ],
          );
        });
    // print(option);
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
    if (_listImg.length >= 3) {
      showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("提示信息"),
              content: Text("最多上传3张，请筛选上传。"),
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
    } else {
      setState(() {
        if (pickedFile != null) {
          File image = File(pickedFile.path);
          _listImg.add(image);
        } else {
          print('No image selected.');
        }
      });
    }
  }

  //拍照
  Future _getImageFromCamera() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.camera, maxWidth: 400);
    if (_listImg.length >= 3) {
      showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("提示信息"),
              content: Text("最多上传3张，请筛选上传。"),
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
    } else {
      setState(() {
        if (pickedFile != null) {
          File image = File(pickedFile.path);
          _listImg.add(image);
        } else {
          print('No image selected.');
        }
      });
    }
  }

  _showImage() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      // controller: ScrollController(),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(width: 10),
          InkWell(
              child: Icon(Icons.add_circle_outline,
                  color: Colors.grey[300], size: 40),
              onTap: () async {
                final pickedFile =
                    await ImagePicker().getImage(source: ImageSource.gallery);
                if (_listImg.length >= 3) {
                  showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("提示信息"),
                          content: Text("最多上传3张，请筛选上传。"),
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
                } else {
                  setState(() {
                    if (pickedFile != null) {
                      File image = File(pickedFile.path);
                      _listImg.add(image);
                    } else {
                      print('No image selected.');
                    }
                  });
                }
              }),
          SizedBox(width: 15),
          Container(
            height: 120,
            decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.blue[300])),
            child: ListView.builder(
                itemCount: _listImg.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) => InkWell(
                    child: Image.file(
                      _listImg[i],
                    ),
                    onTap: () {
                      ExtendedNavigator.of(context)
                          .push(Routes.uploadImgPreview,
                              arguments: UploadImgPreviewArguments(
                                img: _listImg[i],
                              ));
                    })),
          ),
          SizedBox(width: 15),
          InkWell(
              child: Icon(Icons.remove_circle_outline,
                  color: Colors.grey[300], size: 40),
              onTap: () {
                setState(() {
                  _listImg.remove(_listImg[_listImg.length - 1]);
                });
              }),
          SizedBox(width: 10)
        ],
      ),
    );
  }

  //下次跟进
  next_follow() {
    return Container(
      height: 45.0,
      decoration: BoxDecoration(
        // color: Colors.pink[100],
        border: Border(top: BorderSide(width: 1, color: Color(0xffe5e5e5))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Row(
              children: <Widget>[
                Text(
                  '下次跟进',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text(
                    '*',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: _isRemind
                        ? Icon(Icons.error_outline, color: Colors.red)
                        : Text("")),
                Container(
                  width: 85,
                  // decoration: BoxDecoration(color: Colors.yellow),
                  // padding: EdgeInsets.only(bottom: 5),
                  child: DateTimePicker(
                    decoration: InputDecoration(border: InputBorder.none),
                    type: DateTimePickerType.dateTime,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: _isTimeChanged ? Colors.blue : Colors.grey),
                    dateMask: 'yyyy-MM-dd',
                    controller: _controller2,
                    firstDate:
                        DateTime.parse(DateTime.now().toString()).toLocal(),
                    // lastDate: dueDate01, 等写bloc了，再把这里写全
                    lastDate: DateTime(2100),
                    use24HourFormat: true,
                    locale: Locale('zh', 'CH'),
                    onChanged: (val) {
                      // DateTime changeTime = DateTime.parse(val).toLocal();
                      // DateTime nowTime = DateTime.now();
                      // Duration _limitTime = dueDate03.difference(createTime);
                      // Duration _firstRemind = changeTime.difference(nowTime);
                      // Duration _secondRemind = changeTime.difference(dueDate02);
                      // nextRemindTime = _firstRemind.inMinutes.toString();
                      // if (_firstRemind.inSeconds > _limitTime.inSeconds ||
                      //     _secondRemind.inSeconds > 0 ||
                      //     _firstRemind.inSeconds < 0) {
                      //   showDialog(
                      //       barrierDismissible: true,
                      //       context: context,
                      //       builder: (context) {
                      //         return AlertDialog(
                      //           title: Text("提示信息"),
                      //           content: Text("超出规定时间，请重新设置"),
                      //           actions: <Widget>[
                      //             FlatButton(
                      //               child: Text("确定"),
                      //               onPressed: () {
                      //                 Navigator.of(context).pop(true);
                      //               },
                      //             )
                      //           ],
                      //         );
                      //       });
                      //   setState(() {
                      //     _isRemind = true;
                      //   });
                      // } else {
                      //   setState(() {
                      //     _isRemind = false;
                      //   });
                      // }
                      setState(() {
                        _valueChanged2 = val;
                        _isTimeChanged = true;
                      });
                    },
                    // validator: (val) {
                    //   setState(() => _valueToValidate2 = val);
                    //   return null;
                    // },
                    // onSaved: (val) => setState(() => _valueSaved2 = val),
                  ),
                ),
                Icon(
                  Icons.navigate_next,
                  color: _valueChanged2 != "" ? Colors.blue : Colors.grey,
                ),
                SizedBox(width: 10)
              ],
            ),
          )
          // Container(
          //   margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
          //   child: Row(
          //     children: <Widget>[
          //       Text(
          //         '2020-08-27',
          //         style: TextStyle(
          //             fontSize: 16,
          //             fontWeight: FontWeight.w500,
          //             color: Colors.grey),
          //       ),
          //       Icon(
          //         Icons.navigate_next,
          //         color: Colors.grey,
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }

  //底部保存按钮
  _bottom() {
    return Container(
      height: 60.0,
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                _isStart = !_isStart;
              });
              // print('点击了关注');
            },
            child: Container(
              width: 90.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _isStart
                      ? Icon(Icons.star, color: Colors.red, size: 30)
                      : Icon(Icons.star_border, color: Colors.grey, size: 30),
                  Text(
                    '关注',
                    style:
                        TextStyle(color: _isStart ? Colors.red : Colors.grey),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: GestureDetector(
                  onTap: () {
                    print('点击了保持按钮');
                    // Navigator.push(
                    //   context,
                    //   new MaterialPageRoute(builder: (context) => new NewFollowUp()),
                    // );
                  },
                  child: InkWell(
                    child: Container(
                      height: 60.0,
                      decoration: BoxDecoration(color: Colors.blue[300]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '保存',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      showDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("提示"),
                              content: Text("请确认是否提交"),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text("取消",
                                      style:
                                          TextStyle(color: Colors.blue[200])),
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
                          print("bilibilibibilbiibibili");
                        }
                      });
                    },
                  )))
        ],
      ),
    );
  }

  _getOnTap(String onTap) {
    switch (onTap) {
      case "来电":
        isSelect02 = false;
        isSelect03 = false;
        isSelect04 = false;
        isSelect05 = false;
        return isSelect01 = !isSelect01;
      case "去电":
        isSelect01 = false;
        isSelect03 = false;
        isSelect04 = false;
        isSelect05 = false;
        return isSelect02 = !isSelect02;
      case "主动拜访":
        isSelect02 = false;
        isSelect01 = false;
        isSelect04 = false;
        isSelect05 = false;
        return isSelect03 = !isSelect03;
      case "其他":
        isSelect02 = false;
        isSelect03 = false;
        isSelect01 = false;
        isSelect05 = false;
        return isSelect04 = !isSelect04;
      case "微信":
        isSelect02 = false;
        isSelect03 = false;
        isSelect04 = false;
        isSelect01 = false;
        return isSelect05 = !isSelect05;
      case "A":
        isSelect07 = false;
        isSelect08 = false;
        isSelect09 = false;
        isSelect10 = false;
        isSelect11 = false;
        return isSelect06 = !isSelect06;
      case "B":
        isSelect06 = false;
        isSelect08 = false;
        isSelect09 = false;
        isSelect10 = false;
        isSelect11 = false;
        return isSelect07 = !isSelect07;
      case "C":
        isSelect07 = false;
        isSelect06 = false;
        isSelect09 = false;
        isSelect10 = false;
        isSelect11 = false;
        return isSelect08 = !isSelect08;
      case "D":
        isSelect07 = false;
        isSelect08 = false;
        isSelect06 = false;
        isSelect10 = false;
        isSelect11 = false;
        return isSelect09 = !isSelect09;
      case "E":
        isSelect07 = false;
        isSelect08 = false;
        isSelect09 = false;
        isSelect06 = false;
        isSelect11 = false;
        return isSelect10 = !isSelect10;
      case "已验资":
        isSelect07 = false;
        isSelect08 = false;
        isSelect09 = false;
        isSelect10 = false;
        isSelect06 = false;
        return isSelect11 = !isSelect11;
    }
  }

//后面这两个方法是tag方式，用了后又抛弃了，因为没有边框线可选，界面效果有点丑，但要做点击效果这个更好点

  //新增记录tag栏 - 跟进方式
  follow_up_tag01(String title, String tag01, String tag02, String tag03,
      String tag04, String tag05) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
          child: Row(
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Container(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                  '*',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
        ChipTheme(
          data: ChipThemeData(
            backgroundColor: Colors.grey[100],
            disabledColor: Colors.yellow,
            selectedColor: Colors.blue,
            secondarySelectedColor: Colors.black,
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            labelStyle: TextStyle(color: Colors.black),
            secondaryLabelStyle: TextStyle(color: Colors.pink),
            brightness: Brightness.dark,
            elevation: 0,
            // shadowColor: Colors.white,
          ),
          child: Wrap(
            spacing: 10.0,
            runSpacing: 0.0,
            children: <Widget>[
              Chip(
                label: Text(tag01,
                    style: TextStyle(fontSize: 18, color: Colors.grey)),
              ),
              Chip(
                label: Text(tag02,
                    style: TextStyle(fontSize: 18, color: Colors.grey)),
              ),
              Chip(
                label: Text(tag03,
                    style: TextStyle(fontSize: 18, color: Colors.grey)),
              ),
              Chip(
                label: Text(tag04,
                    style: TextStyle(fontSize: 18, color: Colors.grey)),
              ),
              Chip(
                label: Text(tag05,
                    style: TextStyle(fontSize: 18, color: Colors.grey)),
              ),
            ],
          ),
        )
      ],
    );
  }

  //新增记录tag栏 - 意向级别
  follow_up_tag02(String title, String tag01, String tag02, String tag03,
      String tag04, String tag05, String tag06) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
          child: Row(
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Container(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                  '*',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
        ChipTheme(
          data: ChipThemeData(
            backgroundColor: Colors.white,
            disabledColor: Colors.yellow,
            selectedColor: Colors.blue,
            secondarySelectedColor: Colors.black,
            padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            labelStyle: TextStyle(color: Colors.black),
            secondaryLabelStyle: TextStyle(color: Colors.pink),
            brightness: Brightness.dark,
            elevation: 2,
            shadowColor: Colors.grey[200],
          ),
          child: Wrap(
            spacing: 10.0,
            runSpacing: 0.0,
            children: <Widget>[
              Chip(
                label: Text(tag01,
                    style: TextStyle(fontSize: 18, color: Colors.grey)),
              ),
              Chip(
                label: Text(tag02,
                    style: TextStyle(fontSize: 18, color: Colors.grey)),
              ),
              Chip(
                label: Text(tag03,
                    style: TextStyle(fontSize: 18, color: Colors.grey)),
              ),
              Chip(
                label: Text(tag04,
                    style: TextStyle(fontSize: 18, color: Colors.grey)),
              ),
              Chip(
                label: Text(tag05,
                    style: TextStyle(fontSize: 18, color: Colors.grey)),
              ),
              Chip(
                label: Text(tag06,
                    style: TextStyle(fontSize: 18, color: Colors.grey)),
              ),
            ],
          ),
        )
      ],
    );
  }
}
