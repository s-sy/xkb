import 'dart:io';
import 'dart:ui' as ui show Codec, FrameInfo, Image;

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_ui/application/message/bloc/web_scoket_bloc.dart';
import 'package:flutter_ui/infrastructure/datasources/web_socket_remote_data_source.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/components/chat/MessageNormal.dart';
import 'package:flutter_ui/presentation/components/chat/messgae/chat_bottom.dart';
import 'package:flutter_ui/presentation/components/chat/messgae/expanded_viewport.dart';
import 'package:flutter_ui/presentation/components/chat/messgae/message_item.dart';
import 'package:flutter_ui/presentation/components/chat/public.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class MessageChat extends StatefulWidget {
  final String contactId;
  final String headImg;
  final String contactName;

  const MessageChat({Key key, this.contactId, this.headImg, this.contactName})
      : super(key: key);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<MessageChat> {
  String unreadMessage;
  String cachedSignInUser;
  String historyMessage;
  List listForLast = [];
  String lastMsg = '';
  String oldMessage = '';
  String message;
  int index = 1;
  bool _isLastMsg = false;
  final ScrollController listScrollController = new ScrollController();
  List<HrlMessage> mlistMessage = new List();
  StompServiceImpl serviceImpl;

  final changeNotifier = new StreamController.broadcast();
  AudioPlayer mAudioPlayer = AudioPlayer();
  bool isPalyingAudio = false;
  String mPalyingPosition = "";
  bool isShowLoading = false;
  bool isBottomLayoutShowing = false;

  //文本消息
  // sendTextMsg(String hello) {
  //   final HrlTextMessage mMessgae = new HrlTextMessage();
  //   mMessgae.text = hello;
  //   mMessgae.msgType = HrlMessageType.text;
  //   mMessgae.img = jsonDecode(cachedSignInUser)['headimgUrl'];
  //   mMessgae.isSend = true;
  //   mlistMessage.add(mMessgae);
  // }

  @override
  void initState() {
    listScrollController.addListener(() {
      if (listScrollController.position.pixels ==
          listScrollController.position.maxScrollExtent) {
        isShowLoading = true;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    changeNotifier.close();
    listScrollController.dispose();
    super.dispose();
  }

  _removeOnlineChat() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('ONLINE_CHAT');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<WebScoketBloc>()
          ..add(const WebScoketEvent.getPermission())
          // ..add(const WebScoketEvent.getReceiveMsg())
          // ..add(const WebScoketEvent.connectWebsocket())
          ..add(WebScoketEvent.historyMessage(widget.contactId, 1, 10)),
        child: BlocConsumer<WebScoketBloc, WebScoketState>(
            listener: (context, state) async {
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          cachedSignInUser = sharedPreferences.get('CACHED_SIGN_IN_USER');
          if (state.historyMessageList != null) {
            // print("ni zou a ~~~~~");
            // listForLast = state.historyMessageList;
            // if (state.historyMessageList.length != 0) {
            //   print(state.historyMessageList[0]['messageblob']);
            // }
            messageList(state.historyMessageList, _isLastMsg);
          }
          Timer.periodic(Duration(seconds: 3), (Timer t) {
            if (sharedPreferences.get('ONLINE_CHAT') != null) {
              // print(sharedPreferences.get('ONLINE_CHAT'));
              // message =
              //     jsonDecode(sharedPreferences.get('ONLINE_CHAT'))['message'];
              // onlineChat(message);
              BlocProvider.of<WebScoketBloc>(context)
                  .add(WebScoketEvent.historyMessage(widget.contactId, 1, 1));
              _isLastMsg = true;
              sharedPreferences.remove('ONLINE_CHAT');
              // print(state.historyMessageList[0]['messageblob']);
              // String listLast = state.historyMessageList[0]['messageblob'];
              // if (message != listLast) {
              //   print(message);
              //   onlineChat(message);
              // }
            }
          });
          // state.webScoketFailureOrSuccessOption.fold(
          //   () {
          //     print('状态～～～～～');
          //   },
          //   (either) => either.fold(
          //     (failure) {},
          //     (_) {},
          //   ),
          // );
          listScrollController.addListener(() {
            if (listScrollController.position.pixels ==
                listScrollController.position.maxScrollExtent) {
              isShowLoading = true;
              setState(() {});
              Future.delayed(Duration(seconds: 2), () {
                BlocProvider.of<WebScoketBloc>(context).add(
                    WebScoketEvent.historyMessage(
                        widget.contactId, ++index, 10));
                isShowLoading = false;
                setState(() {});
              });
            }
          });
        }, builder: (context, state) {
          return SafeArea(
              child: new WillPopScope(
            onWillPop: () async {
              FocusScope.of(context).requestFocus(FocusNode());
              changeNotifier.sink.add(null);
              BlocProvider.of<WebScoketBloc>(context)
                  .add(WebScoketEvent.getId(widget.contactId));
              _removeOnlineChat();
              Navigator.of(context).pop("refresh");
            },
            child: Scaffold(
              appBar: PreferredSize(
                  child: AppBar(
                    backgroundColor: Color(0xffffffff),
                    leading: IconButton(
                        iconSize: 30,
                        icon: Icon(Icons.arrow_back,
                            color: Colors.black54, size: 25),
                        onPressed: () async {
                          BlocProvider.of<WebScoketBloc>(context)
                              .add(WebScoketEvent.getId(widget.contactId));
                          _removeOnlineChat();
                          Navigator.of(context).pop("refresh");
                        }),
                    title: Text(
                      '${widget.contactName}',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    elevation: 0,
                    centerTitle: true,
                    actions: <Widget>[
                      Container(
                          margin: EdgeInsets.only(right: 15),
                          child: InkWell(
                            child: Center(
                              child: Text(
                                '设置',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ),
                            onTap: () async {
                              print('设置');
                              // SharedPreferences sharedPreferences =
                              //     await SharedPreferences.getInstance();
                              // String message = jsonDecode(sharedPreferences
                              //     .get('ONLINE_CHAT'))['message'];
                              // print(message);
                              // onlineChat(message);
                              // print(sharedPreferences.get('ONLINE_CHAT'));
                              // BlocProvider.of<WebScoketBloc>(context).add(
                              //     WebScoketEvent.historyMessage(
                              //         widget.contactId, 1));
                            },
                          )),
                    ],
                  ),
                  preferredSize: Size.fromHeight(50)),
              resizeToAvoidBottomInset: false,
              backgroundColor: Color(0xffEDEDED),
              body: SafeArea(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          changeNotifier.sink.add(null);
                        },
                        child: new ScrollConfiguration(
                          behavior: MyBehavior(),
                          child: Scrollable(
                            physics: BouncingScrollPhysics(),
                            controller: listScrollController,
                            axisDirection: AxisDirection.up,
                            viewportBuilder: (context, offset) {
                              return ExpandedViewport(
                                offset: offset,
                                axisDirection: AxisDirection.up,
                                slivers: <Widget>[
                                  SliverExpanded(),
                                  SliverList(
                                    delegate: SliverChildBuilderDelegate(
                                      (c, i) {
                                        final GlobalKey<ChatMessageItemState>
                                            mMessageItemKey = GlobalKey();
                                        mMessageItemKey.currentState
                                            ?.methodInChild(false, "");
                                        ChatMessageItem mChatItem =
                                            ChatMessageItem(
                                          key: mMessageItemKey,
                                          mMessage: mlistMessage[i],
                                          onAudioTap: (String str) {
                                            if (isPalyingAudio) {
                                              isPalyingAudio = false;
                                              mMessageItemKey.currentState
                                                  ?.methodInChild(
                                                      false, mPalyingPosition);
                                              mAudioPlayer
                                                  .release(); // manually release when no longer needed
                                              mPalyingPosition = "";
                                              setState(() {});
                                            } else {
                                              Future<int> result = mAudioPlayer
                                                  .play(str, isLocal: true);
                                              mAudioPlayer.onPlayerCompletion
                                                  .listen((event) {
                                                mMessageItemKey.currentState
                                                    ?.methodInChild(false,
                                                        mPalyingPosition);
                                                isPalyingAudio = false;
                                                mPalyingPosition = "";
                                              });

                                              isPalyingAudio = true;
                                              mPalyingPosition =
                                                  mlistMessage[i].uuid;
                                              mMessageItemKey.currentState
                                                  ?.methodInChild(
                                                      true, mPalyingPosition);
                                            }
                                          },
                                        );
                                        return mChatItem;
                                      },
                                      childCount: mlistMessage.length,
                                    ),
                                  ),
                                  SliverToBoxAdapter(
                                    child: isShowLoading
                                        ? Container(
                                            margin: EdgeInsets.only(top: 5),
                                            height: 50,
                                            child: Center(
                                              child: SizedBox(
                                                width: 25.0,
                                                height: 25.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  strokeWidth: 3,
                                                ),
                                              ),
                                            ),
                                          )
                                        : new Container(),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    ChatBottomInputWidget(
                        shouldTriggerChange: changeNotifier.stream,
                        onSendCallBack: (value) {
                          print("发送的文字:" + value);
                          final HrlTextMessage mMessgae = new HrlTextMessage();
                          mMessgae.uuid = Uuid().v4() + "";
                          mMessgae.text = value;
                          mMessgae.msgType = HrlMessageType.text;
                          mMessgae.isSend = true;
                          mMessgae.img =
                              jsonDecode(cachedSignInUser)['headimgUrl'];
                          mMessgae.state = HrlMessageState.sending;
                          mlistMessage.insert(0, mMessgae);
                          listScrollController.animateTo(0.00,
                              duration: Duration(milliseconds: 1),
                              curve: Curves.easeOut);
                          setState(() {
                            print('正在发送');
                          });
                          Future.delayed(new Duration(seconds: 1), () {
                            mMessgae.state = HrlMessageState.send_succeed;
                            setState(() {
                              BlocProvider.of<WebScoketBloc>(context).add(
                                  WebScoketEvent.sendChatMessage(
                                      value, '0', widget.contactId));
                            });
                          });
                        },
                        onImageSelectCallBack: (value) {
                          File image = new File(value.path);
                          Future<ui.Image> decodedImage =
                              decodeImageFromList(image.readAsBytesSync());
                          decodedImage.then((result) {
                            print("图片的宽:" + "${result.width}");
                            print("图片的高:" + "${result.height}");
                          });
                          final HrlImageMessage mMessgae =
                              new HrlImageMessage();
                          mMessgae.uuid = Uuid().v4() + "";
                          mMessgae.msgType = HrlMessageType.image;
                          mMessgae.isSend = true;
                          mMessgae.img =
                              jsonDecode(cachedSignInUser)['headimgUrl'];
                          mMessgae.thumbPath = value.path;
                          mMessgae.state = HrlMessageState.sending;
                          mlistMessage.insert(0, mMessgae);
                          listScrollController.animateTo(0.00,
                              duration: Duration(milliseconds: 1),
                              curve: Curves.easeOut);
                          setState(() {});
                          Future.delayed(new Duration(seconds: 1), () async {
                            mMessgae.state = HrlMessageState.send_succeed;
                            var compressResult =
                                await imageCompressAndGetFile(value);
                            setState(() {
                              BlocProvider.of<WebScoketBloc>(context)
                                  .add(WebScoketEvent.sendChatMessage(
                                      // value.path, 压缩了下
                                      compressResult.path,
                                      '1',
                                      widget.contactId));
                            });
                          });
                        },
                        onAudioCallBack: (value, duration) {
                          final HrlVoiceMessage mMessgae =
                              new HrlVoiceMessage();
                          mMessgae.uuid = Uuid().v4() + "";
                          mMessgae.msgType = HrlMessageType.voice;
                          mMessgae.isSend = true;
                          mMessgae.img =
                              jsonDecode(cachedSignInUser)['headimgUrl'];
                          mMessgae.path = value.path;
                          mMessgae.duration = duration;
                          mMessgae.state = HrlMessageState.sending;
                          mlistMessage.insert(0, mMessgae);
                          listScrollController.animateTo(0.00,
                              duration: Duration(milliseconds: 1),
                              curve: Curves.easeOut);
                          setState(() {
                            print("看看多少秒");
                            print(duration);
                          });
                          Future.delayed(new Duration(seconds: 1), () async {
                            mMessgae.state = HrlMessageState.send_succeed;
                            setState(() {
                              BlocProvider.of<WebScoketBloc>(context).add(
                                  WebScoketEvent.sendChatMessageVoice(
                                      value.path,
                                      '2',
                                      widget.contactId,
                                      duration));
                            });
                          });
                        }),
                  ],
                ),
              ),
            ),
          ));
        }));
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

  messageList(List _list, bool _isLastMsg) {
    // for (int i = 0; i < mlistMessage.length; i++) {
    //   mlistMessage.removeAt(i);
    // }
    // List historyMessageList = [];
    if (_list.length != 0) {
      // for (int i = newList.length - 1; i >= 0; i--) {
      //   historyMessageList.add(newList[i]);
      // }
      for (int i = 0; i < _list.length; i++) {
        if (widget.contactId == _list[i]['senderId']) {
          if (_list[i]['type'] == "0") {
            receiveMessageText(
                widget.headImg, _list[i]['messageblob'], false, _isLastMsg);
          } else if (_list[i]['type'] == "1") {
            receiveMessageImage(
                widget.headImg, _list[i]['messageblob'], false, _isLastMsg);
          } else if (_list[i]['type'] == "2") {
            receiveMessageAudio(widget.headImg, _list[i]['messageblob'],
                _list[i]['speech'], false, _isLastMsg);
          }
        } else {
          // if (jsonDecode(cachedSignInUser)['id'] ==
          //     historyMessageList[i]['receiverId']) {
          if (_list[i]['type'] == "0") {
            receiveMessageText(jsonDecode(cachedSignInUser)['headimgUrl'],
                _list[i]['messageblob'], true, _isLastMsg);
          } else if (_list[i]['type'] == "1") {
            receiveMessageImage(jsonDecode(cachedSignInUser)['headimgUrl'],
                _list[i]['messageblob'], true, _isLastMsg);
          } else if (_list[i]['type'] == "2") {
            receiveMessageAudio(jsonDecode(cachedSignInUser)['headimgUrl'],
                _list[i]['messageblob'], _list[i]['speech'], true, _isLastMsg);
          }
        }
      }
    }
  }

  onlineChat(String message) {
    if (listForLast != null) {
      // print(listForLast);
      lastMsg = listForLast[0]['messageblob'];
    }
    if (message != oldMessage && message != lastMsg) {
      if (message.endsWith(".png") || message.endsWith(".jpg")) {
        receiveMessageImageLast(widget.headImg, message, false);
        oldMessage = message;
        print(oldMessage);
      } else if (message.endsWith(".mp3")) {
        receiveMessageAudioLast(widget.headImg, message, 3, false);
        oldMessage = message;
        print(oldMessage);
      } else {
        receiveMessageTextLast(widget.headImg, message, false);
        oldMessage = message;
        print(oldMessage);
      }
    }
  }

  receiveMessageTextLast(String contactAvatar, String message, bool isSend) {
    final HrlTextMessage mMessgae = new HrlTextMessage();
    mMessgae.uuid = Uuid().v4() + "";
    mMessgae.text = message;
    mMessgae.msgType = HrlMessageType.text;
    mMessgae.isSend = isSend;
    mMessgae.img = contactAvatar;
    mMessgae.state = HrlMessageState.sending;
    mlistMessage.insert(0, mMessgae);
    listScrollController.animateTo(0.00,
        duration: Duration(milliseconds: 1), curve: Curves.easeOut);
    setState(() {});
    Future.delayed(new Duration(seconds: 1), () {
      mMessgae.state = HrlMessageState.send_succeed;
      setState(() {});
    });
  }

  receiveMessageImageLast(String contactAvatar, String message, bool isSend) {
    final HrlImageMessage mMessgae = new HrlImageMessage();
    mMessgae.uuid = Uuid().v4() + "";
    mMessgae.msgType = HrlMessageType.image;
    mMessgae.isSend = isSend;
    mMessgae.img = contactAvatar;
    mMessgae.thumbUrl = message;
    mMessgae.state = HrlMessageState.sending;
    mlistMessage.insert(0, mMessgae);
    listScrollController.animateTo(0.00,
        duration: Duration(milliseconds: 1), curve: Curves.easeOut);
    setState(() {});
    Future.delayed(new Duration(seconds: 1), () {
      mMessgae.state = HrlMessageState.send_succeed;
      setState(() {});
    });
  }

  receiveMessageAudioLast(
      String contactAvatar, String message, duration, bool isSend) {
    final HrlVoiceMessage mMessgae = new HrlVoiceMessage();
    mMessgae.uuid = Uuid().v4() + "";
    mMessgae.msgType = HrlMessageType.voice;
    mMessgae.isSend = isSend;
    mMessgae.img = contactAvatar;
    mMessgae.path = message;
    mMessgae.duration = duration;
    mMessgae.state = HrlMessageState.sending;
    mlistMessage.insert(0, mMessgae);
    listScrollController.animateTo(0.00,
        duration: Duration(milliseconds: 1), curve: Curves.easeOut);
    setState(() {});
    Future.delayed(new Duration(seconds: 1), () {
      mMessgae.state = HrlMessageState.send_succeed;
      setState(() {});
    });
  }

  receiveMessageText(
      String contactAvatar, String message, bool isSend, bool _isLastMsg) {
    final HrlTextMessage mMessgae = new HrlTextMessage();
    mMessgae.uuid = Uuid().v4() + "";
    mMessgae.text = message;
    mMessgae.msgType = HrlMessageType.text;
    mMessgae.isSend = isSend;
    mMessgae.img = contactAvatar;
    mMessgae.state = HrlMessageState.sending;
    if (_isLastMsg) {
      mlistMessage.insert(0, mMessgae);
      setState(() {
        _isLastMsg = false;
      });
    } else {
      mlistMessage.add(mMessgae);
    }
    // mlistMessage.insert(0, mMessgae);
    // listScrollController.animateTo(0.00,
    //     duration: Duration(milliseconds: 1), curve: Curves.easeOut);
    // setState(() {});
    // Future.delayed(new Duration(seconds: 1), () {
    //   mMessgae.state = HrlMessageState.send_succeed;
    //   setState(() {});
    // });
  }

  receiveMessageImage(
      String contactAvatar, String message, bool isSend, bool _isLastMsg) {
    final HrlImageMessage mMessgae = new HrlImageMessage();
    mMessgae.uuid = Uuid().v4() + "";
    mMessgae.msgType = HrlMessageType.image;
    mMessgae.isSend = isSend;
    mMessgae.img = contactAvatar;
    mMessgae.thumbUrl = message;
    mMessgae.state = HrlMessageState.sending;
    if (_isLastMsg) {
      mlistMessage.insert(0, mMessgae);
      setState(() {
        _isLastMsg = false;
      });
    } else {
      mlistMessage.add(mMessgae);
    }
    // mlistMessage.insert(0, mMessgae);
    // listScrollController.animateTo(0.00,
    //     duration: Duration(milliseconds: 1), curve: Curves.easeOut);
    // setState(() {});
    // Future.delayed(new Duration(seconds: 1), () {
    //   mMessgae.state = HrlMessageState.send_succeed;
    //   setState(() {});
    // });
  }

  receiveMessageAudio(String contactAvatar, String message, duration,
      bool isSend, bool _isLastMsg) {
    final HrlVoiceMessage mMessgae = new HrlVoiceMessage();
    mMessgae.uuid = Uuid().v4() + "";
    mMessgae.msgType = HrlMessageType.voice;
    mMessgae.isSend = isSend;
    mMessgae.img = contactAvatar;
    mMessgae.path = message;
    mMessgae.duration = duration;
    mMessgae.state = HrlMessageState.sending;
    if (_isLastMsg) {
      mlistMessage.insert(0, mMessgae);
      setState(() {
        _isLastMsg = false;
      });
    } else {
      mlistMessage.add(mMessgae);
    }
    // mlistMessage.insert(0, mMessgae);
    // listScrollController.animateTo(0.00,
    //     duration: Duration(milliseconds: 1), curve: Curves.easeOut);
    // setState(() {});
    // Future.delayed(new Duration(seconds: 1), () {
    //   mMessgae.state = HrlMessageState.send_succeed;
    //   setState(() {});
    // });
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    if (Platform.isAndroid || Platform.isFuchsia) {
      return child;
    } else {
      return super.buildViewportChrome(context, child, axisDirection);
    }
  }
}
