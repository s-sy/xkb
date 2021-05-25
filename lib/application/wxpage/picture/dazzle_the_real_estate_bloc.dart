import 'dart:async';
import 'dart:convert';
import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter_ui/infrastructure/api/wechat_rest_haskey_service.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_ui/domain/wxpage/i_wx_page_facade.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dazzle_the_real_estate_event.dart';
part 'dazzle_the_real_estate_state.dart';
part 'dazzle_the_real_estate_bloc.freezed.dart';

@injectable
class DazzleTheRealEstateBloc
    extends Bloc<DazzleTheRealEstateEvent, DazzleTheRealEstateState> {
  IWxPageFacade _iWxPageFacade;
  SharedPreferences _preferences;
  WechatRestHaskeyService _wechatRestHaskeyService;
  DazzleTheRealEstateBloc(
      this._iWxPageFacade, this._preferences, this._wechatRestHaskeyService)
      : super(DazzleTheRealEstateState.initial());

  @override
  Stream<DazzleTheRealEstateState> mapEventToState(
    DazzleTheRealEstateEvent event,
  ) async* {
    yield* event.map(
      started: (_Started value) async* {
        print(value.affData);
        var project = value.affData;
        Map<String, dynamic> query = {
          "current": state.current,
          "size": state.size,
          "descs": "create_time",
          "auditStatus": 1,
          "affiliationId": project["id"],
        };
        var reslut = await _iWxPageFacade.getAwesomeshooting(query);
        print(reslut);
        List pictureList = reslut["data"]["records"];
        yield state.copyWith(pictureList: pictureList);
      },
      chagecurrent: (value) async* {
        yield state.copyWith(current: state.current + 1);
      },
      commentdazzle: (e) async* {
        //回复
        var userInfo = await _preferences.get("UserInfo");
        if (userInfo == null) {
          BotToast.showText(text: "请先登陆");
          return;
        }
        Map<String, dynamic> query = {
          "replyTypes": 1, //1 炫拍，2 点评 4,问答
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
            BotToast.showText(text: "评论成功，已发后台审核");
          } else {
            BotToast.showText(text: "评论失败");
          }
        }
      },
      releasedazzle: (value) async* {
        // 发布
        var project = await _preferences.get("ProjectItem");
        Map<String, dynamic> query = {
          "picUrls": value.imgData, //List 图片
          "content": value.description, //文字
          "affiliationId": jsonDecode(project)["id"],
        };
        var reslut = await _iWxPageFacade.releasedazzle(query);
        print(reslut);
        if (reslut.containsKey("data")) {
          if (reslut["data"]) {
            BotToast.showText(text: "提交成功，已发后台审核");
          } else {
            BotToast.showText(text: "提交失败");
          }
        }
      },
      qiNiuLoad: (value) async* {
        var project = await _preferences.get("ProjectItem");
        String img = value.imgPath;
        var imageName = img.substring(img.lastIndexOf("/") + 1, img.length);
        print(imageName);
        FormData formdataUpload = FormData.fromMap({
          "file": await MultipartFile.fromFile(img, filename: imageName),
          "dir": 'material',
          "fileType": 'image',
          "tenantId": jsonDecode(project)['tenantId'],
        });
        // var res = await _iMessagesFacade.qiNiuLoad(formdataUpload);
        print(formdataUpload);
        final response =
            await _wechatRestHaskeyService.uploadImgOrAudio(formdataUpload);
        var reulst = jsonDecode(response);
        if (!reulst.containsKey("link")) {
          BotToast.showText(text: "上传图片失败");
        }
        List<dynamic> imgDatas = state.imgData;
        imgDatas.add(reulst["link"]);
        yield state.copyWith(imgData: imgDatas);
      },
      removeImg: (value) async* {
        int index = value.index;
        List data = state.imgData;
        data.remove(data[index]);
        yield state.copyWith(imgData: data);
      },
    );
  }
}
