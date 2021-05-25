part of 'echarts_bloc.dart';

@freezed
abstract class EchartsState with _$EchartsState {
  const factory EchartsState({
    String id,
    List<String> colors,
    List<String> sceneTitle,
    List<Map<String, Object>> sceneList,
    List<String> userRoleTitle,
    List<Map<String, Object>> userRoleList,
    List<Map<String, Object>> groupList,
    List<String> legendData,
    List<dynamic> series,
    List<String> oneXAxisList,
    int portion,
    int duration,
    List<int> monthList,
    int minePortion, //个人   第几月数据，默认本月
    int mineDuration, // 个人   1查周， 2查月
    String mineId, //个人Id
    List kindSceneTitle,
    List kindSceneList,
    List kindUserRoleTitle,
    List kindUserRoleList,
    List kindGroupList,
    int countWeek,
    bool isMonth,
    List personnelYear,
    List allSalesman,
    bool isManager,
    String houseName,
  }) = _EchartsState;

  factory EchartsState.initial() => EchartsState(
        id: "",
        colors: ['#5470C6', '#91CC75', '#EE6666'],
        sceneTitle: [],
        sceneList: [],
        userRoleTitle: [],
        userRoleList: [],

        legendData: [],
        // category: [],
        // onelineData: [],
        // twolineData: [],
        series: [],
        groupList: [],
        // onelegendDataTilte: [],
        // oneseriesList: [],
        oneXAxisList: [],
        portion: new DateTime.now().month,
        duration: 2,
        // barXAxis: [],
        // barSeries: [],
        monthList: [],
        minePortion: new DateTime.now().month,
        mineDuration: 2,
        mineId: "",
        kindSceneTitle: [],
        kindSceneList: [],
        kindUserRoleTitle: [],
        kindUserRoleList: [],
        kindGroupList: [],
        countWeek: 0,
        isMonth: false,
        personnelYear: [],
        allSalesman: [],
        isManager: false,
        houseName: "",
      );
}
