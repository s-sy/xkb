import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_ui/application/wxpage/picture/dazzle_the_real_estate_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/components/chat/public.dart';
import 'package:flutter_ui/presentation/home/message/processed/processed_photoselect_view.dart';
import 'package:flutter_ui/presentation/home/ui_view/jh_bottom_sheet.dart';
import 'package:flutter_ui/presentation/home/ui_view/jh_image_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo/photo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WechatSetPicture extends StatefulWidget {
  @override
  _WechatSetPictureState createState() => _WechatSetPictureState();
}

class _WechatSetPictureState extends State<WechatSetPicture> {
  List imgData = List();
  String remark = "";

  @override
  void initState() {
    super.initState();
    imgData.add("selectPhoto_add");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DazzleTheRealEstateBloc>(),
      child: BlocConsumer<DazzleTheRealEstateBloc, DazzleTheRealEstateState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Listener(
            onPointerDown: (onPointerDown) {
              FocusScope.of(context).requestFocus(FocusNode());
              print('手指按下回调');
            },
            child: Scaffold(
              appBar: AppBar(
                  title:
                      Text("发布炫拍", style: TextStyle(color: Colors.grey[700])),
                  elevation: 0.0,
                  brightness: Brightness.light,
                  backgroundColor: Colors.white,
                  iconTheme: IconThemeData(color: Colors.grey[700])),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 150,
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: TextField(
                            maxLines: 5,
                            minLines: 1,
                            textInputAction: TextInputAction.go,
                            decoration: InputDecoration(
                              hintText: "请输入说明文字",
                              border: InputBorder.none,
                              isDense: true,
                              hintStyle: TextStyle(
                                  color: Colors.grey[400], fontSize: 16),
                            ),
                            onChanged: (val) {
                              remark = val;
                            }),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          controller: ScrollController(),
                          child: Row(
                            children: <Widget>[
                              // SizedBox(width: 70.0),
                              Container(
                                height: 80,
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: ListView.builder(
                                    itemCount: imgData.length - 1,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) => Container(
                                          margin: EdgeInsets.only(left: 5.0),
                                          child: _showImg(index, setState,
                                              imgData, context),
                                        )),
                              ),
                              SizedBox(width: 15),
                              Container(
                                height: 80,
                                child: addBtn(context, setState, imgData),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5.0, top: 10),
                        child: Text(
                          "一次最多上传9张图片哦",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 50, 10, 0),
                        width: 400,
                        height: 50,
                        child: RaisedButton(
                          splashColor: Colors.lightBlueAccent,
                          child: Text("确认发布",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
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
                                        child: Text("取消",
                                            style: TextStyle(
                                                color: Colors.blue[200])),
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
                              // SharedPreferences pre =
                              //     await SharedPreferences.getInstance();
                              // var userinfo = await pre.get("UserInfo");
                              // if (userinfo == null) {
                              //   BotToast.showText(text: "请先登陆");
                              // } else if (jsonDecode(userinfo)["nickName"] ==
                              //     null) {
                              //   BotToast.showText(text: "信息不全，请先完善个人信息");
                              // } else {
                              if (value && value != null) {
                                BlocProvider.of<DazzleTheRealEstateBloc>(
                                    context)
                                  ..add(DazzleTheRealEstateEvent.releasedazzle(
                                      remark, state.imgData));
                              }
                              // }
                            });
                          },
                          textColor: Colors.white,
                          color: Colors.cyan,
                          elevation: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _showImg(index, setState, imgData, context) {
    return InkWell(
        child: Container(
            margin: EdgeInsets.only(left: 0),
            width: 80,
            height: 100,
            child: Stack(alignment: Alignment.topRight, children: <Widget>[
              ConstrainedBox(
                child: Image.file(File(imgData[index]), fit: BoxFit.cover),
                constraints: BoxConstraints.expand(),
              ),
              GestureDetector(
                child: Image(
                  image: JhImageUtils.getAssetImage("selectPhoto_close"),
                  width: 25,
                  height: 25,
                ),
                onTap: () {
                  setState(() {
                    imgData.removeAt(index);
                    BlocProvider.of<DazzleTheRealEstateBloc>(context)
                        .add(DazzleTheRealEstateEvent.removeImg(index));
                  });
                },
              )
            ])),
        onTap: () {
          print("点击第${index}张图片");
        });
  }

/** 添加按钮 */
  Widget addBtn(context, setState, imgData) {
    return GestureDetector(
      child: Image(image: JhImageUtils.getAssetImage("selectPhoto_add")),
      onTap: () {
        JhBottomSheet.showText(context, dataArr: ["拍照", "相册"], title: "请选择",
            clickCallback: (index, str) async {
          if (index == 1) {
            var image = await ImagePicker.pickImage(source: ImageSource.camera);
            print(image);
            if (image != null) {
              File imagess = File(image.path);
              imgData.insert(imgData.length - 1, image.absolute.path);
              var compressResult = await imageCompressAndGetFile(imagess);
              BlocProvider.of<DazzleTheRealEstateBloc>(context).add(
                  DazzleTheRealEstateEvent.qiNiuLoad(
                      compressResult.absolute.path));
              setState(() {});
            }
          }
          if (index == 2) {
            pickAsset(context, setState, imgData);
          }
        });
      },
    );
  }

/** 多图选择 */
  void pickAsset(context, setState, imgData) async {
    final result = await PhotoPicker.pickAsset(
      context: context,
      maxSelected: 10 - imgData.length,
      pickType: PickType.onlyImage,
      thumbSize: 200,
    );

    if (result != null && result.isNotEmpty) {
      for (var e in result) {
        var file = await e.file;
        print(file.absolute.path);
        var compressResult = await imageCompressAndGetFile(file);
        print(compressResult);

        if (!imgData.contains(file.absolute.path)) {
          imgData.insert(imgData.length - 1, file.absolute.path);
        }
        BlocProvider.of<DazzleTheRealEstateBloc>(context).add(
            DazzleTheRealEstateEvent.qiNiuLoad(compressResult.absolute.path));
      }
    }
    setState(() {});
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
