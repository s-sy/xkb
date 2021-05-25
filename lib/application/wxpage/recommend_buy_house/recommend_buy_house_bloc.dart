import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:bot_toast/bot_toast.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_ui/domain/wxpage/i_wx_page_facade.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommend_buy_house_event.dart';
part 'recommend_buy_house_state.dart';
part 'recommend_buy_house_bloc.freezed.dart';

@injectable
class RecommendBuyHouseBloc
    extends Bloc<RecommendBuyHouseEvent, RecommendBuyHouseState> {
  IWxPageFacade _iWxPageFacade;
  SharedPreferences _preferences;
  RecommendBuyHouseBloc(this._iWxPageFacade, this._preferences)
      : super(RecommendBuyHouseState.initial());

  @override
  Stream<RecommendBuyHouseState> mapEventToState(
    RecommendBuyHouseEvent event,
  ) async* {
    yield* event.map(
      started: (value) async* {},
      checkphonebyborker: (value) async* {
        //下面两种流程都用这个检测号码
        // Map<String, dynamic> query = {
        //   "phone": "",
        //   "senderId": "",
        //   "affId": "",
        //   "salesmanId": "",
        //   "groupId": "",
        //   "tenantId": ""
        // };
        var userInfo = await _preferences.get("UserInfo");
        var project = await _preferences.get("ProjectItem");
        if (userInfo == null) {
          BotToast.showText(text: "请先登陆");
          return;
        }
        if (value.phone.length != 11) {
          BotToast.showText(text: "电话长度不正确，请核对后再提交");
          return;
        }
        Map<String, dynamic> query = {
          "phone": value.phone,
          "senderId": jsonDecode(userInfo)["id"],
          "affId": jsonDecode(project)["id"],
          "salesmanId": state.salesmanItem["id"],
          "groupId": state.salesmanItem["memberGroup"],
          "tenantId": jsonDecode(project)["tenantId"],
        };
        var reslut = await _iWxPageFacade.checkphonebyborker(query);
        print(reslut);
        String repeatTip = "";
        if (!reslut["ok"]) {
          if (reslut["data"]) {
            repeatTip = "您已经推荐过此号码";
          } else {
            repeatTip = "楼盘已存在此号码";
          }
        }
        print(repeatTip);
        yield state.copyWith(isGoodPhone: reslut["ok"], repeatTip: repeatTip);
      },
      repeatTip: (value) async* {
        yield state.copyWith(repeatTip: "");
      },
      getProcessDefinition: (value) async* {
        var project = await _preferences.get("ProjectItem");

        String tenantIdIn = jsonDecode(project)["id"];
        var definition = await _iWxPageFacade.getProcessDefinition(tenantIdIn);
        if (definition.length > 0) {
          String brokerId = "";
          String enrecommendId = "";
          for (var i = 0; i < definition.length; i++) {
            if (definition[i]["key"] == "broker") {
              //全名经纪人Id
              brokerId = definition[i]["id"];
            }
            if (definition[i]["key"] == "enrecommend") {
              //隐号流程Id
              enrecommendId = definition[i]["id"];
            }
          }
          yield state.copyWith(
              brokerId: brokerId, enrecommendId: enrecommendId);
        }
      },
      sendworkflow: (e) async* {
        if (!state.isGoodPhone) {
          return;
        }
        //发起流程
        var project = await _preferences.get("ProjectItem");
        var userInfo = await _preferences.get("UserInfo");
        var salemanOne = await _preferences.get("SALEMANONE");
        if (userInfo == null) {
          BotToast.showText(text: "请先登陆");
          return;
        }
        if (e.phone.length != 11) {
          BotToast.showText(text: "电话长度不正确，请核对后再提交");
          return;
        }
        if (e.name == "") {
          BotToast.showText(text: "推荐人姓名不能为空");
          return;
        }

        Map<String, dynamic> query = {
          "variables": {
            "phone": {"value": e.phone},
            "customerName": {"value": e.name},
            "gender": {"value": e.sex},
            "description": {"value": e.remark},
            "affiliationId": {"value": jsonDecode(project)["id"]},
            "brokerId": {"value": jsonDecode(userInfo)["id"]},
            "salesmanId": {
              "value": salemanOne != null
                  ? jsonDecode(salemanOne)["id"]
                  : state.salesmanItem["id"]
            },
            "brokerName": {"value": jsonDecode(userInfo)["nickName"] ?? " "},
            "brokerPhone": {"value": jsonDecode(userInfo)["registeredPhone"]},
            "inviteeId": {"value": ""},
            "tenantId": {"value": jsonDecode(project)["tenantId"]},
            "origin": {"value": "0"},
          },
          "businessKey": e.phone //输入的电话
        };
        String id = state.brokerId; //流程Id
        var reslut = await _iWxPageFacade.sendworkflow(id, query);
        print(reslut);
        if (reslut.containsKey("id")) {
          BotToast.showText(text: "提交成功!");
        } else {
          BotToast.showText(text: "提交失败");
        }
      },
      getTaills: (value) async* {
        var project = await _preferences.get("ProjectItem");
        String affId = jsonDecode(project)["id"];
        var result = await _iWxPageFacade.getTaills(affId);
        if (!result.containsKey("data")) {
          return;
        }
        print(result);
        int index = 0;
        if (result["data"].length != 0) {
          index = new Random().nextInt(result["data"].length);
        } else {
          return;
        }
        print(index);
        String salesmanstr = await _preferences.get("salesmanItem");
        Map<String, dynamic> salesmanItem = {};
        if (salesmanstr != null) {
          salesmanItem = jsonDecode(salesmanstr);
        } else {
          salesmanItem = result["data"][index];
        }
        yield state.copyWith(
          salesman: result["data"],
          salesmanItem: salesmanItem,
        );
      },
    );
  }
}
