import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/messages/processed/processed_bloc.dart';
import 'package:flutter_ui/presentation/home/message/processed/processed_photo_view.dart';
// import 'package:flutter_ui/presentation/home/message/processed/processed_photo_view.dart';

const double _itemSpace = 5.0;
const double _space = 5.0; //上下左右间距
const double _deleBtnWH = 20.0;
const Color _bgColor = Colors.transparent;

class ProcessedPhotoShowView extends StatefulWidget {
  final double lfPaddingSpace;
  final List imgData;

  const ProcessedPhotoShowView({Key key, this.lfPaddingSpace, this.imgData})
      : super(key: key);
  @override
  _ProcessedPhotoShowViewState createState() => _ProcessedPhotoShowViewState();
}

class _ProcessedPhotoShowViewState extends State<ProcessedPhotoShowView> {
  @override
  Widget build(BuildContext context) {
    var kScreenWidth = MediaQuery.of(context).size.width;

    var lfPadding = widget.lfPaddingSpace == null ? 0.0 : widget.lfPaddingSpace;
    var ninePictureW = (kScreenWidth - _space * 2 - 2 * _itemSpace - lfPadding);
    var itemWH = ninePictureW / 3;
    int columnCount = widget.imgData.length > 6
        ? 3
        : widget.imgData.length <= 3
            ? 1
            : 2;
    return BlocBuilder<ProcessedBloc, ProcessedState>(
        builder: (context, state) {
      return
          // Container(
          //   decoration: BoxDecoration(color: Colors.yellow),
          //   margin: EdgeInsets.only(left: 80),
          //   // color: _bgColor,
          //   width: kScreenWidth - lfPadding,
          //   height: 50,
          //   child:
          _showImage();
      // GridView.builder(
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //       //可以直接指定每行（列）显示多少个Item
      //       //一行的Widget数量
      //       crossAxisCount: 4,
      //       crossAxisSpacing: _itemSpace, //水平间距
      //       mainAxisSpacing: 0, //垂直间距
      //       childAspectRatio: 1.5, //子Widget宽高比例
      //     ),
      //     physics: NeverScrollableScrollPhysics(),
      //     padding: EdgeInsets.all(_space), //GridView内边距
      //     itemCount: widget.imgData.length,
      //     itemBuilder: (context, index) {
      //       return GestureDetector(
      //         onTap: () async {
      //           _jumpToGallery(context, index, widget.imgData);
      //         },
      //         child: Container(
      //           child: Image.network(widget.imgData[index]),
      //         ),
      //       );
      //       // if (index == imgData.length - 1) {
      //       //   return addBtn(context, setState, imgData, imgPicked);
      //       // } else {
      //       //   return imgItem(index, setState, imgData, imgPicked);
      //       // }
      //     })
      // );
    });
  }

  _jumpToGallery(context, index, contextList) async {
    await Navigator.of(context).push(FadeRoute(
        page: PhotoViewGalleryScreen(
      images: contextList, //传入图片list
      index: index, //传入当前点击的图片的index
      heroTag: "sdfs", //传入当前点击的图片的hero tag （可选）
    )));
  }

  _showImage() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      // controller: ScrollController(),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // SizedBox(width: 10),
          Container(
            height: widget.imgData.length != 0 ? 120 : 0.0,
            margin: EdgeInsets.fromLTRB(83, 10, 0, 0),
            // decoration: BoxDecoration(
            //     border: Border.all(width: 1.0, color: Colors.blue[300])),
            child: ListView.builder(
                itemCount: widget.imgData.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Image.network(widget.imgData[index]),
                    ),
                    onTap: () {
                      _jumpToGallery(context, index, widget.imgData);
                    })),
          ),
          SizedBox(width: 15),
        ],
      ),
    );
  }
}

class FadeRoute extends PageRouteBuilder {
  final Widget page;
  FadeRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
