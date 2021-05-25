import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class UploadImgPreview extends StatefulWidget {
  final File img;

  const UploadImgPreview({Key key, this.img}) : super(key: key);
  @override
  _UploadImgPreviewState createState() => _UploadImgPreviewState();
}

class _UploadImgPreviewState extends State<UploadImgPreview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PhotoView(imageProvider: FileImage(widget.img)),
    );
  }
}
