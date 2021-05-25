import 'dart:async';
import 'dart:convert';
import 'package:bot_toast/bot_toast.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_ui/domain/wxpage/i_wx_page_facade.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'real_estate_event.dart';
part 'real_estate_state.dart';
part 'real_estate_bloc.freezed.dart';

@injectable
class RealEstateBloc extends Bloc<RealEstateEvent, RealEstateState> {
  IWxPageFacade _iWxPageFacade;
  SharedPreferences _preferences;
  RealEstateBloc(this._iWxPageFacade, this._preferences)
      : super(RealEstateState.initial());

  @override
  Stream<RealEstateState> mapEventToState(
    RealEstateEvent event,
  ) async* {
    yield* event.map(
      started: (value) async* {
        print(value.affData);
        var project = value.affData;
        Map<String, dynamic> query = {
          "current": state.current,
          "size": state.size,
          "auditStatus": 1,
          "descs": "create_time",
          "affiliationId": project["id"],
        };
        var reslut = await _iWxPageFacade.getQuestionsPage(query);
        List questionsList = reslut["data"]["records"];
        yield state.copyWith(questionsPageAll: questionsList);
        print(reslut);
      },
      chagecurrent: (value) async* {
        yield state.copyWith(current: state.current + 1);
      },
      commentrealestate: (e) async* {
        //回复
        var project = await _preferences.get("ProjectItem");
        var userInfo = await _preferences.get("UserInfo");
        if (userInfo == null) {
          BotToast.showText(text: "请先登陆");
          return;
        }
        Map<String, dynamic> query = {
          "replyTypes": 4, //1 炫拍，2 点评 4,问答
          "typesId": e.maps["id"], //回复某条id
          "details": e.value, //回复详情
          "replyClass": jsonDecode(userInfo)["id"] == e.maps["createId"]
              ? "1"
              : "0", //that.dazzleBeatData.createId==getApp().globalData.wxUser.id?'1':'0',
          "affiliationId": e.maps["affiliationId"],
        };
        var reslut = await _iWxPageFacade.commentdazzle(query);
        print(reslut);
        if (reslut.containsKey("data")) {
          if (reslut["data"]) {
            BotToast.showText(text: "回答成功，已发后台审核");
          } else {
            BotToast.showText(text: "回答失败");
          }
        }
      },
      releaseprealestate: (value) async* {
        //发布
        var project = await _preferences.get("ProjectItem");
        Map<String, dynamic> query = {
          "content": value.value,
          "affiliationId": jsonDecode(project)["id"],
        };
        var reslut = await _iWxPageFacade.releaseprealestate(query);
        print(reslut);
        if (reslut.containsKey("data")) {
          if (reslut["data"]) {
            BotToast.showText(text: "提问成功，已发后台审核");
          } else {
            BotToast.showText(text: "提问失败");
          }
        }
      },
    );
  }
}
