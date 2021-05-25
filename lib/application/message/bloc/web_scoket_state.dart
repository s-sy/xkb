part of 'web_scoket_bloc.dart';

@freezed
abstract class WebScoketState with _$WebScoketState {
  const factory WebScoketState({
    @required bool isReceiveChatMessage,
    @required List<dynamic> getContactsList,
    @required List<dynamic> getUnreadMessageList,
    @required List<dynamic> historyMessageList,
    @required Map<String, dynamic> getReceiveMsg,
    @required List<dynamic> managerRemindList,
    @required Map<String, dynamic> managerRemindDetails,
    @required String unreadMessageCount,
    @required List<dynamic> unreadList,
    @required List<dynamic> history,
    @required List<dynamic> salesman,
    @required List<dynamic> salesmanList,
    @required List<dynamic> historyVariable,
    @required String choosingId,
    @required bool isManagerRemindDetails,
    @required List<dynamic> slideshow,
    @required List<dynamic> listRoles,
    @required List<dynamic> listAffiliated,
    @required bool isReset,
    @required
        Option<Either<WebScoketFailure, Unit>> webScoketFailureOrSuccessOption,
  }) = _WebScoketState;

  factory WebScoketState.initial() => WebScoketState(
        isReceiveChatMessage: false,
        getContactsList: [],
        getUnreadMessageList: [],
        historyMessageList: [],
        getReceiveMsg: {},
        managerRemindList: [],
        managerRemindDetails: {},
        unreadMessageCount: "",
        unreadList: [],
        history: [],
        salesman: [],
        salesmanList: [],
        historyVariable: [],
        choosingId: '',
        slideshow: [],
        isManagerRemindDetails: false,
        listRoles: [],
        listAffiliated: [],
        isReset: false,
        webScoketFailureOrSuccessOption: none(),
      );
}
