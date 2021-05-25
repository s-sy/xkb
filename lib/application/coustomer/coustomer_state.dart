part of 'coustomer_bloc.dart';

@freezed
abstract class CoustomerState with _$CoustomerState {
  const factory CoustomerState({
    // List<dynamic> coustomData,
    // List<dynamic> history,
    List<dynamic> coustomData,
    List<dynamic> history,
    List<dynamic> historyVariable,
    List<dynamic> salesman,
    List<dynamic> buyingList,
    List<dynamic> affList,
    List<dynamic> getContactsList,
    bool isSamePhone,
    bool isConfirm,
    Map<String, dynamic> userInfo,
    Map<String, dynamic> coustomDataItem,
    String userRole,
  }) = _CoustomerState;
  factory CoustomerState.initial() => CoustomerState(
        coustomData: [],
        history: [],
        salesman: [],
        historyVariable: [],
        buyingList: [],
        affList: [],
        getContactsList: [],
        isSamePhone: false,
        isConfirm: false,
        userInfo: {},
        coustomDataItem: {},
        userRole: "",
      );
}
