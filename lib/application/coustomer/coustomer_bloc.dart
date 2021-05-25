import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_ui/application/message/bloc/web_scoket_bloc.dart';
import 'package:flutter_ui/domain/coustomer/i_coustomer_facade.dart';
import 'package:flutter_ui/domain/house/i_house_facade.dart';
import 'package:flutter_ui/domain/messages/i_message_facade.dart';
import 'package:flutter_ui/domain/web_scoket/i_stomp_service.dart';
import 'package:flutter_ui/domain/web_scoket/web_scoket_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'coustomer_event.dart';
part 'coustomer_state.dart';
part 'coustomer_bloc.freezed.dart';

@injectable
class CoustomerBloc extends Bloc<CoustomerEvent, CoustomerState> {
  final ICoustomerFacade _coustomerFacade;
  final IMessagesFacade _iMessagesFacade;
  final IStompService _iStompService;
  final IHouseFacade _iHouseFacade;

  SharedPreferences _preferences;
  CoustomerBloc(this._coustomerFacade, this._preferences, this._iMessagesFacade,
      this._iStompService, this._iHouseFacade)
      : super(CoustomerState.initial());

  @override
  Stream<CoustomerState> mapEventToState(
    CoustomerEvent event,
  ) async* {
    yield* event.map(
      started: (e) async* {
        var userInfo = jsonDecode(_preferences.get("CACHED_SIGN_IN_USER"));
        String isManager = userInfo["userRole"];
        var query;

        if (isManager == 'salesman') {
          query = {
            "current": 1,
            "size": 1000,
            "salesmanId": userInfo["id"],
            "tenantId": userInfo["tenantId"],
            "descs": "update_time",
            "commonPool": 0,
          };
        } else if (isManager == 'manager') {
          query = {
            "current": 1,
            "size": 1000,
            "tenantId": userInfo["tenantId"],
            "groupId": userInfo["memberGroup"],
            "descs": "update_time",
            "commonPool": 0,
          };
        } else if (isManager == 'director') {
          query = {
            "current": 1,
            "size": 1000,
            "tenantId": userInfo["tenantId"],
            "descs": "update_time",
            "commonPool": 0,
          };
        } else {
          return;
        }

        var res = await _coustomerFacade.getCoustomerList(query);
        print(res);
        String affiliateds = _preferences.get('AFFILIATEDS');
        List list = json.decode(affiliateds);
        if (!res.containsKey("data")) {
          return;
        }
        List listAll = [];
        if (res["data"]["records"].length != 0) {
          listAll = res["data"]["records"];
          for (int i = 0; i < listAll.length; i++) {
            for (int j = 0; j < list.length; j++) {
              if (listAll[i]['affiliationId'] == list[j]['id']) {
                listAll[i]['houseName'] = list[j]['projectName'];
              }
            }
          }
        }
        print(listAll);
        print(isManager);
        if (isManager == "salesman") {
          for (int i = 0; i < listAll.length; i++) {
            if (listAll[i]["currentHandler"] == "经理分配" ||
                listAll[i]["currentHandler"] == "人员判客" ||
                listAll[i]["currentHandler"] == "分配客户" ||
                listAll[i]["currentHandler"] == "客户来访调配") {
              listAll.remove(listAll[i]);
            }
          }
        }
        yield state.copyWith(coustomData: listAll, userInfo: userInfo);
      },
      executionWithoutdelay: (value) async* {
        String name = "InvProactive";
        String taskDefinitionKey =
            state.history[state.history.length - 1]["taskDefinitionKey"];
        switch (taskDefinitionKey) {
          case "":
            break;
          case "Activity_0639vrl":
            name = "InvProactive";
            break;
          case "Activity_00h6h12":
            name = "DepProactive";
            break;
          case "Activity_0qvod3g":
            name = "DepProactive";
            break;
          case "CategoryManagent":
            name = "InvProactive";
            break;
          case "Activity_0vv7s63":
            name = "DepProactive";
            break;
          case "Activity_1h77h4t":
            name = "InvProactive";
            break;
          case "Activity_0qk9snp":
            name = "DepProactive";
            break;
        }
        var query = {
          "messageName": name,
          "processInstanceId": value.processIntanceId,
          "correlationKeys": {},
          "processVariables": {},
          "resultEnabled": true
        };
        var res = await _coustomerFacade.executionWithoutdelay(query);
        print(res);
      },
      unFreezedCustomer: (value) async* {
        String processedId = value.processedId;
        Map<String, dynamic> query = {
          "suspended": false
          // "frozenReasons": {"value": inputValue},
          // "suspendTask": "true"
        };
        var res = await _iMessagesFacade.unFrezzeprcessed(processedId, query);
        print(res);
      },
      // gethistory: (value) async* {
      //   var query = {
      //     "processInstanceId": value.instanceId,
      //   };
      //   var res = await _coustomerFacade.gethistory(query);

      //   print(res);
      //   yield state.copyWith(history: res);
      // },
      gethistorydata: (value) async* {
        Map<String, dynamic> userInfo =
            jsonDecode(_preferences.get("CACHED_SIGN_IN_USER"));

        var query = {
          "processInstanceId": value.instanceId,
        };
        var res = await _coustomerFacade.gethistorydata(query);
        // print(res);
        List<dynamic> list = [];
        for (var i = 0; i < res.length; i++) {
          Map<String, dynamic> map = {};
          String key = res[i]["name"];
          String crT = "createTime";
          String id = "id";
          String exid = "executionId";
          map[key] = res[i]["value"];
          map[crT] = res[i]["createTime"];
          map[id] = res[i]["id"];
          map[exid] = res[i]["executionId"];
          list.add(map);
          // if (i == 0) {
          //   print(res[0]);
          // }
        }
        // print("____________________________");
        // print(list);
        yield state.copyWith(historyVariable: list, userInfo: userInfo);
      },
      gethistory: (value) async* {
        var query = {
          "processInstanceId": value.instanceId,
          "sortBy": "startTime",
          "sortOrder": "asc"
        };
        var res = await _coustomerFacade.gethistory(query);
        // print('gethistory————————————————');
        // print(res);
        yield state.copyWith(history: res);
      },
      getSalesmanLists: (value) async* {
        // var salesmanList = await _iMessagesFacade.getSalesmanList(value.affId);
        var salesmanList = await _coustomerFacade.getPersonnelList(value.affId);
        // print('salesmanList++++++++++++++++');
        // print(salesmanList);
        yield state.copyWith(salesman: salesmanList["data"]);
      },
      getSalesman: (value) async* {
        String houseId = _preferences.get('HOUSEID');
        if (houseId == null) {
          String affiliateds = _preferences.get('AFFILIATEDS');
          if (affiliateds != null) {
            houseId = jsonDecode(affiliateds)[0]["id"];
          }
        }
        var salesmanList = await _coustomerFacade.getPersonnelList(houseId);
        // print(salesmanList);
        var userInfo = jsonDecode(_preferences.get("CACHED_SIGN_IN_USER"));
        yield state.copyWith(
            salesman: salesmanList["data"], userRole: userInfo["userRole"]);
      },
      buyinghouse: (value) async* {
        String affiliateds = _preferences.get('AFFILIATEDS');
        List list = json.decode(affiliateds);

        var listdata = value.listData;
        var query = {
          "tenantId": listdata["tenantId"],
          "affId": listdata["affiliationId"]
        };
        String phone = listdata["phone"];
        var res = await _coustomerFacade.getMultipleCustomer(phone, query);
        // print('buyinghouse==================');
        // print(res);
        List buyingList = res["data"];
        // for (var i = 0; i < buyingList.length; i++) {
        //   for (var j = 0; j < list.length; j++) {
        //     if(buyingList[i]["affiliationId"]=)
        //   }
        // }
        yield state.copyWith(buyingList: buyingList, affList: list);
      },
      getContacts: (e) async* {
        Future<Either<WebScoketFailure, List<dynamic>>> forwardedCall =
            _iStompService.getContacts();
        List<dynamic> list = [];
        await forwardedCall.then((value) {
          value.fold((l) {}, (r) {
            // print(r);
            list = r;
          });
        });
        yield state.copyWith(
          getContactsList: list,
        );
        // yield* _getContacts(_iStompService.getContacts());
      },
      frezzeCoumer: (value) async* {
        String processInstanceId = value.processedId;
        Map<String, dynamic> query = {
          "value": "true",
          "type": "Boolean",
          // "frozenReasons": {"value": inputValue},
          "suspendTask": "true"
        };
        var res =
            await _iMessagesFacade.frezzeprcessed(processInstanceId, query);
      },
      getProcessDefinition: (e) async* {
        // String affid = '';
        // for (int i = 0; i < state.historyVariable.length; i++) {
        //   if (state.historyVariable[i]['affiliationId'] != null) {
        //     affid = state.historyVariable[i]['affiliationId'];
        //   }
        // }
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        String houseId = sharedPreferences.get('HOUSEID');
        if (houseId == null) {
          String affiliateds = sharedPreferences.get('AFFILIATEDS');
          if (affiliateds != null) {
            houseId = jsonDecode(affiliateds)[0]["id"];
          }
        }

        Map<String, dynamic> query = {"tenantIdIn": houseId};

        List<dynamic> res = await _iHouseFacade.getProcessDefinition(query);
        var id = "";
        for (var i = 0; i < res.length; i++) {
          if (res[i]["key"] == "acquisition") {
            id = res[i]["id"];
          }
        }
        String userInfoString =
            sharedPreferences.getString("CACHED_SIGN_IN_USER");
        Map<String, dynamic> userInfo = jsonDecode(userInfoString);

        // String customerName = '';
        // String affiliationId = '';
        // String tenantId = '';
        // for (int i = 0; i < state.historyVariable.length; i++) {
        //   if (state.historyVariable[i]['customerName'] != null) {
        //     customerName = state.historyVariable[i]['customerName'];
        //   }
        //   if (state.historyVariable[i]['affiliationId'] != null) {
        //     affiliationId = state.historyVariable[i]['affiliationId'];
        //   }
        //   if (state.historyVariable[i]['tenantId'] != null) {
        //     tenantId = state.historyVariable[i]['tenantId'];
        //   }
        // }

        Map<String, dynamic> data = {
          "variables": {
            "initiator": {"value": userInfo["id"]},
            "phone": {"value": e.phone},
            "customerName": {"value": e.name},
            "affiliationId": {"value": houseId},
            "tenantId": {"value": userInfo["tenantId"]},
            "characters": {"value": null},
            "unspecified": {"value": false}, //有置业 false ，否则true
            "salesmanId": {
              "value": userInfo["id"],
            }, //置业顾问id 无null
            "origin": {"value": "0"},
            "gender": {"value": e.gender},
            "description": {"value": e.description},
          },
          "withVariablesInReturn": true
        };
        var response = await _iHouseFacade.controlPrecess(id, data);
        print(response['ended']);
        yield state.copyWith(isSamePhone: response['ended']);
      },
      updateRemarks: (e) async* {
        Map<String, dynamic> data = {
          "id": e.id,
          "description": e.description,
        };
        var response = await _iHouseFacade.updateRemarks(data);
        print(response);
      },
      updateCustomerName: (e) async* {
        Map<String, dynamic> data = {
          "id": e.id,
          "customerName": e.customerName,
        };
        var response = await _iHouseFacade.updateRemarks(data);
        print(response);
      },
      updateCustomerPhone: (e) async* {
        Map<String, dynamic> data = {
          "id": e.id,
          "phone": e.phone,
        };
        var response = await _iHouseFacade.updateRemarks(data);
        print(response);
      },

      isConfirm: (e) async* {
        yield state.copyWith(isConfirm: true);
      },
      isReset: (e) async* {
        yield state.copyWith(isConfirm: false);
      },
      saveCustomerItem: (value) async* {
        yield state.copyWith(coustomDataItem: value.coustomDataItem);
      },
    );
  }

  // Stream<WebScoketState> _getContacts(
  //   Future<Either<WebScoketFailure, List<dynamic>>> forwardedCall,
  // ) async* {
  //   List<dynamic> list = [];
  //   await forwardedCall.then((value) {
  //     value.fold((l) {}, (r) {
  //       list = r;
  //     });
  //   });
  //   yield state.copyWith(
  //     getContactsList: list,
  //   );
  // }
}
