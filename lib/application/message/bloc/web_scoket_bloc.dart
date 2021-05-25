import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_ui/domain/coustomer/i_coustomer_facade.dart';
import 'package:flutter_ui/domain/house/i_house_facade.dart';
import 'package:flutter_ui/domain/messages/i_message_facade.dart';
import 'package:flutter_ui/domain/web_scoket/i_stomp_service.dart';
import 'package:flutter_ui/domain/web_scoket/web_scoket_failure.dart';
import 'package:flutter_ui/infrastructure/webscoket/client_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'web_scoket_event.dart';
part 'web_scoket_state.dart';
part 'web_scoket_bloc.freezed.dart';

@injectable
class WebScoketBloc extends Bloc<WebScoketEvent, WebScoketState> {
  final IStompService _iStompService;
  final ClientService _clientService;
  final ICoustomerFacade _coustomerFacade;
  final IMessagesFacade _iMessagesFacade;
  final IHouseFacade _iHouseFacade;

  WebScoketBloc(this._iStompService, this._clientService, this._coustomerFacade,
      this._iMessagesFacade, this._iHouseFacade)
      : super(WebScoketState.initial());

  @override
  Stream<WebScoketState> mapEventToState(
    WebScoketEvent event,
  ) async* {
    yield* event.map(
      connectWebsocket: (e) async* {
        yield* _connectWebsocket(_iStompService.clientConnect());
      },
      sendChatMessage: (e) async* {
        yield* _connectWebsocket(
            _iStompService.sendChatMessage(e.msg, e.type, e.contactId));
      },
      sendChatMessageVoice: (e) async* {
        yield* _connectWebsocket(_iStompService.sendChatMessageVoice(
            e.msg, e.type, e.contactId, e.duration));
      },
      disconnectWebsocket: (e) async* {
        yield* _connectWebsocket(_iStompService.disconnectWebsocket());
      },
      getContacts: (e) async* {
        yield* _getContacts(_iStompService.getContacts());
      },
      getId: (e) async* {
        yield* _connectWebsocket(_iStompService.getId(e.contactId));
      },
      getUnreadMessages: (e) async* {
        yield* _getUnreadMessage(_iStompService.getUnreadMessages());
      },
      historyMessage: (e) async* {
        yield* _historyMessage(
            _iStompService.historyMessage(e.contactId, e.index, e.sizeNum));
      },
      getReceiveMsg: (e) async* {
        Map<String, dynamic> onlineChat = _clientService.getReceiveMsg();
        if (onlineChat != null) {
          yield state.copyWith(
            getReceiveMsg: onlineChat,
            isReceiveChatMessage: true,
          );
        } else {
          yield state.copyWith(
            isReceiveChatMessage: false,
          );
        }
      },
      getPermission: (e) async* {
        bool status = await Permission.storage.isGranted;
        bool statusMic = await Permission.microphone.isGranted;
        if (!status) {
          await Permission.storage.request().isGranted;
        }
        if (!statusMic) {
          await Permission.microphone.request().isGranted;
        }
      },
      setJPushRid: (e) async* {
        _iStompService.setJPushRid();
      },
      managerRemindList: (e) async* {
        yield* _managerRemindList(_iStompService.managerRemindList(e.index));
      },
      managerRemindDetails: (e) async* {
        yield* _managerRemindDetails(
            _iStompService.managerRemindDetails(e.phone, e.tenantId));
      },
      refreshRemindList: (e) async* {
        _iStompService.refreshRemindList();
      },
      unreadMessageCount: (e) async* {
        yield* _unreadMessageCount(_iStompService.unreadMessageCount());
      },
      batchUpdate: (e) async* {
        _iStompService.batchUpdate();
      },
      unreadList: (e) async* {
        yield* _unreadList(_iStompService.unreadList());
      },
      gethistory: (value) async* {
        var query = {
          "processInstanceId": value.instanceId,
          "sortBy": "startTime",
          "sortOrder": "asc"
        };
        var res = await _coustomerFacade.gethistory(query);
        var querys = {
          "processInstanceId": value.instanceId,
        };
        var resDatils = await _coustomerFacade.gethistorydata(querys);
        List<dynamic> list = [];
        for (var i = 0; i < resDatils.length; i++) {
          Map<String, dynamic> map = {};
          String key = resDatils[i]["name"];
          String crT = "createTime";
          String id = "id";
          String exid = "executionId";
          map[key] = resDatils[i]["value"];
          map[crT] = resDatils[i]["createTime"];
          map[id] = resDatils[i]["id"];
          map[exid] = resDatils[i]["executionId"];
          list.add(map);
        }
        // print(list);
        // print('gethistory————————————————');
        // print(res);
        yield state.copyWith(
          history: res,
          historyVariable: list,
        );
      },
      getSalesmanLists: (value) async* {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        String houseId = sharedPreferences.get('HOUSEID');
        if (houseId == null) {
          String affiliateds = sharedPreferences.get('AFFILIATEDS');
          if (affiliateds != null) {
            houseId = jsonDecode(affiliateds)[0]["id"];
          }
        }
        var salesmanList = await _iMessagesFacade.getSalesmanList(houseId);
        var personnelList = await _coustomerFacade.getPersonnelList(houseId);
        // print('salesmanList++++++++++++++++');
        // print(salesmanList);
        yield state.copyWith(
            salesman: personnelList["data"], //所有人
            salesmanList: salesmanList['data']); //所有置业顾问
      },
      getProcessDefinition: (e) async* {
        // SharedPreferences sharedPreferences =
        //     await SharedPreferences.getInstance();
        // String houseId = sharedPreferences.get('HOUSEID');
        // if (houseId == null) {
        //   String affiliateds = sharedPreferences.get('AFFILIATEDS');
        //   if (affiliateds != null) {
        //     houseId = jsonDecode(affiliateds)[0]["id"];
        //   }
        // }
        String affid = '';
        for (int i = 0; i < state.historyVariable.length; i++) {
          if (state.historyVariable[i]['affiliationId'] != null) {
            affid = state.historyVariable[i]['affiliationId'];
          }
        }
        Map<String, dynamic> query = {"tenantIdIn": affid};
        List<dynamic> res = await _iHouseFacade.getProcessDefinition(query);
        var id = "";
        for (var i = 0; i < res.length; i++) {
          if (res[i]["key"] == "acquisition") {
            id = res[i]["id"];
          }
        }
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        String userInfoString =
            sharedPreferences.getString("CACHED_SIGN_IN_USER");
        Map<String, dynamic> userInfo = jsonDecode(userInfoString);

        String customerName = '';
        String affiliationId = '';
        String tenantId = '';
        for (int i = 0; i < state.historyVariable.length; i++) {
          if (state.historyVariable[i]['customerName'] != null) {
            customerName = state.historyVariable[i]['customerName'];
          }
          if (state.historyVariable[i]['affiliationId'] != null) {
            affiliationId = state.historyVariable[i]['affiliationId'];
          }
          if (state.historyVariable[i]['tenantId'] != null) {
            tenantId = state.historyVariable[i]['tenantId'];
          }
        }

        Map<String, dynamic> data = {
          "variables": {
            "initiator": {"value": userInfo["id"]},
            "phone": {"value": e.phone},
            "customerName": {"value": customerName},
            "affiliationId": {"value": affiliationId},
            "tenantId": {"value": tenantId},
            "characters": {"value": null},
            "unspecified": {"value": false}, //有置业 false ，否则true
            "salesmanId": {
              "value": e.salesmanId,
            }, //置业顾问id 无null
            "origin": {"value": "2"},
          }
        };
        print(data);
        var response = await _iHouseFacade.controlPrecess(id, data);
        print(response);
      },
      isBottomSheet: (value) async* {
        yield state.copyWith(isManagerRemindDetails: false);
      },
      slideshow: (e) async* {
        yield* _slideshow(_iStompService.slideshow());
      },
      getRoles: (e) async* {
        yield* _getRoles(_iStompService.getRoles());
      },
      getAffiliated: (e) async* {
        yield* _getAffiliated(_iStompService.getAffiliated());
      },
      submitTestUserInfo: (e) async* {
        // _iStompService.setJPushRid();
        yield* _submitTestUserInfo(_iStompService.submitTestUserInfo(
            e.image, e.name, e.nickName, e.sex, e.role, e.listAffiliated));
      },
    );
  }

  Stream<WebScoketState> _connectWebsocket(
    Future<Either<WebScoketFailure, Unit>> forwardedCall,
  ) async* {
    Either<WebScoketFailure, Unit> failureOrSuccess;
    state.copyWith(
      webScoketFailureOrSuccessOption: optionOf(failureOrSuccess),
    );
  }

  Stream<WebScoketState> _getContacts(
    Future<Either<WebScoketFailure, List<dynamic>>> forwardedCall,
  ) async* {
    List<dynamic> list = [];
    await forwardedCall.then((value) {
      value.fold((l) {}, (r) {
        list = r;
      });
    });
    yield state.copyWith(
      getContactsList: list,
    );
  }

  Stream<WebScoketState> _getUnreadMessage(
    Future<Either<WebScoketFailure, List<dynamic>>> forwardedCall,
  ) async* {
    List<dynamic> list = [];
    await forwardedCall.then((value) {
      value.fold((l) {}, (r) {
        list = r;
      });
    });
    yield state.copyWith(
      getUnreadMessageList: list,
    );
  }

  Stream<WebScoketState> _historyMessage(
    Future<Either<WebScoketFailure, List<dynamic>>> forwardedCall,
  ) async* {
    List<dynamic> list = [];
    await forwardedCall.then((value) {
      value.fold((l) {}, (r) {
        list = r;
      });
    });
    yield state.copyWith(
      historyMessageList: list,
    );
  }

  Stream<WebScoketState> _managerRemindList(
    Future<Either<WebScoketFailure, List<dynamic>>> forwardedCall,
  ) async* {
    List<dynamic> list = [];
    await forwardedCall.then((value) {
      value.fold((l) {}, (r) {
        list = r;
      });
    });
    yield state.copyWith(
      managerRemindList: list,
    );
  }

  Stream<WebScoketState> _managerRemindDetails(
    Future<Either<WebScoketFailure, Map<String, dynamic>>> forwardedCall,
  ) async* {
    Map<String, dynamic> map;
    await forwardedCall.then((value) {
      value.fold((l) {}, (r) {
        map = r;
      });
    });
    yield state.copyWith(
      managerRemindDetails: map,
      isManagerRemindDetails: true,
    );
  }

  Stream<WebScoketState> _unreadMessageCount(
    Future<Either<WebScoketFailure, String>> forwardedCall,
  ) async* {
    String count = "";
    await forwardedCall.then((value) {
      value.fold((l) {}, (r) {
        count = r;
      });
    });
    yield state.copyWith(
      unreadMessageCount: count,
    );
  }

  Stream<WebScoketState> _unreadList(
    Future<Either<WebScoketFailure, List<dynamic>>> forwardedCall,
  ) async* {
    List<dynamic> list = [];
    await forwardedCall.then((value) {
      value.fold((l) {}, (r) {
        list = r;
      });
    });
    yield state.copyWith(
      unreadList: list,
    );
  }

  Stream<WebScoketState> _slideshow(
    Future<Either<WebScoketFailure, List<dynamic>>> forwardedCall,
  ) async* {
    List<dynamic> list = [];
    await forwardedCall.then((value) {
      value.fold((l) {}, (r) {
        list = r;
      });
    });
    yield state.copyWith(
      slideshow: list,
    );
  }

  Stream<WebScoketState> _getRoles(
    Future<Either<WebScoketFailure, List<dynamic>>> forwardedCall,
  ) async* {
    List<dynamic> list = [];
    await forwardedCall.then((value) {
      value.fold((l) {}, (r) {
        list = r;
      });
    });
    yield state.copyWith(
      listRoles: list,
    );
  }

  Stream<WebScoketState> _getAffiliated(
    Future<Either<WebScoketFailure, List<dynamic>>> forwardedCall,
  ) async* {
    List<dynamic> list = [];
    await forwardedCall.then((value) {
      value.fold((l) {}, (r) {
        list = r;
      });
    });
    yield state.copyWith(
      listAffiliated: list,
    );
  }

  Stream<WebScoketState> _submitTestUserInfo(
    Future<Either<WebScoketFailure, List<dynamic>>> forwardedCall,
  ) async* {
    List<dynamic> list = [];
    await forwardedCall.then((value) {
      value.fold((l) {}, (r) {
        list = r;
      });
    });
    if (list[0] == "true") {
      yield state.copyWith(
        isReset: true,
        // listAffiliated: list,
      );
    }
  }
}
