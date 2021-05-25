import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_ui/domain/house/i_house_facade.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'house_control_event.dart';
part 'house_control_state.dart';
part 'house_control_bloc.freezed.dart';

@injectable
class HouseControlBloc extends Bloc<HouseControlEvent, HouseControlState> {
  IHouseFacade _iHouseFacade;
  SharedPreferences _preferences;
  HouseControlBloc(this._iHouseFacade, this._preferences)
      : super(HouseControlState.initial());

  @override
  Stream<HouseControlState> mapEventToState(
    HouseControlEvent event,
  ) async* {
    yield* event.map(
      started: (value) async* {
        String userInfoString = _preferences.getString("CACHED_SIGN_IN_USER");
        yield state.copyWith(
            itemHouse: value.routedata, userInfo: jsonDecode(userInfoString));
      },
      getReferrals: (e) async* {
        String userInfoString = _preferences.getString("CACHED_SIGN_IN_USER");
        Map<String, dynamic> activeData = {
          "current": state.current,
          "size": state.size
        };
        _iHouseFacade.getReferrals(activeData);
      },
      getProcessDefinition: (e) async* {
        Map<String, dynamic> query = {
          "tenantIdIn": state.itemHouse["affiliationId"]
        };
        List<dynamic> res = await _iHouseFacade.getProcessDefinition(query);
        var id = "";
        for (var i = 0; i < res.length; i++) {
          if (res[i]["key"] == "choosing") {
            id = res[i]["id"];
          }
        }
        yield state.copyWith(choosingId: id);
      },
      controlPrecess: (e) async* {
        String userInfoString = _preferences.getString("CACHED_SIGN_IN_USER");
        Map<String, dynamic> userInfo = jsonDecode(userInfoString);
        if (userInfo['userRole'] == 'director') {
          if (e.stateName != "") {
            state.itemHouse["state"] = e.stateName;
            await _iHouseFacade.updataHousing(state.itemHouse);
          } else {
            BotToast.showText(text: "状态异常请查看数据");
          }
        } else {
          var message =
              state.itemHouse["staging"] + state.itemHouse["serialNumber"];
          var houseInfo = state.itemHouse;
          Map<String, dynamic> data = {
            "variables": {
              "housingId": {"value": state.itemHouse["id"]},
              "houseInfo": {"value": houseInfo},
              "housmessage": {"value": message},
              "comments": {"value": state.remark},
              "groupId": {"value": userInfo["memberGroup"]},
              "initiator": {"value": userInfo["id"]},
              "tenantId": {"value": state.itemHouse["tenantId"]},
              "buyerPhone": {"value": state.phone},
              "buyerName": {"value": state.name},
              "contractPrice": {"value": state.price},
              "state": {
                "value": e.stateName
              }, //需要修改的房源状态为多少0：待售；1：认购 2：签约 3：销控 4: 管理销控
              "affiliationId": {"value": state.itemHouse["affiliationId"]}
            }
          };
          if (state.itemHouse['state'] == '1') {
            data = {
              "variables": {
                "housingId": {"value": state.itemHouse["id"]},
                "housmessage": {"value": message},
                "comments": {"value": state.remark},
                "groupId": {"value": userInfo["memberGroup"]},
                "initiator": {"value": userInfo["id"]},
                "tenantId": {"value": state.itemHouse["tenantId"]},
                "buyerPhone": {"value": state.itemHouse['buyerPhone']},
                "buyerName": {"value": state.itemHouse['buyerName']},
                "contractPrice": {
                  "value": state.itemHouse['contractPrice'].toString()
                },
                "state": {
                  "value": e.stateName
                }, //需要修改的房源状态为多少0：待售；1：认购 2：签约 3：销控 4: 管理销控
                "affiliationId": {"value": state.itemHouse["affiliationId"]}
              }
            };
          }
          String processId = state.choosingId;
          var res = await _iHouseFacade.controlPrecess(processId, data);
          print(res);
        }
      },
      getgroupValue: (value) async* {
        yield state.copyWith(state: value.v.toString());
      },
      saveName: (value) async* {
        yield state.copyWith(name: value.name);
      },
      savePhone: (value) async* {
        yield state.copyWith(phone: value.phone);
      },
      savePrice: (value) async* {
        yield state.copyWith(price: value.price);
      },
      saveRemark: (value) async* {
        yield state.copyWith(remark: value.remark);
      },

      releaseControlPrecess: (value) async* {
        state.itemHouse["state"] = state.state;
        await _iHouseFacade.updataHousing(state.itemHouse);

        // yield state.copyWith(price: value.price);
      },
      // getStateValues: (value) async* {
      //   state.itemHouse["state"] = state.state;
      //   await _iHouseFacade.updataHousing(state.itemHouse);

      //   yield state.copyWith(stateValues: ['dddd']);
      // },

      getStateValues: (value) async* {
        List list = [];
        if (state.userInfo["userRole"] == 'salesman') {
          if (state.itemHouse['state'] == '0') {
            list = [
              {'title': '认购', 'isSelect': false},
              {'title': '签约', 'isSelect': false},
              {'title': '销控', 'isSelect': false},
            ];
          } else if (state.itemHouse['state'] == '1') {
            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            var userInfo =
                jsonDecode(sharedPreferences.get('CACHED_SIGN_IN_USER'));
            if (userInfo['id'] == value.data['createId']) {
              list = [
                {'title': '签约', 'isSelect': false},
                // {'title': '销控', 'isSelect': false},
              ];
            }
          }
        }
        if (state.userInfo["userRole"] == 'director') {
          if (state.itemHouse['state'] == '0') {
            list = [
              // {'title': '换房', 'isSelect': false},
              {'title': '改状态', 'isSelect': false},
            ];
          } else if (state.itemHouse['state'] == '1') {
            list = [
              {'title': '换房', 'isSelect': false},
              {'title': '改状态', 'isSelect': false},
            ];
          } else if (state.itemHouse['state'] == '2') {
            list = [
              {'title': '换房', 'isSelect': false},
              {'title': '改状态', 'isSelect': false},
            ];
          } else if (state.itemHouse['state'] == '3') {
            list = [
              {'title': '换房', 'isSelect': false},
              {'title': '改状态', 'isSelect': false},
              {'title': '解控', 'isSelect': false}
            ];
          } else if (state.itemHouse['state'] == '4') {
            list = [
              {'title': '换房', 'isSelect': false},
              {'title': '改状态', 'isSelect': false},
              {'title': '解控', 'isSelect': false}
            ];
          }
        }
        yield state.copyWith(stateValues: list);
      },

      getListData: (e) async* {
        var res = await _iHouseFacade.getListData(
            e.buildText, e.houseText, e.entranceText);
        print(res);
        if (res != null) {
          res["housingList"].sort((left, right) {
            if (int.parse((left["floor"])) == int.parse((right["floor"]))) {
              return int.parse((left["serialNumber"]).substring(6))
                  .compareTo(int.parse(right["serialNumber"].substring(6)));
            } else {
              return int.parse((right["serialNumber"]).replaceAll("-", ""))
                  .compareTo(
                      int.parse(left["serialNumber"].replaceAll("-", "")));
            }
          });
          // double cors = double.parse((res["housingList"]
          //         [(res["housingList"].length - 1)]["serialNumber"])
          //     .substring(
          //         res["housingList"][res["housingList"].length - 1]
          //                     ["serialNumber"]
          //                 .length -
          //             1,
          //         res["housingList"][res["housingList"].length - 1]
          //                 ["serialNumber"]
          //             .length));
          yield state.copyWith(
            houseUnitId: res["housingList"], //楼号
            housList: res["buildingList"], //栋
            entranceList: res["entranceList"], //单元
            // buildEntranceList: res["housingList"], //楼号
          );
        } else {
          BotToast.showText(text: "是空的？！！！！！");
        }
      },
      isHouseUnit: (e) async* {
        if (e.value == '02') {
          yield state.copyWith(
            isBottomSheet02: true,
          );
        } else if (e.value == '03') {
          yield state.copyWith(
            isBottomSheet03: true,
          );
        } else if (e.value == '04') {
          yield state.copyWith(
            isBottomSheet04: true,
          );
        }
      },
      offHouseState: (e) async* {
        if (e.value == '02') {
          yield state.copyWith(
            isBottomSheet02: false,
          );
        } else if (e.value == '03') {
          yield state.copyWith(
            isBottomSheet03: false,
          );
        } else if (e.value == '04') {
          yield state.copyWith(
            isBottomSheet04: false,
          );
        }
      },
      changeHouse: (e) async* {
        // String cachedSignInUser = sharedPreferences.get('CACHED_SIGN_IN_USER');
        // print(cachedSignInUser);
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        String cachedSignInUser = sharedPreferences.get('CACHED_SIGN_IN_USER');
        // String tenantId = jsonDecode(cachedSignInUser)['tenantId'];
        String houseId = sharedPreferences.get('HOUSEID');
        if (houseId == null) {
          String affiliateds = sharedPreferences.get('AFFILIATEDS');
          if (affiliateds != null) {
            houseId = jsonDecode(affiliateds)[0]["id"];
          }
        }

        // Map<String, dynamic> data = {
        //     "variables": {
        //       "housingId": {"value": state.itemHouse["id"]},
        //       "housmessage": {"value": message},
        //       "comments": {"value": state.input},
        //       "groupId": {"valaue": userInfo["memberGroup"]},
        //       "initiator": {"value": userInfo["id"]},
        //       "tenantId": {"value": state.itemHouse["tenantId"]},
        //       "buyerPhone": {"value": state.phone},
        //       "buyerName": {"value": state.name},
        //       "contractPrice": {"value": state.price},
        //       "state": {
        //         "value": e.stateName
        //       }, //需要修改的房源状态为多少0：待售；1：认购 2：签约 3：销控 4: 管理销控
        //       "affiliationId": {"value": state.itemHouse["affiliationId"]}
        //     }
        //   };
        Map<String, dynamic> formdata = {
          "currentId": e.oldId,
          "alterationId": e.newId,
          "affiliationId": houseId,
          "tenantId": jsonDecode(cachedSignInUser)['tenantId'],
        };
        var res = await _iHouseFacade.changeHouse(formdata);
      },
    );
  }
}
