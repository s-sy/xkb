part of 'wechathomepage_bloc.dart';

@freezed
abstract class WechathomepageEvent with _$WechathomepageEvent {
  const factory WechathomepageEvent.started(Map<String, dynamic> affData) =
      _Started;
  const factory WechathomepageEvent.getNotice() = _GetNotice;
  const factory WechathomepageEvent.getNewsinformation() = _GetNewsinformation;
  const factory WechathomepageEvent.getapartmentlayout() = _Getapartmentlayout;
  const factory WechathomepageEvent.getAwesomeshooting() = _GetAwesomeshooting;
  const factory WechathomepageEvent.getQuestionsPage() = _GetQuestionsPage;
  const factory WechathomepageEvent.sendaddviews() = _Sendaddviews;
  const factory WechathomepageEvent.gettotalviews() = _Gettotalviews;
  const factory WechathomepageEvent.getreadingReviews() = _GetreadingReviews;
  const factory WechathomepageEvent.getPopupads() = _GetPopupads;
  const factory WechathomepageEvent.getTaills() = _GetTaills;
  const factory WechathomepageEvent.getreadingReviewsAll(
      Map<String, dynamic> affData) = _GetreadingReviewsAll;
  const factory WechathomepageEvent.getQuestionsPageAll(
      Map<String, dynamic> affData) = _GetQuestionsPageAll;
  const factory WechathomepageEvent.getAwesomeshootingAll(
      Map<String, dynamic> affData) = _GetAwesomeshootingAll;
  const factory WechathomepageEvent.houseInfo(Map<String, dynamic> affData) =
      _HouseInfo;
  const factory WechathomepageEvent.apartmentlayoutList(
      Map<String, dynamic> affData) = _ApartmentlayoutList;
  const factory WechathomepageEvent.getNewsinformationAll(
      Map<String, dynamic> affData, String type) = _GetNewsinformationAll;
  const factory WechathomepageEvent.getTaillsAll(String affId) = _GetTaillsAll;
  const factory WechathomepageEvent.goconcern(Map<String, dynamic> maps) =
      _Goconcern;
  const factory WechathomepageEvent.apartmentConcerncennel() =
      _ApartmentConcerncennel;
  const factory WechathomepageEvent.getApartmentConcern() =
      _GetApartmentConcern;
  const factory WechathomepageEvent.getTopicreply() = _GetTopicreply;
  const factory WechathomepageEvent.commentpreviews(String replyValue,
      String affid, String id, int type, String createid) = _Commentpreviews;
  const factory WechathomepageEvent.apartmentlayoutOne(
      Map<String, dynamic> maps) = _ApartmentlayoutOne;
}
