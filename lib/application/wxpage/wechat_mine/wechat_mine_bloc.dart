import 'dart:async';
import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ui/infrastructure/api/wechat_rest_haskey_service.dart';
import 'package:flutter_ui/presentation/components/chat/public.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_ui/domain/wxpage/i_wx_page_facade.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wechat_mine_event.dart';
part 'wechat_mine_state.dart';
part 'wechat_mine_bloc.freezed.dart';

@injectable
class WechatMineBloc extends Bloc<WechatMineEvent, WechatMineState> {
  IWxPageFacade _iWxPageFacade;
  SharedPreferences _preferences;
  WechatRestHaskeyService _wechatRestHaskeyService;
  WechatMineBloc(
      this._iWxPageFacade, this._preferences, this._wechatRestHaskeyService)
      : super(WechatMineState.initial());

  @override
  Stream<WechatMineState> mapEventToState(
    WechatMineEvent event,
  ) async* {
    yield* event.map(
        started: (value) async* {},
        isLogin: (value) async* {
          //验证是否登陆
          bool isLogin = false;
          Map<String, dynamic> userInfo = {};
          var userInfomation = await _preferences.get("UserInfo");
          print(userInfomation);
          if (userInfomation != null && userInfomation != "null") {
            isLogin = true;
            userInfo = jsonDecode(userInfomation);
          }
          yield state.copyWith(
            isLogin: isLogin,
            userInfo: userInfo,
          );
        },
        getvistorInfo: (value) async* {
          //获取个人信息
          var reslut = await _iWxPageFacade.getvistorInfo();
          print(reslut);
        },
        updatevistorInfo: (e) async* {
          //更新个人信息
          String img = "";
          var project = await _preferences.get("ProjectItem");
          var userInfo = await _preferences.get("UserInfo");
          Map<String, dynamic> userInfoMap = jsonDecode(userInfo);
          if (e.image.startsWith('https')) {
            img = e.image;
          } else {
            var imageName =
                e.image.substring(e.image.lastIndexOf("/") + 1, e.image.length);
            FormData formdataUpload = FormData.fromMap({
              "file":
                  await MultipartFile.fromFile(e.image, filename: imageName),
              'dir': 'material',
              'fileType': 'image',
              'tenantId': jsonDecode(project)['tenantId'],
            });
            final response =
                await _wechatRestHaskeyService.uploadImgOrAudio(formdataUpload);
            if (response != null) {
              String imgOnline = jsonDecode(response)['link'];
              print(imgOnline);
              img = imgOnline;
            }
          }
          if (e.nickName == "") {
            BotToast.showText(text: "昵称不能为空");
            return;
          }
          userInfoMap["headimgUrl"] = img;
          userInfoMap["nickName"] = e.nickName;
          // Map<String, dynamic> query = {
          //   "headimgUrl": img,
          //   "nickName": e.nickName,
          //   "id": jsonDecode(userInfo)["id"]
          // };
          var reslut = await _iWxPageFacade.updatevistorInfo(userInfoMap);
          print(reslut);
          if (reslut.containsKey("data")) {
            if (reslut["data"]) {
              BotToast.showText(text: "提交成功");
            } else {
              BotToast.showText(text: "提交失败");
            }
          }
          var res = await _iWxPageFacade.getvistorInfo();
          print(res);
          _preferences.setString("UserInfo", jsonEncode(res["data"]));
        },
        apartmentConcerncennel: (value) async* {
          //取消关注
          Map<String, dynamic> query = {
            "id": "",
            "attentionType": "6",
            "userId": "",
          };
          var reslut = await _iWxPageFacade.apartmentConcerncennel(query);
          print(reslut);
        },
        getApartmentConcern: (value) async* {
          //我的关注列表
          var project = await _preferences.get("ProjectItem");
          var userInfo = await _preferences.get("UserInfo");
          Map<String, dynamic> query = {
            "attentionType": "6",
            "userId": jsonDecode(userInfo)["id"],
            "affiliationId": jsonDecode(project)["id"],
          };
          var reslut = await _iWxPageFacade.getApartmentConcern(query);
          print(reslut);
        },
        getreadingReviews: (value) async* {
          //我发的楼盘点评
          var project = await _preferences.get("ProjectItem");
          var userInfo = await _preferences.get("UserInfo");
          if (userInfo == null) {
            BotToast.showText(text: "请先登陆");
            return;
          }
          Map<String, dynamic> query = {
            "current": 1,
            "size": 10,
            // "auditStatus": "1",
            "userId": jsonDecode(userInfo)["id"],
            "affiliationId": jsonDecode(project)["id"],
          };
          var reslut = await _iWxPageFacade.mineGetReadingReviews(query);
          print(reslut);
          yield state.copyWith(
            comment: reslut["data"]["records"],
          );
        },
        getAwesomeshooting: (value) async* {
          //我的炫拍
          var project = await _preferences.get("ProjectItem");
          var userInfo = await _preferences.get("UserInfo");
          if (userInfo == null) {
            BotToast.showText(text: "请先登陆");
            return;
          }
          Map<String, dynamic> query = {
            "current": 1,
            "size": 10,
            "userId": jsonDecode(userInfo)["id"],
            "affiliationId": jsonDecode(project)["id"],
          };
          var reslut = await _iWxPageFacade.mineGetAwesomeshooting(query);
          print(reslut);
          yield state.copyWith(
            picture: reslut["data"]["records"],
          );
        },
        getQuestionsPage: (value) async* {
          //我的问答
          var project = await _preferences.get("ProjectItem");
          var userInfo = await _preferences.get("UserInfo");
          if (userInfo == null) {
            BotToast.showText(text: "请先登陆");
            return;
          }
          Map<String, dynamic> query = {
            // "current": 1,
            // "size": 10,
            "userId": jsonDecode(userInfo)["id"],
            "affiliationId": jsonDecode(project)["id"],
          };
          var reslut = await _iWxPageFacade.mineGetQuestionsPage(query);
          print(reslut);
          yield state.copyWith(
            questions: reslut["data"]["records"],
          );
        },
        getTopicreply: (value) async* {
          //我的回复
          var project = await _preferences.get("ProjectItem");
          var userInfo = await _preferences.get("UserInfo");
          if (userInfo == null) {
            BotToast.showText(text: "请先登陆");
            return;
          }
          Map<String, dynamic> query = {
            "current": 1,
            "size": 100,
            "replyTypes": value.type, // 1 炫拍 2 点评  3户型  4 问答
            "affiliationId": jsonDecode(project)["id"],
          };
          var reslut = await _iWxPageFacade.mineGetTopicreply(query);
          print(reslut);
          yield state.copyWith(
            reply: reslut["data"]["records"],
            userInfo: jsonDecode(userInfo),
          );
        },
        referrals: (value) async* {
          var project = await _preferences.get("ProjectItem");
          var userInfo = await _preferences.get("UserInfo");
          if (userInfo == null) {
            BotToast.showText(text: "请先登陆");
            return;
          }
          //我的客户
          Map<String, dynamic> query = {
            "currentPage": 1,
            "pageSize": 10,
            "brokerId": jsonDecode(userInfo)["id"], //自己id
            "affiliationId": jsonDecode(project)["id"],
            "desc": "create_time",
          };
          var reslut = await _iWxPageFacade.referrals(query);

          print(reslut);
          if (reslut["ok"]) {
            yield state.copyWith(
              customerList: reslut["data"]["referrals"],
            );
          }
        },
        loginOut: (value) async* {
          _preferences.remove('tenant-session');
          _preferences.remove('vistor-session');
          _preferences.remove('UserInfo');
          _preferences.remove('UserType');
          yield state.copyWith(
            isLogin: false,
          );
        });
  }
}
