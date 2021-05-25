/**
 *  jh_photo_picker.dart
 *
 *  Created by iotjin on 2020/02/25.
 *  description:  图片选择
 */
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/messages/processed/processed_bloc.dart';
import 'package:flutter_ui/presentation/home/ui_view/jh_bottom_sheet.dart';
import 'package:flutter_ui/presentation/home/ui_view/jh_image_utils.dart';
import 'package:path_provider/path_provider.dart';

import 'package:photo/photo.dart';
import 'package:photo_manager/photo_manager.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

const double _itemSpace = 5.0;
const double _space = 5.0; //上下左右间距
const double _deleBtnWH = 20.0;
const Color _bgColor = Colors.transparent;
//const Color  _bgColor = Colors.yellow;

typedef CallBack = void Function(List imgData);

class JhPhotoPicker extends StatefulWidget {
  final double lfPaddingSpace; //外部设置的左右间距
  final CallBack callBack;

  JhPhotoPicker({
    this.lfPaddingSpace,
    this.callBack,
  });

  @override
  _JhPhotoPickerState createState() => _JhPhotoPickerState();
}

class _JhPhotoPickerState extends State<JhPhotoPicker> {
  double initWith = 70.0;
  List imgData = List(); //图片list
  List<AssetEntity> imgPicked = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imgData.add("selectPhoto_add"); //先添加 加号按钮 的图片
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    List data = List();
    data.addAll(imgData);
    data.removeAt(imgData.length - 1);
    widget.callBack(data);
  }

  @override
  Widget build(BuildContext context) {
    var kScreenWidth = MediaQuery.of(context).size.width;

    var lfPadding = widget.lfPaddingSpace == null ? 0.0 : widget.lfPaddingSpace;
    var ninePictureW = (kScreenWidth - _space * 2 - 2 * _itemSpace - lfPadding);
    var itemWH = ninePictureW / 3;
    int columnCount = imgData.length > 6
        ? 3
        : imgData.length <= 3
            ? 1
            : 2;

    // return Container(
    //     color: Colors.yellow,
    //     margin: EdgeInsets.only(left: 60.0),
    //     width: kScreenWidth - lfPadding,
    //     height:
    //         columnCount * itemWH + _space * 2 + (columnCount - 1) * _itemSpace,
    //     child: GridView.builder(
    //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //           //可以直接指定每行（列）显示多少个Item
    //           //一行的Widget数量
    //           crossAxisCount: 4,
    //           crossAxisSpacing: _itemSpace, //水平间距
    //           mainAxisSpacing: _itemSpace, //垂直间距
    //           childAspectRatio: 0.7, //子Widget宽高比例
    //         ),
    //         physics: NeverScrollableScrollPhysics(),
    //         padding: EdgeInsets.all(_space), //GridView内边距
    //         itemCount: imgData.length,
    //         itemBuilder: (context, index) {
    //           if (index == imgData.length - 1) {
    //             return addBtn(context, setState, imgData, imgPicked);
    //           } else {
    //             return imgItem(index, setState, imgData, imgPicked, context);
    //           }
    //         }));
    return Container(
        // height: 80,
        child: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      controller: ScrollController(),
      child: Row(
        children: <Widget>[
          SizedBox(width: 70.0),
          Container(
            height: 80,
            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: ListView.builder(
                itemCount: imgData.length - 1,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.only(left: 5.0),
                      child:
                          //  Text(imgData.length.toString()),
                          _showImg(
                              index, setState, imgData, imgPicked, context),
                    )),
          ),
          SizedBox(width: 15),
          Container(
            height: 60,
            child: addBtn(context, setState, imgData, imgPicked),
          )
        ],
      ),
    ));
  }
}

_showImg(index, setState, imgData, imgPicked, context) {
  // return Image.file(File(imgData[index]), fit: BoxFit.cover);
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
                });
              },
            )
          ])),
      onTap: () {
        print("点击第${index}张图片");
        BlocProvider.of<ProcessedBloc>(context)
            .add(ProcessedEvent.removeImg(index));
      });
}

/** 添加按钮 */
Widget addBtn(context, setState, imgData, imgPicked) {
  return GestureDetector(
    child: Image(image: JhImageUtils.getAssetImage("selectPhoto_add")),
    onTap: () {
      //点击添加按钮
      JhBottomSheet.showText(context, dataArr: ["拍照", "相册"], title: "请选择",
          clickCallback: (index, str) async {
        if (index == 1) {
          var image = await ImagePicker.pickImage(source: ImageSource.camera);
          print(image);

          // 上传
          // imgData.insert(imgData.length - 1, image.absolute.path);
//            imgPicked.add(image);
          if (image != null) {
            File imagess = File(image.path);
            imgData.insert(imgData.length - 1, image.absolute.path);

            var compressResult = await imageCompressAndGetFile(imagess);
            BlocProvider.of<ProcessedBloc>(context)
                .add(ProcessedEvent.qiNiuLoad(compressResult.absolute.path));
            setState(() {});
          }
        }
        if (index == 2) {
          pickAsset(context, setState, imgData, imgPicked);
        }
      });
    },
  );
}

/** 图片和删除按钮 */
Widget imgItem(index, setState, imgData, imgPicked, context) {
  return GestureDetector(
    child: Container(
      color: Colors.transparent,
      child: Stack(alignment: Alignment.topRight, children: <Widget>[
        ConstrainedBox(
//                child:Image.file(imgData[index], fit: BoxFit.cover),
          child: Image.file(File(imgData[index]), fit: BoxFit.cover),
          constraints: BoxConstraints.expand(),
        ),
        GestureDetector(
          child: Image(
            image: JhImageUtils.getAssetImage("selectPhoto_close"),
            width: _deleBtnWH,
            height: _deleBtnWH,
          ),
          onTap: () {
            //点击删除按钮
            setState(() {
              imgData.removeAt(index);
//                    imgPicked.removeAt(index);
            });
          },
        )
      ]),
    ),
    onTap: () {
      print("点击第${index}张图片");
      BlocProvider.of<ProcessedBloc>(context)
          .add(ProcessedEvent.removeImg(index));
    },
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

/** 多图选择 */
void pickAsset(context, setState, imgData, imgPicked) async {
  final result = await PhotoPicker.pickAsset(
    context: context,
//    pickedAssetList: imgPicked,
    maxSelected: 10 - imgData.length,
    pickType: PickType.onlyImage,
    thumbSize: 200,
  );

  if (result != null && result.isNotEmpty) {
    for (var e in result) {
      var file = await e.file;
      print(file.absolute.path);
      // final Directory _temp = await getTemporaryDirectory();
      var compressResult = await imageCompressAndGetFile(file);
      print(compressResult);

      if (!imgData.contains(file.absolute.path)) {
        imgData.insert(imgData.length - 1, file.absolute.path);
      }

      // imgData.insert(imgData.length - 1, file);
      // if (!imgData.contains(file)) {
      //   imgData.insert(imgData.length - 1, file);
      // }

      BlocProvider.of<ProcessedBloc>(context)
          .add(ProcessedEvent.qiNiuLoad(compressResult.absolute.path));
    }
  }
  setState(() {});
}
