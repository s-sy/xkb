part of 'choosetented_bloc.dart';

@freezed
abstract class ChoosetentedState with _$ChoosetentedState {
  const factory ChoosetentedState({
    List platList, //未分类的平台
    List pacd, //分类的平台
    List showPat, //显示平台
    List locationList, //根据定位要查找的数组
    List hotcity, //热门城市
    String platformProvince, //省
    String platformCity, //市
    String platformCountry, //区

    int provinceIndex,
    int cityIndex,
    int countryIndex,
  }) = _ChoosetentedState;
  factory ChoosetentedState.initial() => ChoosetentedState(
        platList: [],
        pacd: [],
        showPat: [],
        locationList: [],
        hotcity: [],
        platformProvince: "选择",
        platformCity: "选择",
        platformCountry: "选择",
        provinceIndex: -1,
        cityIndex: -1,
        countryIndex: -1,
      );
}
