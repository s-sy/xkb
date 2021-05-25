part of 'house_bloc.dart';

@freezed
abstract class HouseState with _$HouseState {
  const factory HouseState({
    Map<String, dynamic> nowMap,
    List<dynamic> housList,
    List<dynamic> buildingList,
    List<dynamic> entranceList,
    List<dynamic> buildEntranceList,
    int houseIndex,
    int buildIndex,
    int entranceIndex,
    double cors,
    String houseText,
    String buildText,
    String entranceText,
    List<dynamic> salesman,
  }) = _HouseState;
  factory HouseState.initial() => HouseState(
        nowMap: {},
        buildEntranceList: [],
        housList: [],
        buildingList: [],
        entranceList: [],
        houseIndex: -1,
        buildIndex: -1,
        entranceIndex: -1,
        cors: 1,
        houseText: "",
        buildText: "",
        entranceText: "",
        salesman: [],
      );
}
