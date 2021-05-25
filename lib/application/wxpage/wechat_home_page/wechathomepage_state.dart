part of 'wechathomepage_bloc.dart';

@freezed
abstract class WechathomepageState with _$WechathomepageState {
  const factory WechathomepageState({
    Map project,
    List notice, //公告
    List swiperList, //轮播图
    List apartmentlayout, //户型
    List newsinformation, //新问动态
    List awesomeshooting, //选拍列表
    List questionsPage, //问答
    Map<String, dynamic> totalviews, //浏览评论
    List salesman, //置业顾问
    List salesmanAll,
    List readingReviews,
    List readingReviewsAll, //点评页面所有
    List questionsPageAll, //问答页面所有
    List awesomeshootingAll, //炫拍页面所有
    Map houseInfo,
    List apartmentlayoutAll,
    List newsData,
    bool isFollow,
    List reply,
    Map userInfo,
    List apartmentlayoutOne,
    List listTag,
  }) = _WechathomepageState;
  factory WechathomepageState.initial() => WechathomepageState(
        project: {},
        notice: [],
        swiperList: [],
        apartmentlayout: [],
        newsinformation: [],
        awesomeshooting: [],
        questionsPage: [],
        totalviews: {},
        salesman: [],
        salesmanAll: [],
        readingReviews: [],
        readingReviewsAll: [],
        questionsPageAll: [],
        awesomeshootingAll: [],
        houseInfo: {},
        apartmentlayoutAll: [],
        newsData: [],
        isFollow: false,
        reply: [],
        userInfo: {},
        apartmentlayoutOne: [],
        listTag: [],
      );
}
