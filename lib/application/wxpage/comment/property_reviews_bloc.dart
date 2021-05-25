import 'dart:async';
import 'package:bot_toast/bot_toast.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_ui/domain/wxpage/i_wx_page_facade.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';
part 'property_reviews_event.dart';
part 'property_reviews_state.dart';
part 'property_reviews_bloc.freezed.dart';

@injectable
class PropertyReviewsBloc
    extends Bloc<PropertyReviewsEvent, PropertyReviewsState> {
  IWxPageFacade _iWxPageFacade;
  SharedPreferences _preferences;
  PropertyReviewsBloc(this._iWxPageFacade, this._preferences)
      : super(PropertyReviewsState.initial());

  @override
  Stream<PropertyReviewsState> mapEventToState(
    PropertyReviewsEvent event,
  ) async* {
    yield* event.map(
      started: (value) async* {
        print(value.affData);
        Map<String, dynamic> query = {
          "current": state.current,
          "size": state.size,
          "auditStatus": 1,
          "descs": "create_time",
          "affiliationId": value.affData["id"],
        };
        var reslut = await _iWxPageFacade.getReadingReviews(query);
        print(reslut);
        List propertyreviewsList = state.propertyreviewsList;
        propertyreviewsList.addAll(reslut["data"]["records"]);
        yield state.copyWith(propertyreviewsList: propertyreviewsList);
      },
      commentOne: (value) async* {
        Map<String, dynamic> query = {"id": value.maps["id"]};
        var reslut = await _iWxPageFacade.getReadingReviews(query);
        print(reslut);
        // List propertyreviewsList = state.propertyreviewsList;
        // propertyreviewsList.addAll(reslut["data"]["records"]);
        yield state.copyWith(commentOne: reslut["data"]["records"]);
      },
      addcurrent: (value) async* {
        yield state.copyWith(current: state.current + 1);
      },
      commentpreviews: (e) async* {
        //回复
        var project = await _preferences.get("ProjectItem");
        var userInfo = await _preferences.get("UserInfo");
        if (userInfo == null) {
          BotToast.showText(text: "请先登陆");
          return;
        }

        Map<String, dynamic> query = {
          "replyTypes": e.type, //1 炫拍，2 点评
          "typesId": e.id, //回复某条id
          "details": e.replyValue, //回复详情
          "replyClass": jsonDecode(userInfo)["id"] == e.createid
              ? "1"
              : "0", //that.dazzleBeatData.createId==getApp().globalData.wxUser.id?'1':'0',
          "affiliationId": e.affid,
        };
        var reslut = await _iWxPageFacade.commentdazzle(query);
        print(reslut);
        if (reslut.containsKey("data")) {
          if (reslut["data"]) {
            BotToast.showText(text: "提交成功，已发后台审核");
          } else {
            BotToast.showText(text: "提交失败");
          }
        }
      },
      releasepreviews: (e) async* {
        //发布
        Map<String, dynamic> query = {
          "content": e.remark,
          "price": e.ratePrice, // 5.0
          "location": e.ratePlace, //5.0
          "environment": e.rateEnvironment, //5.0
          "supporting": e.rateMatching, //5.0
          "transportation": e.rateTraffic, //5.0
          "isVisited": e.arrived, // 是否到访 0 到访 1未到访
          "isAnonymous": e.check, //是否匿名， 0 匿名，1 不匿名
          "affiliationId": e.id,
        };
        var reslut = await _iWxPageFacade.releasepreviews(query);
        if (reslut.containsKey("data")) {
          if (reslut["data"]) {
            BotToast.showText(text: "提交成功，已发后台审核");
          } else {
            BotToast.showText(text: "提交失败");
          }
        }
        // print(reslut);
      },
      replace: (e) async* {
        yield state.copyWith(isComment: !state.isComment);
      },
    );
  }
}
