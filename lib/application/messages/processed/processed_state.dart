part of 'processed_bloc.dart';

@freezed
abstract class ProcessedState with _$ProcessedState {
  const factory ProcessedState({
    Map<String, dynamic> processedData,
    Map<String, dynamic> processedItem,
    int groupValue,
    String userRole, // 用户角色
    List<dynamic> salesmanList, //置业列表
    List<dynamic> salesmanMapList,
    String manageAssignmentUser, //经理选定 置业
    bool nextTime,
    Map<String, dynamic> nextTimeData,
    Map<String, dynamic> nextEndTime,
    int microseconds,
    DateTime reslutDate, //延期办理日期
    String rate, //评级
    String showStringDate,
    Map<String, dynamic> showsalesMan, //显示的置业
    bool isUseDate, //是否带延迟参数
    String ps, //经理不通过备注
    List<dynamic> imgData, //上传图片
    int reslutTime, //选择的时间
    String zDValue, //置业下定写的话
    bool changTextColor, //选择日期超过时间
    DateTime enrecommendDate, //隐号延期最后时间
    Map<String, dynamic> processResult,
    bool isprocess,
    List<dynamic> dateList,
    String nextDate,
    String staging, //期
    String building, //栋
    String entrance, //单元
    String room,
    List chooseHouse,
    List<dynamic> stagingList, //期
    List<dynamic> buildingList, //栋
    List<dynamic> entranceList, //单元
    List<dynamic> roomList, //期
    Map<String, dynamic> roomMap,
    List<dynamic> endListData,
    List<dynamic> checkRes,
    bool followState,
    String startTime,
    List rateList,
  }) = _ProcessedState;
  factory ProcessedState.initial() => ProcessedState(
        processedData: {},
        processedItem: {},
        groupValue: 0,
        userRole: "",
        salesmanList: ["选择"],
        salesmanMapList: [],
        manageAssignmentUser: "选择",
        nextTime: false,
        nextTimeData: {},
        nextEndTime: {},
        microseconds: 0,
        reslutDate: DateTime.now(),
        rate: "",
        showStringDate: "",
        showsalesMan: {},
        isUseDate: false,
        ps: "",
        imgData: [],
        zDValue: "",
        reslutTime: 0,
        changTextColor: false,
        enrecommendDate: DateTime.now(),
        processResult: null,
        isprocess: false,
        dateList: [],
        nextDate: "",
        staging: "期数", //期
        building: "栋数", //栋
        entrance: "单元", //单元
        room: "房间号",
        stagingList: [], //期
        buildingList: [], //栋
        entranceList: [], //单元
        roomList: [],
        chooseHouse: [],
        roomMap: {},
        endListData: [],
        checkRes: [],
        followState: false,
        startTime: "",
        rateList: [],
      );
}
