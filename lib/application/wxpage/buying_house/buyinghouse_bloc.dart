import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_ui/domain/wxpage/i_wx_page_facade.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'buyinghouse_event.dart';
part 'buyinghouse_state.dart';
part 'buyinghouse_bloc.freezed.dart';

@injectable
class BuyinghouseBloc extends Bloc<BuyinghouseEvent, BuyinghouseState> {
  IWxPageFacade _iWxPageFacade;
  SharedPreferences _preferences;
  BuyinghouseBloc(this._iWxPageFacade, this._preferences)
      : super(BuyinghouseState.initial());

  @override
  Stream<BuyinghouseState> mapEventToState(
    BuyinghouseEvent event,
  ) async* {
    yield* event.map(
      started: (value) async* {
        yield state.copyWith(project: value.affData);
      },
      checkphone: (value) async* {
        var userInfo = await _preferences.get("UserInfo");
        if (userInfo == null) {
          BotToast.showText(text: "请先登陆");
          return;
        }
        Map<String, dynamic> query = {
          "phone": value.phone,
          "senderId": jsonDecode(userInfo)["id"],
          "affId": state.project["id"],
          "salesmanId": state.salesmanItem["id"],
          "groupId": state.salesmanItem["memberGroup"],
          "tenantId": state.project["tenantId"],
        };
        //这个验证header里面要带上 app-id  和  third-session
        var reslut = await _iWxPageFacade.checkphonept(query);
        print(reslut);
        bool isRepeat = false;
        if (!reslut["ok"]) {
          isRepeat = true;
        }
        yield state.copyWith(isGoodPhone: reslut["ok"], isRepeat: isRepeat);
      },
      repeatTip: (value) async* {
        yield state.copyWith(isRepeat: false);
      },
      sendworkflow: (e) async* {
        if (!state.isGoodPhone) {
          return;
        }
        var definition =
            await _iWxPageFacade.getProcessDefinition(state.project["id"]);
        print(definition);
        if (definition.length > 0) {
          String id = "";
          for (var i = 0; i < definition.length; i++) {
            if (definition[i]["key"] == "passenger") {
              id = definition[i]["id"];
            }
          }

          if (id != "") {
            var userInfo = await _preferences.get("UserInfo");
            if (userInfo == null) {
              BotToast.showText(text: "请先登陆");
              return;
            }
            if (e.phone.length != 11) {
              BotToast.showText(text: "电话长度不正确，请核对后再提交");
              return;
            }
            if (e.name == "") {
              BotToast.showText(text: "用户姓名不能为空");
              return;
            }

            Map<String, dynamic> query = {
              "variables": {
                "initiator": {"value": jsonDecode(userInfo)["id"]}, //自己id
                "phone": {"value": e.phone},
                "customerName": {"value": e.name},
                "description": {"value": e.remark},
                "affiliationId": {"value": state.project["id"]},
                "currentTaskDeposit": {
                  "value": false,
                },
                "gender": {"value": e.sex}, //性别 1男 2女 0不男不女
                "tenantId": {"value": state.project["tenantId"]},
                "characters": {"value": null},
                "unspecified": {"value": true}, //未指定    有置业 false ，否则true
                "salesmanId": {"value": state.salesmanItem["id"]},
                "origin": {"value": "1"},
              },
            };
            var reslut = await _iWxPageFacade.sendworkflow(id, query);
            print(reslut);
            if (reslut.containsKey("id")) {
              BotToast.showText(text: "提交成功!");
            } else {
              BotToast.showText(text: "提交失败");
            }
          }
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
