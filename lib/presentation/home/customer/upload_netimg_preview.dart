import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class UploadNetImgPreview extends StatefulWidget {
  final String img;

  const UploadNetImgPreview({Key key, this.img}) : super(key: key);
  @override
  _UploadNetImgPreviewState createState() => _UploadNetImgPreviewState();
}

class _UploadNetImgPreviewState extends State<UploadNetImgPreview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PhotoView(imageProvider: NetworkImage(widget.img)),
    );
  }
}
