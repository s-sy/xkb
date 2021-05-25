import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/process/bloc/process_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:image_picker/image_picker.dart';

class ShareCode extends StatefulWidget {
  @override
  _ShareCodeState createState() => _ShareCodeState();
}

class _ShareCodeState extends State<ShareCode> {
  //记录选择的照片
  File _image;

  //拍照
  Future _getImageFromCamera() async {
    var image =
        await ImagePicker.pickImage(source: ImageSource.camera, maxWidth: 400);

    setState(() {
      _image = image;
    });
  }

  //相册选择
  Future _getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<ProcessBloc>(),
        child: BlocConsumer<ProcessBloc, ProcessState>(
            listener: (context, state) async {},
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(title: Text("分享二维码")),
                body: Form(
                    child:
                        ListView(padding: const EdgeInsets.all(8.0), children: [
                  SizedBox(height: 100),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: new Text('分享'),
                    onPressed: () {
                      // context
                      //     .bloc<ProcessBloc>()
                      //     .add(const ProcessEvent.shareCode());
                      BlocProvider.of<ProcessBloc>(context)
                          .add(ProcessEvent.shareCode());
                    },
                  ),
                ])),
                //     Container(
                //   child: ListView(
                //     children: <Widget>[
                //       RaisedButton(
                //         onPressed: () {
                //           _getImageFromCamera();
                //         },
                //         child: Text("照相机"),
                //       ),
                //       SizedBox(height: 10),
                //       RaisedButton(
                //         onPressed: () {
                //           _getImageFromGallery();
                //         },
                //         child: Text("相册"),
                //       ),
                //       SizedBox(height: 10),

                //       _image == null
                //           ? Text("no image selected")
                //           : Image.file(
                //               _image,
                //               fit: BoxFit.cover,
                //             ),
                //     ],
                //   ),
                // ),
              );
            }));
  }
}
