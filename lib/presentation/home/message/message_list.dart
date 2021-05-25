import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/message/bloc/web_scoket_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/bean/chat_contact_list.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MessageList extends StatefulWidget {
  const MessageList(
      {Key key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  final AnimationController mainScreenAnimationController;
  final Animation<dynamic> mainScreenAnimation;
  @override
  _MessageMsgPageState createState() => _MessageMsgPageState();
}

String unreadMessage;
String getContacts;
String messageNum;
String lastMessage;
String createTime;
List getContactsList = [];
List getUnreadMessageList = ["无新消息"];

class _MessageMsgPageState extends State<MessageList> {
  AnimationController animationController;
  AnimationController waveAnimationController;
  List<ChatContactList> _listBaseBean = [];
  String rid;
  @override
  void initState() {
    super.initState();
    _listBaseBean.add(ChatContactList(
        contactId: 'dd',
        contactAvatar: 'https://www.itying.com/images/flutter/4.png',
        contactName: '小红',
        createTime: '2014.12.05 11.25',
        lastMessage: '最后一条出来没，未读变已读注释了，记得,还有这里的list如果没有未读消息，需不需要显示，因为更方便别人聊天',
        messageNum: '2'));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            getIt<WebScoketBloc>()..add(const WebScoketEvent.unreadList()),
        child: BlocConsumer<WebScoketBloc, WebScoketState>(
          listener: (context, state) async {
            state.webScoketFailureOrSuccessOption.fold(
              () async {
                print('这边的状态～～～～～');
              },
              (either) => either.fold(
                (failure) {},
                (_) {},
              ),
            );
          },
          builder: (context, state) {
            return Column(
              children: [
                // if (state.isReceiveChatMessage) ...[
                contacts(state.unreadList),
                // ]
              ],
            );
          },
        ));
  }

  contacts(list) {
    return ListView.builder(
        padding: EdgeInsets.only(top: 0),
        scrollDirection: Axis.vertical,
        reverse: false,
        primary: true,
        shrinkWrap: true,
        itemCount: list.length,
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemBuilder: (context, i) => Column(
              children: <Widget>[
                InkWell(
                    onTap: () async {
                      // Navigator.push(
                      //   context,
                      //   new MaterialPageRoute(
                      //       builder: (context) => new MessageChat(
                      //             contactId: '${list[i].contactId}',
                      //             headImg: '${list[i].contactAvatar}',
                      //             contactName: '${list[i].contactName}',
                      //           )),
                      // );
                      SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      sharedPreferences.remove('ONLINE_CHAT');
                      ExtendedNavigator.of(context)
                          .push(Routes.messageChat,
                              arguments: MessageChatArguments(
                                contactId: '${list[i].contactId}',
                                headImg: '${list[i].contactAvatar}',
                                contactName: '${list[i].contactName}',
                              ))
                          .then((value) {
                        if (value == 'refresh') {
                          BlocProvider.of<WebScoketBloc>(context)
                              .add(WebScoketEvent.unreadList());
                        }
                      });
                      BlocProvider.of<WebScoketBloc>(context)
                          .add(WebScoketEvent.getId('${list[i].contactId}'));
                    },
                    child: Container(
                      height: 65,
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 15, right: 15),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                '${list[i].contactAvatar}',
                              ),
                              radius: 20.0,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '${list[i].contactName}',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                    Spacer(),
                                    Container(
                                      child: Text(
                                        '${list[i].createTime}',
                                        style: TextStyle(
                                            fontSize: 11, color: Colors.grey),
                                      ),
                                      margin: EdgeInsets.only(right: 15),
                                    )
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0.0, 0.0, 18.0, 0.0),
                                          child: Text(
                                            '${list[i].lastMessage}',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 15),
                                        width: 15,
                                        height: 15,
                                        decoration: new BoxDecoration(
                                          border: new Border.all(
                                              color: Colors.red, width: 0.5),
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${list[i].messageNum}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: 0.5,
                                      color: Color(0xffE5E5E5),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ));
  }
}
