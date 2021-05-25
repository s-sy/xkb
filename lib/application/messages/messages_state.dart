part of 'messages_bloc.dart';

@freezed
abstract class MessagesState with _$MessagesState {
  const factory MessagesState({
    List<dynamic> doSth,
    List<dynamic> projectList,
    Map<String, dynamic> definitionlist,
    List<dynamic> oneDayList,
    List<dynamic> thirdDayList,
    List<dynamic> waitWorkList,
    List<dynamic> newCousterList,
    List<dynamic> newCousterNameList,
    List<dynamic> oneDayNameList,
    List<dynamic> thirdDayNameList,
    List<dynamic> waitWorkNameList,
  }) = _MessagesState;
  factory MessagesState.initial() => MessagesState(
        doSth: [],
        projectList: [],
        definitionlist: {},
        oneDayList: [],
        thirdDayList: [],
        waitWorkList: [],
        newCousterList: [],
        newCousterNameList: [],
        waitWorkNameList: [],
        thirdDayNameList: [],
        oneDayNameList: [],
      );
}
